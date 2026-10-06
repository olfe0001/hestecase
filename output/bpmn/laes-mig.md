# Bøgegården: BPMN AS-IS til gruppens gennemgang

Udkast, 2026-10-02. Forenklet til to baner i begge diagrammer: **Ridelærere** og **Elever**.
Blå markerer ridelærere, grøn elever og gul beslutninger. Farverne er også gemt i
BPMN-filerne som bpmn.io-farveattributter. Uddybende noter er flyttet fra tegningen
til dette dokument og elementernes dokumentation for at gøre diagrammerne lettere at læse.
 Modellerne beskriver den nuværende manuelle drift.
De er ikke en TO-BE-løsning eller færdige, vedtagne procesbeskrivelser.

## Åbn i Camunda Modeler

Åbn de to `.bpmn`-filer hver for sig med **File > Open File** i Camunda Desktop
Modeler. SVG-filerne er visuelle forhåndsvisninger med samme placeringer og forbindelser.
BPMN-filerne indeholder diagramlayout (BPMN DI) og kan redigeres videre.

Processerne er beskrivende BPMN 2.0 med `isExecutable="false"`. De er beregnet til
analyse og præsentation, ikke deployment til en Camunda-motor. Generiske opgaver
bruges, fordi materialet blander håndarbejde, papir, telefon og computer.

**Validering:** XML kan indlæses; ID'er er unikke; referencer og diagramreferencer
findes; alle aktiviteter kan nås fra start og føre til slut; beslutningspunkterne
har navngivne udgange. Filerne er ikke importtestet i Camunda Modeler i denne session.
SVG-forhåndsvisningerne er genereret fra samme geometri, men ikke visuelt render-testet.

## To frekvenser i samme SIPOC

SIPOC'ens første fire trin vedrører månedlig planlægning. De sidste tre vedrører
undervisningen, der gentages for hvert hold. En enkelt ubrudt sekvens ville skjule
den forskel. Månedsprocessens output, den fysiske liste, er input til dagsprocessen.
Det er en dataafhængighed mellem processerne, ikke en sekvenspil mellem to pools.

| SIPOC-trin | BPMN-fil | Aktivitet |
|---|---|---|
| Indsamling af hesteønsker | 01 | Indsaml og notér hesteønsker |
| Tjek hestens tilgængelighed | 01 | Tjek tilgængelighed og belastning |
| Match og fordel heste | 01 | Match og fordel heste manuelt |
| Opdater holdlister | 01 | Print og opdater hold- og afkrydsningslister |
| Gør heste klar | 02 | Gør hesten klar med hjælp efter behov |
| Afvikl undervisning | 02 | Afvikl undervisning |
| Registrer fremmøde | 02 | Registrér fremmøde på afkrydsningsliste |

Processen i fil 01 dækker lærerens fordeling til den kommende måned. Fil 02 dækker
ét hold og anvendes igen for næste hold. Mødetidspunktet 30 minutter før første hold
gælder dagens første forberedelse, ikke en ekstra halv time før hvert hold.
Oprydning efter sidste hold ligger uden for SIPOC'ens valgte slutpunkt.

## Kilder og kildeprioritet

- `base-case-files/Heste Case SIPOC.pdf`, side 1: alle syv udfyldte procestrin,
  interessenter, input, output og problemnoter. Det er den lokale PDF-eksport;
  Figma-originalen er ikke tilgået direkte.
- `base-case-files/Casebeskrivelse, BPMN.pdf`, side 2-4: roller, regler, månedsskift,
  klargøring, papirbaseret administration og manglende overlevering.
- `base-case-files/Transkripering af domæne ekspert.md`: telefonnoter,
  antal-gange-lister, print og gul pen samt akut manuel omfordeling.
- `base-case-files/Afkrydsningslister.pdf`: registreringsskemaets udformning.
- `base-case-files/Holdoversigt, uge.pdf` og `fredagsheste jan-jun TIL CASE.pdf`:
  holdkontekst, fordeling og tavs viden. Ingen elevnavne eller diagnoser er kopieret.

