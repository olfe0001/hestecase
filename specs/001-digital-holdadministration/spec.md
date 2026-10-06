# Feature Specification: Stald — hesteregistrering og fordeling

**Created / Updated**: 2026-10-06
**Branch**: Lokalt på `main`; ingen påstået feature-branch eller gennemført PR-review.
**Status**: Implementeret mockup; afstemt med brugerens endelige omfang.
**Constitution**: [2.0.0](../../.specify/memory/constitution.md).

## Formål og leverance

En ridelærer skal kunne se sine elever og hold, skolens heste og elevernes ønsker,
få et fordelingsforslag og rette/godkende det. Eleven skal kunne se egne hold og
sin godkendte hest, vælge op til tre heste og ændre egne hensyn. Arbejdsgangene skal
være overskuelige i en dansk hjemmeside med adgang uden kode.

Denne specifikation gælder den ønskede mockup, ikke alle funktioner i den bredere
rideskolecase. Planen indeholder teknologivalg. Den første bredere Specify blev
afgrænset og senere udvidet efter brugerens valg; dette er dokumenteret som iterationer
[i procesbeskrivelsen](../../docs/process.md), ikke som efterdateret forhåndsplanlægning.

### Inden for omfanget

- Lærer-/elevprofilvalg, logout og skoleafgrænset adgang.
- Lærerens egne elever/hold og alle samme skoles heste.
- Hesteregistrering med egenskaber, grænser og hensyn; ændring af tilgængelighed.
- Op til tre urangerede ønsker pr. elev, hold og demonstrationsmåned.
- Elevens redigering af egne funktionelle hensyn.
- Forslag, manuelle rettelser, begrundede lærerbeslutninger og godkendelse.
- Gemte data, revisioner og historik samt realistiske, mærkede mockupbilleder.
- Flere rideskoler i samme datamodel og brug på desktop/mobil.

### Mulige udvidelser uden for leverancen

Fuld månedsoptimering og månedsafslutning, partholdsaftaler, administrativ oprettelse
og flytning af elever/hold, ventelister, kontingent og betaling, fremmøde og faktisk
hestebrug, velfærdsrapporter, beskeder, afløser-/administratorroller, upload af egne
fotos og verificeret produktionslogin. Disse er fremtidige muligheder og ikke
manglende obligatoriske funktioner i denne mockup.

## Clarifications

### Oprindelige fem valg — 2026-10-06

1. Blandt egnede elever prioriteres den, der længst har ønsket hesten uden at få den.
2. Ventetid tælles som sammenhængende måneder med uopfyldt ønske pr. elev/hold/hest.
   Modtaget hest eller ophørt ønske afbryder rækken i det registrerede månedsgrundlag.
3. Ved lige ventetid viser systemet konflikten; læreren vælger med begrundelse.
4. Nye elever starter på nul. Manglende historik for eksisterende elever kræver
   lærerens afklaring af prioriteringen før godkendelse.
5. Godkendte fordelinger og ændringshistorik skal bevares efter genstart.

### Efterfølgende brugerbeslutninger — 2026-10-06

- Mockuppen omfatter både lærer og elev; kodefri adgang er profilvalg.
- Den ønskede tekniske stack, 3NF og genbrug på andre rideskoler beskrives i planen.
- Casens 19 heste og senere alle 34 elevnavne/fredagshold indlæses.
- Elevens egne hensyn kan ændres; realistiske billeder er tydeligt mærkede mockups.
- Ingen unit tests kræves; build, relevante integrationer og browserforløb afprøves.
- Denne afstemning gør mockuppen til leverancens scope; den bredere case er baggrund.

## User Scenarios & Testing

Story- og krav-id'er bevares, hvor de stadig gælder, så eksisterende opgaver kan spores.
US3/US5/US6 og FR-010/012–016/018–019 fra den bredere spec er udgået af leverancen;
deres emner står ovenfor som mulige udvidelser. Id'erne genbruges ikke til andre krav.

### US8 — Adgang som lærer eller elev (P1)

Som lærer/elev vil jeg vælge rideskole og profil uden kode og få mit relevante overblik.
**Selvstændig afprøvning:** Vælg rolle/profil, åbn systemet og log ud.

- **US8.1:** Når læreren åbner systemet, vises egne hold/elever og skolens heste.
- **US8.2:** Når eleven åbner systemet, vises egne personoplysninger og hold;
  eleven kan ikke fordele eller godkende heste.
