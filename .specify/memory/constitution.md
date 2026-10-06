# Hestecase — Bøgegården Constitution

**Status: Vedtaget som gruppens fælles arbejdsgrundlag den 2026-10-06.**

Dette dokument beskriver de principper, som skal styre krav, planlægning, kode og
vurdering af løsningen. Det er ikke en detaljeret kravspecifikation.
“Materiale” er oplysninger fra kilderne. “Princip” og “Kontrol” er foreslåede
projektregler. Gruppens allerede oplyste valg er markeret særskilt.

## Core Principles

### I. Sikkerhed og hestevelfærd går forud for ønsker

**Materiale:** Casen fastlægger højst tre hold pr. hest pr. dag, en ugentlig fridag,
højst én springning pr. uge og ingen brug af syge eller skadede heste. Hestebilaget
beskriver individuelle begrænsninger i blandt andet aktivitet, temperament og
rytterbelastning. Interviewet fremhæver vægt, størrelse, balance og tryghed (K1, K4, K5).

**Princip:** Forslag og manuelle ændringer skal kontrolleres mod kendte sikkerheds-
og velfærdsbegrænsninger før godkendelse. En hest må ikke dobbelttildeles til samtidige
ryttere. Elevønsker må kun prioriteres blandt egnede og tilgængelige heste.
Den samlede planlagte brug på tværs af hold og ugedage skal indgå i kapacitetskontrollen.
Individuelle, lavere belastningsgrænser skal respekteres.

Matchgrundlaget skal omfatte relevante elevoplysninger om højde, vægt, alder,
erfaring/niveau, ønsker og konkrete hensyn samt hestens egnethed og tilgængelighed.
Alder eller højde må ikke alene bruges til at udlede rideevne eller tilladt belastning.
Talgrænser må ikke opfindes som casefakta. Manglende kritiske oplysninger eller mangel
på en egnet hest skal fremgå som uafklaret; et match må ikke fremtvinges.

**Hvorfor:** Et ønsket match er kun brugbart, hvis både hest og rytter kan gennemføre det.
**Kontrol:** Afprøv syg hest, fjerde daglige hold, manglende fridag, gentagen springning,
uønsket dobbelttildeling og en elev uden nogen egnet hest.

### II. Fælles, daterede oplysninger skal kunne efterprøves

**Materiale:** Holdniveauer og elevplaceringer varierer mellem bilagene. Interviewet
beskriver forskellige lister og mangelfuld overlevering (K1-K5).

**Princip:** Krav og data skal kunne spores til case, interview eller en markeret
antagelse. Modstridende oplysninger skal synliggøres og afklares før brug som fakta.
Relevante ændringer skal kunne knyttes til ansvarlig og tidspunkt. Planlagt hestebrug
skal skelnes fra faktisk gennemført brug; en plan dokumenterer ikke faktisk overholdelse.
Et tomt fremmødefelt må ikke automatisk fortolkes som fravær.

**Gruppens valg:** Interviewet handler om Bøgegården og supplerer casen. Ved modstrid
lægger projektet casen til grund og registrerer forskellen. Interviewets mulighed
for fire daglige hold ændrer derfor ikke casens grænse på tre.

**Hvorfor:** Fælles, sporbare oplysninger begrænser fejl og gør beslutninger forståelige.
**Kontrol:** Gennemgå centrale krav for kildehenvisning og markering af antagelser.

### III. Ridelæreren kontrollerer og godkender fordelingen

**Materiale:** Casen ønsker automatisk månedlig tildeling med hensyn til op til tre
ønsker. Interviewet præciserer ønsket om forslag, som instruktøren kan tjekke og rette
(K1, K5). Parthold og individuelle begrænsninger kan begrunde gentagne matches (K1, K4).

**Princip:** Digital matchning skal være beslutningsstøtte. Ridelæreren skal kunne
forstå begrundelsen, gennemgå og godkende en fordeling samt rette den inden brug.
En rettelse skal kontrolleres efter de samme regler som det oprindelige forslag.
Uopfyldte ønsker og uløste konflikter skal fremgå. Systemet må ikke skjule manglende
kapacitet ved at tilsidesætte sikkerhedsregler.

**Hvorfor:** Lærerens viden er nødvendig, mens den digitale kontrol kan mindske manuelt arbejde.
**Kontrol:** Gennemgå et forslag med konkurrerende ønsker og en manuel ændring,
som ville overskride en hests belastningsgrænse.

### IV. Arbejdsgange skal fungere under undervisningens tidspres

**Materiale:** Casen beskriver akutte ændringer, mangelfuld overlevering og ingen
pauser mellem hold. Interviewet nævner pauser; denne forskel er ikke afklaret (K1, K5).

