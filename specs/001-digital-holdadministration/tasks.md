# Tasks: Stald — den aftalte mockup

**Date**: 2026-10-06. **Grundlag**: [spec.md](spec.md), [plan.md](plan.md), constitution 2.0.0.
**Status**: Implementeringen er gennemført; senere brugerudvidelser står særskilt.
`[x]` betyder udført arbejde, ikke at alle tænkelige fejltilfælde eller driftsforhold er afprøvet.
Ingen unit tests kræves; udført verifikation findes i `docs/verification.md`.

## Phase 1 — Setup og grundlag

- [x] T001 Opret npm-workspaces, Dockerfile og compose.yaml. Plan: valgt stack og lokal opstart.
- [x] T002 [P] Udtræk 19 kildeheste til data/horses.json og dokumentér docs/horse-data.md. FR-021.
- [x] T003 Afgræns constitution, spec og designartefakter efter brugerens stack-/scopevalg. Alle stories; senere afstemning i T022.

## Phase 2 — Foundation

- [x] T004 Opret 3NF/skoleafgrænset skema og vedvarende, ikke-destruktiv seed i server/db/schema.sql og server/seed.js. FR-017, FR-025.
- [x] T005 [P] Opret Express-sessioner, rolle-/hold-/skoleafgrænsning og dataadgang i server/index.js og server/data.js. FR-020, FR-022, FR-025.
- [x] T006 [P] Opret React/Tailwind-layout, mobilnavigation og loading/tomme/fejltilstande i client/src/. SC-010.

## Phase 3 — US8 adgang og US4 overblik

- [x] T007 [US8] Implementér skole-, rolle- og profilvalg samt logout; rollebestemt overblik. FR-020, FR-022, FR-023.

## Phase 4 — US1 fordeling

- [x] T008 [US1] Implementér sikkerhed, overlap, kapacitet, historisk ventetid og lærerbeslutninger i server/matching.js. FR-001–005, FR-008, FR-011.
- [x] T009 [US1] Implementér revisioner, atomisk/idempotent godkendelse, audit og før/efter-versioner i server/index.js og server/db/schema.sql. FR-006, FR-017.
- [x] T010 [P] [US1] Implementér egne hold/elever og fordelingsflow i client/src/. FR-005, FR-020, FR-023; US4.

## Phase 5 — US2 heste

- [x] T011 [US2] Implementér hestevisning, registrering, kildehensyn og tilgængelighed i server/index.js og client/src/. FR-007, FR-008, FR-024.

## Phase 6 — US7 ønsker

- [x] T012 [US7] Implementér egne hold, nul til tre urangerede ønsker, validering og gemning. FR-009, FR-020, FR-023, FR-025.

## Phase 7 — Første integration

- [x] T013 Installer afhængigheder, fastlås package-lock.json og verificér produktionsbuild.
- [x] T014 Afprøv rollegrænser, fordeling, ønsker, skolegrænser, historik og genstart; dokumentér docs/verification.md. SC-001, SC-002, SC-004, SC-007, SC-009.
- [x] T015 Kontrollér lærer-/elevflow på desktop/mobil og ret UI-fejl. SC-001, SC-010.
- [x] T016 Dokumentér start og arkitektur i README.md og docs/architecture.md.

## Phase 8 — Efterfølgende brugerudvidelser

T021 fik næste ledige id ved denne afstemning; importen blev udført før billed-/profiludvidelsen.
Id'erne bevares frem for at omskrive opgavernes historik.

- [x] T021 [US4] Importér alle 34 case-elever og fire fredagshold via data/students.json og server/case-students.js; kontrollér navne/medlemskaber og dokumentér docs/student-data.md. FR-021; SC-007.
- [x] T017 [US2] Generér/gennemgå tre realistiske mockups, gem billedreference/type og vis billeder med fallback og mærkning. FR-027; SC-010.
- [x] T018 [US9] Implementér Min profil med valg, fjernelse og gemning af egne hensyn. FR-026.
- [x] T019 [US9] Gem hensyn normaliseret, afgræns til egen profil, opdatér matchkontrol, historik og berørte revisioner. FR-003, FR-017, FR-020, FR-026.
- [x] T020 Afprøv profil-API, lagring efter reload, lærerens visning og billeder på desktop/mobil. SC-004, SC-009, SC-010.

## Phase 9 — Dokumentation og afstemning

- [x] T022 Afstem constitution, spec, plan, research, datamodel, kontrakter, quickstart og checklist med det valgte scope; dokumentér iterationer og dækning. Alle aktive FR; docs/process.md og docs/traceability.md.
- [x] T023 Gennemfør read-only konsistenskontrol af spec, plan og tasks samt link-/id-kontrol. Registrér resultat uden at påstå ny applikationsafprøvning.

## Dependencies and Execution Order

T001–003 → T004–006 → T007 → T008–012 → T013–016.
Efter brugerens udvidelser: T021 → T017–019 → T020 → T022 → T023.
Hestekilder, backend og frontend blev udført parallelt på adskilte filer efter
fælles kontrakt. Integration og dokumentation blev samlet bagefter.

US3/US5/US6 fra den bredere case er ikke aktive stories i denne leverance.
Historisk prioritet indgår i US1; US4 er et læseoverblik, ikke medlemsadministration.
Gruppeevaluering og GitHub-deling er særskilte aktiviteter, ikke uafsluttet produktkode.
