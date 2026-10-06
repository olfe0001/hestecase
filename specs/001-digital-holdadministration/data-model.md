# Data Model: PostgreSQL, 3NF og flere rideskoler

Autoritativt skema: [server/db/schema.sql](../../server/db/schema.sql).
Modellen understøtter den afgrænsede mockup, ikke betaling/fremmøde eller medlemsadministration.

## Entiteter og relationer

| Tabel / relation | Formål |
| --- | --- |
| schools | Skolens identitet og navn |
| profiles | Navn, rolle og skole; case-navne eller markerede demoprofiler |
| students | Profilens forudsætninger: niveau, højde, vægt og historikstatus |
| needs | Kanoniske behovskoder og labels |
| student_needs / horse_needs | Mange-til-mange-kobling af hensyn til elev/hest |
| horses / horse_activities | Hest, egnethed, kapacitet, tilgængelighed, kilde, syntetiske felter og aktiviteter |
| groups / memberships / lessons | Hold/lærer, elever på holdet og konkrete lektioner |
| wishes | Én elev/hold/måned/hest-række; højst tre forskellige valg valideres i API |
| month_history | Forberedte afsluttede måneders ønsker og received-status til ventetid |
| distributions | Revision og kladde-/godkendt status pr. hold |
| assignments | Lektion/elev/hest med begrundelse; unik elev og hest pr. lektion |
| decisions | Begrundet lærerbeslutning pr. hold/hest/elev |
| audit / distribution_versions | Aktør/tidspunkt og historiske før/efter-fordelingsdokumenter |
| sessions / approval_operations | Gemte demosessioner og idempotente godkendelsesoperationer |

Hestens `image_path` og `image_kind` angiver reference og oprindelse (`mockup`/`photo`).
Tre lokale billedfiler deles i demonstrationen; referencen kan erstattes uden at ændre
ønsker/tildelinger. Upload af egne fotos er en fremtidig brugerfunktion.

## Normalisering

Grundtabellerne har entydige nøgler; domænefelter beskriver disse nøgler. Navne
kopieres ikke ind i ønsker, medlemskaber eller tildelinger. Mange-til-mange-forhold
har koblingstabeller. Fordelingsstatus hentes fra distributions og kopieres ikke
ind som afledt elevstatus. Historiske JSON-snapshots og kilde-/syntetisk metadata
er dokumenter og erstatter ikke den normaliserede operative model.

## Skole- og rollegrænser

Rodentiteter tilhører en skole; relationer afgrænses via rodentiteterne. API'et bruger
skole/rolle fra sessionen. Databasetriggers kontrollerer, at elev, hold og hest hører
sammen. Lærere fordeler egne hold. Elever ændrer egne ønsker på egne hold og eget
sæt hensyn. En ekstra syntetisk skole bruges til kontrol af dataskellet.

## Kilder og import

`data/horses.json`: 19 kildeheste. `data/students.json`: 34 elevnavne og fire
fredagshold. `server/case-students.js` bruger engangsimport; gamle interne id'er
bevares af hensyn til sessioner, ønsker og historik. Derfor kan et teknisk id
indeholde et gammelt demonavn, selv om profilens viste navn er fra casen.

Individuelle elevmål, niveauer, behov, ønsker og historik er fortsat demodata.
Holdenes fælles niveauer/tider er fra elevlisten. Casens tidligere hestetildelinger
importeres ikke som dokumenterede ønsker eller ventetid.

## Mutationer, historik og revisioner

Hensyn erstattes atomisk i student_needs; gyldige valg defineres i
server/student-needs.js. Ændring kræver ny godkendelse af elevens egne hold.
Ønske-/hesteændringer invaliderer skolens fordelinger. Historiske versioner bevares.
Godkendelse validerer seneste revision og regler og gemmer et idempotent resultat.

Ventetid beregnes fra sammenhængende tidligere månedsposter uden received=true;
modtaget hest eller hul afbryder rækken. Nye elever har nul; manglende eksisterende
historik kræver lærerafklaring. En godkendt lektion opdaterer ikke automatisk dette
månedsgrundlag. Månedsafslutning og faktisk brug skal designes ved en senere udvidelse.