**Princip:** Brugerfladen skal gøre relevante oplysninger, matchforslag og konflikter
forståelige for ridelærere og afløsere. Den valgte user story skal kunne gennemføres
som et sammenhængende forløb. Gruppen skal aftale målbare acceptkriterier, før den
vurderer brugervenlighed eller tidsbesparelse. Der må ikke loves driftsgevinster
alene på baggrund af en demonstration.

**Hvorfor:** En løsning skal hjælpe den person, der træffer beslutningen i praksis.
**Kontrol:** Lad en anden i gruppen gennemføre POC-forløbet efter acceptkriterierne.

### V. Registrér kun nødvendig og saglig viden om personer

**Materiale:** Casen advarer om personfølsom tavs viden. Bilaget omfatter børn og
individuelle hensyn. Undervisningen kræver anonymiserede eller syntetiske persondata
i delte projektmaterialer og prototyper (K1, K4, K6).

**Princip:** POC og demonstration skal bruge syntetiske persondata. Hvert personfelt
skal have et konkret formål, og adgangen til oplysninger skal afgrænses efter opgaven.
Sikkerhedsrelevante hensyn skal beskrives sagligt og kunne rettes. Diagnoser og
subjektive karakteristikker må ikke ukritisk kopieres fra bilagene.
Før eventuel brug af virkelige oplysninger skal ansvar, adgang og opbevaring afklares.
Interviewpersonens vurderinger af persondata må ikke behandles som juridisk godkendelse.

**Hvorfor:** Nødvendig matchviden kan beskrives uden at gengive identificerbare børns forhold.
**Kontrol:** Gennemgå POC-data og begrund hvert elevfelt, der anvendes.

### VI. Krav og acceptkriterier skal styre udviklingen

**Materiale:** Undervisningen bruger forløbet Constitution, Specify, Clarify, Plan,
Tasks, Implement og Converge. Gruppen skal kontrollere AI-output og tage beslutningerne
selv. User stories skal have acceptkriterier (K6, slide 48-54; K7, slide 3-7 og 10-18).

**Princip:** Gruppen skal gennemgå krav og åbne spørgsmål, før de bruges som grundlag
for en teknisk plan. Planen skal styre opgaverne; opgaverne skal kunne føres tilbage
til user stories og acceptkriterier. Kode skal kontrolleres mod de aftalte kriterier,
herunder relevante fejl- og undtagelsessituationer.
AI-genererede beslutninger og påstande skal efterprøves. Uafklarede forretningsregler
skal forelægges gruppen eller markeres som antagelser og må ikke skjules i koden.
Ved evaluering skal mangler registreres som opfølgende opgaver.

**Hvorfor:** Sammenhæng mellem krav, plan og resultat gør løsningen vurderbar.
**Kontrol:** Følg en udvalgt user story fra kilde og krav til kode og testresultat.

### VII. Afgræns piloten og muliggør senere udvidelser

**Materiale:** Modul 1 kræver specifikation af hele casen. Modul 2 kræver planlægning,
en lille kodet, klikbar POC for én valgt user story og efterfølgende evaluering.
Python er angivet som dagens teknologivalg (K6, slide 51-52; K7, slide 4-7).
Casen efterspørger mulighed for senere udvidelser (K1, s. 4).

**Gruppens valg:** POC-fokus er matchning mellem heste og elever ud fra elevens
forudsætninger og ønsker, uden at hestens begrænsninger overskrides.

**Princip:** Den bredere specifikation skal holdes adskilt fra den user story, som
faktisk implementeres. POC'en skal være lille nok til at bygge og afprøve og må ikke
automatisk udvides til hele systemet. Den tekniske plan skal tage udgangspunkt i
undervisningens Python-ramme; et eventuelt afvigende valg skal afklares med underviseren.
Matchregler og data skal holdes adskilt fra præsentationen, så de kan ændres og testes.
Simulerede data og funktioner skal fremgå tydeligt.

**Hvorfor:** Et afgrænset, afprøvet forløb giver et konkret grundlag for læring og evaluering.
**Kontrol:** Angiv præcist, hvad POC'en demonstrerer, simulerer og ikke omfatter.

## Projektets ramme og kilder

Dette dokument vedrører **systemudvikling**. BPMN, SIPOC, gapanalyse og digital
modenhed hører i projektet til **forretningsdesign** og bruges som baggrund for krav.
De erstatter ikke specifikation, teknisk plan, opgaveliste, kode og evaluering.

POC-fokus er valgt, men en præcis user story med acceptkriterier skal stadig afgrænses.
Fremmøde, kontingentbetaling, ventelister og en forældreapp er ikke automatisk del af
matchnings-POC'en. Nødvendige oplysninger om hold, aktiviteter og ugentlig hestebrug
skal dog være til rådighed, hvis de indgår i de regler, som POC'en demonstrerer.
En fuld automatisk månedsfordeling er ikke allerede besluttet som POC-omfang.

