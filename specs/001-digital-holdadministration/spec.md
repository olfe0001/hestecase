# Feature Specification: Digital holdadministration på Bøgegården

**Feature Branch**: Ingen feature-branch oprettet; arbejdet ligger lokalt på `main`.

**Created**: 2026-10-06

**Status**: Draft — til gruppens gennemgang og Clarify.

**Input**: Brugeren har vedtaget constitution og bedt om næste trin, Specify.
Specifikationen beskriver hele casens systembehov. Matchning mellem hest og elev er
POC-fokus i constitution; den konkrete POC-afgrænsning nedenfor er et forslag.

## User Scenarios & Testing *(mandatory)*

### User Story 1 - Få og godkend sikre matchforslag (Priority: P1)

Som ridelærer vil jeg få forslag til heste til eleverne på et valgt hold ud fra
deres forudsætninger og ønsker, så jeg kan fordele hestene med færre manuelle
kontroller og uden kendte brud på sikkerheds- og velfærdsreglerne.

**Why this priority**: Forkerte matches påvirker sikkerhed og undervisning.
Dette er projektets foreslåede POC-user story.

**Independent Test**: Brug et forberedt hold med syntetiske elever, heste,
ønsker og ugentlig plan. Gennemfør forslag, manuel rettelse og godkendelse uden
at bygge medlemsadministration eller fremmøderegistrering først.

**Acceptance Scenarios**:

1. **Given** et hold med egnede og tilgængelige heste, **When** læreren anmoder
   om forslag, **Then** får hver elev et begrundet forslag eller en synlig
   besked om, at et match ikke kan findes; forslag er endnu ikke godkendte.
2. **Given** en syg hest, en fuldt belastet hest og en hest med uegnede egenskaber,
   **When** forslag dannes, **Then** foreslås ingen af disse til den berørte elev,
   og årsagerne kan ses af læreren.
3. **Given** et forslag, **When** læreren vælger en anden hest, **Then** kontrolleres
   ændringen mod de samme regler; en konflikt vises og hindrer godkendelse.
4. **Given** to samtidige elever, **When** samme hest vælges til begge,
   **Then** vises dobbelttildelingen, og fordelingen kan ikke godkendes.
5. **Given** et komplet, konfliktfrit forslag og opdaterede oplysninger,
   **When** læreren godkender, **Then** fremgår fordelingens status, godkender
   og tidspunkt, og fordelingen kan ses af en afløser.
6. **Given** manglende kritiske matchoplysninger eller ingen egnet hest,
   **When** læreren forsøger at godkende hele holdets fordeling,
   **Then** blokeres godkendelsen, og de uafklarede elever fremgår.

### User Story 2 - Vedligehold hesteoplysninger og håndter akut sygdom (Priority: P1)

Som staldansvarlig vil jeg registrere relevante ændringer i hestens egnethed og
tilgængelighed, så lærere og afløsere arbejder ud fra samme oplysninger.

**Why this priority**: Matchforslag kræver aktuelle hesteoplysninger.

**Independent Test**: Brug en eksisterende hest og en forberedt fordeling.
Registrér sygdom og kontrollér, at berørte tildelinger markeres.

**Acceptance Scenarios**:

1. **Given** en hest, **When** en ansvarlig registrerer sygdom for en periode,
   **Then** vises hesten som utilgængelig i perioden, og berørte fordelinger
   markeres som krævende ny kontrol, også hvis de tidligere var godkendte.
2. **Given** en utilgængelig hest, **When** læreren søger en erstatning,
   **Then** anvendes de almindelige match- og belastningsregler; hvis ingen
   erstatning findes, vises problemet uden en automatisk usikker tildeling.
3. **Given** en hest, der er solgt, **When** den afsluttes som aktiv rideskolehest,
   **Then** kan den ikke tildeles fremover, mens tidligere brug bevares.

### User Story 3 - Fordel heste for en ny måned (Priority: P2)

Som ridelærer vil jeg samle elevernes ønsker og få et månedligt fordelingsforslag,
så jeg kan gennemgå hestebrug på tværs af hold uden at sammenholde papirark.

**Why this priority**: Månedlig fordeling er en central, tidskrævende caseopgave,
men er større end den foreslåede første POC.

**Independent Test**: Brug forberedte hold og en måneds undervisningsdatoer;
kontrollér fordeling, uopfyldte ønsker og kendte partholdstildelinger.

**Acceptance Scenarios**:

