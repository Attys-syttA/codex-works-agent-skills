# Development changelog

## 2026-07-12

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