- **US8.3:** Når en anden rideskoles profil vælges, vises kun denne skoles data;
  ændring af id i en forespørgsel giver ikke adgang på tværs af skoler.

### US4 — Overblik over egne hold og elever (P1)

Som lærer vil jeg se elevernes forudsætninger, hensyn og hold samlet.
**Selvstændig afprøvning:** Åbn overblik og Mine elever som lærer.

- **US4.1:** Alle elever på lærerens hold vises med tilknyttede hold og relevante hensyn.
- **US4.2:** Elever på en anden lærers hold vises kun, hvis de også går på egne hold.
- **US4.3:** Eleven ser egne hold og kun godkendte tildelinger som sin kommende hest;
  en kladde vises som afventende godkendelse.

### US2 — Se og registrér heste (P1)

Som lærer vil jeg se skolens heste, registrere en hest og ændre tilgængelighed.
**Selvstændig afprøvning:** Søg en hest, åbn detaljer og registrér en demonstrationshest.

- **US2.1:** Hestelisten kan søges/filtreres; detaljer viser egenskaber, hensyn,
  aktivitet, kapacitet, kilde og mærkede demonstrationsgrænser.
- **US2.2:** En ny hest med nødvendige felter gemmes på lærerens rideskole.
- **US2.3:** Ændret tilgængelighed gør skolens fordelinger til kladder og kræver
  ny kontrol. En utilgængelig hest kan ikke godkendes til en elev.
- **US2.4:** Realistiske mockupbilleder vises i hestevalg/detaljer og betegnes som
  illustrationer. En hest uden billede får en neutral illustration.

### US7 — Elevens egne hesteønsker (P1)

Som elev vil jeg vælge op til tre ligeværdige heste pr. hold.
**Selvstændig afprøvning:** Gem ønsker og genåbn dem som elev og holdets lærer.

- **US7.1:** Nul til tre forskellige ønsker gemmes for egen profil, hold og måned.
- **US7.2:** Et fjerde eller gentaget ønske afvises. Ingen rangering tilføjes.
- **US7.3:** Fremmede hold og en anden skoles heste kan ikke vælges.
- **US7.4:** Læreren ser de gemte ønsker. Ændring sætter skolens fordelinger i kladde.

### US9 — Eleven ændrer egne hensyn (P1)

Som elev vil jeg fortælle læreren, hvad der støtter min ridning, og kunne rette det.
**Selvstændig afprøvning:** Åbn Min profil, tilføj/fjern et hensyn, gem og genindlæs.

- **US9.1:** Eksisterende hensyn vises; eleven kan vælge/fjerne hensyn fra listen.
- **US9.2:** Gemning bevares efter genindlæsning og vises til elevens lærer.
- **US9.3:** Ændring af egne hensyn kræver ny gennemgang af egne holds fordelinger.
- **US9.4:** Ukendte/duplikerede hensyn og forsøg på at ændre andre elever afvises.
- **US9.5:** Balancehjælp, skånsom belastning, ro og tryghed indgår i det rolige match;
  Ingen spring blokerer springtildeling. Håndteringshjælp og størrelseshensyn vises
  til lærerens vurdering; de ændrer ikke automatisk elevens mål eller faglige niveau.

### US1 — Foreslå, ret og godkend fordeling (P1)

Som lærer vil jeg fordele egnede heste på et valgt hold ud fra behov og ønsker.
**Selvstændig afprøvning:** Lav forslag, afklar konflikter, gem rettelser og godkend.

- **US1.1:** Et forslag giver hver elev en tildeling eller en synlig besked om manglende
  match. Forslaget er en kladde, og ønsker vises uden rangering.
- **US1.2:** Forslag/rettelser kontrollerer registreret tilgængelighed, niveau,
  eksempel-vægtgrænse, relevant temperament/behov, aktivitet og hviledag.
  Individuelle begrænsninger fra hestedata kan skærpe kontrollen.
- **US1.3:** Overlap, daglig/ugentlig kapacitet og registrerede undervisningsdatoer
  på tværs af skolens hold indgår. Samme hest kan ikke tildeles to elever på holdet.
- **US1.4:** Ønsker prioriteres efter de fem Clarify-valg. Lige ventetid og manglende
  historik kræver et begrundet lærervalg; en sikkerhedsafvisning kan ikke overstyres.