Som aftalt supplerer interviewet casen. Casens maksimalt tre hold om dagen er
fastholdt. Interviewets undtagelse med fire hold er ikke indført. Diagrammerne
angiver ingen pausevarighed, da kilderne er uenige om pauser mellem holdene.

## Antagelser, som gruppen skal gennemgå

**A1 — Kontrol og omarbejde:** Månedlig fordeling indeholder et eksplicit spørgsmål
om opdagede konflikter og en løkke tilbage til kontrol. Kilderne beskriver manuel
vurdering og fejl, men ikke en fast kontrolprocedure. Kontrolpunktet er derfor
modellering af en sandsynlig arbejdsgang, ikke dokumenteret kvalitetssikring.
En konflikt, som ikke opdages, kan fortsætte til listen. Praksis ved en konflikt,
som ikke kan løses, mangler og skal undersøges.

**A2 — Akut ændring:** Interviewet beskriver omfordeling ved sygdom. Samlet læsning
af beskeder før klargøring og rettelse af dagens liste er modelleringsantagelser.
Den viste gren forudsætter en egnet erstatningshest. Aflysning, udsættelse eller anden
håndtering ved mangel på en erstatning er ikke fastlagt af materialet.

**A3 — Klargøring:** Elevernes opgave omfatter klargøring, med støtte fra forældre
og staldhjælpere efter behov som beskrevet i casen. Støtterollerne har ikke egne
baner i denne forenklede model. Undervisningsopgaven i lærerbanen omfatter elevernes
samtidige deltagelse; elevdeltagelse modelleres ikke som en efterfølgende aktivitet.

**A4 — Fremmødets tidspunkt:** Placering efter undervisning følger SIPOC. Bekræft,
om registrering reelt sker før, under eller efter timen. Modellen siger ikke, at
kontorets medlemsliste automatisk ajourføres, når læreren skriver på sit skema.

## Afgrænsning af roller og resultater

- Begge diagrammer har én fælles procespool med præcis to baner: Ridelærere og Elever.
- Elevbanen viser aflevering af ønsker i månedsprocessen og klargøring i dagsprocessen.
- Ridelærerbanen omfatter også en eventuel afløser.
- Alle forbindelser mellem aktiviteter er sekvensflow, også når de krydser banerne.
  Den tidligere eksterne elevpool og beskedflow er fjernet.
- Farver viser roller og beslutninger, ikke SIPOC'ens vurdering af værdiskabelse.
- Malene/administration indgår som kilde/modtager i SIPOC, men materialet beskriver
  ikke en sikker, sammenhængende administrationsproces. En sådan proces er ikke opfundet.
- Kommunen er interessent i dokumentation. Der er ikke indsat et rapporteringstrin,
  fordi format, tidspunkt og faktisk afleveringsproces ikke er beskrevet.
- “Godkendt hestefordeling”, “korrekt holdplacering” og “opdateret medlemsliste” er
  ønskede SIPOC-resultater. AS-IS-materialet dokumenterer ikke, at de altid opnås.
  Modellerne bruger derfor lokale lister som output og indfører ingen formel godkender.
- SIPOC-farverne viser jeres vurdering af værdiskabelse/spild. De er ikke BPMN-semantik
  og er ikke overført. Holdlisteopdatering er bevaret, selv om den står som rød i SIPOC.

## Spørgsmål til review

1. Er konfliktkontrollen et faktisk, særskilt trin, eller sker den løbende under fordelingen?
2. Hvad sker der konkret, når der ikke findes en egnet hest ved månedlig eller akut fordeling?
3. Hvornår registreres fremmøde, og hvordan får kontoret faktisk besked?
4. Passer opdelingen af klargøring mellem hjælper, elev og forælder til jeres observationer?

Notationsreference: [Camundas BPMN-primer](https://docs.camunda.io/docs/components/modeler/bpmn/bpmn-primer/).
