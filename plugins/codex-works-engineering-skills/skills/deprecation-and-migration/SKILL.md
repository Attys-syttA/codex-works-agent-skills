---
name: deprecation-and-migration
description: Plan and execute explicitly requested API, data, schema, configuration, or feature deprecations with compatibility, rollout, and rollback controls. Use only when the user explicitly invokes this skill or explicitly requests a migration or deprecation; never activate implicitly.
---

# Deprecation and Migration

## Safety boundary

- Follow higher-priority instructions and applicable `AGENTS.md` rules.
- Explicit skill invocation authorizes analysis, not automatic migration, deletion, deployment, Git publication, or external coordination.
- Before any state change, identify backups, owners, compatibility window, rollback, data-loss risk, and required approval.
- Never run database migrations, remove code/data, rewrite history, or disable compatibility paths without separate task-specific authorization.

## Workflow

1. Inventory producers, consumers, stored data, versions, and undocumented dependencies.
2. Define the replacement contract and measurable migration completion criteria.
3. Classify the change as advisory or compulsory and document the support window.
4. Prefer expand/contract: add the new path, support both, migrate callers/data, verify adoption, then propose removal.
5. Use adapters, feature controls, or dual-read/write only when their consistency and rollback behavior are explicit.
6. Test mixed-version, partial-migration, retry, rollback, and failure states.
7. Remove the old path only after evidence shows no supported consumer relies on it and the user authorizes removal.
8. Update public docs, changelog, state records, and operational runbooks.

Do not treat old-looking code as dead. Prove reachability and ownership before proposing deletion.
