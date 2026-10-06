# Hestebilleder i mockuppen

Tre realistiske, genererede portrætter (brun hest, rød pony og grå hest) deles
mellem hestekortene. De er illustrerende mockups, ikke dokumentation for farve
eller udseende af casens heste. Dette står på hestelisten, ønskevisningen og i
detaljevisningen. Billederne er visuelt gennemgået og gemt lokalt som JPEG,
960 pixels brede, så appen ikke er afhængig af eksterne billedtjenester.

Filer: `client/public/images/horses/`. `horses.image_path` og `horses.image_kind`
gemmer billedreference og oprindelsestype på den enkelte skoleafgrænsede hest.
Seed udfylder kun tomme billedreferencer på de to demoskoler og erstatter ikke
allerede gemte fotos. Nye registreringer uden billede bruger en illustration.
