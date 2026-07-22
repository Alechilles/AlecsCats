param(
    [Parameter(Mandatory = $true)]
    [string]$Version,
    [Parameter(Mandatory = $true)]
    [string]$ArtifactPath,
    [string]$ChangelogPath = "artifacts/changelog.md",
    [string]$ConfigPath = ".release/publish-config.json",
    [string]$ApiToken = $env:MODIFOLD_API_TOKEN,
    [bool]$DryRun = $true
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Get-PropertyValue {
    param([object]$Object, [string]$Name, [object]$DefaultValue = $null)
    $property = $Object.PSObject.Properties[$Name]
    if ($null -eq $property -or $null -eq $property.Value) {
        return $DefaultValue
    }
    return $property.Value
}

if (-not (Test-Path -Path $ConfigPath)) { throw "Release config '$ConfigPath' was not found." }
if (-not (Test-Path -Path $ArtifactPath)) { throw "Artifact '$ArtifactPath' was not found." }
if (-not (Test-Path -Path $ChangelogPath)) { throw "Changelog '$ChangelogPath' was not found." }

$config = Get-Content -Path $ConfigPath -Raw | ConvertFrom-Json
$modifold = Get-PropertyValue -Object $config -Name "modifold"
if ($null -eq $modifold) { throw "modifold configuration is missing in $ConfigPath." }

$projectSlug = ([string](Get-PropertyValue -Object $modifold -Name "projectSlug" -DefaultValue "")).Trim()
$releaseChannel = ([string](Get-PropertyValue -Object $modifold -Name "releaseChannel" -DefaultValue "release")).Trim().ToLowerInvariant()
$versionPrefix = [string](Get-PropertyValue -Object $modifold -Name "versionPrefix" -DefaultValue "")
$apiBaseUrl = ([string](Get-PropertyValue -Object $modifold -Name "apiBaseUrl" -DefaultValue "https://api.modifold.com")).TrimEnd("/")
$gameVersions = @(@(Get-PropertyValue -Object $modifold -Name "gameVersions" -DefaultValue @()) | ForEach-Object { "$_".Trim() } | Where-Object { $_ })
$loaders = @(@(Get-PropertyValue -Object $modifold -Name "loaders" -DefaultValue @()) | ForEach-Object { "$_".Trim() } | Where-Object { $_ })
$dependencies = @(Get-PropertyValue -Object $modifold -Name "dependencies" -DefaultValue @())

if ([string]::IsNullOrWhiteSpace($projectSlug)) { throw "modifold.projectSlug is empty in $ConfigPath." }
if (@("release", "beta", "alpha") -notcontains $releaseChannel) { throw "Invalid Modifold release channel '$releaseChannel'." }
if ($gameVersions.Count -eq 0) { throw "modifold.gameVersions is empty in $ConfigPath." }
if ($loaders.Count -eq 0) { throw "modifold.loaders is empty in $ConfigPath." }

$dependencyPayload = @($dependencies | ForEach-Object {
    $slug = ([string](Get-PropertyValue -Object $_ -Name "slug" -DefaultValue "")).Trim()
    $type = ([string](Get-PropertyValue -Object $_ -Name "type" -DefaultValue "required")).Trim().ToLowerInvariant()
    if ([string]::IsNullOrWhiteSpace($slug)) { throw "Each Modifold dependency must include a slug." }
    if (@("required", "optional", "incompatible", "embedded") -notcontains $type) { throw "Invalid Modifold dependency type '$type' for '$slug'." }
    [ordered]@{ slug = $slug; type = $type }
})

$normalizedVersion = (($Version.Trim()) -replace "^v", "")
if ([string]::IsNullOrWhiteSpace($normalizedVersion)) { throw "Version cannot be empty." }
$publishedVersion = "$versionPrefix$normalizedVersion"
$endpoint = "$apiBaseUrl/projects/$([uri]::EscapeDataString($projectSlug))/versions"

if ($DryRun) {
    Write-Host "Dry-run: would publish '$ArtifactPath' to Modifold project '$projectSlug'."
    Write-Host "Endpoint: $endpoint"
    Write-Host "Version: $publishedVersion"
    Write-Host "Release channel: $releaseChannel"
    Write-Host "Game versions: $($gameVersions -join ', ')"
    Write-Host "Loaders: $($loaders -join ', ')"
    if ($dependencyPayload.Count -gt 0) {
        Write-Host "Dependencies: $(@($dependencyPayload | ForEach-Object { "$($_.slug):$($_.type)" }) -join ', ')"
    }
    exit 0
}

if ([string]::IsNullOrWhiteSpace($ApiToken)) { throw "MODIFOLD_API_TOKEN is required when DryRun is false." }

$gameVersionsJson = ConvertTo-Json -InputObject @($gameVersions) -Compress
$loadersJson = ConvertTo-Json -InputObject @($loaders) -Compress
$dependenciesJson = ConvertTo-Json -InputObject @($dependencyPayload) -Depth 6 -Compress
$resolvedArtifactPath = (Resolve-Path -Path $ArtifactPath).Path
$resolvedChangelogPath = (Resolve-Path -Path $ChangelogPath).Path
$responseTempFile = New-TemporaryFile

try {
    $statusCode = & curl.exe -sS -X POST $endpoint `
        -H "Authorization: Bearer $ApiToken" `
        -F "version_number=$publishedVersion" `
        -F "changelog=<$resolvedChangelogPath;type=text/plain" `
        -F "release_channel=$releaseChannel" `
        -F "game_versions=$gameVersionsJson" `
        -F "loaders=$loadersJson" `
        -F "dependencies=$dependenciesJson" `
        -F "file=@$resolvedArtifactPath" `
        -o $responseTempFile -w "%{http_code}"
    $statusCode = $statusCode.Trim()
    if ($LASTEXITCODE -ne 0) { throw "Modifold upload failed with exit code $LASTEXITCODE." }

    $response = Get-Content -Path $responseTempFile -Raw
    $statusCodeInt = 0
    if (-not [int]::TryParse($statusCode, [ref]$statusCodeInt)) { throw "Invalid Modifold HTTP status '$statusCode'." }
    if ($statusCodeInt -lt 200 -or $statusCodeInt -ge 300) {
        $summary = if ([string]::IsNullOrWhiteSpace($response)) { "<empty>" } else { $response }
        throw "Modifold upload failed with HTTP status $statusCode. Response: $summary"
    }

    Write-Host "Modifold upload completed (HTTP $statusCode)."
    if (-not [string]::IsNullOrWhiteSpace($response)) { Write-Output $response }
} finally {
    Remove-Item -Path $responseTempFile -Force -ErrorAction SilentlyContinue
}
