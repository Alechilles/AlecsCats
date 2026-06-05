Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$templatePath = "Server/NPC/Roles/AlecsCats/Templates/Template_Cat_Pet.json"
$maxSitStartRange = 0.15
$maxSeekStopDistance = 0.05

function Get-JsonProperty {
    param(
        [Parameter(Mandatory = $true)]
        [object]$Node,
        [Parameter(Mandatory = $true)]
        [string]$Name
    )

    if ($Node -isnot [pscustomobject]) {
        return $null
    }

    $property = $Node.PSObject.Properties[$Name]
    if ($property) {
        return $property.Value
    }

    return $null
}

function Find-JsonObjects {
    param(
        [Parameter(Mandatory = $true)]
        [object]$Node,
        [Parameter(Mandatory = $true)]
        [scriptblock]$Predicate
    )

    $matches = @()
    if ($Node -is [pscustomobject]) {
        if (& $Predicate $Node) {
            $matches += $Node
        }

        foreach ($property in $Node.PSObject.Properties) {
            $matches += Find-JsonObjects -Node $property.Value -Predicate $Predicate
        }
    } elseif ($Node -is [System.Collections.IEnumerable] -and $Node -isnot [string]) {
        foreach ($item in $Node) {
            $matches += Find-JsonObjects -Node $item -Predicate $Predicate
        }
    }

    return $matches
}

if (-not (Test-Path -Path $templatePath)) {
    throw "Missing cat template '$templatePath'."
}

$template = Get-Content -Path $templatePath -Raw | ConvertFrom-Json

$sitBranches = @(Find-JsonObjects -Node $template -Predicate {
    param($node)
    (Get-JsonProperty -Node $node -Name '$Comment') -eq "If already inside the open box target, start sitting and run a timer for the sit duration."
})

if ($sitBranches.Count -ne 1) {
    throw "Expected exactly one cat box sit-start branch, found $($sitBranches.Count)."
}

$sitBlockSensors = @(Find-JsonObjects -Node $sitBranches[0] -Predicate {
    param($node)
    (Get-JsonProperty -Node $node -Name 'Type') -eq "Block" -and $null -ne (Get-JsonProperty -Node $node -Name 'Range')
})

if ($sitBlockSensors.Count -ne 1) {
    throw "Expected exactly one sit-start block sensor, found $($sitBlockSensors.Count)."
}

$sitStartRange = [double](Get-JsonProperty -Node $sitBlockSensors[0] -Name 'Range')
if ($sitStartRange -gt $maxSitStartRange) {
    throw "Cat box sit-start Range $sitStartRange must be <= $maxSitStartRange."
}

$seekBranches = @(Find-JsonObjects -Node $template -Predicate {
    param($node)
    (Get-JsonProperty -Node $node -Name '$Comment') -eq "Seek the adjusted center point inside the open box."
})

if ($seekBranches.Count -ne 1) {
    throw "Expected exactly one cat box seek branch, found $($seekBranches.Count)."
}

$bodyMotion = Get-JsonProperty -Node $seekBranches[0] -Name 'BodyMotion'
if ((Get-JsonProperty -Node $bodyMotion -Name 'Type') -ne "Seek") {
    throw "Cat box seek branch must use BodyMotion Type 'Seek'."
}

$seekStopDistance = [double](Get-JsonProperty -Node $bodyMotion -Name 'StopDistance')
if ($seekStopDistance -gt $maxSeekStopDistance) {
    throw "Cat box seek StopDistance $seekStopDistance must be <= $maxSeekStopDistance."
}

Write-Host "Cat box precision settings are tightened."
