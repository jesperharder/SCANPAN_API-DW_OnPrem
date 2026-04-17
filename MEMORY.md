# Workspace Memory

## Formaal
- Husk vaesentlige beslutninger, arbejdsmønstre og faldgruber for `SCANPAN API-DW OnPrem`.
- Opdater denne fil loebende, naar der træffes nye vigtige beslutninger.

## Arbejdsomraader
- AL API-kode ligger i `src/`.
- SQL databaseprojektet ligger ikke i dette workspace, men i:
  `..\\SQL scripts\\BusinessAnalyticsDB2\\DatabaseProjectBusinessAnalyticsAI\\`
- SQL schema for BC API staging i databaseprojektet er `[stg_bc_api]`.

## Vigtige regler fra denne opgave
- Brug ikke `dbo` som standard for nye staging-tabeller til BC API.
- Match altid eksisterende mønstre i databaseprojektet foer nye SQL-filer laves.
- Relevante SQL-tabeller skal oprettes i databaseprojektet under:
  `..\\SQL scripts\\BusinessAnalyticsDB2\\DatabaseProjectBusinessAnalyticsAI\\stg_bc_api\\`
- Nye `stg_bc_api`-tabeller foelger normalt dette mønster:
  - `CompanyId` er med i noeglen
  - pipelinefelter er med:
    - `PipelineName`
    - `PipelineRunId`
    - `PipelineTriggerTime`
  - schema er `[stg_bc_api]`

## SalesLine specifikt
- `page 50262 "SalesLineAPI"` er udvidet markant og skal indeholde:
  - alle antal-felter
  - alle beloebsfelter
  - `Drop Shipment`
  - centrale reference-, dato-, dimensions- og auditfelter
- SQL-tabellen for denne API er:
  `[stg_bc_api].[SalesLine]`
- Naturlig SQL-noegle for `SalesLine` er:
  - `CompanyId`
  - `documentType`
  - `documentTypeInt`
  - `documentNo`
  - `lineNo`

## Samarbejdsnote
- Hold altid fokus paa det rigtige arbejdsomraade.
- Hvis brugeren henviser til databaseprojektet, saa arbejd i databaseprojektets filer og ikke i en lokal placeholder i API-projektet.

## Perfion API
- `page 50211 "PerfionItemsAPI"` er en `PageType = API`-side med route baseret paa:
  - `APIPublisher = 'harder'`
  - `APIGroup = 'perfion'`
  - `APIVersion = 'v1.0'`
  - `EntitySetName = 'perfionItems'`
- Test den via custom API-endpoint under `.../api/harder/perfion/v1.0/...` og ikke som klassisk `ODataV4` web service fra Web Services-siden.
- Relevante integrationstilladelser findes i permission set `PERFION API READ`.
- Klassisk `ODataV4` for Perfion Items koerer nu via `page 50226 "PerfionItemsOData"` med service-navnet `PerfionItemsDW`.
- `DW WS Registrar` rydder gammel publicering for `page 50211` og publicerer `PerfionItemsDW` paa `page 50226`.
- Klassisk `ODataV4` for Perfion Prices koerer nu via `page 50228 "PerfionPricesOData"` med service-navnet `PerfionPricesDW`.
- `page 50225 "PerfionPricesAPI"` er beholdt som custom API under `/api/harder/perfion/v1.0/perfionPrices`.

## Lager til eCommerce
- I dette workspace er eksisterende OData-moennster en almindelig `List`-side publiceret som web service, ikke en `PageType = API`-side.
- `page 50228 "PerfionPricesOData"` viser et relevant moenster for OData-udtraek med `SourceTableTemporary = true` og opbygning af et curated datasæt i `OnOpenPage`.
- `page 50234 "ItemLedgerEntryAPI"` viser, at repoet allerede eksponerer de centrale poster for fysisk lager, herunder `Quantity`, `Remaining Quantity`, `Reserved Quantity`, `Open`, `Location Code` og `Variant Code`.
- Til eCommerce boer `stock-at-hand` og `stock-available` behandles som to forskellige begreber:
  - `stock-at-hand`: fysisk lager nu baseret paa postede lagerposter.
  - `stock-available`: salgbart lager nu efter fradrag af reservationer/forpligtelser.
- Hvis man senere vil vise forventet fremtidig disponibel beholdning, boer det vaere et separat felt eller endpoint og ikke blandes sammen med "available now".
- Aktuel forretningsafgraensning: lager for eCommerce skal beregnes kun for lokation `AUNING`.
- Lokale Base App-symboler (BC 18.18) bekraefter relevante standardobjekter:
  - `codeunit 5790 "Available to Promise"` med standardmetoder til `CalcAvailableInventory`, `CalcGrossRequirement`, `CalcReservedRequirement`, `CalcScheduledReceipt` og `QtyAvailabletoPromise`.
  - `codeunit 5530 "Calc. Item Availability"` til opbygning af `Inventory Event Buffer` ud fra supply/demand.
  - `codeunit 7314 "Warehouse Availability Mgt."` med `CalcInvtAvailQty`, som tager hoejde for warehouse-styring paa lokationer uden directed put-away and pick.
  - Standard schedulering sker via Job Queue; `table 472 "Job Queue Entry"` kan koere `Codeunit`-objekter via `codeunit 449 "Job Queue Start Codeunit"`.
