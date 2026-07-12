[CmdletBinding()]
param(
    [string]$RepositoryRoot = (Split-Path -Parent $PSScriptRoot),
    [switch]$Check
)

$ErrorActionPreference = 'Stop'
$inventoryPath = Join-Path $RepositoryRoot 'repo-file-inventory.json'
$gitFiles = @(git -C $RepositoryRoot ls-files --cached --others --exclude-standard 2>$null)
if ($LASTEXITCODE -ne 0) { throw 'Unable to enumerate repository files with git.' }
$relativeFiles = @($gitFiles | Where-Object { $_ -ne 'repo-file-inventory.json' } | Sort-Object)

$entries = foreach ($relative in $relativeFiles) {
    $absolute = Join-Path $RepositoryRoot $relative
    [ordered]@{
        path = $relative.Replace('\','/')
        sha256 = (Get-FileHash -Algorithm SHA256 -LiteralPath $absolute).Hash.ToLowerInvariant()
        bytes = (Get-Item -LiteralPath $absolute).Length
    }
}

$document = [ordered]@{
    schema_version = 1
    generated_from = 'git-index-and-untracked'
    files = @($entries)
}
$json = ($document | ConvertTo-Json -Depth 5) -replace "`r`n", "`n" -replace "`r", "`n"

if ($Check) {
    if (-not (Test-Path -LiteralPath $inventoryPath -PathType Leaf)) { throw 'Inventory is missing.' }
    $existing = (Get-Content -LiteralPath $inventoryPath -Raw).Trim()
    if ($existing -ne $json.Trim()) { throw 'Inventory is stale. Run tools/build-inventory.ps1.' }
    Write-Host "Inventory valid: $($entries.Count) files."
    return
}

[IO.File]::WriteAllText($inventoryPath, $json + "`n", [Text.UTF8Encoding]::new($false))
Write-Host "Inventory written: $($entries.Count) files."
