# Hestecase — Stald Constitution

Vedtaget første gang 2026-10-06. Denne version afstemmer arbejdsgrundlaget med
brugerens valgte og implementerede mockup. Principperne styrer krav, plan,
implementering og vurdering; de er ikke en liste over hele rideskolens systembehov.

## Core Principles

### I. Sikkerhed og hestevelfærd går forud for ønsker

Forslag, manuelle rettelser og godkendelser skal kontrolleres på serveren mod
registrerede elevhensyn, hestens egnethed, tilgængelighed og kendte planlagte brug.
Samme hest må ikke bruges på overlappende lektioner. Grænserne er højst tre hold
pr. dag, mindst én ugentlig fridag og højst én springaktivitet pr. uge; lavere
individuelle grænser gælder. Ønsker og ventetid prioriteres kun blandt egnede matches.

Kildeoplysninger og demonstrationsværdier skal kunne skelnes. Manglende numeriske
hestegrænser må udfyldes med mærkede eksempler til mockuppen, men ikke fremstilles
som fagligt validerede casefakta. Ingen egnet hest skal give en synlig uløst tildeling.

**Begrundelse:** Lærerens fordelingsarbejde kræver hensyn til både elev og hest.
**Kontrol:** Gennemgå sikkerhedsreglerne og afprøv blandt andet utilgængelig hest,
dobbelttildeling og en rettelse, der ikke kan godkendes.

### II. Fælles oplysninger og beslutninger skal kunne efterprøves

Krav og data skal have kilde eller en tydelig markering som demonstrationsvalg.
Gemte ønsker, heste, fordelinger og historik skal bevares i databasen efter genstart.
Fordelingsændringer skal have historiske snapshots; godkendelser og relevante
ændringer skal have ansvarlig og tidspunkt i historikken.

Mockuppen registrerer planlagt undervisning. Den må ikke fremstille planen som
faktisk fremmøde, faktisk hestebrug eller dokumenteret fuldstændig ugentlig velfærd.

**Begrundelse:** Fælles, sporbare oplysninger gør fordelingen forståelig.
**Kontrol:** Kontrollér historik og bevarelse af data efter genstart.

### III. Ridelæreren kontrollerer og godkender fordelingen

Matchning er beslutningsstøtte. Læreren skal kunne lave et forslag, se elevernes
hensyn og ønsker, rette tildelinger og godkende. Sikkerhedsfejl, manglende
tildelinger og uafklarede prioriteringer skal blokere godkendelse.

Ved konkurrerende ønsker prioriteres sammenhængende måneders uopfyldt ønske blandt
egnede elever. Ved lige ventetid vælger læreren med begrundelse. Nye elever starter
på nul; manglende historik for eksisterende elever kræver lærerens afklaring.
Godkendelse skal bruge den aktuelle revision og må ikke tilsidesætte sikkerhed.

**Begrundelse:** Læreren har ansvar for at gennemgå systemets forslag.
**Kontrol:** Følg forslag → rettelse → begrundet valg → godkendelse og afprøv en
forældet revision. Afslutning af en måned er ikke en del af mockuppen.

### IV. Arbejdsgange skal være overskuelige for lærer og elev

Brugerfladen skal være på dansk og vise rollebestemt navigation, tydelige
hovedhandlinger, gemt-status og konkrete fejl. Læreren skal se egne elever og hold
samt skolens heste. Eleven skal se egne hold, ønsker, tildelinger og profil.
Desktop og mobil skal kunne bruges uden vandret overflødigt sideoverløb.

Hestebilleder skal gennemgås visuelt og mærkes som mockups, når de ikke viser den
faktiske hest. Demonstrationen må ikke bruges som bevis på målte tidsbesparelser.

**Begrundelse:** Et samlet overblik skal støtte den praktiske arbejdsgang.
**Kontrol:** Afprøv lærer- og elevforløb i browseren på desktop og mobil.
Gruppens egen vurdering af brugervenlighed dokumenteres særskilt.

### V. Personoplysninger skal være formålsbestemte og kunne rettes

Efter brugerens udtrykkelige valg bruges de 34 elevnavne og deres fire fredagshold
fra `fredagsheste jan-jun TIL CASE.pdf`. Dette er en afgrænset undtagelse fra det
tidligere valg om udelukkende syntetiske navne. Individuelle kropsmål, niveauer,
behov, ønsker og ventetid er fortsat markerede demodata. Diagnoser og subjektive
karakteristikker fra elevbilaget kopieres ikke.

Eleven skal kunne tilføje og fjerne egne funktionelle hensyn. Læreren ser hensyn
for sine hold. Adgang skal afgrænses efter rolle, egen profil, egne hold og rideskole.
Profilvalg uden kode er demonstrationsadgang og dokumenterer ikke en persons identitet.

