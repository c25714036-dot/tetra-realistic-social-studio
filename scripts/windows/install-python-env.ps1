$Root = (Resolve-Path (Join-Path $PSScriptRoot '..\..')).Path
$Venv = Join-Path $Root '.venv'
python -m venv $Venv
& "$Venv\Scripts\python.exe" -m pip install --upgrade pip
Write-Host "Ambiente Python local criado em $Venv" -ForegroundColor Green
