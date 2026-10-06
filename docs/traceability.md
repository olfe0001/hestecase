# Sporbarhed: krav → plan → opgaver → mockup

Grundlag: constitution 2.0.0 og den afstemte spec. Plan, datamodel og kontrakter
beskriver den fælles løsning. Tabellen forbinder alle 19 aktive funktionelle krav
med udført arbejde. Evidens er præciseret; opgavedækning er ikke en fuld testmatrix.

| Krav | Story | Opgaver | Implementering / evidens |
| --- | --- | --- | --- |
| FR-001 | US1 | T008, T010, T014 | matching.js og fordelingsflow; forslag afprøvet i første API-forløb |
| FR-002 | US1 | T008, T014 | matching.js: kapacitet/fridag; implementeret, ikke hele regelmatrixen afprøvet |
| FR-003 | US1, US9 | T008, T019 | matching.js, student-needs.js og kildeheste; registrerede/demo-grænser |
| FR-004 | US1 | T008, T014 | matching.js og constraints; dobbelttildeling afvist i API-forløb |
| FR-005 | US1 | T008, T010, T015 | Fordelingsvisning; lærerflow gennemgået i browser |
| FR-006 | US1 | T009, T014 | index.js, distributions og approval_operations; godkendelse, revision/idempotens afprøvet |
| FR-007 | US2 | T011, T014, T015 | Hesteform/API; registrering af Storm og tilgængelighed afprøvet |
| FR-008 | US2, US1 | T008, T011, T014 | Nyt forslag og tilgængelighedskontrol; utilgængelig hest afvist |
| FR-009 | US7 | T012, T014 | Wishes/API; tre ønsker og ugyldige valg afprøvet |
| FR-011 | US1 | T008, T014 | waitMonths/priorities; lige ventetid afprøvet, månedshistorik er seed |
| FR-017 | US1, US9 | T004, T009, T019, T020 | audit/versioner og PostgreSQL; genstart og profilhistorik kontrolleret |
| FR-020 | US8, US4, US9 | T005, T007, T010, T012, T019 | Rolle-/hold-/egen profilkontrol; adgangsafvisninger afprøvet |
| FR-021 | US2, US4 | T002, T021 | horses.json/students.json; 19 heste og 34 navne/medlemskaber kontrolleret |
| FR-022 | US8 | T005, T007, T015 | Sessions og Login; lærer/elev/logout afprøvet |
| FR-023 | US4, US7 | T007, T010, T012, T015 | Dashboard/overblik og ønsker; rolleflows gennemgået |
| FR-024 | US2 | T011, T014 | POST /horses og AddHorse; ny demonstrationshest gemt |
| FR-025 | US8, US7 | T004, T005, T012, T014 | Skoler, relationer og serverkontrol; anden skole afprøvet |
| FR-026 | US9 | T018, T019, T020 | Min profil og PUT /profile/needs; tilføj/fjern, reload og lærerens visning afprøvet |
| FR-027 | US2 | T017, T020 | Tre lokale billeder, billedtype/fallback og kort; visuelt/browserkontrolleret |

## Acceptmål og evidens

SC-001/002: første lærer-/elev-/fordelingsforløb. SC-004: databasegenstart og senere
profil-reload. SC-007: skole-/rollegrænser og senere caseimport. SC-009: ønsker og
profilmutationer. SC-010: desktop/mobil og billeder. Se [verification.md](verification.md)
for perioder og præcis afprøvning; en tidligere afprøvning er ikke en ny test af alle
34 elever eller alle belastningsregler.

Tekniske setup- og dokumentationsopgaver T001/003/006/013/016/022/023 understøtter
planens miljø, constitution, browserbrug og sporbarhed og har ikke en selvstændig
produktfunktion. Ingen obligatoriske krav er efterladt til de mulige udvidelser.
