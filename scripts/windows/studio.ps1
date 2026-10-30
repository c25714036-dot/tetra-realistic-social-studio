$Root = (Resolve-Path (Join-Path $PSScriptRoot '..\..')).Path

while ($true) {
    Clear-Host
    Write-Host 'TETRA REALISTIC SOCIAL STUDIO' -ForegroundColor Cyan
    Write-Host '1. Diagnóstico do ambiente'
    Write-Host '2. Instalar perfil Core'
    Write-Host '3. Instalar perfil Creator'
    Write-Host '4. Instalar perfil Research'
    Write-Host '5. Atualizar upstreams'
    Write-Host '6. Iniciar ComfyUI'
    Write-Host '7. Iniciar Fooocus'
    Write-Host '8. Gerar prompt Tetra 4:5 — comércio local'
    Write-Host '9. Gerar prompt Tetra 9:16 — reunião consultiva'
    Write-Host '0. Sair'
    $choice = Read-Host 'Escolha'

    switch ($choice) {
        '1' { & "$PSScriptRoot\doctor.ps1"; Pause }
        '2' { & "$PSScriptRoot\bootstrap.ps1" -Profile core; Pause }
        '3' { & "$PSScriptRoot\bootstrap.ps1" -Profile creator; Pause }
        '4' { & "$PSScriptRoot\bootstrap.ps1" -Profile research; Pause }
        '5' { & "$PSScriptRoot\update-upstreams.ps1"; Pause }
        '6' { & "$PSScriptRoot\run-comfy.ps1" }
        '7' { & "$PSScriptRoot\run-fooocus.ps1" }
        '8' { python "$Root\src\prompt_builder.py" --preset tetra-capital --scene comercio-local --format 4x5; Pause }
        '9' { python "$Root\src\prompt_builder.py" --preset tetra-capital --scene reuniao-consultiva --format 9x16; Pause }
        '0' { break }
        default { Write-Host 'Opção inválida.' -ForegroundColor Yellow; Start-Sleep -Seconds 1 }
    }
    if ($choice -eq '0') { break }
}
