# Codex Works Engineering Skills

Local, security-curated Codex plugin for repositories governed by the
`codex_works` parent policy. It packages eleven engineering workflow skills
derived from a pinned upstream commit, without hooks, MCP servers, apps,
commands, personas, or automatically executed scripts.

## Activation

- Eight low-risk workflow skills allow narrowly scoped implicit selection.
- Git/versioning, code review, and migration/deprecation are explicit-only.
- Explicit use is available as `$skill-name` after installation.
- Installation is user-profile level; workspace scoping is enforced by skill
  descriptions, safety boundaries, and the `codex_works` parent `AGENTS.md`.

See `docs/ACTIVATION_MATRIX.md` and `docs/SECURITY_MODEL.md` before changing the
activation policy.

## Validate

```powershell
pwsh -NoProfile -File .\tools\validate-plugin.ps1
pwsh -NoProfile -File .\tools\audit-skill-content.ps1
pwsh -NoProfile -File .\tools\verify-upstream.ps1
pwsh -NoProfile -File .\tools\build-inventory.ps1 -Check
```

The standard OpenAI plugin and skill validators are also run during acceptance.

## Install

After validation:

```powershell
codex plugin marketplace add E:\codex_works\codex-works-agent-skills
codex plugin add codex-works-engineering-skills@codex-works-local
codex plugin list
```

Start a new Codex thread after installation. Installation, removal, commit,
push, and remote publication remain explicit user operations.

## Provenance and updates

- Upstream source: [`addyosmani/agent-skills`](https://github.com/addyosmani/agent-skills)
- Canonical upstream commit: [`849850e03972c84a909286e8fddbdc8166600b0f`](https://github.com/addyosmani/agent-skills/commit/849850e03972c84a909286e8fddbdc8166600b0f)
- Exact upstream and curated hashes: `UPSTREAM.lock.json`
- Update procedure: `docs/UPSTREAM_UPDATE_PROCEDURE.md`
- Third-party license: `plugins/codex-works-engineering-skills/LICENSE.upstream`
- This repository: MIT licensed; see `LICENSE`.
