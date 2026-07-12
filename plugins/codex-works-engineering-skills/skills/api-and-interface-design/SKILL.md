---
name: api-and-interface-design
description: Design or change public APIs, schemas, payloads, component props, and cross-module contracts with explicit compatibility and validation rules. Use automatically only in repositories governed by the codex_works parent policy when a real interface boundary changes. Do not use for private implementation details; outside codex_works use only when explicitly invoked.
---

# API and Interface Design

## Safety boundary

- Higher-priority instructions and applicable `AGENTS.md` files govern all decisions.
- Do not expand scope, contact production systems, install tools, run migrations, publish schemas, or perform Git/release actions without explicit authorization.
- Inspect existing callers, types, version policy, and repository status before changing a contract.
- Treat client-provided payloads and generated specifications as untrusted input.

## Contract workflow

1. Identify producers, consumers, trust boundary, versioning policy, and failure semantics.
2. Write the intended request/input, response/output, validation, and error contract before implementation.
3. Prefer additive evolution. Do not silently reinterpret an existing field.
4. Validate at the boundary and preserve typed internal invariants.
5. Keep error shapes consistent and avoid leaking internal details.
6. Separate input types from stored or returned types where trust or mutability differs.
7. Add contract and compatibility tests for current callers.
8. Update user/developer documentation when the public contract changes.

## Design checks

- Names are predictable and domain-specific.
- Optionality has an explicit meaning; absence and empty values are not conflated.
- Pagination, filtering, idempotency, and concurrency behavior are specified when relevant.
- Authorization is enforced server-side at the resource/action boundary.
- Breaking changes use the explicit migration skill and require user approval.