- **US1.5:** En manuel rettelse kontrolleres efter de samme regler. Uløste prioriteringer,
  manglende elever eller sikkerhedsfejl hindrer godkendelse.
- **US1.6:** Godkendelse gemmer komplet fordeling, aktør, tidspunkt og historik.
  En forældet revision afvises; samme godkendelses-id kan sendes igen uden dublet.
- **US1.7:** Gemte data og godkendelser bevares efter genstart. Efterfølgende ændringer
  i ønsker, hensyn eller hestetilgængelighed kan gøre fordelingen til kladde igen,
  mens den tidligere beslutning bevares i historikken.

## Functional Requirements

| ID | Krav | Acceptgrundlag |
| --- | --- | --- |
| FR-001 | Foreslå heste for et valgt eget hold og synliggør manglende matches. | US1.1 |
| FR-002 | Kontrollér højst tre daglige hold, mindst én fridag, højst én ugentlig springaktivitet og lavere individuelle grænser mod registreret plan. | US1.2–3 |
| FR-003 | Kontrollér niveau, vægtgrænse, relevante behov, temperament og aktivitet; kildefakta og demo-tal skelnes. | US1.2; US9.5 |
| FR-004 | Afvis dobbelttildeling og overlappende planlagt brug på skolens registrerede lektioner. | US1.3 |
| FR-005 | Vis ønsker, tildelingsbegrundelser, konflikter og mulighed for manuel rettelse. | US1.1, US1.4–5 |
| FR-006 | Godkend kun komplette, sikre, afklarede fordelinger med aktuel revision; gem resultat og håndtér gentaget godkendelses-id. | US1.5–7 |
| FR-007 | Læreren kan registrere heste og ændre tilgængelighed med begrundelse. | US2.1–3 |
| FR-008 | Efter ændret tilgængelighed kan læreren lave nyt forslag; en utilgængelig hest afvises ved godkendelse. | US2.3; US1.2 |
| FR-009 | Gem nul til tre forskellige, urangerede ønsker pr. elev/hold/demonstrationsmåned. | US7.1–2 |
| FR-011 | Prioritér sammenhængende uopfyldt månedsønske blandt egnede elever. Ligelig ventetid og manglende historik kræver lærerbeslutning; nye elever starter på nul. | US1.4; Clarify 1–4 |
| FR-017 | Bevar aktør/tidspunkt i ændringshistorik og før/efter-snapshots for fordelingsændringer; data består efter genstart. | US1.6–7; US9.2 |
| FR-020 | Læreren ser/fordeler egne hold; eleven ser egne persondata og kan kun ændre egne ønsker/hensyn. | US8.1–2; US4.1–3; US9.4 |
| FR-021 | Brug casens 19 heste og 34 elevnavne/fredagshold; øvrige individuelle elevoplysninger og ukendte faglige talgrænser er mærkede demodata. | Datagennemgang; US2.1; US4.1 |
| FR-022 | Tilbyd profilvalg som lærer/elev uden kode samt logout. | US8.1–3 |
| FR-023 | Eleven ser egne hold, ønsker og godkendte tildelinger; læreren ser elevønsker. | US4.3; US7.1, US7.4 |
| FR-024 | Registrér nye heste med egenskaber, aktiviteter, behov og grænser på egen skole. | US2.2 |
| FR-025 | Afgræns data og relationer pr. rideskole og demonstrér samme model med to skoler. | US8.3; US7.3 |
| FR-026 | Eleven kan tilføje/fjerne egne hensyn; gemning vises hos læreren og kræver ny gennemgang af egne hold. | US9.1–5 |
| FR-027 | Vis realistiske, visuelt kontrollerede og mærkede mockupbilleder; bevar fallback ved manglende billede. | US2.4 |

## Edge Cases

- Manglende egnet hest giver uløst tildeling og blokerer komplet godkendelse.
- Lige ventetid eller ukendt eksisterende historik afgøres ikke stiltiende.
- Historikreglen bruger registrerede afsluttede måneder; en enkeltlektions
  godkendelse afslutter ikke en måned eller nulstiller månedsgrundlaget.
