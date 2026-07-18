---
name: hungarian-prose-editor
description: Edit or draft Hungarian prose only when explicitly invoked as $hungarian-prose-editor. Use for clear official, natural neutral, or concise technical Hungarian wording while preserving meaning, facts, tone, address form, and quoted or structured content. Do not use for code, logs, raw data, protocol fields, API payloads, verbatim legal text, foreign-language prose, or repository tasks unless the user explicitly requests this skill.
---

# Hungarian Prose Editor

## Safety boundary

- Follow higher-priority instructions, repository policy, and the user's requested output format.
- This skill is explicit-only. Use it only when the user names `$hungarian-prose-editor` or clearly asks to use this exact skill.
- Do not change facts, names, dates, numbers, obligations, deadlines, legal references, quotes, code, logs, JSON, YAML, command output, file paths, API fields, or identifiers.
- Do not paraphrase verbatim quotations or contract/legal text unless the user explicitly asks for a non-authoritative summary.
- Do not invent institution-specific terminology, legal effect, procedural deadlines, authority, evidence, source citations, or validation results.
- Do not translate foreign-language prose unless the user explicitly asks for translation. For mixed texts, edit only the Hungarian prose around protected foreign-language content.
- The skill gives writing guidance only. It does not authorize publication, filing, legal advice, data disclosure, or external communication.

## Supported modes

- `official-clear`: clear Hungarian for public administration, institutional, procedural, citizen-facing, or formal workplace communication.
- `natural-neutral`: natural, readable Hungarian for everyday explanation, reports, messages, articles, and user-facing prose without bureaucratic weight.
- `technical-concise`: precise, compact Hungarian for engineering, security, audit, operations, and documentation where technical identifiers must remain intact.

## Mode selection

1. Use the mode requested by the user.
2. If no mode is named, infer the narrowest safe mode from audience and text type.
3. Use `technical-concise` when code identifiers, system behavior, security findings, commands, versions, or file paths are central.
4. Use `official-clear` for obligations, procedural guidance, public authority, decision support, or formal letters.
5. Use `natural-neutral` for general prose where the goal is readability without institutional tone.
6. If the mode is ambiguous and the edit could change legal or professional force, ask one short clarification question.

## Content-preservation rules

- Preserve the original meaning, factual scope, modality, certainty, and responsibility.
- Preserve tegezés or magázás unless the user asks to change address form.
- Preserve risk level, warning strength, and negative findings. Do not soften a warning just to sound elegant.
- Keep quoted text, examples, logs, code, field names, shell commands, URLs, hashes, and identifiers unchanged.
- Prefer smaller sentence-level edits over restructuring when the original order carries evidentiary or procedural meaning.
- Mark uncertainty plainly when the source text is uncertain; do not convert possibility into fact.

## Drafting workflow

1. Identify purpose, audience, register, address form, and protected text spans.
2. Build an internal inventory of facts, obligations, claims, dates, names, numbers, and technical identifiers.
3. Select one mode and keep that mode stable throughout the output.
4. Edit for clarity, then for rhythm, then for terminology.
5. Run an AI-style cleanup pass: remove inflated adjectives, repeated framing, theatrical wording, and generic filler.
6. Check factual fidelity against the internal inventory.
7. Check Hungarian grammar, word order, case endings, punctuation, and register consistency.
8. Output only the requested rewritten text unless the user asks for explanation or alternatives.

## Natural Hungarian principles

- Prefer active, concrete sentences when the actor is known.
- Put the main message early; keep conditions and exceptions close to the affected statement.
- Use ordinary Hungarian word order and avoid direct English calques.
- Replace nominal chains with verbs where it improves clarity.
- Avoid repeated sentence starters and mechanical list rhythm.
- Use examples only when they help the reader act or understand a distinction.

## Official-language rules

- Keep legal and procedural meaning intact, but write in clear sentences.
- State who does what, by when, on what basis, and with what consequence.
- Prefer "kérjük", "tájékoztatjuk", "benyújtható", "igazolni kell" only when the function requires it.
- Avoid heavy bureaucratic padding such as "tekintettel arra, hogy" when a simpler connector is enough.
- Do not remove mandatory warnings, rights, obligations, or appeal information.

## Everyday-language rules

- Keep the text direct, calm, and human.
- Prefer common words unless a specialist term is necessary.
- Avoid exaggerated emotion, moralizing, and over-explaining.
- Keep paragraphs short enough for easy reading, but do not fragment every sentence.
- Use a natural Hungarian close or transition instead of generic AI phrases.

## Technical-language rules

- Preserve exact identifiers: function names, commands, file paths, config keys, event names, hashes, ports, package names, and error strings.
- Keep causality explicit: input, condition, component, result, evidence.
- Prefer concise Hungarian around stable English technical terms.
- Do not translate established technical terms when translation would reduce precision.
- Separate observed facts from hypotheses, mitigations, and follow-up work.

## AI-style cleanup pass

- Remove theatrical or inflated wording unless it is present in the source and must be preserved.
- Replace vague intensifiers with concrete findings.
- Remove redundant scaffolding such as "fontos megjegyezni", "összességében elmondható", and repeated "az adott esetben".
- Avoid template-like sentence patterns across independent items.
- Prefer specific verbs over abstract nouns.
- Keep the user's voice when it is clear and appropriate.

## Output rules

- If the user asks for a direct rewrite, provide the rewritten text only.
- If the user asks for variants, label each variant by mode.
- If the user asks for review, list concrete language issues and give a corrected version.
- Do not include hidden analysis, source inventories, or reference summaries unless asked.
- For protected text, say briefly which parts were intentionally left unchanged.

## Reference files

- Use [README](../../references/hungarian-prose-editor/README.md) for source handling and copyright boundaries.
- Use [source setup reminder](../../references/hungarian-prose-editor/source-setup.md) when the NAV PDF source files are needed but not available locally.
- Use [style modes](../../references/hungarian-prose-editor/style-modes.md) when choosing the register.
- Use [AI style smells](../../references/hungarian-prose-editor/ai-style-smells-hu.md) for cleanup.
- Use [editorial checklist](../../references/hungarian-prose-editor/editorial-checklist.md) before final output.
- Use [approved examples](../../references/hungarian-prose-editor/approved-examples.md) for pattern calibration, not exact phrase copying.
- Use [terminology preferences](../../references/hungarian-prose-editor/terminology-preferences.md) for general wording choices.
- Use [source register](../../references/hungarian-prose-editor/source-register.md) to track source provenance.

## Definition of Done

- The output preserves facts, scope, certainty, modality, address form, and protected spans.
- The selected mode is consistent and appropriate for the audience.
- Hungarian wording is natural, grammatical, and non-theatrical.
- Official text remains procedurally accurate; technical text remains identifier-accurate.
- No external source text is copied beyond short, lawful references requested by the user.
