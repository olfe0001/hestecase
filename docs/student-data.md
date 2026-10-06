# Elevnavne fra casen

`data/students.json` indeholder alle 34 elevnavne fra side 1–2 i
`base-case-files/fredagsheste jan-jun TIL CASE.pdf` samt hold og starttidspunkter:

- Hold 1, begynder: 7 elever, fredag 15:00.
- Hold 2, letøvet: 9 elever, fredag 15:45.
- Hold 3, øvet: 10 elever, fredag 16:30.
- Hold 4, letøvet: 8 elever, fredag 17:15.

Navnenes stavemåde bevares, herunder Freja/Freya, Sofia/Sophia og Victoria/Viktoria.
Hvert hold varer 45 minutter. Anne er fortsat en demonstrationslærer;
PDF'en angiver ikke denne lærerfordeling. Det ekstra torsdagsspringhold er
markeret som demo og kommer ikke fra elevlisten.

Importen sker én gang ved serverstart, både i en eksisterende database og ved
ny installation. Eksisterende interne profil-id'er bevares, så gemte ønsker,
fordelinger og sessions stadig fungerer. Derfor kan et teknisk id indeholde et
gammelt demonavn; brugerfladen viser navnet fra casen. Importen nulstiller
fordelinger til kladder, fordi nye holdmedlemmer kræver lærerens gennemgang.

Vægt, højde, individuelle niveauer, behov, ønsker og ventetid er fortsat
demonstrationsdata. Casens tidligere hestetildelinger er ikke dokumentation for
urangerede ønsker eller sammenhængende ventetid og importeres ikke som sådan.
Nye elevprofiler får ingen opdigtede ønsker og har manglende ventetidshistorik.
Enghøj er en separat syntetisk rideskole og beholder sin demonstrationsprofil.

Elever kan ændre deres funktionelle hensyn under Min profil. Oplysningerne gemmes
i den normaliserede student_needs-relation, vises hos læreren og sætter elevens
holds fordelinger tilbage til kladde. Andre elevers profiler kan ikke ændres.
