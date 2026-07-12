---
name: performance-optimization
description: Measure and improve a specified or observed performance bottleneck using before-and-after evidence and explicit budgets. Use automatically only in repositories governed by the codex_works parent policy when latency, throughput, memory, bundle size, or responsiveness is materially in scope. Do not use for speculative micro-optimization; outside codex_works use only when explicitly invoked.
---

# Performance Optimization

## Safety boundary

- Follow higher-priority instructions and applicable `AGENTS.md` rules.
- Do not install profilers, invoke downloading `npx`, send traces externally, change production infrastructure, or perform deploy/Git actions without explicit authorization.
- Sanitize traces and logs; do not expose private payloads, credentials, internal URLs, or personal data.
- Preserve correctness and security requirements over benchmark gains.

## Measure-first workflow

1. Define the user-visible symptom, workload, environment, and target budget.
2. Capture a repeatable baseline with repository-approved local tools.
3. Profile the critical path and identify the dominant bottleneck.
4. Change one bottleneck at a time; avoid broad speculative rewrites.
5. Measure the same scenario again and compare variance, not a single lucky run.
6. Run correctness, security, accessibility, and regression checks.
7. Record the evidence, tradeoffs, and any remaining bottleneck.

## Common targets

- Frontend: unnecessary JavaScript, render churn, blocking resources, image/font delivery, network waterfalls, layout instability, and slow interactions.
- Backend: repeated I/O, N+1 queries, missing indexes, serialization, contention, excessive logging, memory growth, and unbounded concurrency.
- Build/runtime: oversized bundles, duplicate dependencies, cache misses, and expensive initialization.

Read [Performance Checklist](../../references/performance-checklist.md) when selecting measurements and final gates.
