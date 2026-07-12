---
name: git-workflow-and-versioning
description: Guide explicitly authorized Git status, staging, commit, branch, tag, push, merge, release-version, and changelog work with scope and secret checks. Use only when the user explicitly invokes this skill or explicitly requests the corresponding Git operation; never activate implicitly.
---

# Git Workflow and Versioning

## Safety boundary

- Follow higher-priority instructions, the nearest `AGENTS.md`, and the repository Git playbook.
- Skill invocation does not authorize commit, push, tag, merge, branch deletion, worktree removal, history rewrite, release, or remote creation unless the user's request explicitly includes that operation.
- Never use destructive reset/checkout to discard changes. Preserve unrelated and pre-existing work.
- Do not stage secrets, machine-local state, private exports, or unrelated generated files.

## Authorized workflow

1. Resolve repository, current branch, upstream, worktrees, and `git status`.
2. Separate user changes from task changes and inspect the exact diff.
3. Run repository-required validation, encoding, inventory, and secret checks.
4. Stage only reviewed task files when staging is authorized.
5. Use an atomic message that explains intent and preserves repository conventions.
6. Re-read the staged diff before an authorized commit.
7. Push only the explicitly requested branch/remote; never force-push without a separate explicit instruction and safety review.
8. For version changes, apply repository policy and keep manifests, visible version, changelog, and packages synchronized.

Branch deletion, worktree removal, tagging, merging, and releases are separate consequential operations and require direct authorization even after a commit.