1. **Given** en elev på et hold, **When** ønsker registreres for en ny måned,
   **Then** kan der gemmes nul til tre forskellige heste; et fjerde eller
   gentaget ønske afvises med forklaring.
2. **Given** hold, ønsker og kendt brug i perioden, **When** forslaget dannes,
   **Then** kontrolleres de konkrete undervisningsdatoer på tværs af hold;
   uopfyldte ønsker og uafklarede tildelinger fremgår.
3. **Given** en dokumenteret partholdsaftale, **When** månedsforslaget dannes,
   **Then** bevares den faste hest, hvis match og belastning er tilladt;
   ellers markeres konflikten til lærerens behandling.
4. **Given** konkurrerende ønsker, **When** læreren gennemgår forslaget,
   **Then** fremgår den anvendte fordelingsregel og begrundelsen for hvert match.

### User Story 4 - Hold én fælles hold- og medlemsoversigt (Priority: P2)

Som administrator vil jeg vedligeholde elever, hold, tilmeldinger, ventelister
og kontingentstatus, så kontoret og lærerne ser samme gældende holdplacering.

**Why this priority**: Uens lister skaber fejl og svækker administrationens overblik.

**Independent Test**: Opret syntetiske elever og hold, flyt en elev og se ændringen
som lærer; matchning behøver ikke være implementeret.

**Acceptance Scenarios**:

1. **Given** et hold med ti aktive elever, **When** en ekstra tilmelding forsøges,
   **Then** afvises tilmeldingen, og eleven kan sættes på venteliste.
2. **Given** en elev, **When** administratoren flytter eleven fra en bestemt dato,
   **Then** viser begge holds lister korrekt placering før og efter datoen.
3. **Given** en venteliste, **When** en plads bliver ledig,
   **Then** kan administratoren se og tilbyde pladsen til en ventende elev;
   systemet tilmelder ikke automatisk uden en registreret beslutning.
4. **Given** en medlemsoversigt, **When** administratoren opdaterer kontingentstatus,
   **Then** kan status og periode ses af administratoren; læreren får ikke
   betalingsoplysninger gennem den almindelige undervisningsoversigt.

### User Story 5 - Registrér fremmøde og faktisk hestebrug (Priority: P2)

Som ridelærer vil jeg registrere fremmøde og den faktisk anvendte hest for hver
undervisning, så administrationen og velfærdsoversigten bygger på gennemført brug.

**Why this priority**: En plan dokumenterer ikke, hvem der deltog, eller hvilke
heste der faktisk blev brugt.

**Independent Test**: Brug en forberedt undervisning med elev- og hesteliste.
Registrér fremmøde og en erstatningshest, og kontrollér de efterfølgende oversigter.

**Acceptance Scenarios**:

1. **Given** en undervisning uden registreringer, **When** oversigten åbnes,
   **Then** står eleverne som ikke registreret, ikke som fraværende.
2. **Given** en elev, som deltog på en anden hest end planlagt,
   **When** læreren afslutter registreringen, **Then** bevares både den planlagte
   tildeling og den faktisk anvendte hest.
3. **Given** en forkert registrering, **When** en ansvarlig retter den,
   **Then** kan den tidligere værdi, rettelsen, ansvarlig og tidspunkt efterprøves.

### User Story 6 - Se velfærd, beskeder og nødvendig overlevering (Priority: P3)

Som lærer, afløser eller administrator vil jeg se relevante beskeder og oversigter
over hestenes brug, så jeg kan forberede undervisningen og opdage mangler.

**Why this priority**: Overblik forbinder de øvrige arbejdsgange og understøtter
dokumentation; det kan afprøves med forberedte registreringer.

**Independent Test**: Brug en kendt uge med plan, faktisk brug og daterede beskeder.
Åbn oversigten som afløser og administrator.

**Acceptance Scenarios**:

1. **Given** en uge med fuldstændige registreringer,
   **When** velfærdsoversigten åbnes, **Then** vises daglige hold, springaktiviteter
   og fridage for hver hest, særskilt for planlagt og faktisk brug.
2. **Given** manglende registreringer, **When** oversigten åbnes,
   **Then** vises manglerne, og ugen erklæres ikke dokumenteret regeloverholdende.
3. **Given** en besked om et bestemt hold eller en prøvelektion,
   **When** en afløser åbner den relevante undervisning,
   **Then** vises besked, gyldighed, afsender og tidspunkt.
4. **Given** en bruger uden ansvar for holdet,
   **When** vedkommende forsøger at se elevhensyn,
   **Then** gives ikke adgang til disse oplysninger.

### Edge Cases

