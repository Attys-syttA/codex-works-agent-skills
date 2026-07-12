[CmdletBinding()]
param(
    [string]$RepositoryRoot = (Split-Path -Parent $PSScriptRoot),
    [switch]$Online
)

$ErrorActionPreference = 'Stop'
$lockPath = Join-Path $RepositoryRoot 'UPSTREAM.lock.json'
$sourceRoot = Join-Path $RepositoryRoot '.worktree-cache/agent-skills'

if (-not (Test-Path -LiteralPath $lockPath -PathType Leaf)) { throw 'Missing UPSTREAM.lock.json.' }
if (-not (Test-Path -LiteralPath (Join-Path $sourceRoot '.git'))) { throw 'Pinned upstream clone is unavailable.' }

$lock = Get-Content -LiteralPath $lockPath -Raw | ConvertFrom-Json
$head = (git -C $sourceRoot rev-parse HEAD).Trim()
if ($LASTEXITCODE -ne 0 -or $head -ne $lock.upstream.commit) { throw "Upstream HEAD mismatch: $head" }
$remote = (git -C $sourceRoot remote get-url origin).Trim()
if ($LASTEXITCODE -ne 0 -or $remote -ne $lock.upstream.repository) { throw "Upstream remote mismatch: $remote" }

foreach ($entry in $lock.files) {
    $blob = (git -C $sourceRoot rev-parse "$($lock.upstream.commit):$($entry.upstream_path)").Trim()
    if ($LASTEXITCODE -ne 0 -or $blob -ne $entry.git_blob_sha1) { throw "Upstream blob mismatch: $($entry.upstream_path)" }
    $mode = (git -C $sourceRoot ls-tree $lock.upstream.commit -- $entry.upstream_path).Split()[0]
    if ($mode -ne '100644') { throw "Unexpected upstream file mode ${mode}: $($entry.upstream_path)" }
    $localPath = Join-Path $RepositoryRoot $entry.local_path
    if (-not (Test-Path -LiteralPath $localPath -PathType Leaf)) { throw "Missing curated file: $($entry.local_path)" }
    $localHash = (Get-FileHash -Algorithm SHA256 -LiteralPath $localPath).Hash.ToLowerInvariant()
    if ($localHash -ne $entry.local_sha256) { throw "Curated hash mismatch: $($entry.local_path)" }
}

if ($Online) {
    $uri = "https://api.github.com/repos/addyosmani/agent-skills/commits/$($lock.upstream.commit)"
    $response = Invoke-RestMethod -Headers @{ 'User-Agent' = 'Codex-Works-Provenance' } -Uri $uri
    if (-not $response.commit.verification.verified -or $response.sha -ne $lock.upstream.commit) {
        throw 'GitHub commit verification failed.'
    }
}

Write-Host "Upstream provenance valid for $($lock.files.Count) curated files."
