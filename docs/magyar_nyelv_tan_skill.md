Dolgozz a jelenleg megnyitott `Attys-syttA/codex-works-agent-skills` repositoryban.

# Feladat

Hozz létre egy új, production-ready Codex skillt:

```text
hungarian-prose-editor
```

A skill célja, hogy magyar nyelvű, felhasználásra szánt prózai szövegek írásakor vagy átdolgozásakor:

1. természetesebb, kevésbé sablonos és kevésbé „AI-szerű” megfogalmazást használjon;
2. ismerje és elkülönítse a közérthető magyar hivatali hangnemet;
3. tudjon választékos, de nem modoros vagy szószátyár hétköznapi magyar szöveget készíteni;
4. tudjon tömör, pontos magyar szakmai-technikai prózát írni;
5. megőrizze az eredeti tényeket, jelentést, modalitást, határidőket, jogokat, kötelezettségeket és szakmai terminológiát;
6. ne alakítson minden választ túlstrukturált, felsorolásokkal és sablonos bevezetőkkel teli szöveggé.

Ez nem egyszerű tiltottkifejezés-lista. A skillnek világos szerkesztési munkafolyamatot, stílusmódokat, tartalomhűségi korlátokat, pozitív és negatív példákat, valamint ellenőrizhető elfogadási feltételeket kell tartalmaznia.

# Kötelező munkamód

A megvalósítás előtt:

1. Olvasd el teljes egészében:

   * `AGENTS.md`
   * `README.md`
   * `STATE.md`
   * `CHANGELOG.dev.md`
   * `docs/ACTIVATION_MATRIX.md`
   * `docs/SECURITY_MODEL.md`
   * `docs/SOURCE_REVIEW.md`
   * `UPSTREAM.lock.json`
   * `repo-file-inventory.json`
   * a plugin manifestjét a `.codex-plugin` könyvtárban;
   * legalább három meglévő skill teljes tartalmát és `agents/openai.yaml` fájlját.

2. Futtasd a `git status` parancsot, és azonosítsd a már meglévő, más feladathoz tartozó módosításokat.

3. Semmilyen idegen vagy párhuzamos munkát ne írj felül, ne állíts vissza, ne formázz át és ne törölj.

4. A repository aktuális szerkezetét és konvencióit tekintsd elsődlegesnek. Ha az alábbi fájllista valamely pontja ütközik a repository tényleges validátoraival vagy kialakult szerkezetével, a repository konvencióját kövesd, de a feladat funkcionális követelményeit teljesítsd.

5. Használj UTF-8 kódolást és LF sorvéget.

6. A módosításokhoz lehetőleg `apply_patch` eljárást használj.

7. Ne commitolj, ne pusholj, ne nyiss pull requestet, ne telepítsd és ne publikáld a plugint. Ezek külön felhasználói engedélyhez kötött műveletek.

# Aktiválási politika

A skill első verziója legyen:

```text
explicit-only
```

Az `agents/openai.yaml` fájlban:

```yaml
policy:
  allow_implicit_invocation: false
```

Indok: a skill ne módosítson automatikusan kódot, logokat, idézeteket, jogilag kötött szövegeket, protokollmezőket vagy olyan dokumentációt, amelynek szó szerinti pontossága fontos.

A skill explicit meghívása:

```text
$hungarian-prose-editor
```

Az explicit meghívás csak stílus- és szerkesztési útmutatást választ ki. Nem ad felhatalmazást fájlmódosításra, publikálásra, külső kommunikációra vagy más következményes műveletre.

# Kötelező fájlok

Legalább az alábbi struktúrát hozd létre:

```text
plugins/codex-works-engineering-skills/
├── skills/
│   └── hungarian-prose-editor/
│       ├── SKILL.md
│       └── agents/
│           └── openai.yaml
└── references/
    └── hungarian-prose-editor/
        ├── README.md
        ├── style-modes.md
        ├── ai-style-smells-hu.md
        ├── editorial-checklist.md
        ├── approved-examples.md
        ├── terminology-preferences.md
        └── source-register.md
```

Amennyiben a repository validátorai nem támogatják az alkönyvtárat a plugin `references` könyvtárán belül, alakítsd át a neveket lapos, egyértelmű fájlnevekre, például:

```text
references/hungarian-prose-editor-style-modes.md
```

Ne hozz létre executable fájlt, scriptet, hookot, commandot, MCP-servert, appot, persona-konfigurációt vagy külső függőséget.

# A `SKILL.md` követelményei

