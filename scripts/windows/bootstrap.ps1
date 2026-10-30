param(
    [ValidateSet('core','creator','research')]
    [string]$Profile = 'core'
)

$ErrorActionPreference = 'Stop'
$Root = (Resolve-Path (Join-Path $PSScriptRoot '..\..')).Path
$External = Join-Path $Root 'external'
$ConfigPath = Join-Path $Root 'config\upstreams.json'

function Require-Command($Name) {
    if (-not (Get-Command $Name -ErrorAction SilentlyContinue)) {
        throw "Comando obrigatório não encontrado: $Name"
    }
}

Require-Command git
Require-Command python

New-Item -ItemType Directory -Force -Path $External | Out-Null
$config = Get-Content $ConfigPath -Raw | ConvertFrom-Json

$rank = @{ core = 1; creator = 2; research = 3 }
$selectedRank = $rank[$Profile]

Write-Host "Tetra Realistic Social Studio" -ForegroundColor Cyan
Write-Host "Perfil: $Profile" -ForegroundColor Yellow

foreach ($project in $config.projects) {
    if ($rank[$project.tier] -gt $selectedRank) { continue }

    if (-not $project.autoClone) {
        if ($Profile -ne 'research') {
            Write-Host "[skip] $($project.name) — instalação manual/licença a revisar" -ForegroundColor DarkYellow
            continue
        }
        $answer = Read-Host "Clonar $($project.name) (licença: $($project.license))? [s/N]"
        if ($answer -notmatch '^(s|S|y|Y)$') { continue }
    }

    $dest = Join-Path $External $project.id
    if (Test-Path (Join-Path $dest '.git')) {
        Write-Host "[ok] $($project.name) já existe" -ForegroundColor DarkGreen
        continue
    }

    Write-Host "[clone] $($project.name)" -ForegroundColor Cyan
    git clone --depth 1 $project.repo $dest
}

Write-Host "\nBootstrap concluído." -ForegroundColor Green
Write-Host "Execute .\scripts\windows\doctor.ps1 para validar o ambiente."
