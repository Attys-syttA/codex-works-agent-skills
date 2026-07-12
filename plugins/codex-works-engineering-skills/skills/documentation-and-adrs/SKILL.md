---
name: documentation-and-adrs
description: Keep user documentation, runbooks, state files, changelogs, API guidance, and architecture decisions aligned with verified implementation behavior. Use automatically only in repositories governed by the codex_works parent policy when architecture, public interfaces, operations, or user-visible behavior materially changes. Do not use for unrelated prose; outside codex_works use only when explicitly invoked.
---

# Documentation and ADRs

## Safety boundary

- Follow higher-priority instructions and repository documentation policy.
- Do not invent behavior, versions, validation results, decisions, contacts, URLs, commands, or release status.
- Do not copy secrets, personal data, internal endpoints, or machine-specific paths into tracked documentation.
- Do not create auxiliary instruction files such as `CLAUDE.md`; modify `AGENTS.md` only when the requested change is genuinely policy-related and authorized.
- Documentation work does not authorize commits, publishing, releases, or external messages.

## Workflow

1. Read the implementation, tests, current docs, state file, changelog, and applicable policy.
2. Identify the audience and the exact behavior that changed.
3. Update the existing structure rather than creating duplicate guides.
4. Use plain language for users and precise identifiers for developers/operators.
5. Mark prerequisites, destructive steps, permissions, failure states, and rollback clearly.
6. Write an ADR only for a durable architectural decision with meaningful alternatives and consequences.
7. Verify commands and links without claiming checks that did not run.
8. Review for stale screenshots, obsolete labels, version drift, private data, and encoding issues.

## ADR minimum

Record title, status, date, context, decision, alternatives, consequences, compatibility, security impact, and rollback/revisit conditions. Never rewrite accepted history silently; supersede it explicitly.

Use [Definition of Done](../../references/definition-of-done.md) before declaring documentation aligned.