- To elever ønsker den samme hest: kun én kan tildeles den ved samme tidspunkt;
  den anden får en egnet alternativ hest eller en synlig uløst tildeling.
- Kritiske matchdata eller dele af ugens brug mangler: relevant godkendelse blokeres,
  indtil data er afklaret; ukendt betyder ikke tilladt.
- En hest bliver syg efter godkendelse: berørte fordelinger kræver ny kontrol.
- Hestens lavere individuelle grænse er nået: den individuelle grænse gælder.
- En ændring til springning eller ekstra hold bryder en ugeregel: godkendelse blokeres.
- Flere brugere ændrer samme fordeling: en godkendelse skal bruge aktuelle data;
  en forældet version må ikke stiltiende overskrive en nyere godkendelse.
- En elev går på flere hold: ønsker og tildelinger knyttes til elevens enkelte hold.
- Et hold aflyses: aflysningen bevares og tæller ikke som faktisk hestebrug.
- Hjælpere eller parter bruger en hest: relevant brug indgår i den samlede
  belastning og må ikke forsvinde, fordi rytteren ikke er en almindelig holdelev.
- En faktisk hændelse brød en regel: registreringen skal kunne bevares som faktisk
  hændelse med synlig afvigelse; systemet må ikke kræve en urigtig registrering.

## Requirements *(mandatory)*

### Functional Requirements

| ID | Krav | Acceptgrundlag | Kilde |
| --- | --- | --- | --- |
| FR-001 | Systemet skal kunne foreslå heste til et valgt hold ud fra elevforudsætninger, hesteegnethed, ønsker og kendt brug. | US1.1–2 | K1, K5 |
| FR-002 | Forslag og manuelle rettelser skal kontrolleres mod sygdom/skade, højst tre hold pr. dag, mindst én ugentlig fridag, højst én springaktivitet pr. uge og lavere individuelle grænser. | US1.2–3; US6.1; edge cases | K1, constitution I |
| FR-003 | Systemet skal kontrollere dokumenterede begrænsninger for rytterbelastning, størrelse, niveau, temperament og aktivitet uden selv at opfinde faglige talgrænser. | US1.2, US1.6 | K1, K4, K5 |
| FR-004 | Samme hest må ikke tildeles samtidige ryttere, og alle relevante holds og øvrige kendte aktiviteters brug skal indgå i kontrollen. | US1.4; edge cases | K1, K5 |
| FR-005 | Læreren skal kunne se begrundelser, afvisninger og uopfyldte ønsker samt rette et forslag før godkendelse. | US1.1–3; US3.4 | K5 |
| FR-006 | Godkendelse skal kræve komplet, konfliktfri fordeling og aktuelle kritiske data; godkender og tidspunkt skal registreres. | US1.5–6; edge cases | Constitution II–III |
| FR-007 | Ansvarlige skal kunne vedligeholde hestens egenskaber, individuelle grænser, aktivstatus og daterede utilgængelighed. Ændringer skal markere berørte fordelinger til ny kontrol. | US2.1–3 | K1, K5 |
| FR-008 | Systemet skal tilbyde ny kontrol og egnet omfordeling ved sygdom og vise tydelig mangel på erstatning, når ingen findes. | US2.2 | K5 |
| FR-009 | Ønsker skal registreres pr. elev, hold og måned med højst tre forskellige heste. | US3.1 | K1 |
| FR-010 | Systemet skal kunne foreslå en månedsfordeling på tværs af hold og datoer og håndtere dokumenterede partholdsaftaler uden at tilsidesætte sikkerhedsregler. | US3.2–3 | K1 |
| FR-011 | Den anvendte prioritering ved konkurrerende ønsker skal være synlig; ønsker må kun prioriteres blandt egnede og tilgængelige heste. | US3.4; US1.2 | Constitution I, III |
| FR-012 | Administratoren skal kunne vedligeholde hold, niveau, tidspunkter og daterede elevtilmeldinger med højst ti aktive elever pr. hold. | US4.1–2 | K1 |
| FR-013 | Administratoren skal kunne vedligeholde ventelister og registrere tilbud og tilmelding; afløser og lærer skal se samme gældende holdliste. | US4.2–3 | K1 |
| FR-014 | Administratoren skal kunne registrere medlems- og kontingentstatus for en periode. Automatisk betaling er ikke omfattet. | US4.4 | K1; antagelse A5 |
| FR-015 | Fremmøde skal kunne angives som til stede, fraværende eller ikke registreret for en konkret undervisning. | US5.1 | K1, K3 |
| FR-016 | Planlagt hestebrug og faktisk hestebrug skal bevares særskilt, også ved aflysning og erstatningshest. Faktiske regelbrud skal kunne registreres og fremgå som afvigelser. | US5.2; edge cases | Constitution II |
| FR-017 | Rettelser til fremmøde, tildeling, hesteoplysninger og faktisk brug skal kunne efterprøves med tidligere værdi, ny værdi, ansvarlig og tidspunkt. | US5.3; US1.5 | Constitution II |
| FR-018 | Velfærdsoversigten skal vise daglig og ugentlig belastning, fridage, afvigelser og manglende data uden at ligestille plan med dokumenteret faktisk overholdelse. | US6.1–2 | K1; constitution II |
| FR-019 | Daterede beskeder om heste, hold og prøvelektioner skal vises for relevante lærere og afløsere med afsender og tidspunkt. | US6.3 | K1, K5 |
| FR-020 | Adgang skal afgrænses efter opgave: administration håndterer medlems- og betalingsstatus; staldansvarlig håndterer hesteoplysninger; lærer og afløser ser kun nødvendige elevhensyn for deres hold. | US4.4; US6.4 | Constitution V; antagelse A4 |
| FR-021 | POC og demonstration skal bruge syntetiske elever og saglige, formålsbestemte hensyn; kildenavne, diagnoser og subjektive elevkarakteristikker må ikke kopieres til demonstrationsdata. | Gennemgang af alle demonstrationsdata | Constitution V |