A fájl kövesse a repository meglévő skillformátumát és frontmatter-konvencióját.

A `name` pontosan:

```text
hungarian-prose-editor
```

A `description` legyen angol nyelvű, aktiválásra alkalmas, pontos és szűk. Térjen ki arra, hogy:

* magyar nyelvű próza írására és szerkesztésére szolgál;
* hivatali, természetes hétköznapi és szakmai-technikai regisztert támogat;
* csökkenti a sablonos, túlmagyarázó, mechanikusan strukturált megfogalmazást;
* explicit meghívásra használható;
* nem való kód, log, nyers adat, szó szerinti idézet, jogilag kötött szöveg vagy protokollmező átírására.

A skill törzse legalább az alábbi részeket tartalmazza:

```text
# Hungarian Prose Editor
## Safety boundary
## Supported modes
## Mode selection
## Content-preservation rules
## Drafting workflow
## Natural Hungarian principles
## Official-language rules
## Everyday-language rules
## Technical-language rules
## AI-style cleanup pass
## Output rules
## Reference files
## Definition of Done
```

A `SKILL.md` maradjon tömör és végrehajtható. A hosszabb példák és részletes listák kerüljenek a referenciafájlokba.

# Kötelező stílusmódok

A skill pontosan három elsődleges módot kezeljen.

## 1. `official-clear`

Közérthető, korszerű magyar hivatali hangnem.

Követelmények:

* tárgyszerű, udvarias és pontos;
* a címzett teendője, határideje és a következmény legyen könnyen felismerhető;
* kerülje a fölösleges bürokratikus körülírást;
* ne váljon bizalmaskodóvá;
* ne egyszerűsítsen úgy, hogy jogi vagy eljárási jelentés vesszen el;
* aktív igét használjon, amikor az pontosabb és természetesebb;
* a hagyományos hivatali formula csak akkor maradjon, ha funkciója vagy kötelező szerepe van.

Például ne tekintse automatikusan jobb megoldásnak ezt:

```text
Tájékoztatjuk, hogy...
```

A kontextus alapján döntsön, szükséges-e.

## 2. `natural-neutral`

Választékos, természetes, hétköznapi magyar.

Követelmények:

* művelt, de nem modoros;
* világos, közvetlen, de nem nyers;
* változatos, természetes mondatritmus;
* ne használjon indokolatlanul sok címet, alcímet és felsorolást;
* ne ismételje meg a feladatot bevezetésként;
* ne fűzzön minden válaszhoz fölösleges összegzést;
* ne magyarázza túl a magától értetődő részeket;
* ne használjon erőltetett metaforákat vagy reklámszerű jelzőket.

## 3. `technical-concise`

Tömör, pontos magyar szakmai-technikai próza.

Követelmények:

* különítse el a tényt, feltételezést, következtetést és ajánlást;
* őrizze meg a bevett technikai azonosítókat és angol szakkifejezéseket, amikor a magyar fordítás pontatlan vagy szokatlan lenne;
* ne cserélje le a pontos terminológiát pusztán stilisztikai változatosság kedvéért;
* kerülje a marketinges és általános értékelő fordulatokat;
* a mondat legyen rövid, de ne telegramszerű;
* bizonytalanság esetén jelezze a bizonytalanságot.

# Módválasztás

A skill először állapítsa meg:

* a szöveg típusát;
* a címzettet vagy célközönséget;
* a kívánt formalitást;
* hogy új szöveget ír vagy meglévőt szerkeszt;
* van-e szó szerint megőrzendő rész;
* vannak-e jogilag, eljárásilag vagy technikailag kötött kifejezések.

Ha a felhasználó nem nevez meg módot, de a kontextusból egyértelműen megállapítható, válassza ki a legmegfelelőbbet.

Ha a mód nem állapítható meg megbízhatóan, ne találjon ki üzleti vagy kommunikációs kontextust. Ilyenkor legfeljebb egy rövid, nagy hatású pontosító kérdést tegyen fel, kivéve, ha a feladat anélkül is biztonságosan teljesíthető semleges `natural-neutral` módban.

# Tartalomhűség

A skill soha ne:

