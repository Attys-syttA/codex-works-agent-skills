# Approved Examples

Examples are original calibration samples. They show editing patterns, not
mandatory fixed phrases.

## Official Clear

### HU-OFC-001

- Mode: `official-clear`
- Use case: deadline notice
- Before: "A dokumentum benyújtásának elmulasztása esetén az ügyintézés folytatására nem minden esetben nyílik lehetőség."
- After: "Ha nem nyújtja be a dokumentumot, előfordulhat, hogy az ügyintézés nem folytatható."
- Why: shorter condition and consequence
- Facts preserved: document submission, possible inability to continue

### HU-OFC-002

- Mode: `official-clear`
- Use case: missing attachment
- Before: "A csatolmány pótlása szükséges az érdemi elbírálás megkezdéséhez."
- After: "Az érdemi elbíráláshoz pótolni kell a csatolmányt."
- Why: clearer action
- Facts preserved: attachment must be supplied before review

### HU-OFC-003

- Mode: `official-clear`
- Use case: appeal information
- Before: "A döntéssel szemben jogorvoslati lehetőség igénybevételére van mód."
- After: "A döntés ellen jogorvoslat kérhető."
- Why: removes nominal padding
- Facts preserved: appeal option exists

### HU-OFC-004

- Mode: `official-clear`
- Use case: request for clarification
- Before: "Kérjük, szíveskedjen nyilatkozatát oly módon kiegészíteni, hogy abból az érintett időszak egyértelműen megállapítható legyen."
- After: "Kérjük, egészítse ki a nyilatkozatát úgy, hogy egyértelmű legyen az érintett időszak."
- Why: direct request
- Facts preserved: statement, affected period, clarity requirement

### HU-OFC-005

- Mode: `official-clear`
- Use case: official information
- Before: "Tájékoztatjuk, hogy a kérelem feldolgozása folyamatban van."
- After: "Tájékoztatjuk, hogy a kérelmét feldolgozzuk."
- Why: uses an active verb
- Facts preserved: request processing is ongoing

### HU-OFC-006

- Mode: `official-clear`
- Use case: consequence warning
- Before: "A hiánypótlás teljesítésének hiányában a rendelkezésre álló adatok alapján kerül sor döntéshozatalra."
- After: "Ha nem teljesíti a hiánypótlást, a döntés a rendelkezésre álló adatok alapján születik meg."
- Why: clearer conditional structure
- Facts preserved: no supplement means decision based on available data

## Natural Neutral

### HU-NAT-001

- Mode: `natural-neutral`
- Use case: status update
- Before: "A probléma kezelésével kapcsolatos folyamat jelen pillanatban megkezdésre került."
- After: "A probléma kezelése már elkezdődött."
- Why: removes bureaucratic phrasing
- Facts preserved: handling has started

### HU-NAT-002

- Mode: `natural-neutral`
- Use case: user explanation
- Before: "A fenti információk alapján összességében elmondható, hogy a hiba oka vélhetően a beállításokban keresendő."
- After: "A hiba oka valószínűleg a beállításokban van."
- Why: concise and natural
- Facts preserved: probable cause is settings

### HU-NAT-003

- Mode: `natural-neutral`
- Use case: non-dramatic warning
- Before: "A levél szó szerinti szörnyűséges fenyegető tartalmat hordoz."
- After: "A levél fenyegető tartalmat tartalmaz."
- Why: removes theatrical adjective
- Facts preserved: threat content

### HU-NAT-004

- Mode: `natural-neutral`
- Use case: apology
- Before: "A kellemetlenség kapcsán ezúton szeretnénk elnézését kérni."
- After: "Elnézést kérünk a kellemetlenségért."
- Why: direct and polite
- Facts preserved: apology for inconvenience

### HU-NAT-005

- Mode: `natural-neutral`
- Use case: explanation of limitation
- Before: "Az adatok jelen formájukban nem teszik lehetővé teljes bizonyosságú következtetés levonását."
- After: "Az adatok alapján nem lehet teljes bizonyossággal következtetni."
- Why: simpler sentence
- Facts preserved: uncertainty remains

### HU-NAT-006

- Mode: `natural-neutral`
- Use case: request
- Before: "Amennyiben lehetősége van rá, kérjük, a válaszát a mai nap folyamán küldje meg."
- After: "Ha teheti, kérjük, ma küldje el a választ."
- Why: keeps polite tone but reduces weight
- Facts preserved: send response today if possible

## Technical Concise

### HU-TEC-001

- Mode: `technical-concise`
- Use case: bug report
- Before: "A futtatás során olyan jelenség volt tapasztalható, amely arra utalhat, hogy a parser működése nem minden esetben konzisztens."
- After: "A futtatás alapján a parser nem minden esetben működik konzisztensen."
- Why: direct observation
- Facts preserved: run evidence and inconsistent parser behavior

### HU-TEC-002

- Mode: `technical-concise`
- Use case: validation result
- Before: "A `npm run test` parancs végrehajtása sikeres eredménnyel zárult."
- After: "A `npm run test` sikeresen lefutott."
- Why: concise, command unchanged
- Facts preserved: command and success

### HU-TEC-003

- Mode: `technical-concise`
- Use case: security finding
- Before: "Az érintett endpoint esetében jogosultsági ellenőrzés hiányára visszavezethető kockázat áll fenn."
- After: "Az érintett endpoint jogosultsági ellenőrzés nélkül érhető el."
- Why: states concrete issue
- Facts preserved: endpoint and missing authorization check

### HU-TEC-004

- Mode: `technical-concise`
- Use case: file handling
- Before: "A fájl feldolgozása során a rendszer nem biztosítja minden esetben a bemenet méretének megfelelő validálását."
- After: "A rendszer nem mindig validálja a bemeneti fájl méretét."
- Why: shorter and clearer
- Facts preserved: file input size validation gap

### HU-TEC-005

- Mode: `technical-concise`
- Use case: fallback behavior
- Before: "Amennyiben az első provider nem ad választ, a folyamat a következő candidate vizsgálatával folytatódik."
- After: "Ha az első provider nem válaszol, a folyamat a következő candidate-tel folytatódik."
- Why: keeps technical terms and simplifies connector
- Facts preserved: provider fallback behavior

### HU-TEC-006

- Mode: `technical-concise`
- Use case: report wording
- Before: "A kivonatban egy támadó, fenyegető vagy megtévesztő tartalomra utaló általános megállapítás szerepel."
- After: "A kivonat általánosan jelzi a támadó, fenyegető vagy megtévesztő tartalmat."
- Why: cleaner report sentence
- Facts preserved: general content-risk indication