### Key Entities *(include if feature involves data)*

- **Elev**: Identitet i systemet, relevante forudsætninger og nødvendige hensyn;
  demonstrationsidentiteter er syntetiske.
- **Hest**: Egnethed, temperament, individuelle belastningsgrænser, aktivstatus
  og perioder med utilgængelighed.
- **Hold og tilmelding**: Niveau, tidspunkter, lærer, elevplacering og gyldighedsperiode.
- **Undervisning/aktivitet**: Dato, tidsrum, aktivitetstype og status;
  også relevant kendt brug uden for almindelige hold.
- **Ønske**: En elevs op til tre heste for et bestemt hold og en bestemt måned.
- **Tildeling og fordelingsforslag**: Elev, hest, undervisning, begrundelse,
  konflikter, godkendelsesstatus og godkender.
- **Fremmøde og faktisk brug**: Elevens deltagelse og den faktisk brugte hest
  ved en konkret undervisning; adskilt fra planen.
- **Venteliste og medlemsstatus**: Ønsket hold, ventestatus, tilbud samt medlems-
  og kontingentstatus for en periode.
- **Besked og ændringshistorik**: Relevant emne, gyldighed, indhold, ansvarlig,
  tidspunkt og dokumentation af ændringer.

## Success Criteria *(mandatory)*

### Measurable Outcomes

Følgende er foreslåede acceptmål, ikke dokumenterede driftsgevinster.

- **SC-001**: På et syntetisk hold med ti elever skal hver elev få et begrundet
  match eller en konkret uløst-status; ingen elever må forsvinde fra resultatet.
- **SC-002**: I mindst ét afprøvningsscenarie for hver af sygdom, fjerde daglige
  hold, manglende fridag, anden ugentlige springning, individuel grænse,
  uegnet match og dobbelttildeling skal 100 % af de kendte konflikter identificeres
  og hindre godkendelse. Gyldige matches skal også kunne godkendes.
- **SC-003**: Mindst to gruppemedlemmer, som ikke har bygget forløbet, skal hver
  kunne gennemføre forslag, rettelse og godkendelse for et forberedt hold på
  højst fem minutter uden mundtlig hjælp. Resultater og problemer registreres.
- **SC-004**: Alle godkendelser og afprøvede rettelser skal vise ansvarlig og
  tidspunkt; ingen af de afprøvede historiske ændringer må gå tabt.
- **SC-005**: I afprøvningen af holdadministration skal lærer og administrator
  se samme elevplacering for alle afprøvede datoer, og det ellevte medlems optagelse
  på et fyldt hold skal afvises.
- **SC-006**: I afprøvningen af fremmøde og velfærd skal alle forberedte tilfælde
  af erstatningshest, manglende registrering og aflyst undervisning vises korrekt;
  ingen ufuldstændig uge må erklæres dokumenteret regeloverholdende.
- **SC-007**: Alle demonstrationspersoner skal være syntetiske, og alle afprøvede
  adgangsforsøg uden den nødvendige rolle og holdtilknytning skal afvises.

