# STATE

Last updated: 2026-07-12

## Current state

- Plugin: `codex-works-engineering-skills` version `1.0.0`.
- Marketplace: `codex-works-local`.
- Upstream pinned to `849850e03972c84a909286e8fddbdc8166600b0f`.
- Eleven curated skills: eight implicit-capable and three explicit-only.
- Installed plugin contains no executable code, hooks, MCPs, apps, commands, or personas.
- Remote: `origin` points to `Attys-syttA/codex-works-agent-skills`; publication branch is `agent/initial-engineering-skills` based on the GitHub-created MIT-license commit.

## Validation

- Repository plugin structure and content audits passed.
- Online provenance verification passed for all 15 curated upstream files.
- OpenAI plugin validator passed.
- OpenAI skill validator passed for all 11 skills.
- Marketplace/plugin installation succeeded; CLI reports `installed, enabled`, version `1.0.0`.
- Fresh read-only CLI smoke test resolved all 11 explicit skills and preserved authority boundaries.
- Version-sensitive implicit smoke test selected `source-driven-development`.
- Outside-workspace trivial spelling smoke test remained a one-word response.
- Fresh CLI tests required `-m gpt-5.4-mini`: profile default `gpt-5.6-sol` is unsupported by installed Codex CLI `0.139.0` and requests a CLI upgrade.
- UTF-8 without BOM and LF-only encoding check passed.
- Deterministic inventory check passed for 49 files.
- `ggshield secret scan repo .` passed with no secrets found.
- `git diff --check`, protected-repository audit, shared workspace baseline/encoding checks, and parent-policy hash parity passed.
- `E-SPER` remained clean and unchanged.

## Next step

- Review and merge the draft publication PR to `main`, then start a new Codex app thread for routine use.
