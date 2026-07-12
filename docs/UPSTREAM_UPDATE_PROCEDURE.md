# Upstream update procedure

Updates are manual and commit-pinned. Do not use blind marketplace upgrades.

1. Select an exact upstream commit and verify repository identity and license.
2. Fetch into the ignored `.worktree-cache/agent-skills` clone without executing upstream content.
3. Review every selected file diff, including prompt-injection, executable,
   dependency, secret, external-service, destructive Git, migration, and scope risks.
4. Keep the local safety boundaries. Curate changes instead of overwriting local files.
5. Recalculate Git blob and local SHA-256 values in `UPSTREAM.lock.json`.
6. Update `SOURCE_REVIEW.md`, `SECURITY_MODEL.md`, activation metadata, version,
   changelog, state, and inventory as needed.
7. Run all repository, OpenAI plugin, and per-skill validators plus secret scan.
8. Reinstall only after approval, using the plugin-creator cachebuster helper for
   local iteration rather than incrementing the semantic version solely for cache invalidation.
9. Start a new thread and repeat positive, negative, authority, and outside-workspace tests.

Reject the update if provenance, license, scope, safety semantics, or validation
cannot be established.
