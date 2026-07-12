---
name: workspace-cross-repo-coordination
description: Coordinate work that reads, changes, validates, or documents more than one repository under codex_works. Use automatically when a task spans repositories, a repo depends on another, or validation crosses repository boundaries. Do not treat related repositories or read access as shared write authority.
---

# Cross-Repo Coordination

## Safety boundary

- Each repository has separate history, policy, dirty state, permissions, and risk.
- Access to a secondary repository does not authorize edits, cleanup, commits, or external actions there.
- Preserve unrelated work and never combine repositories into one commit.

## Workflow

1. Name the primary repository, every secondary repository, and the exact integration link.
2. Read applicable policy and `git status` separately in each repository.
3. Define allowed read/write paths and protected paths for every repo.
4. Decide the smallest implementation order; prefer a stable producer contract before dependent consumer changes.
5. Validate repo-local behavior first, then the cross-repo contract or runtime flow.
6. Keep state, changelog, task plans, inventories, and version decisions correct in each affected repository.
7. Stage, commit, and publish separately and only when each corresponding operation is explicitly authorized.
8. Report untouched dirty repositories and any validation that could not be performed across the boundary.

## Review focus

Prioritize contract drift, integration regressions, secret leakage, path/encoding incompatibility, package mismatch, permissions, deployment order, and documentation divergence.