* találjon ki új tényt;
* módosítson nevet, számot, dátumot, határidőt, összeget vagy elérhetőséget;
* változtasson engedélyt kötelezettséggé vagy fordítva;
* enyhítse vagy erősítse a jogi, eljárási vagy biztonsági állítást;
* találjon ki jogszabályt, hivatkozást, indokot vagy ígéretet;
* távolítson el lényeges kivételt vagy feltételt;
* egészítsen ki hiányzó részletet feltételezés alapján;
* fogalmazzon át szó szerint megőrzendő idézetet, kódot, parancsot, logot, fájlnevet, API-mezőt vagy azonosítót;
* változtassa meg a felhasználó által választott tegező vagy magázó viszonyt indok nélkül.

Átdolgozáskor először készítsen belső tartalmi leltárt az állításokról, majd a végleges szöveget ehhez ellenőrizze vissza.

# Szerkesztési munkafolyamat

A skill ezt a folyamatot írja elő:

1. Azonosítsd a célt, címzettet, regisztert és kötött elemeket.
2. Készíts belső tartalmi leltárt a megőrzendő tényekről.
3. Válaszd ki a stílusmódot.
4. Írd meg vagy szerkeszd át a szöveget.
5. Futtass külön „AI-style cleanup” ellenőrzést.
6. Futtass tartalomhűségi ellenőrzést.
7. Futtass magyar nyelvi és regiszterellenőrzést.
8. Csak a kért kimenetet add át.

Ne jelenítse meg a belső ellenőrzési listát vagy gondolatmenetet, hacsak a felhasználó kifejezetten nem kér szerkesztői indoklást.

# „AI-szerű” stílus kezelése

Ne használj merev globális szótiltást. A kontextus alapján vizsgáld, hogy egy fordulatnak van-e valódi funkciója.

A referenciaanyag térjen ki legalább ezekre a gyakori tünetekre:

* a kérdés vagy feladat fölösleges visszamondása;
* sablonos bevezető;
* kötelezőnek ható összegző bekezdés;
* túl sok cím és alcím;
* minden három elem automatikus felsorolássá alakítása;
* azonos hosszúságú és ritmusú mondatok;
* túl sok kettőspont és gondolatjel;
* halmozott jelzők;
* reklámszerű értékelés;
* tartalom nélküli átvezetés;
* túlzott óvatossági formulák;
* indokolatlan metakommunikáció;
* főnévi szerkezetek túlhasználata;
* angolos szórend;
* szinonimák mechanikus cserélgetése;
* ugyanazon állítás többszöri megismétlése;
* fölösleges „összességében”, „fontos kiemelni”, „érdemes megjegyezni” típusú mondatkezdések;
* „nemcsak…, hanem…” retorikai szerkezet túlhasználata;
* „kulcsfontosságú”, „átfogó”, „robusztus”, „hatékony”, „zökkenőmentes” jelzők bizonyíték nélküli használata.

A skill ne ígérje, hogy a szöveg „emberinek bizonyul” vagy átmegy bármilyen AI-detektoron. A cél természetes, kontextushoz illő és jó minőségű magyar próza, nem detektorok kijátszása.

# Magyar nyelvi alapelvek

A referenciaanyag tartalmazzon saját megfogalmazású szabályokat és saját példákat legalább ezekhez:

* természetes magyar szórend;
* cselekvő igék előnyben részesítése;
* fölösleges főnévi szerkezetek egyszerűsítése;
* rövidebb és pontosabb névutós, illetve körülíró szerkezetek;
* világos névmási utalás;
* tegezés és magázás következetessége;
* bekezdések logikai íve;
* mondathossz változatossága;
* megfelelő kötőszóhasználat;
* hivatali udvariasság és közérthetőség egyensúlya;
* szakmai terminusok következetessége;
* dátumok, számok, mértékegységek és felsorolások következetes alakja;
* szükségtelen anglicizmusok kerülése;
* bevett angol technikai terminusok indokolatlan erőltetett magyarításának kerülése.

Ne állíts olyan helyesírási vagy nyelvhelyességi szabályt normatív tényként, amelyet nem ellenőriztél.

# Referenciafájlok

## `README.md`

Írja le:

* mire szolgál a referencia-könyvtár;
* mely fájlt mikor kell betölteni;
* hogy a külső források később kerülnek be;
* hogy nem ellenőrzött vagy ismeretlen licencű anyag nem tekinthető normatívnak;
* hogy weboldalról, könyvből vagy korpuszból származó teljes szöveget nem szabad engedély nélkül bemásolni.

## `style-modes.md`

Részletesen hasonlítsa össze a három módot:

* cél;
* közönség;
* formalitás;
* mondathossz;
* terminológia;
* megszólítás;
* szerkezet;
* kerülendő szélsőségek;
* rövid saját példák.

