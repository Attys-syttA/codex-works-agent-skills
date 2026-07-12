---
name: workspace-repo-bootstrap
description: Bootstrap or normalize a repository under codex_works with project-specific policy, state and changelog files, encoding rules, inventory, safe examples, validation scripts, and justified CI workflows. Use automatically when creating a new repository or explicitly normalizing a repository baseline. Do not copy every workspace rule into local AGENTS.md or add irrelevant workflows.
---

# Workspace Repo Bootstrap

## Safety boundary

- Confirm repository location, intended visibility, runtime, packaging model, and applicable parent policy first.
- Do not initialize a remote, publish, install dependencies, overwrite existing policy, or commit/push without task-specific authorization.
- Use synthetic examples only; never migrate secrets or machine-private values into the baseline.

## Baseline workflow

1. Read the shared baseline rulebook and available `AGENTS.md`/`STATE.md` templates.
2. Create a local `AGENTS.md` containing only repository role, runtime model, local safety boundaries, local validation, versioning, packaging, and rollback differences.
3. Add concise `STATE.md`, development changelog, README, and task/plan structure when work spans sessions.
4. Add `.gitignore`, `.editorconfig`, and `.gitattributes` matching the real Windows/toolchain needs.
5. Establish deterministic tracked-file inventory with write and check modes.
6. If the repo builds a subset, add a separate bundle/package manifest derived from the full inventory.
7. Add a local aggregate check and only the CI workflows justified by stack and risk: build/test, lint/typecheck, encoding, inventory, secret/security, persistence, Docker, integration, or platform checks as applicable.
8. Define public/private data policy, synthetic fixtures, env examples, release/version rules, and a stable rollback point.
9. Run local equivalents of CI before considering the baseline ready.

## Do not duplicate

Keep shared precedence, authorization, cross-repo, secret, Git, and Windows safety invariants in the parent policy. Local policy should retain only stricter or repository-specific requirements and short skill triggers.
