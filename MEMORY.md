# Project Memory

## Current Project State
- Repository: `SCANPAN API-DW OnPrem`.
- App: `SCANPAN Data Warehouse API`, version `1.0.0.40`, runtime `7.2`, target `OnPrem`, platform `18.0.31692.0`.
- Active compile context is BC18-oriented with local symbols around `Base Application 18.18.x`.
- The maintained operational integration endpoints are:
  - `AuningStockDW`
  - `PerfionItemsDW`
  - `PerfionPricesDW`
- Stable project rules now live in `AGENTS.md`.

## Active Integrations
- `PerfionItemsDW` runs through `page 50226 "PerfionItemsOData"`.
- `PerfionPricesDW` runs through `page 50228 "PerfionPricesOData"`.
- `AuningStockDW` runs through `page 50233 "AuningStockOData"`.
- Custom API pages `PerfionItemsAPI` and `PerfionPricesAPI` have been removed from this project.
- Relevant maintained documentation:
  - `docs\IntegrationEndpoints.md`
  - `docs\IntegrationEndpoints.Readable.html`
  - `docs\IntegrationEndpoints.pdf`
  - `docs\PerfionAuningFieldOverview.md`
  - `docs\PerfionAuningFieldOverview.xlsx`
  - `docs\PerfionPriceFields.md`

## AUNING Stock State
- eCommerce stock is scoped to location `AUNING`.
- `stock-at-hand` means physical stock now from posted inventory.
- `stock-available` means sellable stock now after the current business demand calculation.
- Implemented objects:
  - `tableextension 50231 "DW Item Auning Stock"` adds `AUNING Stock On Hand`, `AUNING Stock Available`, and `AUNING Stock Updated At` to `Item`.
  - `codeunit 50042 "Auning Stock Update"` updates stock snapshots and is Job Queue-capable through `TableNo = "Job Queue Entry"`.
  - `page 50233 "AuningStockOData"` exposes `auningStockOnHand`, `auningStockAvailable`, and `auningStockUpdatedAt`.
  - `page 50237 "AuningStockFactBox"` shows the snapshot fields as a `CardPart`.
  - `pageextension 50232 "DW Item Card Auning Stock"` adds the FactBox to `Item Card`.
  - `permissionset 50231 "AUNING STOCK READ"` gives read access for the OData page and relevant `Item` data.
- Current default item scope is `Gen. Prod. Posting Group` filter `INTERN|EKSTERN|BRUND`.
- `codeunit 50042` supports these Job Queue parameters:
  - `GenProdPostingGroupFilter=INTERN|EKSTERN|BRUND`
  - `AvailableReductionPct=<decimal>`
  - `ScheduledMinute=<0..59>`
- If `GenProdPostingGroupFilter` is omitted, the default is `INTERN|EKSTERN|BRUND`.
- Snapshot and OData stock fields are rounded down to whole numbers and clamped to `0` when negative.
- `AUNING Stock Available` is currently calculated as `On Hand - sales-order demand`.
- Sales-order demand is read from `Sales Line."Outstanding Qty. (Base)"` for location `AUNING`.
- Both `Open` and `Released` sales orders are included.
- Demand window uses `Shipment Date <= WorkDate + 30D`, including backlog before `WorkDate`.
- The current demand logic intentionally avoids combining custom sales-order demand with standard warehouse availability for the same demand, to avoid double subtraction.
- `ScheduledMinute` must not block manual UI runs; the minute guard applies only to background runs without UI.
- Job Queue normalization must set `Job Queue Entry."Recurring Job" = true` in addition to recurring weekdays and `No. of Minutes between Runs`.

## Perfion Prices State
- `PerfionPricesDW` is a curated price feed, not a raw extract.
- It builds a unique temporary item list on `Asset No.`.
- It includes only:
  - `Asset Type = Item`
  - base prices with `Source Type = Customer Price Group`
  - active price lines
  - lines valid on `Today`
- It exposes fixed pivoted fields for the configured customer-price-group, currency, and unit-of-measure combinations.
- Each configured combination has `price*`, `recommendedPrice*`, and `campaignPrice*` fields.
- Base price selection prefers nonzero `Unit Price`, then lowest `Minimum Quantity`, then latest `Starting Date`, then lowest `Unit Price`.
- `SystemId` is used only as the OData key for each temporary row.
- Web price list output fields use cleaned base names before the language suffix: `price_DAN`, `recommendedPrice_DAN`, and `campaignPrice_DAN` style across `_DE`, `_DAN`, `_NLD`, and `_NOR`.
- `WEB-NO` is read from company `SCANPAN Norge`; the other configured price combinations are read from the current company.
- `campaignPrice*` is read from `Price List Line` with `Source Type = Campaign`.
- Campaign price lookup matches through `Campaign."Customer Price Group NOTO"` and uses the same lowest-minimum-quantity rule.

## SalesLine And SQL State
- `page 50262 "SalesLineAPI"` is expected to include all quantity fields, all amount fields, `Drop Shipment`, and central reference, date, dimension, and audit fields.
- The related SQL staging table is `[stg_bc_api].[SalesLine]`.
- Natural SQL key for `[stg_bc_api].[SalesLine]`:
  - `CompanyId`
  - `documentType`
  - `documentTypeInt`
  - `documentNo`
  - `lineNo`

## Verified Findings
- Local BC18 symbols confirm these relevant standard objects:
  - `codeunit 5790 "Available to Promise"` has standard availability methods including `CalcAvailableInventory`, `CalcGrossRequirement`, `CalcReservedRequirement`, `CalcScheduledReceipt`, and `QtyAvailabletoPromise`.
  - `codeunit 5530 "Calc. Item Availability"` can build `Inventory Event Buffer` from supply and demand.
  - `codeunit 7314 "Warehouse Availability Mgt."` has `CalcInvtAvailQty` for warehouse-aware inventory availability on locations without directed put-away and pick.
  - `table 472 "Job Queue Entry"` can run codeunits through `codeunit 449 "Job Queue Start Codeunit"`.
- `page 50234 "ItemLedgerEntryAPI"` already exposes central physical inventory fields including `Quantity`, `Remaining Quantity`, `Reserved Quantity`, `Open`, `Location Code`, and `Variant Code`.

## Blockers And Risks
- This workspace is version-sensitive between BC18 and BC25.
- Publish against BC18 and BC25 cannot be assumed to work with identical source unless the code is version-gated or delivered separately.
- At least `Sales Header` and `Sales Invoice Header` fields `Sent as Email`, `Last Email Notif Cleared`, and `Last Email Sent Status` are not safe to use in BC18 without version handling.

## Next Checks
- After current AL source changes, run the available AL compile/package validation for the BC18 context.
- After any AL object add/delete/rename/ID change, refresh the central BC object inventory.
- After endpoint field changes, verify that `docs\IntegrationEndpoints.md`, `docs\PerfionAuningFieldOverview.md`, and `docs\PerfionPriceFields.md` remain aligned with the AL source.
- If SQL staging changes are requested, work in the external database project under `[stg_bc_api]`, not in a placeholder inside this repository.
