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
