Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$expectedRecipes = @(
    @{
        Path = "Server/Item/Items/Furniture/Cat_Box.json"
        Output = "Cat_Box"
        Fibre = 10
        Catnip = 5
    },
    @{
        Path = "Server/Item/Items/Furniture/Cat_Box2.json"
        Output = "Cat_Box2"
        Fibre = 20
        Catnip = 10
    }
)

foreach ($expected in $expectedRecipes) {
    if (-not (Test-Path -Path $expected.Path)) {
        throw "Missing cat box asset '$($expected.Path)'."
    }

    $asset = Get-Content -Path $expected.Path -Raw | ConvertFrom-Json
    if ($null -eq $asset.Recipe) {
        throw "Missing recipe on '$($expected.Path)'."
    }

    $inputs = @{}
    foreach ($input in @($asset.Recipe.Input)) {
        $inputs[$input.ItemId] = [int]$input.Quantity
    }

    if ($inputs["Ingredient_Fibre"] -ne $expected.Fibre) {
        throw "Expected $($expected.Fibre)x Ingredient_Fibre in '$($expected.Path)', found $($inputs["Ingredient_Fibre"])."
    }

    if ($inputs["Plant_Flower_Catnip"] -ne $expected.Catnip) {
        throw "Expected $($expected.Catnip)x Plant_Flower_Catnip in '$($expected.Path)', found $($inputs["Plant_Flower_Catnip"])."
    }

    $output = @(@($asset.Recipe.Output) | Where-Object { $_.ItemId -eq $expected.Output })
    if ($output.Count -ne 1 -or [int]$output[0].Quantity -ne 1 -or [int]$asset.Recipe.OutputQuantity -ne 1) {
        throw "Expected '$($expected.Path)' to output exactly one $($expected.Output)."
    }

    $bench = @(@($asset.Recipe.BenchRequirement) | Where-Object {
        $_.Type -eq "Crafting" -and
        $_.Id -eq "Workbench" -and
        [int]$_.RequiredTierLevel -eq 2 -and
        @($_.Categories) -contains "Workbench_Tinkering"
    })

    if ($bench.Count -ne 1) {
        throw "Expected '$($expected.Path)' to require Tier 2 Workbench Tinkering."
    }
}

Write-Host "Cat box recipes are craftable from Plant Fiber and Catnip at Tier 2 Workbench Tinkering."
