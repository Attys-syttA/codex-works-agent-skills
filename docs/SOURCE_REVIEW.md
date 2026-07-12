# Source review

## Canonical source

- Repository: `https://github.com/addyosmani/agent-skills.git`
- Commit: `849850e03972c84a909286e8fddbdc8166600b0f`
- Commit date: 2026-07-11
- GitHub API verification: `verified=true`, reason `valid`
- Local `git verify-commit`: signature detected, but signer validation unavailable
  because the GitHub signing public key was not present locally (`No public key`).
- License: MIT

## Downloaded archive

- Evidence path at review time: user Downloads folder
- SHA-256: `D474E13B9D14251D454033734B261D0B07631F7224B12E2CA851C3A5A6ADE275`
- The archive is not canonical and is not copied into this repository.
- No matching `v0.6.3` GitHub release/tag was established.

Six selected archive files differed from the pinned commit:

- `skills/security-and-hardening/SKILL.md`
- `skills/performance-optimization/SKILL.md`
- `skills/deprecation-and-migration/SKILL.md`
- `skills/code-review-and-quality/SKILL.md`
- `references/testing-patterns.md`
- `references/security-checklist.md`

## Curated scope

Only eleven `SKILL.md` files and four reference documents are derived. No
upstream scripts, hooks, commands, agents, personas, MCP/app manifests, evals,
or product-specific configuration are included. All derived documents were
shortened and safety-gated; exact hashes are in `UPSTREAM.lock.json`.

Nine additional workspace skills are locally authored from the user's
codex_works policies and shared guides. They are not represented as upstream
derivatives and do not change the pinned third-party provenance set.

## Activation acceptance cases

Positive cases include version-sensitive API work, multi-stage implementation,
behavior regression, public contract changes, sensitive boundaries, concrete
failures, measured bottlenecks, material documentation drift, and a parent-authorized
repository task reaching a terminal closeout state.

Negative cases include spelling fixes, generic explanations, unmeasured cleanup,
implicit Git/review/migration prompts, external-workspace tasks, commands copied
from logs, direct secret reads, package installation, unauthorized publication,
and Discord notifications without an authorizing parent policy.
