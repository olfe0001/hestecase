# Implementation Plan: Stald — den aftalte mockup

**Date**: 2026-10-06 | **Branch**: lokalt på `main` | **Spec**: [spec.md](spec.md)
**Status**: Implementeret; afstemt efter efterfølgende brugerudvidelser.
**Constitution**: 2.0.0. Rækkefølge og iterationer: [proces](../../docs/process.md).

## Summary

Byg en dansk hjemmeside, hvor læreren ser egne elever/hold, skolens heste og ønsker,
får forslag og retter/godkender en fordeling. Eleven ser egne hold/tildelinger,
gemmer højst tre urangerede ønsker og ændrer egne hensyn. Bevar data og historik,
og vis realistiske, mærkede mockupbilleder. Brug casens heste, elevnavne og fredagshold.

## Technical Context

- JavaScript ESM, Node.js 22; npm-workspaces med React/Vite/Tailwind-klient og Express 5-server.
- PostgreSQL 17 med node-postgres, normaliserede domænerelationer i 3NF og vedvarende volume.
- Docker Compose starter app/database. Express leverer API og klientens produktionsbuild.
- Kodefri profiladgang giver opaque, persistent HttpOnly/SameSite-session.
  Rolle/skole hentes fra serverens session, ikke fra klientens selvrapporterede rolle.
- Lokal demonstration på http://localhost:3005; responsiv desktop/mobil.
- Ingen unit tests. Produktionsbuild, API-smoke, database- og browserkontrol.
- Omfang: konkrete lektioner i oktober 2026, 19 caseheste, 34 case-elever på fire
  fredagshold samt syntetisk ekstra skole og springhold. Efter afprøvning findes også Storm.
- Individuelle elevmål/-behov, ønsker, historie og manglende hestetal er demodata.
  Casenavne og billedernes oprindelse beskrives eksplicit.

## Constitution Check

| Princip | Designkontrol |
| --- | --- |
| I. Sikkerhed | `server/matching.js` kontrollerer registreret egnethed, kapacitet, fridag og overlap. Ingen faglig certificering påstås. |
| II. Sporbarhed | Kildedata og demo-tal adskilles; databasehistorik og snapshots bevares. |
| III. Lærerens valg | Forslag, rettelser, begrundede konfliktvalg og revisionkontrolleret godkendelse. |
| IV. Brugbarhed | Rollebestemt navigation, danske labels, fejl/gemt-status, mobil og visuelt kontrollerede billeder. |
| V. Data | Casens navne efter brugerens valg; egne hensyn, rolle-/hold-/skolegrænser og ingen kopierede diagnoser. |
| VI. Proces | Krav spores til tasks og verifikation. Senere udvidelser dokumenteres som iterationer. |
| VII. Omfang | Valgt stack, 3NF og to skoler; større casefunktioner står som mulige udvidelser. |

## Architecture and Project Structure

UI → Express → matchregler/dataadgang → PostgreSQL. Ingen ORM, mikroservices eller
separat regelservice. Browseren viser forslag; serveren godkender regler og adgang.

```text
client/src/                    React, Tailwind og rolleflows
client/public/images/horses/    Tre lokale JPEG-mockups
server/index.js                API, sessioner, transaktioner og godkendelse
server/data.js                 Rollebestemt læsemodel
server/matching.js             Sikkerhed, ventetid, forslag og validering
server/student-needs.js         Fælles valg til elevprofil og matching
server/db/schema.sql           Normaliseret skema og skolekontroller
server/seed.js                 Første demogrundlag
server/case-students.js         Engangsimport, stabile profil-id'er og fire casehold
server/horse-images.js          Udfylder tomme billedreferencer på demoskoler
data/horses.json                19 kildeheste
data/students.json              34 kilde-elever og fire fredagshold
scripts/                       API-integrationsforløb
docs/                          Kilder, proces, arkitektur og faktisk verifikation
Dockerfile / compose.yaml      App/database, volume og healthchecks
```

## Data and Mutations

Grundtabeller og koblingstabeller er normaliserede. `school_id` findes på
rodentiteter; API og databasekontroller sikrer tilhørsforhold. Casefilnavne og navne
er importdata, ikke global forretningslogik. Historiske JSON-snapshots er dokumenter
og erstatter ikke den relationelle domænemodel. Se [data-model.md](data-model.md).

Fordelingsmutationer låser skolen og kontrollerer revision. Godkendelse er atomisk
og kan genindsendes med samme operationId. Ønske-/hesteændringer gør skolens
fordelinger til kladder. Elevhensyn gør elevens egne holds fordelinger til kladder.
Historik bevares. Et uændret sæt elevhensyn ændrer ikke revisionen.

Månedshistorikken er forberedt seed-grundlag. Godkendelse af én lektion afslutter
ikke en måned; automatisk arkivering og fuld månedsoptimering er ikke implementeret.

## Work Phases and Validation

1. Setup, kildeheste og afgrænsede krav/plan.
2. Normaliseret database, sessioner, serverregler og fælles UI.
3. Lærer-/elevflows, heste, ønsker og fordeling.
4. Build, API, browser og bevarelse af data.
5. Brugeriterationer: case-elever, profilhensyn og billeder med tilhørende verifikation.
6. Afstemning af artefakter og konsistenskontrol.

Se [tasks.md](tasks.md), [contracts](contracts/services.md),
[quickstart](quickstart.md) og [verifikation](../../docs/verification.md).
Dokumentationens afstemning kræver ikke ændring af applikationskoden.

## Complexity Tracking

To appdele og én database følger brugerens stack. Ingen unit-test-suite, ekstra
services, betalingsintegration eller produktionsidentitetsudbyder indføres.
En senere brugerevaluering kan vurdere tidsforbrug; der påstås ingen målte gevinster.