## `ai-style-smells-hu.md`

Tartalmazzon:

* tünetet;
* miért problémás;
* mikor lehet mégis indokolt;
* javítási elvet;
* rövid, saját „előtte–utána” példát.

Ne legyen puszta tiltólista.

## `editorial-checklist.md`

Legyen rövid, végrehajtható ellenőrzőlista:

* tartalomhűség;
* regiszter;
* természetesség;
* tömörség;
* szerkezet;
* terminológia;
* modalitás;
* kötött elemek;
* fölösleges AI-stílusjegyek;
* végső kimeneti forma.

## `approved-examples.md`

Első verzióban hozz létre legalább 18 teljesen saját, jogtiszta példapárt:

* legalább 6 `official-clear`;
* legalább 6 `natural-neutral`;
* legalább 6 `technical-concise`.

Minden példához tartozzon:

```text
Mode:
Use case:
Before:
After:
Why:
Facts preserved:
```

A „Before” példák legyenek reálisak, de ne tartalmazzanak valódi személyes adatot, intézményi titkot, valódi ügyazonosítót vagy másolt külső szöveget.

A példák között kötelezően szerepeljen:

* hiánypótlási vagy dokumentumpótlási értesítés;
* határidős tájékoztatás;
* udvarias elutasítás;
* belső munkahelyi e-mail;
* hétköznapi időpont-egyeztetés;
* visszajelzés egy elkészült munkáról;
* hibajelentés;
* technikai döntés;
* bizonytalan diagnózis;
* teszteredmény összefoglalása;
* olyan szöveg, amelyet nem kell radikálisan átírni;
* olyan példa, ahol egy hivatalos formula megtartása indokolt.

## `terminology-preferences.md`

Első verzióban csak struktúrát és néhány általános saját példát tartalmazzon.

Legyen benne hely későbbi:

* előnyben részesített kifejezéseknek;
* kerülendő kifejezéseknek;
* intézményi terminológiának;
* tegezési/magázási szabályoknak;
* rövidítéseknek;
* kötelezően szó szerint használandó alakoknak.

Ne találj ki intézményspecifikus terminológiát.

## `source-register.md`

Hozz létre kitölthető forrásnyilvántartást legalább ezekkel a mezőkkel:

```text
ID
Title
Author or institution
Source type
Location
License or permission status
Redistribution allowed
Derivative notes allowed
Intended use
Normative or advisory
Date checked
Checked by
Local file
Notes
```

Tartalmazzon külön figyelmeztetést:

* ismeretlen licencű teljes mű nem másolható be;
* webes hozzáférés nem jelent újraterjesztési engedélyt;
* normatívként csak ellenőrzött és megfelelően dokumentált forrás használható;
* belső példatár csak anonimizált, jogtisztán használható anyagból készülhet.

A fájlban lehetnek üres, kommentált mintabejegyzések, de ne állíts be külső forrást „engedélyezettként” bizonyíték nélkül.

# `agents/openai.yaml`

Kövesse a meglévő fájlok formátumát.

Javasolt tartalom, a repository validátoraihoz szükség szerint igazítva:

```yaml
interface:
  display_name: "Hungarian Prose Editor"
  short_description: "Write clear natural and concise Hungarian prose"
  default_prompt: "Use $hungarian-prose-editor to revise this Hungarian text in the requested register without changing its meaning."

policy:
  allow_implicit_invocation: false
```

A `short_description` feleljen meg a repository hosszkorlátainak.

# Aktiválási tesztek

Frissítsd azt a repository-dokumentumot vagy tesztforrást, ahol a pozitív és negatív skillaktiválási promptok szerepelnek.

Adj hozzá legalább 12 pozitív és 16 negatív promptot.

## Pozitív promptok

A pozitív tesztek explicit módon hívják a skillt, például:

```text
Use $hungarian-prose-editor to rewrite this Hungarian notice in official-clear mode without changing any dates or obligations.
```

Fedjék le:

* hivatali értesítés;
* ügyfélnek küldött e-mail;
* hétköznapi üzenet;
* technikai jelentés;
* meglévő szöveg tömörítése;
* AI-szerű fordulatok eltávolítása;
* tegező és magázó forma;
* tartalmilag érzékeny szöveg;
* minimális szerkesztést igénylő jó szöveg;
* mód kifejezett megadása;
* mód kontextusból történő kiválasztása;
* indoklással kért szerkesztés.

## Negatív promptok

