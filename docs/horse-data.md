# Hestedata og sikkerhedsregler

`data/horses.json` indeholder de 19 heste fra side 3 i `base-case-files/fredagsheste jan-jun TIL CASE.pdf`. Navne, højder, beskrivelser og særlige hensyn stammer fra casens tavse viden. De 34 elevnavne og deres fire fredagshold er efterfølgende indlæst fra side 1–2 i samme PDF, se `docs/student-data.md`. Individuelle elevoplysninger er demonstrationsdata. Try Me optræder i fordelingshistorikken, men har ingen hesteprofil på side 3 og er derfor ikke oprettet med opdigtede egenskaber.

## Faktiske forhold

- Bølle, Wally og Aida må ikke springe.
- Arthur er ikke til øvet hold og må gå maksimalt ét springhold. Kilden angiver ikke, om grænsen er daglig eller ugentlig; POC bruger konservativt ét ugentligt springhold og kræver lokal bekræftelse.
- Missy sparker andre heste ved utilstrækkelig afstand og bør ikke bære tunge ryttere. Wally må kun have lette ryttere. Der findes ingen numeriske vægtgrænser i materialet.
- Boy og Pixie beskrives som vanskelige ved rideangst; Freya som uegnet til nervøse ryttere. Cornelius er meget frisk og kan være vanskelig at styre.
- Boy er vanskelig i skoven, og Oline er meget nervøs i skoven. Det er en vurderingsregel, ikke et udtrykkeligt generelt forbud.
- Donny, Rosa og Aida kræver hjælp eller særlig vurdering ved klargøring på grund af vorter. Bølle mangler et øje og er vanskelig at klargøre. Rosa kræver blid, bestemt styring. Aida kan smide børn af.

## Demonstrationsvalg, der skal kunne ændres

Feltet `syntheticFields` markerer felter, der er fortolkninger eller demonstrationsværdier. `kind` er afledt af højden med ponygrænse 148 cm. `minRiderLevel` er en forsigtig POC-kategorisering (0 trækhold, 1 begynder, 2 letøvet, 3 øvet), ikke en certificeret egnethedsvurdering. Den erstatter ikke særlige sikkerhedshensyn, og Arthur skal særskilt udelukkes på øvede hold via `no-advanced`.

Alle heste starter som tilgængelige, med søndag som illustrativ hviledag. Det er ikke oplysninger om hestenes aktuelle helbred eller rideskolens virkelige kalender. Ugentlig springgrænse sættes konservativt til 1, eller 0 ved udtrykkeligt springforbud. Dressur og skovridning er generelle demonstrationsaktiviteter; særlige forbehold skal stadig vurderes.

`Transkripering af domæne ekspert.md`, afsnittet Hestevelfærd, angiver højst tre lektioner pr. dag og to for ældre heste; undtagelsesvist fire for en stærk hest. Alder og individuel kapacitet er ikke oplyst i hesteprofilerne. POC bruger tre som standard og skal tillade lærerens lavere individuelle grænse. Undtagelsen fire er ikke implementeret. `maxRiderWeightKg` er null i kildefilen, fordi kilden ikke giver numeriske bæregrænser. Serverens seed tilføjer illustrerende grænser på 35–80 kg, baseret på størrelse og kvalitative hensyn. Disse markeres i `syntheticFields` og i brugerfladen som demoværdier; de kræver rideskolens egen vurdering. Manglende data må ikke fremstilles som en bestået vægtkontrol.

## Brug ved registrering og fordeling

Registreringen skal gøre lærerens tavse viden synlig før et match: temperament, håndtering, aktivitetsbegrænsninger, kapacitet, tilgængelighed og konkrete behov. Elevens funktionelle behov (for eksempel rolig hest, ekstra balancehjælp eller blid styring) er relevante; kliniske diagnoser er ikke nødvendige til demonstrationen.

Hestevelfærd og sikkerhed kontrolleres før ønsker og ventetid. Et kendt springforbud, utilgængelighed, overbelastning, dobbeltbooking eller kendt uegnethed må ikke overstyres af elevens ønske. Manglende vægtgrænser og kvalitative størrelseshensyn skal vises som udestående lærervurdering. Ved samme ventetid træffer læreren valget. Kun læreren godkender den endelige fordeling.

## Flere rideskoler og vedligeholdelse

Heste-id'er i JSON er lokale seed-id'er, ikke globale identiteter. Ved import forbindes hver hest med en rideskole, og alle forespørgsler afgrænses af rideskolens id. Kildehenvisning og syntetiske felter bør bevares, så importerede oplysninger kan valideres og senere erstattes af rideskolens egne registreringer. Normaliser aktivitets- og behovstabeller samt relationer i databasen frem for at gøre casens hestenavne eller regelsæt til hårdkodede globale sandheder.