Kilder, som er læst i projektarbejdet (sidenumre inkluderer forsider):

- **K1:** `base-case-files/Casebeskrivelse, BPMN.pdf`, s. 2-4.
- **K2:** `base-case-files/Holdoversigt, uge.pdf`, s. 1.
- **K3:** `base-case-files/Afkrydsningslister.pdf`, s. 1-2.
- **K4:** `base-case-files/fredagsheste jan-jun TIL CASE.pdf`, s. 1-5.
- **K5:** `base-case-files/Transkripering af domæne ekspert.md`.
- **K6:** `slides-fra-undervisningen/ITA systeudvikling AI og case.pdf`, især slide 48-54.
- **K7:** `slides-fra-undervisningen/ITA systemudvikling spec driven II E2026.pdf`,
  især slide 4-7 og 10-18.
- **K8:** `base-case-files/Heste Case SIPOC.pdf`, supplerende procesoverblik fra gruppen.

## Udviklingsproces og kvalitetskontrol

Arbejdet følger Constitution → Specify → Clarify → Plan → Tasks → Implement → Converge.
Hvert trin skal bruge den gældende constitution og de foregående projektartefakter.

- Før teknisk planlægning skal den valgte user story have acceptkriterier, og kritiske
  åbne spørgsmål skal være afklaret eller dækket af tydeligt markerede antagelser.
- Før implementering skal opgaverne kunne spores til krav og plan. Teknologivalg og
  eventuelle afvigelser fra undervisningens ramme skal begrundes i planen.
- Matchlogik skal afprøves med både gyldige matches og brud på de sikkerhedsregler,
  som den valgte POC omfatter. Resultaterne skal dokumenteres; en vellykket
  demonstration alene dokumenterer ikke, at reglerne virker i fejltilfælde.
- Ændringer deles i GitHub via branches og pull requests. Før en pull request flettes
  til `main`, skal mindst ét andet gruppemedlem gennemgå ændringen mod krav og
  relevante principper. Kendte mangler og afvigelser skal fremgå af reviewet.
- Ved evaluering skal implementeret, simuleret og manglende funktionalitet skelnes.
  Mangler registreres som opgaver med henvisning til det berørte acceptkriterium.

Gruppen skal gennemgå principperne og registrere de ændringer, den beslutter.
Nedenstående spørgsmål skal besvares i den kommende afklaring eller erstattes af
udtrykkeligt markerede, afgrænsede antagelser. De er ikke allerede besluttet:

- **TODO(MATCHREGLER):** Hvem fastlægger konkrete grænser for vægt, størrelse,
  niveau og belastning for hver hest? Hvilke elevhensyn skal kunne blokere et match?
  Hvordan defineres uge, fridag og brug ved parter og hjælperridning?
- **TODO(FORDELING):** Hvordan prioriteres konkurrerende ønsker, tidligere tildelinger,
  parter og elevudvikling? Hvad gør læreren, når ingen egnet hest er tilgængelig?
- **TODO(DATA):** Hvilke bilag og perioder gælder? Holdniveauer og elevplaceringer
  varierer; der forekommer dobbelttildelinger samt tomme felter og streger med ukendt
  betydning. Der mangler fuldstændige ugentlige hestetildelinger og præcise matchgrænser.
- **TODO(POC):** Hvilken enkelt user story bygges, og hvilke målbare acceptkriterier
  skal den opfylde? Hvilke regler demonstreres med syntetiske data?
- **TODO(PRAKTIK):** Hvilke enheder og netforhold forudsættes? Hvem vedligeholder
  hesteoplysninger, og hvilke brugere må se og ændre hvilke data?

## Governance

Gruppens vedtagelse er bekræftet af brugeren den 2026-10-06. Denne version er
projektets første vedtagne constitution.

Efter vedtagelse er principperne fælles ramme for specifikation,
plan og implementering. Ved modstrid skal dokumenterne afstemmes og beslutningen
registreres. Ændringer skal foreslås i en pull request, beskrive begrundelse og konsekvenser
og godkendes af gruppen. Berørte krav, planer og opgaver skal derefter afstemmes.
Ved hver overgang i Spec Kit-forløbet kontrollerer gruppen princippernes overholdelse.

Versionspolitik: Første vedtagne version bliver 1.0.0. Derefter ændres hovedversionen
ved uforenelige ændringer eller fjernelse af principper, minorversionen ved tilføjelser
og væsentlige udvidelser og patchversionen ved sproglige præciseringer.
Version 1.0.0 fastlægger de principper og den udviklingsproces, som gruppen har vedtaget.

**Version**: 1.0.0 | **Ratified**: 2026-10-06 | **Last Amended**: 2026-10-06
