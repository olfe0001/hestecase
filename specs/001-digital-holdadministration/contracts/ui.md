# UI Contract: lærer- og elevflow

Dansk brugerflade med roligt grønt/neutralt udtryk, tydelige labels og luft.
Fejl forklares med tekst; tilstande må ikke kun afhænge af farve.

## Adgang og navigation

Vælg rideskole, rolle og profil uden kode. Log ud er tilgængelig i navigationen.
Lærer: Overblik, Fordeling, Mine elever, Heste.
Elev: Mit overblik, Ønsk heste, Heste, Min profil.
Mobil bruger en menu, som kan åbnes og lukkes; siderne har ikke vandret sideoverløb.

## Ridelærer — US1/US2/US4/US8

Overblik → Fordeling → vælg hold → se elevernes hensyn og urangerede ønsker →
Lav forslag → afklar konflikter med begrundelse/ret hest → Gem rettelser → Godkend.
Kladden og godkendelsen har tydelig status; usikre og ufuldstændige valg afvises.

Mine elever viser lærerens elever, hold og forudsætninger. Heste giver søgning,
tilgængelighedsfilter, detaljevisning og Tilføj hest. Eksisterende hestes
brugerflade tilbyder tilgængelighed med begrundelse; generel redigering af alle
hestefelter er ikke en brugerfunktion, selv om API'et understøtter flere felter.

## Elev — US7/US9/US8

Mit overblik viser egne hold, godkendt hest og hensyn. Kladdetildeling vises som
Afventer godkendelse. Redigér hensyn åbner Min profil.

Ønsk heste: vælg eget hold → vælg/fjern nul til tre heste → Gem mine ønsker.
Valgene er ligeværdige; demonstrationsmåneden er oktober 2026.
Min profil: se eksisterende hensyn → tilføj/fjern valg → Gem mine hensyn.
Gemning bevares og vises hos læreren; en ændring kræver ny gennemgang af egne hold.
Eleven ændrer ikke kropsmål eller fagligt rytterniveau via denne formular.

## Billeder og tilstande

Hestekort og detaljer har tre delte realistiske mockupmotiver. En kort tekst angiver,
at de ikke viser den faktiske hest. Manglende/fejlet billede får en illustration.

Loading, tomme lister, fejl, gemt-status og uløste konflikter vises konkret.
Desktop/mobilkontrol er dokumenteret i docs/verification.md; ingen tidsbesparelse
eller brugerevaluering fremstilles som målt alene ud fra browserkontrollen.
