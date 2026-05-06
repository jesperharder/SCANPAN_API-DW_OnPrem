# Project Instructions

## Scope
- These instructions apply to the whole `SCANPAN API-DW OnPrem` repository.
- Keep this file limited to stable project rules. Put current state, blockers, decisions, and next checks in `MEMORY.md`.
- Update `AGENTS.md` only when stable rules change. If a repeated `MEMORY.md` note becomes a rule, move it here.

## Repository Structure
- AL extension source lives in `src/`.
- Pages and page extensions live in `src/page/`.
- Codeunits live in `src/codeunit/`.
- Tables and table extensions live in `src/table/`.
- Permission sets live in `src/permission/`.
- Generated and distribution documentation lives in `docs/`.
- Translation files live in `Translations/`.
- Local AL package symbols live in `.alpackages/`.
- The related SQL database project is outside this workspace at `..\SQL scripts\BusinessAnalyticsDB2\DatabaseProjectBusinessAnalyticsAI\`.
- SQL staging objects for BC API integrations belong under the SQL database project schema folder `stg_bc_api`.

## Business Central Object Governance
- Before proposing, creating, or changing AL object IDs, read `C:\Users\jespe\.codex\memories\bc-object-ranges.md`.
- Keep `C:\Users\jespe\.codex\memories\bc-object-inventory.csv` aligned after AL object changes in this registered BC project. Use `C:\Users\jespe\.codex\memories\bc-refresh-object-inventory.ps1` when practical.
- The app declares object ranges `50042-50050` and `50200-50299`.
- Practical allocation in this repository:
  - `page`: use `50200-50290` for API pages and classic OData/list pages.
  - `codeunit`: use `50042-50050` for new API codeunits.
  - `table`, `tableextension`, and `permissionset`: use available slots inside the declared app ranges after checking the central inventory.
- Existing codeunits at `50200`, `50291`, and `50292` are legacy exceptions. Do not copy that pattern for new objects unless the user explicitly changes governance.
- Keep custom API pages and classic OData/list pages as separate objects when both integration styles are needed.

## AL Development Rules
- Match existing repository style before adding new patterns.
- Keep AL code and technical object, field, parameter, and OData names in English.
- Handle local user-facing translations through translation files, not hard-coded localized AL names.
- Prefer classic OData `List` pages for the maintained Perfion and AUNING operational feeds unless the integration contract is explicitly changed.
- For temporary OData datasets, follow the existing curated-page pattern using `SourceTableTemporary = true` and data construction in page triggers.
- Do not use BC fields that are not available in the active BC18 compile context unless the implementation is explicitly version-gated.

## Integration Contracts
- The operational endpoints for this project are:
  - `AuningStockDW`
  - `PerfionItemsDW`
  - `PerfionPricesDW`
- `PerfionItemsDW` is exposed by `page 50226 "PerfionItemsOData"`.
- `PerfionPricesDW` is exposed by `page 50228 "PerfionPricesOData"`.
- `AuningStockDW` is exposed by `page 50233 "AuningStockOData"`.
- Perfion integration read access belongs in permission set `PERFION API READ`.
- AUNING stock read access belongs in permission set `AUNING STOCK READ`.
- Keep `docs\IntegrationEndpoints.md`, `docs\PerfionAuningFieldOverview.md`, and `docs\PerfionPriceFields.md` aligned with endpoint field changes.

## SQL Integration Rules
- Do not use `dbo` as the default schema for new BC API staging tables.
- BC API staging tables belong in schema `[stg_bc_api]`.
- New `[stg_bc_api]` tables should match existing database-project patterns before new SQL files are created.
- New staging tables normally include:
  - `CompanyId` in the key.
  - `PipelineName`.
  - `PipelineRunId`.
  - `PipelineTriggerTime`.

## Validation
- After AL source changes, run the relevant existing AL compile/package validation for this workspace when available.
- After AL object additions, deletions, ID changes, or renames, refresh the central BC object inventory when practical.
- After endpoint contract changes, validate both source and documentation updates.
- Use non-interactive commands for validation and diffs.

## Git Rules
- Do not revert unrelated changes.
- Use non-interactive git diffs, preferably `git --no-pager diff`.
- Keep changes scoped to the requested task.
- Do not stage, commit, push, or create branches unless the user asks for it.

## Access And Workflow
- Do not store secrets, tokens, credentials, temporary IP allowlist values, or run-specific identifiers in `AGENTS.md`.
- `MEMORY.md` should store current project state only, not a changelog.
- If `MEMORY.md` content becomes obsolete, replace it with current state.
- If `MEMORY.md` content becomes a repeated rule, move it to this file.
