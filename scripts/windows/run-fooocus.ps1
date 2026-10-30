$Root = (Resolve-Path (Join-Path $PSScriptRoot '..\..')).Path
$Fooocus = Join-Path $Root 'external\fooocus'
if (-not (Test-Path $Fooocus)) { throw 'Fooocus não instalado. Rode bootstrap.ps1 -Profile creator.' }
Push-Location $Fooocus
try {
    if (Test-Path '.\entry_with_update.py') { python .\entry_with_update.py }
    elseif (Test-Path '.\launch.py') { python .\launch.py }
    else { throw 'Launcher do Fooocus não encontrado; consulte README upstream.' }
} finally {
    Pop-Location
}
