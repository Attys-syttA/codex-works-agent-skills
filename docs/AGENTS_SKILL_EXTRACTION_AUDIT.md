# AGENTS workflow extraction audit

Date: 2026-07-12

## Decision rule

Move a section to a skill only when it is a conditional, reusable procedure.
Keep it in `AGENTS.md` when it defines precedence, authorization, mandatory
safety, repository identity, source of truth, sensitive data, exact local
commands/paths, versioning, rollback, or a stricter local exception.

No backup, `posta`, reference repository, packaged copy, alternate worktree, or
dirty overlapping `AGENTS.md` is rewritten by this extraction.

## Workspace mapping

| Existing policy area | Skill | What remains in parent policy |
|---|---|---|
| Session startup routine | `workspace-repo-startup` | Mandatory trigger, precedence, scope and `git status` invariants |
| Windows MCP/Serena detailed procedure | `windows-mcp-startup-hygiene` | Startup inspection requirement, cleanup authorization and stop conditions |
| New repository baseline and workflow catalog | `workspace-repo-bootstrap` | Requirement to use the skill and not weaken parent safety |
| Cross-repository planning/validation sequence | `workspace-cross-repo-coordination` | Separate-repo boundary and no implicit write authority |
| State/changelog/task lifecycle closeout | `workspace-task-closeout` | Required files and factual/no-secret invariant |
| Browser QA route and rendered checklist | `rendered-frontend-qa` | Mandatory real rendered QA for UI work |
| Inventory/package/runtime synchronization order | `workspace-package-inventory-sync` | Repo-specific manifests, commands, targets and sensitive exclusions |
| Active-work-aware runtime restart sequence | `runtime-safe-reload` | Exact runtime commands, wait interval, activity source and protected state |
| Repository closeout Discord notification | `workspace-discord-closeout-notification` | Parent authorization, bot-running gate, read-only bot registration lookup, explicit validated conflict-free registration, sanitized message, no secret exposure |

## Repository mapping

### E-SPER

- Replace generic project-memory, task closeout, inventory update order and
  validation sequencing with named skill triggers.
- Retain `dev_store/` source-of-truth, exact manifests/commands, local/server/test
  pack roles, sensitive paths, UI design-system rules, versioning, rollback and
  repository role.

### email-header-analyzer

- Replace duplicated MCP procedure, generic task closeout cadence, rendered QA
  route and generic inventory ordering with skill triggers.
- Retain analyzer/MCP role boundary, exact MCP local overrides, analysis-data
  prohibition, changelog archive naming, task paths, daily sensitive ZIP policy,
  engine restart safety, version format, parser/report review checks and browser
  compatibility requirements.

### WD_HUD

- Replace generic project closeout, inventory update sequence and validation
  sequencing with skill triggers.
- Retain offline/no-network architecture, allowed dependency, exact commands,
  inventory files, version format, elevation/startup restrictions and MVP scope.

## Deferred files

Repositories with pre-existing changes overlapping `AGENTS.md` or large active
worktrees are audit-only in this pass. Small 21-line local policies and files
containing only genuine repo-specific commands/architecture are already concise
and receive no mechanical rewrite.
