$Root = (Resolve-Path (Join-Path $PSScriptRoot '..\..')).Path
$External = Join-Path $Root 'external'

function Status($Label, $Ok, $Detail='') {
    $mark = if ($Ok) { '[OK]' } else { '[--]' }
    $color = if ($Ok) { 'Green' } else { 'DarkYellow' }
    Write-Host "$mark $Label $Detail" -ForegroundColor $color
}

Status 'Git' ([bool](Get-Command git -ErrorAction SilentlyContinue))
Status 'Python' ([bool](Get-Command python -ErrorAction SilentlyContinue))
Status 'NVIDIA SMI' ([bool](Get-Command nvidia-smi -ErrorAction SilentlyContinue))

if (Get-Command python -ErrorAction SilentlyContinue) {
    Write-Host "Python: $(python --version 2>&1)"
}
if (Get-Command nvidia-smi -ErrorAction SilentlyContinue) {
    nvidia-smi --query-gpu=name,memory.total,driver_version --format=csv,noheader
}

$ids = 'comfyui','flux2','photoshoot','instantid','photomaker','fooocus','zakaru','vicii','ecom'
foreach ($id in $ids) {
    Status "external/$id" (Test-Path (Join-Path $External $id))
}
