---
name: workspace-package-inventory-sync
description: Keep tracked source inventories, bundle/package manifests, test-run or runtime mirrors, local install packs, server/NAS packages, and version metadata synchronized with the verified source state. Use automatically when files are added/moved/removed, packaging roles change, or a task claims runtime/package parity. Do not edit generated output manually or label dirty experimental output as stable.
---

# Package And Inventory Sync

## Safety boundary

- Repository-local manifests and scripts define the source of truth; this skill does not invent package membership.
- Do not include secrets, auth/audit state, real analysis material, logs, user data, machine-private paths, caches, or unrelated repositories unless local policy explicitly defines a safe synthetic exception.
- Do not delete runtime state, overwrite user-selected data, publish packages, or run installers without task-specific authorization.

## Synchronization workflow

1. Identify the authoritative source tree, full tracked inventory, and every derived runtime/package target.
2. Determine whether file addition, move, deletion, role change, version change, or build output invalidated an inventory or manifest.
3. Run repository-provided write/update mode; never hand-edit hashes or generated membership when a generator exists.
4. Run check mode for the full inventory before package-specific checks.
5. Build or restore derived targets only from the validated source and only when local policy requires it for this checkpoint.
6. Verify resolved manifests, file counts/hashes, excluded sensitive paths, runtime assets, and visible version consistency.
7. Distinguish dirty/QA output from a stable package. Do not claim parity from timestamps or directory presence alone.
8. Re-run inventory/package/test-run checks after any generated metadata update and inspect `git status` for unintended tracked churn.

Keep exact commands, target directories, and exceptions in repo-local `AGENTS.md`; the skill supplies the reusable order and safety model.
