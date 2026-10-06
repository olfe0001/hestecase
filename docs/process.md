# Arbejdsproces: fra principper til mockup

Projektet brugte Spec Kit-artefakter til at gå fra arbejdsregler og krav til en
implementeret mockup. Dokumenterne er levende: brugerens senere valg ændrede
omfanget, og de berørte artefakter er nu afstemt med den endelige leverance.

## Rækkefølge og resultat

| Trin | Arbejde og beslutning | Artefakt |
| --- | --- | --- |
| 1. Constitution | Fælles regler om sikkerhed, lærerens godkendelse, sporbarhed og afgrænsning. | .specify/memory/constitution.md |
| 2. Specify | Først bredere casebehov; derefter den valgte lærer-/elevmockup som scope. | specs/001-digital-holdadministration/spec.md |
| 3. Clarify | Fem konkrete valg om ventetid, lighed, manglende historik og bevarelse af data. | Clarifications i spec.md |
| 4. Plan | Brugerens Docker/JavaScript/Express/React/Tailwind/PostgreSQL-stack og 3NF; teknisk løsning og kontrakter. | plan.md, research.md, data-model.md, contracts/ |
| 5. Tasks | Afhængighedsordnede opgaver til foundation, rolleflows og fordeling. | tasks.md, T001–016 |
| 6. Implement | Backend, frontend og kildeheste blev bygget og integreret. | server/, client/, data/ |
| 7. Verifikation | Build, API-forløb, browser og databasedata efter genstart. | docs/verification.md |
| 8. Iterationer | Brugerens 34 case-elever, profilhensyn og realistiske billeder blev tilføjet og kontrolleret. | tasks.md, T017–021 og datadokumentation |
| 9. Afstemning | Brugeren bad om at gøre mockuppen til projektets leverance. Constitution/spec/plan/tasks og kontrakter blev afstemt. | tasks.md, T022–023; docs/traceability.md |

Det er den faktiske arbejdsrækkefølge i samtalen og projektet. De endelige dokumenter
blev ajourført efter implementeringen; det ville være misvisende at hævde, at alle
senere udvidelser stod i den oprindelige plan. Afstemningen er en iteration og en
konsistens-/convergensgennemgang. Den betyder ikke, at alle Spec Kit-kommandoer blev
kørt i præcis denne rækkefølge, eller at gruppens slutreview allerede er udført.

## Hvad blev afklaret undervejs?

- De fem Clarify-valg erstattede åbne spørgsmål om prioritering og historik.
- Stackvalget erstattede den tidligere Python-retning.
- Casens 34 navne erstattede de otte oprindelige syntetiske navne. Individuelle
  elevoplysninger og ønsker er fortsat demodata.
- Egne profilhensyn og billedmotiver blev separate brugeriterationer.
- Hele casens administration/fremmøde blev flyttet til mulige udvidelser og er
  ikke uafsluttede krav i den ønskede mockup.

## Afstemningens kontrol

Hvert aktivt krav forbindes med story, opgave, implementeringssted og evidens i
[traceability.md](traceability.md). Spec, plan og tasks gennemgås sammen med
constitution. Links og id'er kontrolleres. Dette er dokumentkontrol og påstår ikke
nye app-testresultater; allerede udførte kontroller står i verification.md.

Gruppens egen evaluering kan beskrive, hvad mockuppen demonstrerer, og hvilke
begrænsninger den har. Dokumentafstemningen blev udført lokalt på main uden
feature-branch eller PR-review. GitHub-deling er et efterfølgende trin og er ikke
dokumentation for gruppens review eller aflevering.

### Resultat af den afsluttende konsistenskontrol

19 aktive funktionelle krav, 23 udførte opgaver og opgavedækning for 19 af 19 krav.
Der blev ikke fundet resterende modstrid, udækkede produktkrav eller uafklarede
skabelonfelter mellem constitution, spec, plan og tasks. Alle relative Markdown-links
i de gennemgåede dokumenter og alle refererede opgave-id'er blev kontrolleret.
Tekniske setup-/dokumentationsopgaver understøtter planen og er forklaret i sporbarheden.
Denne kontrol er ikke en fuld applikationstest eller et allerede udført gruppereview.