SC-001–004 og datadelen af SC-007 gælder den foreslåede første POC.
SC-005–006 og adgangskontrol i SC-007 gælder den bredere løsning og er ikke
allerede lovet som implementeret i POC'en.

## Assumptions

### Omfang og foreslået POC

- **A1 — Bred specifikation, lille POC**: Hele casens systembehov beskrives her.
  Første POC foreslås afgrænset til US1 for ét hold og én undervisningsdato med
  forberedt ugentlig belastning, syntetiske elever, heste og ønsker. Den viser
  forslag, begrundelser, rettelse, konflikter og godkendelse. US2–6 bygges ikke
  automatisk som del af denne POC. Gruppen bekræfter afgrænsningen i Clarify.
- **A2 — Ugebegreb og belastning**: Afprøvningen bruger mandag–søndag og konkrete
  undervisningsdatoer. Relevant kendt ridning, også ved hjælper og part, medregnes
  som én aktivitet i de demonstrerede holdgrænser. Dette er en konservativ
  afprøvningsantagelse, ikke en fagligt bekræftet definition af al ridning.
- **A3 — Konkurrerende ønsker**: Ønsker behandles som et sæt uden antaget rangering.
  POC'en lover ingen optimal eller historisk retfærdig fordeling. Den anvendte
  reproducerbare tie-break-regel skal dokumenteres i planen; sikkerhed prioriteres
  altid først. Rotation og længerevarende prioritering af uopfyldte ønsker skal
  afklares, før den fulde månedsfordeling planlægges.
- **A4 — Roller**: Rollefordelingen i FR-020 er et forslag. I POC'en kan lærerrollen
  og de øvrige roller være simulerede og skal da fremgå som simulerede. Det giver
  ikke grundlag for at anvende virkelige personoplysninger.
- **A5 — Administration**: Kontingentstatus registreres manuelt. Betalingsløsning,
  automatisk opkrævning, kommunal indberetning og eksterne integrationer er uden
  for denne specifikations leverance. Oversigter understøtter kontrol uden at
  love et ikke-oplyst officielt rapportformat.
- **A6 — Enheder og drift**: POC'en afprøves på gruppens computer med tilgængelige
  demonstrationsdata. Mobilbrug, offlinebrug og faktisk drift afklares særskilt.
  Forældreapp og fuldt hestemanagement er fremtidige udvidelser.

### Afhængigheder og afklaringspunkter

- En fagligt ansvarlig skal fastlægge hestenes konkrete match- og belastningsgrænser.
  Indtil da må POC'en kun anvende tydeligt mærkede syntetiske eksempelgrænser.
- Den fulde løsning kræver et dækkende billede af ugentlig brug, inklusive relevante
  aktiviteter uden for de viste hold. Bilagene giver ikke alene fuldstændige data.
- Gruppen skal ved Clarify bekræfte POC-omfang, ugebegreb, konkurrence mellem ønsker
  og rollefordeling eller justere de markerede antagelser.
- Brug af virkelige personoplysninger kræver særskilt afklaring af ansvar, adgang
  og opbevaring i overensstemmelse med constitution.

### Kilder og prioritet

- **K1**: `base-case-files/Casebeskrivelse, BPMN.pdf`, side 2–4. Primær kilde til
  formål, roller, holdtyper, højst ti elever, ønsker og fire velfærdsregler.
- **K2**: `base-case-files/Holdoversigt, uge.pdf`. Holdkontekst; varierende perioder
  og niveauer skal afklares før brug som gældende oplysninger.
- **K3**: `base-case-files/Afkrydsningslister.pdf`. Baggrund for fremmøderegistrering.
- **K4**: `base-case-files/fredagsheste jan-jun TIL CASE.pdf`. Baggrund for individuelle
  hensyn; ingen identificerende elevdata overføres til POC'en.
- **K5**: `base-case-files/Transkripering af domæne ekspert.md`. Supplerende kilde til
  manuel fordeling, matchhensyn, overlevering og lærerens kontrol af forslag.
- **Styrende grundlag**: `.specify/memory/constitution.md`, version 1.0.0.

K1 og K5 er læst ved udarbejdelsen. K2–K4 bruges her gennem den eksisterende
constitutions opsummering; detaljer skal efterprøves ved brug i senere arbejde.
Ved modstrid går casen forud for interviewet: undtagelsen med fire daglige hold
indføres ikke. Foreslåede løsningskrav og mål er gruppens arbejdsudkast,
ikke påstande om eksisterende praksis eller allerede målte resultater.
