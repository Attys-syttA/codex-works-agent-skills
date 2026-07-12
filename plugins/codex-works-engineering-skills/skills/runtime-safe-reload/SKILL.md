---
name: runtime-safe-reload
description: Decide and perform a safe local application, backend, engine, or test-runtime reload after code changes without interrupting active user work. Use automatically when changed code may leave a running local process stale. Do not restart, stop, or replace a runtime until activity is checked; uncertain or active work requires waiting or user confirmation.
---

# Runtime Safe Reload

## Safety boundary

- Runtime access does not authorize process termination, service restart, data migration, port cleanup, or replacement of user state.
- Use repository-provided status and runtime scripts when available; inspect scripts before execution.
- Never expose credentials, runtime secrets, real analysis material, or personal data while checking health.

## Workflow

1. Determine whether the changed code is loaded by a currently running local application, backend, engine, worker, or test runtime.
2. Identify the repository-approved activity/health source and exact runtime owner, port, process tree, and data directory.
3. Check for active jobs, analyses, uploads, exports, user interaction, or other interruptible work.
4. If activity cannot be determined reliably, ask the user before restart.
5. If work is active, do not interrupt it. Wait a short policy-approved interval, re-check once, then request confirmation if still active.
6. When idle and authorized, use the repository-provided stop/start or reload path; do not kill unrelated processes or discard runtime state.
7. Verify health, version/capabilities, expected ports, and the changed behavior after restart.
8. Report whether reload occurred, whether activity caused waiting, whether confirmation was needed, and any unresolved blocker.

Keep exact commands, wait interval, runtime paths, state exclusions, and process-specific rules in repo-local `AGENTS.md`.
