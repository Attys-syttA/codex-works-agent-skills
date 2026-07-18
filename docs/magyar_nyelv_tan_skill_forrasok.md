Van jó hír: **találtam frissebb és a célhoz sokkal jobban illő, hivatalosan letölthető magyar anyagokat**. A két régi nyelvtankönyvre valószínűleg nem is lesz szükség.

## A legjobb forrás: NAV közérthetőségi kiadványok

A NAV 2025 végén három kifejezetten idevágó PDF-et tett közzé:

* **Az érthető hivatal 1. – Hogyan lássunk hozzá?**
* **Az érthető hivatal 2. – A hivatali szövegek átalakítása**
* **Segédlet a közérthető írásbeli tájékoztatáshoz**

Mindhárom hivatalosan letölthető PDF. Ezek lényegesen alkalmasabbak a `official-clear` stílusmód kialakítására, mint egy általános nyelvtan vagy lexikon, mert közvetlenül a hivatali szövegek érthetőségéről és átalakításáról szólnak. A NAV oldala azt is közli, hogy a honlap információi változatlan tartalommal és formában szabadon terjeszthetők. ([NAV][1])

Ezt a három dokumentumot elsődleges forrásként kezelném.

## Második forrás: EU kiadványszerkesztési útmutató

Az **Intézményközi kiadványszerkesztési útmutató** magyar változata:

* magyarul elérhető;
* PDF-ben letölthető;
* folyamatosan frissülő webes változattal rendelkezik;
* külön magyar nyelvi szabályokat és konvenciókat tartalmaz;
* szerkesztőknek, fordítóknak, terminológusoknak és korrektoroknak készült. ([Interinstitutional Style Guide][2])

Ez főleg ezekhez hasznos:

* dátumok és számok;
* felsorolások;
* rövidítések;
* hivatkozások;
* intézménynevek;
* idézetek;
* tipográfiai és szerkesztési következetesség.

Kevésbé alkalmas a természetes hétköznapi hang tanítására, mert intézményi kiadványokra optimalizált.

## Harmadik forrás: AkH. 12 online

**A magyar helyesírás szabályai 12. kiadása** teljes egészében kereshető az MTA helyesírási portálján. Ez a helyesírás, írásjelek, rövidítések, számok és keltezés normatív ellenőrzésére megfelelő. ([Helyesírás-Fejlesztő][3])

Nem feltétlenül kell letölteni. A skill forrásjegyzékében külső normatív referenciaként szerepelhet.

## Javasolt forráskészlet

A skill első használható változatához már elegendő lehet:

```text
official-clear:
- NAV: Az érthető hivatal 1.
- NAV: Az érthető hivatal 2.
- NAV: Segédlet a közérthető írásbeli tájékoztatáshoz

editorial-rules:
- EU Intézményközi kiadványszerkesztési útmutató

orthography:
- A magyar helyesírás szabályai, 12. kiadás

natural-neutral:
- saját, jóváhagyott példatár
```

A hiányzó rész továbbra is a **választékos, természetes hétköznapi beszéd**. Ehhez valószínűleg nem találunk egyetlen hivatalos, szabadon letölthető könyvet, amelyből biztonságosan felépíthető a skill. Ennél jobb egy saját példatár.

## Hová helyezd őket?

Ezt a szerkezetet javaslom:

```text
plugins/codex-works-engineering-skills/
└── references/
    └── hungarian-prose-editor/
        ├── sources/
        │   ├── raw/
        │   │   ├── nav/
        │   │   │   ├── az-ertheto-hivatal-1.pdf
        │   │   │   ├── az-ertheto-hivatal-2.pdf
        │   │   │   └── segedlet-kozerheto-irasbeli-tajekoztatashoz.pdf
        │   │   └── eu/
        │   │       └── intezmenykozi-kiadvanyszerkesztesi-utmutato-hu.pdf
        │   └── source-register.md
        └── derived/
            ├── official-clear-rules.md
            ├── editorial-conventions.md
            ├── ai-style-smells-hu.md
            └── approved-examples.md
```

## Fontos: ne a teljes PDF-eket olvastasd minden alkalommal

A PDF-ek legyenek **forrásdokumentumok**, de a skill ne töltse be automatikusan mindegyiket minden fogalmazási feladatnál.

A Codex-agent feladata később:

1. elolvassa a PDF-eket;
2. kigyűjti a használható szabályokat;
3. saját szavakkal rövid, végrehajtható útmutatót készít;
4. forrásmegjelölést rendel minden szabálycsoporthoz;
5. elkülöníti a kötelező helyesírási szabályt a puszta stílusajánlástól;
6. a runtime skill már főként a `derived/` fájlokat használja.

Így kisebb lesz a kontextus, gyorsabb a működés, és nem keveredik össze több száz oldalnyi intézményi részletszabály.

## Jogi óvatosság

A NAV anyagokat eredeti, változatlan PDF-ként valószínűleg biztonságosabban lehet tárolni, mert az oldal kifejezetten engedi a változatlan terjesztést. Ettől még a forrásnyilvántartásban rögzíteni kell a letöltési helyet, dátumot és a terjesztési feltételt. ([NAV][1])

Az EU-útmutatónál a repositoryba másolás előtt külön ellenőrizném a kiadványhoz tartozó újrafelhasználási nyilatkozatot. Addig külső forrásként vagy helyi, nem commitolt fájlként kezelhető.

**Gyakorlati döntés:** töltsd le elsőként a három NAV-kiadványt. Ezek valószínűleg pontosan azt a modern magyar hivatali nyelvi alapot adják, amelyet kerestünk.

[1]: https://nav.gov.hu/kiadvanyok/kozerthetosegi-program "Közérthetőségi kiadványok - Nemzeti Adó- és Vámhivatal"
[2]: https://style-guide.europa.eu/hu/ "Kezdőlap - Intézményközi kiadványszerkesztési útmutató - Publications Office of the EU"
[3]: https://helyesiras.mta.hu/helyesiras/default/akh12 "A magyar helyesírás szabályai (AkH.) – helyesiras.mta.hu"
