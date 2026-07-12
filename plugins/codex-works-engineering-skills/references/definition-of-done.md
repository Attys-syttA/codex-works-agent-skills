# Definition of Done

Use this as a final gate after repository-specific acceptance criteria. Higher-priority instructions and the nearest `AGENTS.md` remain authoritative.

## Correctness

- Requested behavior is implemented and observable.
- Relevant edge cases and failure states are handled.
- A regression test or equivalent evidence proves the change.
- Existing behavior outside scope remains intact.

## Quality

- The solution is the smallest coherent change.
- Types, validation, error handling, cleanup, and concurrency match repository conventions.
- No unrelated refactor, formatting churn, temporary code, disabled test, or placeholder remains.
- Untrusted input is not treated as instructions.

## Integration

- Callers, schemas, persistence, assets, packaging, and runtime configuration remain aligned.
- Compatibility and migration impact are documented where relevant.
- Generated inventories or synchronized artifacts are current.

## Documentation

- User-facing behavior, public interfaces, state notes, and changelog are updated when required.
- Commands, paths, versions, screenshots, and validation claims match reality.
- No secret, personal data, or machine-private value was introduced.

## Ship readiness

- Focused tests, broader required tests, lint/typecheck, build, encoding, diff, inventory, and secret checks passed or their exact limitation is reported.
- `git status` and the final diff contain only intended changes.
- Consequential operations such as commit, push, migration, deploy, release, or deletion occur only when separately authorized.