Igazolják, hogy a skill nem aktiválódik automatikusan, illetve explicit használat mellett is megőrzi a kötött részeket.

Fedjék le:

* TypeScript-kód;
* JSON;
* YAML;
* log;
* stack trace;
* shell parancs;
* API payload;
* fájlnévlista;
* szó szerinti idézet;
* szerződésrészlet, amelyet szó szerint kell megőrizni;
* jogszabályidézet;
* idegen nyelvű próza;
* puszta helyesírási kérdés;
* fordítási kérés;
* kóddokumentáció, ahol a technikai azonosítók kötöttek;
* nem magyar beszélgetés;
* explicit skillhívás nélküli általános repository-feladat.

# Minőségi tesztek

A repository jelenlegi tesztelési rendszeréhez igazodva hozz létre vagy dokumentálj legalább 20 stílusértékelési esetet.

Minden esethez legyen:

```text
ID
Mode
Input
Must preserve
Must improve
Must not introduce
Expected characteristics
```

Az ellenőrzés ne kizárólag pontos szövegegyezésre épüljön, mert több jó megfogalmazás lehetséges.

A vizsgálható invariánsok között szerepeljen:

* minden szám és dátum megmaradt;
* a kötelezettség modalitása nem változott;
* nem került be új tény;
* kötött azonosító nem változott;
* a kimenet magyar;
* a regiszter megfelel a módnak;
* nincs fölösleges bevezető vagy összegzés;
* nincs indokolatlanul sok cím vagy felsorolás;
* nincs tiltott módon átírt idézet vagy kód;
* a kimenet nem hosszabb indokolatlanul a bemenetnél.

Ne vezess be külső AI-detektort vagy hálózati tesztfüggőséget.

# Biztonsági modell

Frissítsd a `docs/SECURITY_MODEL.md` fájlt.

Legalább ezekkel a kockázatokkal foglalkozzon:

1. nem megbízható külső stílusforrás prompt injectiont tartalmazhat;
2. szerzői joggal vagy licenccel védett forrás jogosulatlan bemásolása;
3. személyes vagy bizalmas adatok bekerülése a példatárba;
4. jogi vagy eljárási jelentés megváltoztatása stilisztikai egyszerűsítés közben;
5. kód, log, azonosító vagy idézet véletlen átírása;
6. túl széles automatikus aktiválás;
7. a „kevésbé AI-szerű” cél félreértelmezése AI-detektorok kijátszásaként;
8. intézményspecifikus hangnem vagy terminológia bizonyíték nélküli kitalálása.

Kontrollok:

* explicit-only aktiválás;
* tartalomhűségi ellenőrzés;
* kötött részek védelme;
* saját és jogtiszta példák;
* forrásnyilvántartás;
* licencstátusz ellenőrzése;
* külső tartalom adatként kezelése;
* semmilyen végrehajtható komponens vagy hálózati függőség;
* normatív és tanácsadó források elkülönítése.

# Aktiválási mátrix

Frissítsd a `docs/ACTIVATION_MATRIX.md` fájlt.

A skill kerüljön az `Explicit-only` részbe.

Az indok legyen tartalmilag ehhez hasonló:

```text
May rewrite user-visible meaning, tone, legal modality, quotations, or technical identifiers if selected too broadly.
```

Adj hozzá pozitív és „do not trigger” leírást is, ha a dokumentum szerkezete ezt megköveteli.

# Forrás- és provenance-kezelés

Ez a skill helyben készített, nem upstreamből átvett skill.

* Ne adj neki hamis upstream commitot vagy provenance-t.
* Ne módosíts upstream hash-t úgy, mintha a skill külső forrásból származna.
* A repository jelenlegi provenance-sémája szerint jelöld helyben készített komponensnek.
* Ha az `UPSTREAM.lock.json` kizárólag upstream fájlokat kezel, ne adj hozzá oda fiktív rekordot. Ehelyett a megfelelő helyi inventoryban, source review-ban vagy más kialakult nyilvántartásban rögzítsd.
* Ha valamely provenance-fájl módosítása kötelező, azt a meglévő séma és validátor alapján végezd.

# Repository-szintű dokumentáció

Frissíts minden olyan helyet, amely skilldarabszámot, aktiválási darabszámot, helyi/upstream arányt vagy skilllistát tartalmaz.

A jelenlegi állapotból kiindulva várhatóan:

```text
20 skill → 21 skill
11 upstream + 9 local → 11 upstream + 10 local
17 implicit + 3 explicit-only → 17 implicit + 4 explicit-only
```

