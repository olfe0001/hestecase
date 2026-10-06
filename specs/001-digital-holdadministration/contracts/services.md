# API Contract: Stald

JSON under `/api`. HTTP-only SameSite=Lax-session baseret på valgt demoprofil.
Navne til profilvalget er offentlige demonstrationsoplysninger; login er ikke
verificeret identitet. Fejl returnerer `{message, conflicts?, revision?}` og HTTP-status.

| Endpoint | Rolle | Indhold/formål |
| --- | --- | --- |
| GET /health | Offentlig | App/database-status |
| GET /bootstrap | Offentlig | Skoler og profiler til kodefrit profilvalg |
| POST /session | Offentlig | `{profileId}`; sæt persistent demosession |
| GET /session | Session | Profil, rolle og rideskole |
| DELETE /session | Session | Logout |
| GET /dashboard | Session | Rolleafgrænsede hold, elever, heste, ønsker, historik og studentNeedOptions |
| PUT /profile/needs | Elev | `{needCodes}`; erstat egne hensyn med gyldige, forskellige koder |
| PUT /wishes | Elev | `{groupId,month,horseIds}`; nul til tre ønsker i demonstrationsmåneden |
| POST /distributions/propose | Lærer | `{groupId}`; gem forslag med konflikter og revision |
| PUT /distributions/:groupId | Lærer | `{revision,assignments,decisions}`; gem kontrolleret rettelse og begrundede valg |
| POST /distributions/:groupId/approve | Lærer | `{revision,operationId}`; atomisk godkendelse, operationId bruges til idempotens |
| POST /horses | Lærer | Registrér egenskaber, aktiviteter, behov og grænser på egen skole |
| PATCH /horses/:id | Lærer | API opdaterer hestefelter; brugerfladen tilbyder ændring af tilgængelighed |

Læreren fordeler kun egne hold og ser elever på egne hold. Eleven ser egne
personoplysninger i dashboard og kan kun ændre egne ønsker/hensyn. Skoletilhør
kommer fra sessionen og valideres også i databaserelationer.

Forældet fordelingsrevision giver 409; ugyldigt/usikkert match giver 422;
rolle-/holdoverskridelse giver 403. Uafklarede prioriteringer eller manglende elever
hindrer godkendelse. Sikkerhed kan ikke overstyres med en prioriteringsbeslutning.

Ønske- og hesteændringer gør skolens fordelinger til kladder. Profilhensyn ændrer
kun egne holds revision/status. Uændrede profilhensyn er en no-op. Ændringer og
godkendelser gemmes med audit; fordelingsmutationer har historiske snapshots.
Endpointet til profilhensyn accepterer ingen anden elevs id eller frie behovskoder.

Der er ingen endpoints til betaling, fremmøde, månedsafslutning, medlemsadministration
eller foto-upload i denne leverance. Kontrakten følger de aktive krav i spec.md.
