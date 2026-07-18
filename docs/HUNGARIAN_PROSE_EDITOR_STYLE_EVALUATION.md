# Hungarian Prose Editor Style Evaluation

These cases are reviewer-facing quality checks for `$hungarian-prose-editor`.
They are not exact-match tests. A passing answer preserves the listed content
and shows the expected mode characteristics.

| ID | Mode | Input | Must preserve | Must improve | Must not introduce | Expected characteristics |
|---|---|---|---|---|---|---|
| HU-QA-001 | `official-clear` | A dokumentum benyújtásának elmulasztása esetén az eljárás folytathatósága akadályozottá válhat. | missing document may block procedure | conditional clarity | new deadline | clear condition and consequence |
| HU-QA-002 | `official-clear` | Kérjük, szíveskedjen az igazolást mielőbb megküldeni. | request to send certificate soon | lighter official wording | exact date | polite direct request |
| HU-QA-003 | `official-clear` | A döntéssel szemben jogorvoslat igénybevételére nyílik lehetőség. | appeal option | nominal phrase | legal advice | short official statement |
| HU-QA-004 | `official-clear` | A hiánypótlás teljesítésének hiányában döntéshozatalra kerül sor. | missing supplement leads to decision | actor/action clarity | stricter consequence | clear procedural wording |
| HU-QA-005 | `natural-neutral` | Összességében elmondható, hogy a feladat megoldása megkezdésre került. | task has started | filler | completion claim | natural short sentence |
| HU-QA-006 | `natural-neutral` | A jelenség kapcsán fontos megjegyezni, hogy további ellenőrzés lehet indokolt. | further check may be justified | generic framing | certainty | calm natural wording |
| HU-QA-007 | `natural-neutral` | A levél szörnyűséges, félelmetes fenyegetéseket hordoz magában. | threat content | theatrical adjectives | new facts | firm but restrained |
| HU-QA-008 | `natural-neutral` | Amennyiben lehetőséged van rá, kérlek, küldd el ma a választ. | tegezés and today request | sentence weight | magázás | natural tegezés |
| HU-QA-009 | `technical-concise` | A `npm run test` parancs végrehajtása sikeres eredménnyel zárult. | command and success | verbosity | changed command | concise technical Hungarian |
| HU-QA-010 | `technical-concise` | A parser működése során nem minden esetben tapasztalható konzisztens viselkedés. | parser inconsistency | abstract wording | root cause | concrete observation |
| HU-QA-011 | `technical-concise` | A `GET /api/health` endpoint esetében válaszidő-növekedés volt megfigyelhető. | endpoint and latency increase | word order | exact latency | identifier-preserving wording |
| HU-QA-012 | `technical-concise` | A fájl feldolgozása a `reportExport.ts` modulban hibát eredményezhet. | file processing, module, possible error | clarity | definite failure | cautious technical statement |
| HU-QA-013 | `official-clear` | Az ügyfél köteles a változást 15 napon belül bejelenteni. | obligation and 15 days | readability | different deadline | no weakened obligation |
| HU-QA-014 | `natural-neutral` | Nem áll rendelkezésre elegendő adat a teljes bizonyosságú megállapításhoz. | insufficient data | natural phrasing | false certainty | plain uncertainty |
| HU-QA-015 | `technical-concise` | A SHA-256 hash értéke nem egyezik a forrásfájlhoz tartozó értékkel. | SHA-256 mismatch | compactness | new hash | exact term preserved |
| HU-QA-016 | `official-clear` | A kérelem feldolgozása folyamatban van. | request processing ongoing | active wording | result promise | formal but clear |
| HU-QA-017 | `natural-neutral` | Ez a rész kissé nehezen olvasható, mert nagyon hosszú és ismétlődő mondatokból áll. | readability issue | rhythm | blame | helpful neutral feedback |
| HU-QA-018 | `technical-concise` | A validáció sikertelen, mert a `config.json` hiányzik. | failure and missing file | directness | remediation not asked | concise cause |
| HU-QA-019 | `official-clear` | Az eljárás során további iratok bekérése válhat szükségessé. | possible further documents | plain wording | certainty | formal uncertainty |
| HU-QA-020 | `natural-neutral` | Köszönjük az együttműködését, és elnézést kérünk a kellemetlenségért. | thanks and apology | none if already good | extra explanation | preserve tone |
