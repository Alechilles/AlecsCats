Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$blockSetPath = "Server/Item/Block/Sets/AlecsCats_Cat_Box.json"
$expectedOpenBlockTypes = @(
    "*Cat_Box_State_Definitions_Open",
    "*Cat_Box2_State_Definitions_Open"
)

if (-not (Test-Path -Path $blockSetPath)) {
    throw "Missing cat box block set '$blockSetPath'."
}

$blockSet = Get-Content -Path $blockSetPath -Raw | ConvertFrom-Json
$includeBlockTypesProperty = $blockSet.PSObject.Properties["IncludeBlockTypes"]
$includeHitboxTypesProperty = $blockSet.PSObject.Properties["IncludeHitboxTypes"]

$includeBlockTypes = @()
if ($includeBlockTypesProperty) {
    $includeBlockTypes = @($includeBlockTypesProperty.Value)
}

$includeHitboxTypes = @()
if ($includeHitboxTypesProperty) {
    $includeHitboxTypes = @($includeHitboxTypesProperty.Value)
}

if ($includeHitboxTypes.Count -gt 0) {
    throw "Cat box behavior must target open block-state types, not hitbox types. Found IncludeHitboxTypes: $($includeHitboxTypes -join ', ')."
}

$missingOpenBlockTypes = @($expectedOpenBlockTypes | Where-Object { $includeBlockTypes -notcontains $_ })
if ($missingOpenBlockTypes.Count -gt 0) {
    throw "Cat box behavior is missing open block-state targets: $($missingOpenBlockTypes -join ', ')."
}

$unexpectedBlockTypes = @($includeBlockTypes | Where-Object { $expectedOpenBlockTypes -notcontains $_ })
if ($unexpectedBlockTypes.Count -gt 0) {
    throw "Cat box behavior has unexpected block-state targets: $($unexpectedBlockTypes -join ', ')."
}

Write-Host "Cat box behavior targets open block-state types only."