- Objekt-governance i dette repo skal behandles paa to niveauer:
  - app-range: `50042-50050` og `50200-50299`
  - type-specifik praktisk allocation:
    - `page`: `50200-50290`
    - nye API-codeunits: `50042-50050`
    - historiske eksisterende codeunits i repoet ligger stadig i `50200`, `50291`, `50292`
    - `table`, `tableextension`, `permissionset`: brug ledige slots i den lave del af rangen efter opslag i central inventory
- Undgaa at placere nye codeunits i page-bandet. Brug `50042-50050` til nye API-codeunits, medmindre governance bevidst aendres.
- Implementeret model i dette repo:
  - `tableextension 50231 "DW Item Auning Stock"` tilfoejer felterne `AUNING Stock On Hand`, `AUNING Stock Available` og `AUNING Stock Updated At` paa `Item`.
  - `codeunit 50042 "Auning Stock Update"` er job queue-egnet (`TableNo = "Job Queue Entry"`) og opdaterer felterne for alle inventory-items.
  - Beregningen bruger standard `Warehouse Availability Mgt.` for disponibelt lager og summerer baade blank variant og opsatte item-varianter.
  - `page 50233 "AuningStockOData"` er den klassiske OData-side, publiceret som service-navn `AuningStockDW`, og eksponerer `auningStockOnHand`, `auningStockAvailable` og `auningStockUpdatedAt`.
  - `page 50237 "AuningStockFactBox"` viser snapshotfelterne i sidebjælken som `CardPart`.
  - `pageextension 50232 "DW Item Card Auning Stock"` indsætter FactBox'en paa `Item Card`.
  - `permissionset 50231 "AUNING STOCK READ"` giver laeseadgang til OData-siden og `Item`-data.
  - OData-siden er aktuelt afgraenset til `Gen. Prod. Posting Group` = `INTERN|EKSTERN|BRUND`.
  - Job Queue-parameter til codeunit `50042` kan styre samme filter via:
    - `GenProdPostingGroupFilter=INTERN|EKSTERN|BRUND`
    - `AvailableReductionPct=<decimal>`
  - Hvis parameteren udelades, bruges standardfilteret `INTERN|EKSTERN|BRUND`.
  - Snapshotfelter og OData-felter rundes ned til hele tal, og negative vaerdier clamps til `0`.
  - AL-koden holdes paa engelsk for tekniske objekt-, felt-, parameter- og OData-navne; eventuelle lokale brugeroversaettelser haandteres via translationsfiler uden for koden.
- Samlet system- og driftsbeskrivelse for de tre operationelle integrationssider ligger i:
  - `docs\IntegrationEndpoints.md`
  - laesevenlig HTML/PDF distributionsversion ligger i:
    - `docs\IntegrationEndpoints.Readable.html`
    - `docs\IntegrationEndpoints.pdf`
- Komplet kolonneopdelt feltoversigt for de tre operationelle endpoints ligger i:
  - `docs\PerfionAuningFieldOverview.md`
  - `docs\PerfionAuningFieldOverview.xlsx`
- De operative endpoints for denne integration er:
  - `AuningStockDW`
  - `PerfionItemsDW`
  - `PerfionPricesDW`
- Dette workspace skal behandles som versionsfoelsomt mellem BC18 og BC25:
  - lokale symbolpakker og nuvaerende compile-kontekst har vaeret BC18 (`Base Application 18.18.x`)
  - mindst felterne `Sent as Email`, `Last Email Notif Cleared` og `Last Email Sent Status` er ikke sikre at bruge paa BC18 i `Sales Header` og `Sales Invoice Header`
  - publish mod BC18 og BC25 kan derfor ikke antages at virke med identisk kode uden versionsstyring i kildekoden eller separat leverance
- `PerfionPricesDW` er et kurateret prisfeed og ikke et raadt udtraek:
  - kun `Asset Type = Item`
  - kun `Source Type = Customer Price Group` for basispris
  - kun `Status = Active`
  - kun linjer gyldige pr. `Today`
  - deduplikerer paa `Asset No. + Source No. + Currency Code + Unit of Measure Code`
  - vaelger seneste `Starting Date`, derefter laveste `Unit Price`
  - `Minimum Quantity` respekteres som request-filter, men indgaar ikke i dedupe-noeglen
- `campaignPrice` og `campaignId` i `PerfionPricesDW` beregnes separat:
  - kampagnelinjer hentes fra `Price List Line` med `Source Type = Campaign`
  - kampagne matcher via `Campaign."Customer Price Group NOTO" = salesCode`
  - laveste kampagnepris vinder
  - ved samme pris vinder seneste `Starting Date`
