---
name: windows-mcp-startup-hygiene
description: Inspect Windows MCP and Serena process health at session startup, after the first interaction, or when transport availability is questioned. Use automatically before normal codex_works repository work when the parent policy requires it. Startup is inspection-only; cleanup, process termination, configuration changes, or secret access require separate explicit authorization.
---

# Windows MCP Startup Hygiene

## Safety boundary

- Initial startup hygiene is OS-level inspection only. Do not initialize Serena merely to inspect processes.
- Do not stop host-managed duplicate branches during normal startup reporting.
- Never print tokens or literal authorization headers. Do not rewrite MCP configuration unless explicitly requested.
- Cleanup authority must be explicit for the current task; process access alone is not permission.

## Inspection workflow

1. Use PowerShell/CIM to inspect relevant process roots and descendants with `Name`, `ProcessId`, `ParentProcessId`, and `CommandLine`.
2. Identify the active `codex.exe app-server` owner and distinguish host-managed duplicates from clearly orphaned branches.
3. Report missing, duplicated, stuck, or suspicious Serena/Filesystem/MCP branches before repository work.
4. After the first user interaction in a fresh session, repeat the process check once.
5. When full availability verification is needed, use real calls for Serena, Filesystem, `ai_tools_local` MCP initialize with the correct Accept header, and Obsidian when expected.

## Explicit cleanup workflow

Only when cleanup is explicitly authorized:

1. Select the younger duplicate root branch, never an arbitrary child.
2. Stop that root and all descendants using non-conflicting PowerShell variable names such as `$targetProcessId`.
3. Wait briefly and re-check the tree once; do not enter a kill loop.
4. Immediately verify real MCP transport after cleanup.
5. If Serena returns `Transport closed` or the host respawns duplicates, stop and report the need for Codex/VS Code restart or reconnect.

Do not treat a running process, tray icon, or dashboard as proof of a working MCP transport.

## Logging

Record MCP rule changes, incidents, and cleanup results in `codex-works-shared/CHANGELOG.dev.md` and `STATE.md` when that repository is available. Do not include credentials or private header values.
