---
name: workspace-discord-closeout-notification
description: Send a concise, sanitized Discord status message to the active repository's configured channel when a material Codex Works repository task completes, pauses, becomes blocked, or otherwise stops. Use implicitly only inside repositories governed by the codex_works parent policy when that policy explicitly requires the notification. Do not use for ordinary questions, early progress updates, work outside codex_works, or when no repository task is stopping.
---

# Workspace Discord closeout notification

## Safety boundary

- Follow direct user instructions and every applicable `AGENTS.md` before this skill.
- Treat this skill as workflow guidance, not independent authority for external messaging or secret access.
- Send only because the applicable parent policy explicitly authorizes the audited closeout notification.
- Never read, print, copy, summarize, or expose `.env` contents, tokens, credentials, guild IDs, user IDs, or unrelated channel IDs.
- Never start, restart, stop, or reconfigure the Discord bot or its control panel.
- Never send source code, diffs, logs, prompts, absolute local paths, personal data, case data, test data, or secrets.
- Do not install packages, invoke arbitrary webhooks, or implement a direct Discord REST call ad hoc.

## Workflow

1. Resolve the active Git repository and its applicable parent policy.
2. Confirm that a material repository task is reaching a terminal state: `complete`, `paused`, or `blocked`.
3. Prepare a single short summary containing only:
   - repository name;
   - terminal status;
   - one plain-language result sentence;
   - an optional non-sensitive next step.
4. Run the audited helper defined by the parent policy:

   ```powershell
   pwsh -NoProfile -File <CODEX_WORKS>\codex-works-shared\scripts\send-discord-closeout-notification.ps1 `
     -RepositoryPath <ACTIVE_REPOSITORY> `
     -Status complete `
     -Summary "<SANITIZED_SUMMARY>"
   ```

5. Interpret the helper result:
   - `sent`: report that the repository channel was notified;
   - `bot-not-running`: skip silently except for a short final-status note;
   - `channel-not-configured`: ask the user to create/register the repository channel or provide its channel ID at the next useful interaction;
   - configuration or delivery failure: report only the safe reason, never raw response bodies or configuration values.
6. Send at most one message for the primary active repository. In a multi-repository task, notify a secondary repository only when it was materially modified and its own channel is configured.

## Missing channel registration

When the helper returns `channel-not-configured`:

1. Tell the user: "Ehhez a repóhoz még nincs Discord-csatorna regisztrálva. Ellenőrizd, hogy létezik-e a repo nevű csatorna; ha nem, hozd létre, majd add meg a csatornaazonosítót."
2. Wait for the user to provide the identifier. Do not create a Discord channel or infer an identifier.
3. Register only the explicitly supplied identifier:

   ```powershell
   pwsh -NoProfile -File <CODEX_WORKS>\codex-works-shared\scripts\send-discord-closeout-notification.ps1 `
     -RepositoryPath <ACTIVE_REPOSITORY> `
     -RegisterChannelId <USER_SUPPLIED_CHANNEL_ID>
   ```

4. Accept only `registered` or `already-registered` as success. The helper verifies bot access, server identity, supported channel type, and database conflicts before writing.
5. On `channel-conflict` or `repository-conflict`, do not overwrite the existing mapping; report the conflict and ask the user which mapping should remain.
6. Retry the closeout notification only after registration succeeds.

## Message discipline

- Keep the final Discord content under 1,500 characters.
- Use repository-relative filenames only when necessary.
- Do not include commit hashes unless the task actually created that commit and the hash is already safe to disclose.
- Do not claim success before required validation finishes.
- If the bot is not definitely running, do not send.
