# STATE

Last updated: 2026-07-19

## Current state

- Plugin: `codex-works-engineering-skills` base version `1.4.0`.
- Marketplace: `codex-works-local`.
- Upstream pinned to `849850e03972c84a909286e8fddbdc8166600b0f`.
- Twenty-two curated skills: nineteen available-list exposed and three
  explicit-only.
- Installed plugin contains no executable code, hooks, MCPs, apps, commands, or personas.
- Remote: `origin` points to `Attys-syttA/codex-works-agent-skills`; publication branch is `agent/initial-engineering-skills` based on the GitHub-created MIT-license commit.

## Validation

- The plugin source now targets `1.4.0+codex.20260719110000`; installed
  runtime availability must be refreshed only after explicit user authorization.
- The plugin was previously installed and enabled as `1.2.0+codex.20260712160310`.
- Online provenance verification passed for all 15 curated upstream files.
- OpenAI plugin validator passed.
- OpenAI skill validator passed for all 20 skills.
- Marketplace/plugin installation exposes the cachebuster-reinstalled `1.1.0` build.
- All 22 skill validators, plugin structure/content audit, 84-file deterministic inventory, upstream provenance, GitGuardian scan, encoding check, and `git diff --check` passed for the `programtervezo` source addition.
- Fresh E-SPER read-only smoke selected `workspace-repo-startup`, `rendered-frontend-qa`, and `workspace-task-closeout` after the AGENTS cleanup.
- The audited shared helper recognized the supervised `CodexBot.exe`, rejected credential-like content, and delivered live sanitized test messages to the configured E-SPER and plugin-repository channels after adding Discord's required User-Agent.
- Repository channels are resolved from the bot's existing read-only SQLite registration; a separate ignored mapping is needed only as an explicit override.
- Missing mappings now trigger a user prompt; an explicitly supplied channel ID can be registered only after Discord access/guild/type validation and SQLite conflict checks.
- Fresh read-only CLI smoke test resolved all 11 explicit skills and preserved authority boundaries.
- Version-sensitive implicit smoke test selected `source-driven-development`.
- Outside-workspace trivial spelling smoke test remained a one-word response.
- Fresh CLI tests required `-m gpt-5.4-mini`: profile default `gpt-5.6-sol` is unsupported by installed Codex CLI `0.139.0` and requests a CLI upgrade.
- UTF-8 without BOM and LF-only encoding check passed.
- `hungarian-prose-editor` is exposed to the Codex available-skills list, while
  its `SKILL.md` keeps effective use gated to explicit `$hungarian-prose-editor`
  requests.
- `hungarian-prose-editor` was added as a local skill with three modes:
  `official-clear`, `natural-neutral`, and `technical-concise`.
- `programtervezo` was added as an available-list exposed local planning skill
  for saved Markdown implementation plans, strict Codex execution prompts,
  scope discipline, and repository-appropriate synthetic validation planning.
- The Hungarian prose references are original derived guidance; the listed PDF
  sources remain local external inputs and are not packaged into the plugin.
- NAV source synchronization is documented in
  `plugins/codex-works-engineering-skills/references/hungarian-prose-editor/source-setup.md`.
  Missing workplace PDFs should be downloaded from the recorded NAV page into
  `.local-sources/hungarian-prose-editor/nav/`.
- `validate-plugin.ps1`, `audit-skill-content.ps1`, `verify-upstream.ps1`,
  `build-inventory.ps1 -Check`, `git diff --check`, UTF-8/BOM/CRLF check,
  `ggshield secret scan repo .`, and `quick_validate.py` passed for the
  Hungarian prose skill addition.
- Deterministic inventory check passed for 84 files.
- `ggshield secret scan repo .` passed with no secrets found.
- `git diff --check`, protected-repository audit, shared workspace baseline/encoding checks, and parent-policy hash parity passed.
- `E-SPER` remained clean and unchanged.
- Initial GitHub `validate` and `encoding-check` runs passed. The custom
  GitGuardian job exposed a missing repository API-key secret; the branch now
  uses GitGuardian when configured and a commit-pinned Gitleaks fallback otherwise.

## Next step

- Validate the `1.4.0` `programtervezo` skill addition. Commit, push, install,
  or publish only after explicit user authorization.
