# Stald — hesteregistrering og fordeling

En lokal POC til Bøgegårdens Ridecenter med React, Tailwind, Express, PostgreSQL og Docker.

## Start hjemmesiden

Start Docker Desktop, og kør i projektmappen:

```bash
docker compose up --build -d
```

Åbn **http://localhost:3005**. Vælg rideskole, rolle og demonstrationsprofil.
Der kræves ingen adgangskode. Brug fx Anne som ridelærer eller Ellen Frellsen som elev.

- **Ridelærer:** egne elever og hold, skolens heste, registrering, ønsker, forslag,
  begrundede rettelser og godkendt fordeling.
- **Elev:** egne hold, godkendte tildelinger, højst tre ligeværdige ønsker pr. hold
  og redigering af egne hensyn under **Min profil**.

Fordeling følger elevens behov, hestens begrænsninger og sammenhængende ventetid.
Ved lighed eller manglende historik vælger læreren; sikkerhedsregler kommer først.

## Data og videreudvikling

De 19 heste og dokumenterede hensyn kommer fra casebilaget. De 34 elevnavne og fire fredagshold kommer fra samme bilag. Elevbehov,
ventetidshistorik og afprøvningsgrænser er demodata. Vægtgrænser, som mangler i bilaget,
er **demonstrationsværdier**, og må ikke bruges fagligt uden en rideskoles vurdering.
Se [elevdata](docs/student-data.md), [hestedata](docs/horse-data.md) og [arkitektur](docs/architecture.md).

PostgreSQL bruger normaliserede tabeller med skoleafgrænsning. En ekstra syntetisk
rideskole demonstrerer, at datamodellen kan genbruges. Login uden kode demonstrerer
roller og er ikke identitetskontrol til drift. Elevnavne fra casen er indlæst; øvrige elevoplysninger er demodata.

Data bevares i Docker-volume, også efter genstart. Stop uden at slette data:

```bash
docker compose down
```

## Udvikling

Node.js 22 og Docker Desktop:

```bash
docker compose up -d db
npm ci
npm run dev
```

React: http://localhost:5173 · API: http://localhost:3001.
Standardforbindelsen til PostgreSQL bruger localhost:5434 og projektets demo-database.

```bash
npm run build
docker compose logs app
```

Der er ingen unit-test-suite. Build, API-forløb, database og browser afprøves;
resultater dokumenteres i [verifikation](docs/verification.md).

## Omfang og Spec Kit

Den aftalte mockup er projektets leverance. Betaling, medlemsadministration, faktisk
fremmøde og fuld månedsoptimering er mulige udvidelser uden for dette omfang.
Dokumenterne er afstemt med brugerens valg; senere udvidelser står som iterationer.


- [Constitution](.specify/memory/constitution.md)
- [Specify og Clarify](specs/001-digital-holdadministration/spec.md)
- [Plan](specs/001-digital-holdadministration/plan.md)
- [Tasks](specs/001-digital-holdadministration/tasks.md)
- [Proces og rækkefølge](docs/process.md)
- [Kravsporbarhed](docs/traceability.md)

Hestekortene bruger tre realistiske, genererede mockupbilleder. De viser ikke de
faktiske heste; billedreference og billedtype gemmes på den enkelte hest, så de
kan erstattes af rideskolens egne fotos.

## Hent ændringer som gruppemedlem

Kør i en eksisterende projektmappe med Docker Desktop startet:

```bash
git switch main
git pull --ff-only origin main
docker compose up --build -d
```

Åbn http://localhost:3005. Første gang kan projektet hentes med
`git clone https://github.com/olfe0001/hestecase.git`.
Koden og startdata deles via GitHub; hver computer har sin egen database.
Lokale ændringer i heste, ønsker og hensyn synkroniseres ikke mellem computere.
