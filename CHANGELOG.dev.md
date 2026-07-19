# Development changelog

## 2026-07-19

- Began version `1.4.0` by adding the available-list exposed `programtervezo`
  skill for saved Markdown
  implementation plans and strict Codex execution prompts. The skill plans
  before coding, keeps implementation scope bounded, requires repository-aware
  plan-file locations, and asks for synthetic fixtures plus observed-result
  evidence for code-level behavior changes.
- Validated the `programtervezo` addition with the plugin structure validator,
  skill content audit, upstream provenance check, all 22 `quick_validate.py`
  skill checks, deterministic 84-file inventory, UTF-8/LF encoding check,
  `ggshield secret scan repo .`, and `git diff --check`.
- Exposed `hungarian-prose-editor` to the Codex available-skills list by
  enabling its OpenAI agent policy while keeping the skill text explicitly
  gated to direct `$hungarian-prose-editor` use.
- Began version `1.3.0` by adding the explicit-only `hungarian-prose-editor` skill.
- Added three supported modes: `official-clear`, `natural-neutral`, and
  `technical-concise`, with strict preservation of facts, address form,
  protected spans, technical identifiers, and legal/procedural meaning.
- Added original reference materials for mode selection, AI-style cleanup,
  editorial checks, terminology preferences, and approved Hungarian examples.
- Recorded the user-supplied local PDF source set in a source register without
  copying the PDFs or embedding long source passages in the plugin.
- Added a NAV source setup reminder for synchronized machines: if the PDFs are
  missing, download them from `https://nav.gov.hu/kiadvanyok/kozerthetosegi-program`
  into `.local-sources/hungarian-prose-editor/nav/`.
- Validated plugin structure, skill content audit, upstream provenance, inventory,
  whitespace, encoding, secret scan, and the system skill quick validator.

## 2026-07-12

- Began version `1.2.0` with `workspace-discord-closeout-notification`.
- Added a parent-authorized, bot-running-gated closeout workflow that delegates delivery to the audited shared helper and keeps tokens/channel IDs outside the plugin.
- Validated live delivery to the configured E-SPER and plugin-repository channels; the initial Discord `40333` Cloudflare block was fixed by the required `DiscordBot (URL, version)` User-Agent in the shared helper.
- Added the missing-channel interaction: ask the user to create/check the repository channel and provide its ID, then validate and store a conflict-free mapping in the bot's ignored SQLite database.
- Updated the README to distinguish eleven upstream-derived skills from nine locally authored workspace skills and document the external helper boundary without exposing runtime configuration.
- Began version `1.1.0` by extracting reusable procedures from codex_works
  workspace and repository `AGENTS.md` files into eight locally authored skills.
- Added repository startup, Windows MCP hygiene, repository bootstrap,
  cross-repository coordination, task closeout, rendered frontend QA, and
  package/inventory synchronization workflows.
- Added `runtime-safe-reload` for active-work-aware local engine and application reload decisions.
- Replaced only successfully smoke-tested reusable procedures in the parent, E-SPER, email-header-analyzer, and WD-HUD policies with explicit skill triggers; retained their authority, safety, paths, commands, and project-specific invariants.
- Kept authority, precedence, secrets, destructive-operation, repository-role,
  runtime, versioning, and local command rules in `AGENTS.md` scope.
- Initialized the standalone Codex Works local marketplace repository.
- Added `codex-works-engineering-skills` version `1.0.0`.
- Curated eleven skills and four shared references from pinned upstream commit
  `849850e03972c84a909286e8fddbdc8166600b0f`.
- Added hybrid invocation policy: eight narrowly implicit skills and three explicit-only skills.
- Added provenance locking, upstream/archive review, safety model, update procedure,
  activation matrix, validators, inventory, encoding policy, and CI gates.
- Excluded upstream scripts, hooks, commands, agents, personas, MCP/app manifests,
  and product-specific instruction files.
- Registered marketplace `codex-works-local` and installed the plugin as enabled.
- Verified all 11 explicit skill resolutions, the version-sensitive implicit trigger,
  an outside-workspace negative case, and the no-authority-expansion rule in ephemeral read-only CLI sessions.
- Connected the local repository to `Attys-syttA/codex-works-agent-skills`, retained
  the GitHub-created MIT license, and prepared the initial plugin publication branch.
- Added the upstream `addyosmani/agent-skills` repository and pinned commit as
  explicit README provenance links.
- Fixed the secret-scan workflow for new repositories without a configured
  GitGuardian API key: use GitGuardian when the secret exists, otherwise run a
  commit-pinned Gitleaks fallback. The local and external GitGuardian checks remain enabled.
