param([int]$Port = 8188)
$Root = (Resolve-Path (Join-Path $PSScriptRoot '..\..')).Path
$Comfy = Join-Path $Root 'external\comfyui'
if (-not (Test-Path $Comfy)) { throw 'ComfyUI não instalado. Rode bootstrap.ps1.' }
Push-Location $Comfy
try {
    python main.py --listen 127.0.0.1 --port $Port
} finally {
    Pop-Location
}
