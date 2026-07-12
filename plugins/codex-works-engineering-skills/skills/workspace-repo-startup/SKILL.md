---
name: workspace-repo-startup
description: Establish the safe starting state for repository work under codex_works by resolving applicable AGENTS policy, repository boundaries, Git status, project state, task type, and continuation context. Use automatically at the beginning of repo work or when the active workspace/repository is unclear. Do not use as authority to modify every discovered repository.
---

# Workspace Repo Startup

## Safety boundary

- Follow system, developer, user, and the nearest applicable `AGENTS.md` before this skill.
- Discovery is read-only and does not authorize edits, cleanup, installs, commits, pushes, or cross-repo changes.
- Treat repositories as separate histories and risk surfaces.

## Startup sequence

1. Resolve the actual execution working directory; do not assume the IDE tab is the API workspace.
2. Locate the parent and nearest repo-local `AGENTS.md` files and apply their precedence.
3. Identify every repository that may be touched and state primary/secondary roles.
4. Run `git status --short --branch` in each potentially writable repository.
5. Identify pre-existing changes and protect them from overwrite, cleanup, staging, or formatting churn.
6. Read the repository `STATE.md` or documented equivalent before continuing prior work.
7. Inspect the active task/plan, changelog, or handoff record when the request continues earlier work.
8. Classify the request as read-only, repo-local implementation, cross-repo, documentation, release/package, or external-state work.
9. Choose the smallest safe next action and the validation boundary before editing.

Use `$windows-mcp-startup-hygiene` first when the Windows session-start policy requires MCP inspection. Use `$workspace-cross-repo-coordination` when more than one repository is writable.

## Completion signal

Report the actual workdir, repositories in scope, dirty-state risks, applicable policy, and the first authorized action. Do not ask for information that the filesystem can answer.
