[CmdletBinding()]
param(
    [string]$RepositoryRoot = (Split-Path -Parent $PSScriptRoot)
)

$ErrorActionPreference = 'Stop'
$pluginRoot = Join-Path $RepositoryRoot 'plugins/codex-works-engineering-skills'
$files = @(Get-ChildItem -LiteralPath $pluginRoot -Recurse -File | Where-Object { $_.Extension -in '.md', '.yaml', '.json' })
$failures = [Collections.Generic.List[string]]::new()

$rules = [ordered]@{
    'placeholder' = '(?i)\[TODO:|\bTODO\b|\bFIXME\b'
    'product leak' = '(?i)E-SPER'
    'personal path' = '(?i)C:\\Users\\|/Users/'
    'unconditional destructive git' = '(?im)^\s*(git\s+reset\s+--hard|git\s+clean\s+-[a-z]*f)\b'
    'unconditional audit fix' = '(?im)^\s*(npm|pnpm|yarn)\s+audit\s+fix\b'
    'unconditional downloader' = '(?im)^\s*npx\s+(?:-y|--yes)\b'
}

foreach ($file in $files) {
    $text = Get-Content -LiteralPath $file.FullName -Raw
    foreach ($rule in $rules.GetEnumerator()) {
        if ($text -match $rule.Value) {
            $failures.Add("$($rule.Key): $($file.FullName)")
        }
    }
}

if ($failures.Count -gt 0) {
    $failures | ForEach-Object { Write-Error $_ }
    throw "Skill content audit failed with $($failures.Count) finding(s)."
}

Write-Host "Skill content audit passed for $($files.Count) files."
