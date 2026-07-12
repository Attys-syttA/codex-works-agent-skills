---
name: workspace-task-closeout
description: Close a substantial codex_works task by reconciling implementation, tests, STATE, changelog, active/done plans, inventory, packaging, version decisions, and final Git scope. Use automatically near completion of implementation, validation, release/package, policy, or multi-session work. Documentation must describe verified reality, not intended or assumed results.
---

# Workspace Task Closeout

## Safety boundary

- Closeout does not authorize commit, push, merge, release, deployment, restart, package publication, deletion, or movement of unrelated task files.
- Do not claim tests, builds, scans, screenshots, synchronization, or runtime checks that did not run.
- Keep secrets, personal data, real case material, tokens, and machine-private values out of tracked records.

## Closeout workflow

1. Re-read the task acceptance criteria and inspect the final source diff.
2. Run the repository-specific focused and broad gates in risk-appropriate order.
3. Reconcile generated inventories, manifests, runtime copies, packages, screenshots, and help/docs only when their source changed.
4. Record an explicit version decision and synchronize exposed versions when a bump is required.
5. Update `STATE.md` concisely with current status, evidence, limitations, and next action.
6. Append the development changelog without rewriting history; include date, goal, files/areas, commands, result, and follow-up expected by local policy.
7. Move only truly completed task plans to the local done location; keep active status blocks factual for unfinished work.
8. Run encoding, inventory, secret, and `git diff --check` gates required by policy.
9. Inspect final `git status` across every touched repository and report pre-existing or unrelated changes separately.

Use `$workspace-package-inventory-sync` when source has runtime/package mirrors. Use `$rendered-frontend-qa` when UI acceptance depends on rendered evidence.
