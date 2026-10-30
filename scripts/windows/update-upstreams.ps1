$ErrorActionPreference = 'Continue'
$Root = (Resolve-Path (Join-Path $PSScriptRoot '..\..')).Path
$External = Join-Path $Root 'external'

Get-ChildItem $External -Directory | ForEach-Object {
    $gitDir = Join-Path $_.FullName '.git'
    if (Test-Path $gitDir) {
        Write-Host "Atualizando $($_.Name)..." -ForegroundColor Cyan
        git -C $_.FullName pull --ff-only
    }
}
