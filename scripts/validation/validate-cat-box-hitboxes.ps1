Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$boxAssets = @(
    "Server/Item/Items/Furniture/Cat_Box.json",
    "Server/Item/Items/Furniture/Cat_Box2.json"
)

foreach ($assetPath in $boxAssets) {
    if (-not (Test-Path -Path $assetPath)) {
        throw "Missing cat box asset '$assetPath'."
    }

    $asset = Get-Content -Path $assetPath -Raw | ConvertFrom-Json
    $baseHitboxProperty = $asset.BlockType.PSObject.Properties["HitboxType"]
    $baseHitboxType = if ($baseHitboxProperty) { $baseHitboxProperty.Value } else { $null }
    $openHitboxType = $asset.BlockType.State.Definitions.Open.HitboxType

    if ([string]::IsNullOrWhiteSpace($openHitboxType)) {
        throw "$assetPath is missing BlockType.State.Definitions.Open.HitboxType."
    }

    if ($baseHitboxType -ne $openHitboxType) {
        throw "$assetPath closed/base HitboxType '$baseHitboxType' must match open HitboxType '$openHitboxType'."
    }
}

Write-Host "Cat box closed/base hitboxes match their open hitboxes."
