# Security model

## Assets and trust boundaries

Protected assets include repository source, local credentials, personal data,
Git history, external systems, and the user's authority over consequential
actions. Untrusted inputs include upstream skill text, downloaded archives,
web pages, issue/PR content, logs, fixtures, model output, and tool responses.

The installed plugin contains instructions only. It provides no MCP server,
app connector, hook, command, executable script, credential, or autonomous
runtime. Repository-level maintenance scripts are not packaged as plugin
capabilities and must be inspected before manual execution.

## Principal threats and controls

| Threat | Control |
|---|---|
| Upstream tampering or archive drift | Exact commit pin, Git blob hashes, curated hashes, MIT notice, manual update review |
| Prompt injection in skill/source text | Common safety boundary; imported content treated as data; no upstream automation |
| Accidental destructive Git or publication | Git skill explicit-only; user operation-specific authorization required |
| Package-install or supply-chain execution | No plugin dependencies; installs and downloading `npx` require explicit approval |
| Secret or private-data disclosure | No skill reads secrets; the parent-authorized shared closeout helper may read only the local bot token and sends only sanitized metadata without logging configuration |
| Migration, deletion, or production impact | Migration skill explicit-only; separate approval and rollback evidence required |
| Over-broad automatic activation | Seventeen narrow implicit descriptions; three high-risk skills implicit-disabled |
| Use outside codex_works | Metadata and body restrict implicit use to repos governed by codex_works policy |
| AGENTS policy loss during extraction | Extraction audit maps each removed procedure; mandatory invariants and repo-specific facts remain local |

## Workspace-scope limitation

Codex plugin installation is user-profile level. The plugin cannot create an
operating-system isolation boundary around `E:\codex_works`. Workspace scoping
is therefore a layered behavioral control:

1. narrow descriptions condition implicit use on the codex_works parent policy;
2. every skill repeats the authority boundary;
3. the parent `AGENTS.md` defines the allowlist and precedence;
4. high-risk skills disable implicit invocation in `agents/openai.yaml`.

The Discord closeout skill is a narrow exception for external state: it can run
only where the parent policy already mandates the notification. The plugin still
contains no credential or executable sender. The audited sender remains in the
shared workspace repository, refuses unsafe summaries, skips unless the bot is
definitely running, and never returns configuration values.
Channel registration is a separate explicit-user-input path: the shared helper
validates the supplied snowflake, bot access, guild and channel type, then writes
only a conflict-free mapping to the bot's ignored SQLite store. It never replaces
an existing repository or channel mapping automatically.

An accidental selection outside the workspace must stop at the skill's safety
boundary and must not authorize any additional action.

## Non-goals

- The plugin is not a security scanner or enforcement sandbox.
- It does not replace repository policy, user approval, code review, or tests.
- It does not automatically update itself or trust new upstream releases.
