# Research and Decisions: Stald

**Status**: Beslutningsgrundlag afstemt med den implementerede mockup 2026-10-06.
Grundprincipper: constitution 2.0.0; leverance: spec.md.

| Beslutning | Begrundelse / afgrænsning |
| --- | --- |
| JavaScript, Express, React og Tailwind | Brugerens udtrykkelige stackvalg erstattede den tidligere Python-retning. |
| PostgreSQL og 3NF | Entiteter og koblingstabeller genbruges pr. skole; ønsker, hensyn og tildelinger kopierer ikke navne. |
| Docker Compose | Ens lokal app/database, healthchecks og vedvarende volume. |
| Kodefrit profilvalg | Demonstrerer roller hurtigt; en servergemt session afgrænser skole/rolle. Ikke verificeret identitet. |
| Serverstyret matchning | Samme validering bruges ved forslag, rettelser og godkendelse; browseren kan ikke overstyre regler. |
| Historisk ventetid | Bevar de fem Clarify-valg. Brug forberedte månedsposter; ingen automatisk månedsafslutning. |
| Casens heste og elever | 19 heste samt 34 navne/fredagshold fra bilaget. Øvrige individuelle elevfelter er demodata. |
| Numeriske eksempelgrænser | Casen mangler bæregrænser; mærkede demo-tal kan afprøve flowet, men er ikke faglige fakta. |
| Egne profilhensyn | Et normaliseret sæt funktionelle valg kan ændres og ses hos læreren. Ingen diagnosekopiering. |
| Tre lokale billedmotiver | Realistiske, visuelt kontrollerede mockups uden afhængighed af ekstern billedtjeneste; eget foto kan senere erstatte reference. |
| Integration og browserkontrol | Ingen unit tests efter brugerens valg. Faktisk evidens adskilles fra målsætninger. |

Alternativer som ORM, separat regelservice, betalingsintegration og ekstern loginudbyder
er ikke nødvendige for denne mockup. En fuld driftsløsning kan vælge dem senere.

Eksisterende tekniske referencekilder (ikke genverificeret som del af dokumentafstemningen):
[Tailwind/Vite](https://tailwindcss.com/docs/installation/using-vite),
[Express](https://expressjs.com/en/guide/migrating-5/) og
[Docker-opstartsorden](https://docs.docker.com/compose/how-tos/startup-order/).
Den anvendte implementation og fastlåste afhængigheder er dokumenteret i planen og package-lock.json.

Kilde-/demoadskillelse: [heste](../../docs/horse-data.md),
[elever](../../docs/student-data.md) og [billeder](../../docs/horse-images.md).
