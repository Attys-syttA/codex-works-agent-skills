# Activation matrix

## Implicit-capable inside codex_works

| Skill | Positive trigger | Do not trigger for |
|---|---|---|
| `source-driven-development` | Version-sensitive API/library/platform fact | Stable basics, trivial edits |
| `incremental-implementation` | Multi-file or multi-stage implementation | One-line or informational work |
| `test-driven-development` | Bug fix or observable behavior change | Documentation-only changes |
| `api-and-interface-design` | Public schema, payload, prop, or API change | Private implementation detail |
| `security-and-hardening` | Auth, secrets, sensitive data, untrusted input, external boundary | Styling or low-risk prose |
| `debugging-and-error-recovery` | Reproducible failure or unexpected behavior | Speculative cleanup |
| `performance-optimization` | Measured or explicitly reported bottleneck | Unmeasured micro-optimization |
| `documentation-and-adrs` | Architecture, public interface, operations, or user-visible change | Unrelated prose |
| `workspace-repo-startup` | Beginning repository work or unclear execution scope | Non-repository conversation |
| `windows-mcp-startup-hygiene` | Windows session startup or MCP transport concern | Non-Windows work without MCP relevance |
| `workspace-repo-bootstrap` | New repository or explicit baseline normalization | Ordinary feature work in an established repo |
| `workspace-cross-repo-coordination` | More than one repository is read/changed/validated | Single-repository work |
| `workspace-task-closeout` | Substantial task, release, package, or multi-session closeout | Early implementation with no completed slice |
| `rendered-frontend-qa` | User-facing rendered web UI change | Backend-only or prose-only change |
| `workspace-package-inventory-sync` | File-role, inventory, runtime mirror, or package parity change | Source change with no derived artifact contract |
| `runtime-safe-reload` | Changed code may leave a local runtime or engine stale | No running consumer of the changed code |
| `workspace-discord-closeout-notification` | A material repository task completes, pauses, or becomes blocked under an authorizing parent policy | Ordinary questions, progress updates, or work outside codex_works |

## Explicit-only

| Skill | Reason |
|---|---|
| `deprecation-and-migration` | May influence compatibility, data, or deletion decisions |
| `code-review-and-quality` | Requires an explicitly resolved review target and read-only scope |
| `git-workflow-and-versioning` | May influence Git, version, release, or remote state |
| `hungarian-prose-editor` | Changes user-facing Hungarian wording and must not silently affect code, logs, legal text, quotes, or structured data |

Explicit invocation selects guidance only. It does not authorize the actions
described by a skill.

## Acceptance prompts

Positive and negative prompts are recorded in `docs/SOURCE_REVIEW.md`. Test in
a new thread after installation because skill metadata is loaded at session
startup.
