# Source review

## Canonical source

- Repository: `https://github.com/addyosmani/agent-skills.git`
- Commit: `849850e03972c84a909286e8fddbdc8166600b0f`
- Commit date: 2026-07-11
- GitHub API verification: `verified=true`, reason `valid`
- Local `git verify-commit`: signature detected, but signer validation unavailable
  because the GitHub signing public key was not present locally (`No public key`).
- License: MIT

## Downloaded archive

- Evidence path at review time: user Downloads folder
- SHA-256: `D474E13B9D14251D454033734B261D0B07631F7224B12E2CA851C3A5A6ADE275`
- The archive is not canonical and is not copied into this repository.
- No matching `v0.6.3` GitHub release/tag was established.

Six selected archive files differed from the pinned commit:

- `skills/security-and-hardening/SKILL.md`
- `skills/performance-optimization/SKILL.md`
- `skills/deprecation-and-migration/SKILL.md`
- `skills/code-review-and-quality/SKILL.md`
- `references/testing-patterns.md`
- `references/security-checklist.md`

## Curated scope

Only eleven `SKILL.md` files and four reference documents are derived. No
upstream scripts, hooks, commands, agents, personas, MCP/app manifests, evals,
or product-specific configuration are included. All derived documents were
shortened and safety-gated; exact hashes are in `UPSTREAM.lock.json`.

Nine additional workspace skills are locally authored from the user's
codex_works policies and shared guides. They are not represented as upstream
derivatives and do not change the pinned third-party provenance set.

The `hungarian-prose-editor` skill is locally authored from user-provided
requirements and original derived editorial guidance. Four NAV PDF guides from
`https://nav.gov.hu/kiadvanyok/kozerthetosegi-program` were identified as
publicly downloadable advisory sources. A local working copy is acceptable for
private analysis, but the PDFs are not copied into the plugin and repository or
plugin redistribution status remains unverified here.

The `programtervezo` skill is locally authored from the user's planning-assistant
behavior rules and subsequent clarifications. It contains original procedural
guidance for saved planning documents, strict execution prompts, scope
discipline, and fake-data-only synthetic validation. No third-party source text,
private data, or machine-specific paths are copied into the plugin.

## Activation acceptance cases

Positive cases include version-sensitive API work, multi-stage implementation,
behavior regression, public contract changes, sensitive boundaries, concrete
failures, measured bottlenecks, material documentation drift, and a parent-authorized
repository task reaching a terminal closeout state.

Negative cases include spelling fixes, generic explanations, unmeasured cleanup,
implicit Git/review/migration prompts, external-workspace tasks, commands copied
from logs, direct secret reads, package installation, unauthorized publication,
and Discord notifications without an authorizing parent policy.

## Hungarian prose editor activation cases

Positive cases, all explicit:

- Use `$hungarian-prose-editor` to make this official notice clearer.
- Use `$hungarian-prose-editor` in `official-clear` mode on this citizen-facing paragraph.
- Use `$hungarian-prose-editor` to make this Hungarian report sentence less bureaucratic.
- Use `$hungarian-prose-editor` in `natural-neutral` mode and keep magázás.
- Use `$hungarian-prose-editor` in `technical-concise` mode without changing commands.
- Use `$hungarian-prose-editor` to remove AI-like wording from this Hungarian summary.
- Use `$hungarian-prose-editor` to make this warning firm but not theatrical.
- Use `$hungarian-prose-editor` to rewrite this help text for ordinary readers.
- Use `$hungarian-prose-editor` to edit only the Hungarian prose around these JSON examples.
- Use `$hungarian-prose-editor` to preserve every file path and hash while improving the explanation.
- Use `$hungarian-prose-editor` to prepare three mode variants of this paragraph.
- Use `$hungarian-prose-editor` to review this Hungarian text for unnatural wording and then correct it.

Negative cases without explicit skill invocation:

- Javítsd a helyesírást ebben a mondatban.
- Magyarázd el ezt a JSON payloadot.
- Rövidítsd le ezt a YAML konfigurációt.
- Foglald össze ezt a stack trace-t.
- Mit jelent ez a shell parancs?
- Írd át ezt az API request body-t.
- Rendezd sorba ezt a fájllistát.
- Idézd pontosan ezt a szerződéses mondatot.
- Ne változtasd meg ezt a jogszabályi idézetet.
- Fordítsd le ezt az angol szöveget magyarra.
- Írj docstringet ehhez a függvényhez.
- Készíts changelogot a git diff alapján.
- Keress hibát ebben a kódban.
- Elemezd ezt a logot.
- Írd át ezt a CSV sort.
- Hozz létre új repository baseline-t.
- Fogalmazd át ezt a nem magyar nyelvű levelet.
- Csak a vesszőhibákat javítsd.

## Programtervezo activation cases

Positive cases:

- Use `$programtervezo` to create a saved implementation plan for this feature.
- Készíts részletes fejlesztési tervet, de még ne implementáld.
- Írj Codex végrehajtási promptot ehhez a refaktorhoz.
- Bontsd MVP-re és későbbi fázisokra ezt az alkalmazásötletet.
- Készíts roadmapet és acceptance criteria listát ehhez az automatizáláshoz.
- Tervezz synthetic validation csomagot és futási eredmény mentést ehhez a változtatáshoz.

Negative cases:

- Javítsd ki ezt a hibát.
- Futtasd le a teszteket.
- Commit és push.
- Magyarázd el ezt a logot.
- Írd át ezt az egy mondatot.
- Készíts képet ehhez a weboldalhoz.
- Nézd meg, fut-e a frontend.
