Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$templatePath = "Server/NPC/Roles/AlecsCats/Templates/Template_Predator_Cat.json"
$modelPath = "Server/Models/Pets/Cat/Cat_Base.json"
if (-not (Test-Path -Path $templatePath)) {
    throw "Cat predator template '$templatePath' was not found."
}

if (-not (Test-Path -Path $modelPath)) {
    throw "Cat base model '$modelPath' was not found."
}

$raw = Get-Content -Path $templatePath -Raw
$template = $raw | ConvertFrom-Json
$model = Get-Content -Path $modelPath -Raw | ConvertFrom-Json

foreach ($requiredParameter in @("AttractiveItemSetParticles", "SmellingRange", "FollowItemPreDelay", "FollowItemDistance", "FollowItemAttitudes")) {
    if (-not $template.Parameters.PSObject.Properties.Name.Contains($requiredParameter)) {
        throw "Template_Predator_Cat is missing required food-follow parameter '$requiredParameter'."
    }
}

if ($raw -notmatch '"State"\s*:\s*"SeekFood"') {
    throw "Template_Predator_Cat must define a SeekFood state for curious fish-follow behavior."
}

if ($raw -notmatch '"Reference"\s*:\s*"Component_Tamework_Instruction_SeekFood_PlayerFollow"') {
    throw "Template_Predator_Cat must use Component_Tamework_Instruction_SeekFood_PlayerFollow while in SeekFood."
}

if (-not $model.AnimationSets.PSObject.Properties.Name.Contains("Curious")) {
    throw "Cat_Base model must define the Curious animation used by Component_Tamework_Instruction_SeekFood_PlayerFollow."
}

if ($raw -notmatch '"Type"\s*:\s*"ItemInHand"[\s\S]*"Items"\s*:\s*\{\s*"Compute"\s*:\s*"AttractiveItemSet"\s*\}') {
    throw "Template_Predator_Cat must detect players holding AttractiveItemSet items before entering SeekFood."
}

if ($raw -match 'Start a timer to switch to combat if it can''t flee from the target') {
    throw "Template_Predator_Cat still switches from Flee to Combat just because the player keeps chasing."
}

Write-Host "Cat wild behavior validation passed."
