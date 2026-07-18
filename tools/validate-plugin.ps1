[CmdletBinding()]
param(
    [string]$RepositoryRoot = (Split-Path -Parent $PSScriptRoot)
)

$ErrorActionPreference = 'Stop'

function Assert-Condition {
    param([bool]$Condition, [string]$Message)
    if (-not $Condition) { throw $Message }
}

$pluginRoot = Join-Path $RepositoryRoot 'plugins/codex-works-engineering-skills'
$manifestPath = Join-Path $pluginRoot '.codex-plugin/plugin.json'
$marketplacePath = Join-Path $RepositoryRoot '.agents/plugins/marketplace.json'

Assert-Condition (Test-Path -LiteralPath $manifestPath -PathType Leaf) 'Missing plugin manifest.'
Assert-Condition (Test-Path -LiteralPath $marketplacePath -PathType Leaf) 'Missing marketplace manifest.'

$manifest = Get-Content -LiteralPath $manifestPath -Raw | ConvertFrom-Json
Assert-Condition ($manifest.name -eq 'codex-works-engineering-skills') 'Plugin name mismatch.'
Assert-Condition ($manifest.version -match '^[0-9]+\.[0-9]+\.[0-9]+(?:-[0-9A-Za-z.-]+)?(?:\+[0-9A-Za-z.-]+)?$') 'Plugin version is not strict semver.'
Assert-Condition (-not [string]::IsNullOrWhiteSpace($manifest.description)) 'Plugin description is missing.'
Assert-Condition ($manifest.author.name -eq 'Codex Works') 'Plugin author mismatch.'
Assert-Condition ($manifest.skills -eq './skills/') 'Plugin skills path mismatch.'
Assert-Condition ($null -eq $manifest.hooks) 'Unsupported hooks field found.'
Assert-Condition ($null -eq $manifest.mcpServers) 'Unexpected MCP declaration found.'
Assert-Condition ($null -eq $manifest.apps) 'Unexpected app declaration found.'
foreach ($key in 'displayName','shortDescription','longDescription','developerName','category','capabilities','defaultPrompt') {
    Assert-Condition ($null -ne $manifest.interface.$key) "Missing plugin interface field: $key"
}

$marketplace = Get-Content -LiteralPath $marketplacePath -Raw | ConvertFrom-Json
Assert-Condition ($marketplace.name -eq 'codex-works-local') 'Marketplace name mismatch.'
Assert-Condition ($marketplace.plugins.Count -eq 1) 'Marketplace must contain exactly one plugin.'
$entry = $marketplace.plugins[0]
Assert-Condition ($entry.name -eq $manifest.name) 'Marketplace plugin name mismatch.'
Assert-Condition ($entry.source.source -eq 'local') 'Marketplace source must be local.'
Assert-Condition ($entry.source.path -eq './plugins/codex-works-engineering-skills') 'Marketplace source path mismatch.'
Assert-Condition ($entry.policy.installation -eq 'AVAILABLE') 'Installation policy mismatch.'
Assert-Condition ($entry.policy.authentication -eq 'ON_INSTALL') 'Authentication policy mismatch.'
Assert-Condition ($entry.category -eq 'Productivity') 'Marketplace category mismatch.'

$expected = [ordered]@{
    'source-driven-development' = $true
    'incremental-implementation' = $true
    'test-driven-development' = $true
    'api-and-interface-design' = $true
    'security-and-hardening' = $true
    'debugging-and-error-recovery' = $true
    'performance-optimization' = $true
    'documentation-and-adrs' = $true
    'workspace-repo-startup' = $true
    'windows-mcp-startup-hygiene' = $true
    'workspace-repo-bootstrap' = $true
    'workspace-cross-repo-coordination' = $true
    'workspace-task-closeout' = $true
    'rendered-frontend-qa' = $true
    'workspace-package-inventory-sync' = $true
    'runtime-safe-reload' = $true
    'workspace-discord-closeout-notification' = $true
    'hungarian-prose-editor' = $true
    'deprecation-and-migration' = $false
    'code-review-and-quality' = $false
    'git-workflow-and-versioning' = $false
}

$skillDirectories = @(Get-ChildItem -LiteralPath (Join-Path $pluginRoot 'skills') -Directory)
Assert-Condition ($skillDirectories.Count -eq $expected.Count) 'Unexpected number of skill directories.'

foreach ($skillName in $expected.Keys) {
    $skillRoot = Join-Path $pluginRoot "skills/$skillName"
    $skillPath = Join-Path $skillRoot 'SKILL.md'
    $agentPath = Join-Path $skillRoot 'agents/openai.yaml'
    Assert-Condition (Test-Path -LiteralPath $skillPath -PathType Leaf) "Missing SKILL.md: $skillName"
    Assert-Condition (Test-Path -LiteralPath $agentPath -PathType Leaf) "Missing agents/openai.yaml: $skillName"

    $skillText = (Get-Content -LiteralPath $skillPath -Raw) -replace "`r`n", "`n"
    Assert-Condition ($skillText -match "(?s)^---\nname: $([regex]::Escape($skillName))\ndescription: .+?\n---\n") "Invalid frontmatter: $skillName"
    Assert-Condition ($skillText -match '## Safety boundary') "Missing safety boundary: $skillName"
    Assert-Condition ($skillText -notmatch '(?i)E-SPER|C:\\Users\\|/Users/') "Product or personal path leaked into skill: $skillName"

    foreach ($reference in [regex]::Matches($skillText, '\.\./\.\./references/([A-Za-z0-9.-]+\.md)')) {
        $referencePath = Join-Path $pluginRoot "references/$($reference.Groups[1].Value)"
        Assert-Condition (Test-Path -LiteralPath $referencePath -PathType Leaf) "Broken reference in $skillName"
    }

    $agentText = Get-Content -LiteralPath $agentPath -Raw
    $expectedValue = if ($expected[$skillName]) { 'true' } else { 'false' }
    Assert-Condition ($agentText -match "(?m)^\s*allow_implicit_invocation:\s*$expectedValue\s*$") "Invocation policy mismatch: $skillName"
    Assert-Condition ($agentText -match [regex]::Escape("`$${skillName}")) "Default prompt does not name skill: $skillName"
}

$allowedExtensions = @('.md', '.json', '.yaml')
$pluginFiles = @(Get-ChildItem -LiteralPath $pluginRoot -Recurse -Force -File)
foreach ($file in $pluginFiles) {
    $relative = [IO.Path]::GetRelativePath($pluginRoot, $file.FullName).Replace('\','/')
    $allowedType = ($allowedExtensions -contains $file.Extension.ToLowerInvariant()) -or ($relative -eq 'LICENSE.upstream')
    Assert-Condition $allowedType "Disallowed plugin file type: $($file.FullName)"
    Assert-Condition (-not ($file.Attributes -band [IO.FileAttributes]::ReparsePoint)) "Symlink/reparse point found: $($file.FullName)"
    if ($relative -match '(^|/)(hooks|scripts|commands|personas|assets)(/|$)' -or $relative -match '(^|/)(\.mcp\.json|\.app\.json|hooks\.json)$') {
        throw "Disallowed plugin surface: $relative"
    }
    if ($relative -match '(^|/)agents/' -and $relative -notmatch '^skills/[^/]+/agents/openai\.yaml$') {
        throw "Unexpected agent file: $relative"
    }
}

Write-Host "Plugin structure valid: $($expected.Count) skills (18 available-list exposed, 3 explicit-only)."
