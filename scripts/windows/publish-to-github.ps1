param(
    [Parameter(Mandatory=$true)]
    [string]$RepoUrl,
    [string]$Branch = 'main'
)

$ErrorActionPreference = 'Stop'
$Root = (Resolve-Path (Join-Path $PSScriptRoot '..\..')).Path
Push-Location $Root
try {
    if (-not (Test-Path '.git')) {
        git init -b $Branch
    }

    git add .
    $hasChanges = git status --porcelain
    if ($hasChanges) {
        git commit -m 'feat: initialize realistic social media AI studio'
    }

    $remote = git remote 2>$null
    if ($remote -contains 'origin') {
        git remote set-url origin $RepoUrl
    } else {
        git remote add origin $RepoUrl
    }

    git push -u origin $Branch
} finally {
    Pop-Location
}