**Begrundelse:** Mockuppen skal bruge de ønskede casenavne og saglig matchviden.
**Kontrol:** Kontrollér datakilder, egen profilredigering og afvisning af fremmede
hold, andre elevers ændringer og en anden rideskoles data.

### VI. Krav, plan, opgaver og resultat skal hænge sammen

Arbejdsgangen er Constitution → Specify → Clarify → Plan → Tasks → Implement →
verifikation og afstemning. Hvert trin bruger beslutningerne fra de foregående trin.
Krav skal have acceptscenarier; opgaver skal kunne spores til krav og plan.
Ændrer brugeren omfanget undervejs, opdateres de berørte artefakter som en iteration.
Dokumenterne må ikke foregive, at senere udvidelser var færdigplanlagt fra starten.

Ingen unit tests kræves til denne mockup. Produktionsbuild, relevante API-forløb,
rolle-/skolegrænser, datalagring og browserforløb skal kontrolleres. Testmål skal
skelnes fra faktisk udførte kontroller; kendte begrænsninger skal dokumenteres.

**Begrundelse:** Sporbarhed gør løsningen og arbejdsprocessen vurderbare.
**Kontrol:** Følg en user story fra Specify via plan og opgaver til kode og dokumenteret
verifikation. Konsistenskontrollen erstatter ikke gruppens egen evaluering.

### VII. Afgræns mockuppen og muliggør videreudvikling

Projektets leverance er den valgte mockup: lærer-/elevadgang, overblik, heste,
elevønsker, egne hensyn, fordelingsforslag, rettelser, godkendelse og historik.
Betaling, ventelister, medlemsadministration, fremmøde, afløserrolle og fuld
månedsoptimering er mulige udvidelser og er ikke uafsluttede krav i denne leverance.

Den valgte stack er Docker, JavaScript, Express, React, Tailwind og PostgreSQL.
Domænet skal bruge tredje normalform og rideskoleafgrænsede relationer. Matchregler,
dataadgang og præsentation skal holdes adskilt. Ingen ekstra services indføres uden
et konkret behov. Flere skoler demonstreres gennem samme datamodel.

**Begrundelse:** En afgrænset løsning kan gennemgås og senere udbygges.
**Kontrol:** Angiv implementeret, kildebaseret og simuleret funktionalitet samt
mulige udvidelser i Specify, datamodel og dokumentation.

## Projektets ramme og kilder

K1: `base-case-files/Casebeskrivelse, BPMN.pdf`, s. 2–4, case og velfærdsregler.
K4: `base-case-files/fredagsheste jan-jun TIL CASE.pdf`, s. 1–2 elevnavne/hold og
s. 3 heste. K5: `base-case-files/Transkripering af domæne ekspert.md`, praktisk
fordeling og lærerens kontrol. Øvrige bilag og undervisningsslides er procesbaggrund.
Ved modstrid anvendes casens maksimum på tre daglige hold frem for interviewets fire.

Afprøvningen bruger konkrete oktoberdatoer, mandag–søndag som uge og registrerede
lektioner som belastningsgrundlag. Demo-vægtgrænser og individuelle mål er ikke
fagligt validerede. Fuld ugentlig aktivitet, produktion og identitetskontrol kræver
senere afklaring og er ikke påstået leveret.

## Udviklingsproces og kvalitetskontrol

Projektforløbet og de senere brugerændringer dokumenteres i `docs/process.md`.
Den gældende spec afgrænser leverancen; plan og tasks beskriver løsningen og
arbejdet. `docs/verification.md` indeholder faktisk udførte kontroller.

Gruppen skal gennemgå resultatet mod acceptscenarierne. En efterfølgende afstemning
skal registreres som en iteration; historiske testresultater må ikke omskrives til
resultater for senere versioner. Nye produktønsker kræver opdaterede krav og opgaver.

## Governance

Denne opdatering er udført efter brugerens anmodning om at afstemme projektgrundlaget
med den ønskede mockup. Tidligere vedtagelse og afklaringer bevares som proceshistorik.
Ændringer begrundes og afstemmes i berørte dokumenter. Gruppen gennemgår dem før
fælles aflevering. Ved deling via GitHub anvendes review; det aktuelle lokale arbejde
på `main` dokumenteres og fremstilles ikke som et allerede gennemført PR-review.

Versioner følger semantisk versionering: major ved ændrede grundprincipper,
minor ved udvidede regler, patch ved sproglige præciseringer.
1.0.0 var første arbejdsgrundlag; 1.1.0 fastlagde stack og POC-plan. 2.0.0 afstemmer
princip V og VII med brugerens casenavne og endelige mockup-afgrænsning.

**Version**: 2.0.0 | **Ratified**: 2026-10-06 | **Last Amended**: 2026-10-06
