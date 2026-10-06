# Quickstart: Stald

Start Docker Desktop, og kør fra projektmappen:

```bash
docker compose up --build -d
```

Åbn http://localhost:3005. Vælg Bøgegårdens Ridecenter og fx Anne som lærer eller
Ellen Frellsen som elev. Der kræves ingen adgangskode.

19 heste og 34 elevnavne på fire fredagshold kommer fra casen. Individuelle
mål/-behov, ønsker, ventetid og manglende hestetal er demodata. Tre realistiske
mockupmotiver illustrerer hestevalget og viser ikke casens faktiske heste.

Databasen bevares i Docker-volume. `docker compose down` stopper uden at slette data.
Caseimport køres én gang og bevarer eksisterende profil-id'er og historik.

## Lærerforløb

1. Se egne hold/elever og skolens heste; søg og åbn hestedetaljer.
2. Åbn Fordeling og vælg et hold. Lav forslag og gennemgå elever, ønsker og konflikter.
3. Vælg elever ved lige ventetid/manglende historik, og begrund valget.
4. Ret eventuelle tildelinger. Gem rettelser og godkend en komplet, sikker fordeling.
5. Registrér en demonstrationshest eller ændr en eksisterende hests tilgængelighed.
   En ændring kræver ny kontrol af fordelingerne.

## Elevforløb

1. Åbn Mit overblik og se egne hold, hensyn og godkendt hest.
2. Åbn Ønsk heste, vælg op til tre forskellige heste og gem.
3. Åbn Min profil, tilføj/fjern egne hensyn og gem. Genindlæs og se, at de bevares.
4. Log ind som lærer og kontrollér, at ønsker/hensyn vises på det relevante hold.

## Lokal udvikling og kontroller

```bash
docker compose up -d db
npm ci
npm run dev
```

Vite: http://localhost:5173; Express: localhost:3001; PostgreSQL: localhost:5434.
Standardforbindelsen svarer til `.env.example`.

```bash
npm run check
node scripts/profile-smoke.mjs
```

Integrationsscripts ændrer demodata. Det første fordelingsforløb findes i
`scripts/demo-smoke.mjs`; den dokumenterede første kørsel var før udvidelsen til
34 case-elever. Et historisk resultat må ikke udlægges som fuld afprøvning af alle
senere hold og regler. Ingen unit-test-suite kræves.

Faktisk udførte kontroller: [verifikation](../../docs/verification.md).
Proces/rækkefølge: [process.md](../../docs/process.md).