Ezeket ne vakon írd át. Előbb keresd meg és számold újra a repository tényleges tartalmát.

Legalább ellenőrizd és szükség szerint frissítsd:

* `README.md`
* `STATE.md`
* `CHANGELOG.dev.md`
* `docs/SOURCE_REVIEW.md`
* `docs/ACTIVATION_MATRIX.md`
* `docs/SECURITY_MODEL.md`
* plugin manifest vagy marketplace metadata;
* `repo-file-inventory.json`;
* minden más fájlt, amely skillneveket vagy darabszámokat tartalmaz.

A changelog és state csak ténylegesen elkészült, ellenőrzött állapotot írjon le. Ne állíts sikeres validációt olyan parancsról, amely nem futott le.

# Inventory

A repository által biztosított inventory-generáló eszközt használd.

Ne szerkeszd kézzel a generált inventoryt, ha a repository eszköze generálja.

A végén a check módnak tisztán kell lefutnia.

# Validálás

A megvalósítás után futtasd legalább:

```powershell
pwsh -NoProfile -File .\tools\validate-plugin.ps1
pwsh -NoProfile -File .\tools\audit-skill-content.ps1
pwsh -NoProfile -File .\tools\verify-upstream.ps1
pwsh -NoProfile -File .\tools\build-inventory.ps1 -Check
```

Futtasd továbbá:

* a repository által elérhető standard OpenAI skill validátort;
* a repository által elérhető standard OpenAI plugin validátort;
* az aktiválási és negatív teszteket;
* minden további ellenőrzést, amelyet az `AGENTS.md`, README vagy CI előír;
* `ggshield secret scan repo .`, amennyiben a parancs telepítve van és futtatható.

Ne telepíts csomagot vagy globális eszközt pusztán azért, hogy egy opcionális validátort futtass. Ha egy eszköz hiányzik, rögzítsd pontosan, hogy az ellenőrzés miért nem futott le.

Ha valamely validátor hibát jelez:

1. vizsgáld meg a tényleges okot;
2. javítsd a saját módosításodhoz tartozó hibát;
3. futtasd újra;
4. ne kerüld meg vagy gyengítsd a validátort;
5. ne módosíts idegen munkát a zöld eredmény kedvéért.

# Elfogadási feltételek

A feladat csak akkor tekinthető késznek, ha:

1. a `hungarian-prose-editor` skill létezik és valid;
2. explicit-only;
3. három stílusmódot kezel;
4. tartalmaz egyértelmű tartalomhűségi szabályokat;
5. védi a kódot, logot, idézetet, azonosítókat és jogilag kötött részeket;
6. nem egyszerű tiltottkifejezés-listára épül;
7. tartalmaz külön AI-style cleanup munkafázist;
8. rendelkezik saját, jogtiszta példatárkezdeménnyel;
9. rendelkezik később kitölthető forrásnyilvántartással;
10. nem tartalmaz bemásolt vagy ismeretlen licencű külső művet;
11. nem vezet be executable komponenst vagy függőséget;
12. az aktiválási mátrix és a biztonsági modell frissült;
13. a pozitív és negatív aktiválási tesztek frissültek;
14. a skilldarabszámok és listák következetesek;
15. a state, changelog és inventory a valós állapotot tükrözi;
16. minden kötelezően elérhető validátor sikeres;
17. a munkafa idegen módosításai érintetlenek maradtak;
18. nem történt commit, push, install vagy publikálás.

# Záró jelentés

A munka végén adj rövid, tényszerű jelentést az alábbi szerkezetben:

```text
Implemented
- létrehozott és módosított fájlok
- a skill aktiválási módja
- a három támogatott stílusmód
- a referenciaanyagok állapota

Validation
- lefuttatott parancs
- eredmény
- tesztszám vagy lényeges kimenet

Not run
- kihagyott ellenőrzés
- pontos ok

External sources
- erősítsd meg, hogy külső forrásanyag nem került bemásolásra
- add meg, pontosan melyik könyvtárba és milyen nyilvántartással helyezhetők el később

Git state
- rövid `git status`
- saját módosítások felsorolása
- idegen, már meglévő módosítások elkülönítése
- erősítsd meg, hogy nem történt commit vagy push

Remaining decisions
- csak valóban nyitott, felhasználói döntést igénylő pontok
```

Ne adj általános, bizonyíték nélküli „minden rendben” összefoglalást. Minden készültségi állítást fájllal vagy ellenőrzési eredménnyel támassz alá.
