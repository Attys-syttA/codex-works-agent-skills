# STATE

Last updated: 2026-07-12

## Current state

- Plugin: `codex-works-engineering-skills` base version `1.2.0`.
- Marketplace: `codex-works-local`.
- Upstream pinned to `849850e03972c84a909286e8fddbdc8166600b0f`.
- Twenty curated skills: seventeen implicit-capable and three explicit-only.
- Installed plugin contains no executable code, hooks, MCPs, apps, commands, or personas.
- Remote: `origin` points to `Attys-syttA/codex-works-agent-skills`; publication branch is `agent/initial-engineering-skills` based on the GitHub-created MIT-license commit.

## Validation

- The plugin is installed and enabled as `1.2.0+codex.20260712160310`.
- Online provenance verification passed for all 15 curated upstream files.
- OpenAI plugin validator passed.
- OpenAI skill validator passed for all 20 skills.
- Marketplace/plugin installation exposes the cachebuster-reinstalled `1.1.0` build.
- All 19 skill validators, plugin structure/content audit, 67-file deterministic inventory, upstream provenance, GitGuardian scan, and `git diff --check` passed.
- Fresh E-SPER read-only smoke selected `workspace-repo-startup`, `rendered-frontend-qa`, and `workspace-task-closeout` after the AGENTS cleanup.
- The audited shared helper recognized the supervised `CodexBot.exe`, rejected credential-like content, and delivered live sanitized test messages to the configured E-SPER and plugin-repository channels after adding Discord's required User-Agent.
- Repository channels are resolved from the bot's existing read-only SQLite registration; a separate ignored mapping is needed only as an explicit override.
- Missing mappings now trigger a user prompt; an explicitly supplied channel ID can be registered only after Discord access/guild/type validation and SQLite conflict checks.
- Fresh read-only CLI smoke test resolved all 11 explicit skills and preserved authority boundaries.
- Version-sensitive implicit smoke test selected `source-driven-development`.
- Outside-workspace trivial spelling smoke test remained a one-word response.
- Fresh CLI tests required `-m gpt-5.4-mini`: profile default `gpt-5.6-sol` is unsupported by installed Codex CLI `0.139.0` and requests a CLI upgrade.
- UTF-8 without BOM and LF-only encoding check passed.
- Deterministic inventory check passed for 49 files.
- `ggshield secret scan repo .` passed with no secrets found.
- `git diff --check`, protected-repository audit, shared workspace baseline/encoding checks, and parent-policy hash parity passed.
- `E-SPER` remained clean and unchanged.
- Initial GitHub `validate` and `encoding-check` runs passed. The custom
  GitGuardian job exposed a missing repository API-key secret; the branch now
  uses GitGuardian when configured and a commit-pinned Gitleaks fallback otherwise.

## Next step

- Review and merge the draft publication PR to `main`, then start a new Codex app thread for routine use.
