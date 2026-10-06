# Verifikation — 2026-10-06

Afprøvet mod Docker på http://localhost:3005 med PostgreSQL. Første forløb brugte
otte syntetiske elever; senere kontroller omfattede case-elever, egne hensyn og billeder.
Ingen unit tests er tilføjet.

- Produktionsbuild af React/Tailwind gennemført i Docker.
- API-integration: lærerens egne hold, elevens egne oplysninger, højst tre ønsker, afvisning af fremmede hold, rollegrænser og adskilte rideskoler.
- Fordeling: forslag, begrundede lærerbeslutninger ved lige ventetid, godkendelse, afvisning af dobbelttildeling og utilgængelig hest, revisionskonflikter, idempotent godkendelse og historik.
- Registrering af en ekstra syntetisk hest, Storm, gennemført. Casen indeholder fortsat 19 kildeheste.
- Chromium: lærerlogin, overblik, fordeling, registreringsdialog, logout, elevlogin og gemning af ønsker. Ingen JavaScript-fejl. Mobil ved 390 × 844 uden vandret sideoverløb; desktop ved 1440 × 1000.
- Begge containere genstartet før elev-/profiludvidelserne. Antal ønsker, tildelinger,
  versionshistorik og audithændelser bevaret: 31, 4, 10 og 20 før og efter genstart.
  Dette er historiske kontroltal, ikke den aktuelle databases antal.

API-forløbet kan gentages med `node scripts/demo-smoke.mjs` mod den kørende demo.
Det ændrer demonstrationsdata. `BASE_URL` kan pege på en anden lokal installation.

## Afgrænsning

Passwordløst profilvalg er til mockuppen. Kildebeskrivelserne suppleres med markerede demonstrationsgrænser; disse er ikke validerede bæregrænser. Der er ikke gennemført et brugerstudie med ridelærere eller en fuld månedsoptimering. Planlagte lektioner dokumenterer ikke faktisk fremmøde. Elev- og holdmedlemsadministration er ikke en del af denne leverance.

## Opdatering: elevnavne fra casen

Alle 34 elevnavne samt medlemskab på de fire fredagshold er kontrolleret i den
kørende PostgreSQL-database mod `data/students.json` (7/9/10/8 elever).
Docker-produktionsbuild gennemført igen. Navne og hold er nu kildebaserede;
andre elevoplysninger er fortsat demodata.

## Opdatering: Min profil og hestebilleder

- `npm run check` og Docker-produktionsbuild bestået.
- `node scripts/profile-smoke.mjs`: egne hensyn tilføjes og fjernes, læreren ser
  dem, elevens hold bliver kladder, og ændringer registreres i historikken.
  Ukendte/duplikerede hensyn, forsøg på at ændre andre elever og lærerens forsøg
  på at bruge elevens selvbetjening afvises. Oprindelige hensyn gendannes.
- Chromium: profil gemt og kontrolleret efter reload; desktop 1440 × 1000 og
  mobil 390 × 844 gennemgået visuelt uden sideoverløb eller JavaScript-fejl.
- Alle 20 hestekort i den aktuelle demo har en billedreference. Synlige billeder
  indlæses korrekt; tre lokale, realistiske mockupbilleder deles mellem kortene.
  Genererede originaler og færdige kort er visuelt kontrolleret.

Balancehjælp og skånsom belastning kræver et roligt, trygt match i POC-reglerne;
Ingen spring udelukker eleven fra springtildeling. Øvrige hensyn synliggøres for
læreren og ændrer ikke automatisk elevens mål eller faglige rytterniveau.

## Dokumentafstemning

Constitution 2.0.0 og spec/plan/tasks er afstemt med den valgte mockup. Denne
afstemning er dokumentkontrol og ændrer ikke ovenstående historiske testresultater.
Der er ikke kørt nye app-tests alene på grund af dokumentrettelserne. Alle
implementerede belastnings-/ventetidsregler er ikke dækket af en fuld afprøvningsmatrix;
den begrænsning fastholdes i spec og sporbarhed frem for at blive markeret som bestået.

Dokumentkontrollen gennemgik constitution, README-filer, feature-artefakter og docs.
19/19 aktive krav havde opgavedækning, de 23 task-id'er var unikke, og de relative
Markdown-links havde gyldige mål. Ingen kritiske konsistensproblemer blev fundet.
