# Codex Works Engineering Skills

Local, security-curated Codex plugin for repositories governed by the
`codex_works` parent policy. It packages twenty-one engineering, workspace
workflow, and Hungarian prose skills: eleven curated from a pinned upstream
commit and ten authored for the local workspace operating model. The plugin contains no hooks, MCP
servers, apps, commands, personas, credentials, or executable scripts.

## Activation

- Eighteen skills are exposed to the Codex available-skills list.
- Git/versioning, code review, and migration/deprecation remain explicit-only.
- Explicit use is available as `$skill-name` after installation.
- Installation is user-profile level; workspace scoping is enforced by skill
  descriptions, safety boundaries, and the `codex_works` parent `AGENTS.md`.

See `docs/ACTIVATION_MATRIX.md` and `docs/SECURITY_MODEL.md` before changing the
activation policy.

Workspace workflow skills cover repository startup, Windows MCP hygiene, new
repository baselines, cross-repository coordination, task closeout, rendered
frontend QA, inventory/package synchronization, and sanitized Discord closeout
notification. Detailed procedures live in skills, including safe local runtime
reload decisions; `AGENTS.md` files retain mandatory policy, authority, and
repo-specific facts.

`hungarian-prose-editor` is an available-list exposed local writing skill for
clear Hungarian official, natural, and technical prose. Its `SKILL.md` keeps
effective use gated to direct `$hungarian-prose-editor` requests. It contains
original guidance and source-register discipline only; referenced NAV PDFs may
be kept as local working copies, but remain outside the plugin package until
repository redistribution status is verified.

## Discord closeout integration

`workspace-discord-closeout-notification` provides the safety and decision
workflow only. The authorizing parent `AGENTS.md` points it to the audited
workspace helper:

```text
<CODEX_WORKS>\codex-works-shared\scripts\send-discord-closeout-notification.ps1
```

The helper is intentionally outside the plugin. It checks that the supervised
bot runtime is running, resolves repository channels from the bot's ignored
SQLite registration, sanitizes the message, and uses Discord's required HTTP
User-Agent. If a repository is not registered, the skill asks the user to
create or verify the channel and provide its ID. Registration validates bot
access, guild and channel type, and refuses repository/channel conflicts.

No token, real channel ID, runtime database, or `.env` content is stored in this
repository. The skill cannot authorize notifications outside a parent policy
that explicitly enables this workflow.

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
codex plugin marketplace add <CODEX_WORKS>\codex-works-agent-skills
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