- Ændringer kan gøre en tidligere godkendelse til kladde; historikken bevares.
- Forældede revisioner, fremmede id'er og uegnede manuelle matches afvises.
- En elev på flere hold har egne ønsker pr. hold og ét fælles sæt profilhensyn.
- Nul ønsker og nul hensyn er tilladt. Alle elever skal stadig have egnet hest før godkendelse.
- Manglende billede vises med fallback; fotos er ikke evidens for reelle hesteegenskaber.
- Ukendt faktisk brug uden for de registrerede lektioner kan ikke certificeres som sikker.

## Key Entities

Rideskole; profil med rolle/skole; elev med forudsætninger og hensyn; hest med
aktiviteter, grænser, tilgængelighed og billedreference; hold og medlemskab;
dateret lektion; urangeret ønske; forberedt månedshistorik; fordeling med revision;
tildeling; begrundet lærerbeslutning; ændringshistorik og historisk fordelingsversion.
Login og godkendelses-id'er er tekniske støtteentiteter i planen/datamodellen.

## Success Criteria

Dette er acceptmål. Udført verifikation står i [verifikation](../../docs/verification.md).
Et beskrevet mål er ikke automatisk en påstand om en gennemført kontrol.

- **SC-001:** Både lærer og elev kan vælge profil, gennemføre deres hovedforløb og logge ud.
- **SC-002:** Kendte utilgængelige/dobbelttildelte heste og forældede revisioner afvises;
  et komplet gyldigt demonstrationshold kan godkendes med begrundede lærerbeslutninger.
- **SC-004:** Ønsker, tildelinger og historik bevares efter én genstart; egne hensyn
  bevares efter genindlæsning og vises hos læreren.
- **SC-007:** Afprøvede rolle-, hold- og skoleoverskridelser afvises; 19 heste og 34
  elevnavne med medlemskab på fire fredagshold stemmer med kildefilerne.
- **SC-009:** Eleven kan gemme op til tre forskellige ønsker og tilføje/fjerne hensyn;
  ugyldige valg afvises uden at ændre andre elevers oplysninger.
- **SC-010:** Desktop ved 1440 × 1000 og mobil ved 390 × 844 gennemgås uden
  JavaScript-fejl eller vandret sideoverløb; synlige hestebilleder indlæses korrekt.

Tidligere SC-003 (to personer/fem minutter), SC-005–006 (administration/fremmøde)
og den fulde SC-008 scenariematrix er ikke obligatoriske acceptmål for den valgte
mockup. Ventetidsreglen er fortsat FR-011. En senere brugerevaluering og bredere
sikkerhedsafprøvning kan udvide evidensen uden at påstå allerede målte resultater.

## Assumptions and Limitations

- Oktober 2026 er demonstrationsmåned med forberedte undervisningsdatoer.
  Måneder vælges ikke frit i brugerfladen, og historik afsluttes ikke automatisk.
- Hvert fredagshold varer 45 minutter. Anne er demonstrationslærer for de fire hold.
  Et ekstra torsdagsspringhold og en anden skole er syntetiske demonstrationer.
- Ugen er mandag–søndag. Kapacitet kontrolleres mod registrerede planlagte lektioner,
  ikke mod et fuldstændigt register over faktisk ridning, parter eller hjælpere.
- Matchning omfatter POC-regler og mærkede taleksempler, ikke faglig validering af
  hestenes bæregrænser. Casens kvalitative hensyn er bevaret.
- Profilvalg giver ingen verificeret identitet. Rolle- og skolegrænser håndhæves
  efter valgt profil; en rigtig identitetsudbyder er senere arbejde.
- Hestebilleder er tre delte mockupmotiver. Egne fotos kan senere erstatte dem;
  upload er ikke en leveret brugerfunktion.
- Ingen unit tests kræves. Dokumentation skelner mellem implementeret regel,
  faktisk afprøvet scenario og en fremtidig evaluering.

## Kilder

K1: `base-case-files/Casebeskrivelse, BPMN.pdf`, velfærdsregler og op til tre ønsker.
K4: `base-case-files/fredagsheste jan-jun TIL CASE.pdf`, s. 1–2 navne/hold, s. 3 heste.
K5: `base-case-files/Transkripering af domæne ekspert.md`, praktisk fordeling og kontrol.
Brugerens fem Clarify-valg, stackvalg og efterfølgende udvidelser er projektbeslutninger.
Detaljer og skel mellem kilde og demo findes i `docs/horse-data.md`,
`docs/student-data.md` og `docs/horse-images.md`.
