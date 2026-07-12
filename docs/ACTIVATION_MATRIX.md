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

## Explicit-only

| Skill | Reason |
|---|---|
| `deprecation-and-migration` | May influence compatibility, data, or deletion decisions |
| `code-review-and-quality` | Requires an explicitly resolved review target and read-only scope |
| `git-workflow-and-versioning` | May influence Git, version, release, or remote state |

Explicit invocation selects guidance only. It does not authorize the actions
described by a skill.

## Acceptance prompts

Positive and negative prompts are recorded in `docs/SOURCE_REVIEW.md`. Test in
a new thread after installation because skill metadata is loaded at session
startup.
