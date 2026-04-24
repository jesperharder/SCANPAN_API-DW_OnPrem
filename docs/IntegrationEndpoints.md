# Integration Endpoints

## Purpose

This document describes the current integration design for three operational export endpoints in `SCANPAN API-DW OnPrem`:

- `AuningStockDW`
- `PerfionItemsDW`
- `PerfionPricesDW`

The document covers:

- the business purpose of each endpoint
- the technical design in Business Central
- the operational model in BC
- the core filtering and calculation logic
- the relationship between OData pages and retained custom API pages
- code examples with explanation

## Scope

The operational integration model currently uses three OData V4 web services as the canonical export layer:

1. `page 50233 "AuningStockOData"` published as `AuningStockDW`
2. `page 50226 "PerfionItemsOData"` published as `PerfionItemsDW`
3. `page 50228 "PerfionPricesOData"` published as `PerfionPricesDW`

The Perfion area also still contains two custom API pages:

- `page 50211 "PerfionItemsAPI"`
- `page 50225 "PerfionPricesAPI"`

These two custom API pages are retained in the extension, but the current registrar logic publishes the OData pages as the operational endpoints for the DW/Perfion export flow.

## Architecture Summary

The design uses two patterns.

### Pattern 1: Direct OData over `Item`

Used by:

- `AuningStockOData`
- `PerfionItemsOData`

Characteristics:

- the page reads directly from `Item`
- the page exposes either physical fields or computed page variables
- the endpoint can be filtered further by the caller
- the BC page is the contract

### Pattern 2: Curated temporary dataset

Used by:

- `PerfionPricesOData`

Characteristics:

- the page uses `SourceTableTemporary = true`
- the dataset is rebuilt in `OnOpenPage()`
- only the latest valid price rows for today are loaded
- campaign price lookup is calculated per record in `OnAfterGetRecord()`

### Snapshot pattern for stock

The AUNING stock endpoint is intentionally not calculated live per OData request.

Instead:

- a Job Queue codeunit calculates stock values
- the calculated values are stored on `Item`
- the OData page only reads the snapshot values

This is the performance-oriented part of the design.

## Endpoint 1: AUNING Stock

### Business purpose

`AuningStockDW` exposes a compact stock snapshot for eCommerce and downstream integrations.

The endpoint is scoped to:

- location `AUNING`
- inventory items only
- general product posting groups `INTERN|EKSTERN|BRUND`

### Exposed fields

The endpoint exposes:

- `itemNo`
- `description`
- `auningStockOnHand`
- `auningStockAvailable`
- `auningStockUpdatedAt`

### Data model

The stock snapshot is stored on `Item` through:

- [DWItemAuningStock.TableExt.al](/c:/Users/jespe/OneDrive%20-%20Scanpan/Scanpan%20(7.1.2015)/Development/SCANPAN%20API-DW%20OnPrem/src/table/DWItemAuningStock.TableExt.al:1)

Added fields:

- `AUNING Stock On Hand`
- `AUNING Stock Available`
- `AUNING Stock Updated At`

### Calculation model

The stock snapshot is populated by:

- [AuningStockUpdate.Codeunit.al](/c:/Users/jespe/OneDrive%20-%20Scanpan/Scanpan%20(7.1.2015)/Development/SCANPAN%20API-DW%20OnPrem/src/codeunit/AuningStockUpdate.Codeunit.al:1)

The codeunit:

- is Job Queue enabled through `TableNo = "Job Queue Entry"`
- resolves location `AUNING`
- filters `Item` by `Type = Inventory`
- filters `Item` by `Gen. Prod. Posting Group`
- calculates blank variant and all explicit variants
- rounds quantities down to integers
- clamps negative quantities to `0`
- stores one shared timestamp for the current run

### Stock definitions

`AUNING Stock On Hand`

- calculated from `Item.Inventory`
- filtered by location and variant
- summed across blank variant and all item variants
- rounded down to a whole number
- never stored below `0`

`AUNING Stock Available`

- calculated from `AUNING Stock On Hand`
- subtracts outstanding sales-order demand with `Shipment Date` up to `WorkDate + 30D`
- includes overdue demand with `Shipment Date` before `WorkDate`
- includes both `Open` and `Released` sales orders for location `AUNING`
- calculated per variant and summed
- optionally reduced by a configured percentage
- rounded down to a whole number
- never stored below `0`

### Job Queue parameters

The codeunit supports the following parameter tokens:

- `GenProdPostingGroupFilter`
- `AvailableReductionPct`
- `ScheduledMinute`

Examples:

```text
GenProdPostingGroupFilter=INTERN|EKSTERN|BRUND
```

```text
GenProdPostingGroupFilter=INTERN|EKSTERN|BRUND;AvailableReductionPct=10
```

```text
GenProdPostingGroupFilter=INTERN|EKSTERN|BRUND;AvailableReductionPct=10;ScheduledMinute=50
```

Interpretation:

- `AvailableReductionPct=0` means no additional reduction
- `AvailableReductionPct=10` means reduce calculated available stock by 10%
- `ScheduledMinute=50` means the job self-normalizes to an hourly recurring schedule for all days and only performs the stock update when the dispatcher starts it during minute `50`
- if the job is restarted or otherwise drifts away from the configured minute, the next calculated run is aligned back to the next `XX:50`

### BC user interface support

The snapshot is visible on the Item Card through:

- [AuningStockFactBox.Page.al](/c:/Users/jespe/OneDrive%20-%20Scanpan/Scanpan%20(7.1.2015)/Development/SCANPAN%20API-DW%20OnPrem/src/page/AuningStockFactBox.Page.al:1)
- [DWItemCardAuningStock.PageExt.al](/c:/Users/jespe/OneDrive%20-%20Scanpan/Scanpan%20(7.1.2015)/Development/SCANPAN%20API-DW%20OnPrem/src/page/DWItemCardAuningStock.PageExt.al:1)

This gives BC users a visual check of:

- on hand
- available
- updated at

### Operational notes

The stock endpoint is only as current as the last completed Job Queue run.

If users run the codeunit manually with UI access:

- a progress dialog is shown
- total item count is shown
- processed item count is shown
- current item number is shown

If the codeunit runs in background Job Queue:

- no dialog is shown

## Endpoint 2: Perfion Items

### Business purpose

`PerfionItemsDW` exposes item master data for Perfion-related downstream use.

The purpose is to export a curated item dataset containing:

- identity
- classification
- translations
- barcodes
- dimensions per unit of measure
- weights
- customs/origin metadata

### Operational endpoint

The operational OData endpoint is:

- [PerfionItemsOData.Page.al](/c:/Users/jespe/OneDrive%20-%20Scanpan/Scanpan%20(7.1.2015)/Development/SCANPAN%20API-DW%20OnPrem/src/page/PerfionItemsOData.Page.al:1)

Published by:

- [DWWSRegistrar.Codeunit.al](/c:/Users/jespe/OneDrive%20-%20Scanpan/Scanpan%20(7.1.2015)/Development/SCANPAN%20API-DW%20OnPrem/src/codeunit/DWWSRegistrar.Codeunit.al:1)

as:

- `PerfionItemsDW`

### Retained custom API page

The custom API variant still exists:

- [PerfionItemsAPI.Page.al](/c:/Users/jespe/OneDrive%20-%20Scanpan/Scanpan%20(7.1.2015)/Development/SCANPAN%20API-DW%20OnPrem/src/page/PerfionItemsAPI.Page.al:1)

It uses:

- `APIPublisher = 'harder'`
- `APIGroup = 'perfion'`
- `APIVersion = 'v1.0'`
- `EntitySetName = 'perfionItems'`

This is useful if the custom API route is needed, but the current registrar-driven web service exposure for DW is the OData page.

### Base filtering logic

The item dataset is filtered by:

- `Gen. Prod. Posting Group = INTERN|EKSTERN|BRUND`
- `ABCD Category <> E and <> D`
- `Product Usage <> PRODUCTION and <> MARKETING`
- `Prod. Group Code <> RÅVARE`

This filter is implemented directly in `SourceTableView`.

### Enrichment logic

The page enriches `Item` with calculated values in `OnAfterGetRecord()`:

- item type as integer and text
- barcodes for `STK`, `INNER`, `MASTER`
- translated descriptions for `DAN`, `NOR`, `SVE`, `FIN`, `ENU`, `DEU`, `FRA`, `NLD`, `ITA`
- fallback for Danish description to `Item.Description`
- UoM dimensions and weights for `STK`, `INNER`, `MASTER`

### Source tables involved

The page reads from:

- `Item`
- `Item Reference`
- `Item Translation`
- `Item Unit of Measure`

### Result shape

The endpoint returns one row per item and exposes a flattened payload that is convenient for downstream import, rather than forcing the receiver to join BC tables itself.

## Endpoint 3: Perfion Prices

### Business purpose

`PerfionPricesDW` exposes valid selling prices for today, with one curated row per logical price combination and optional campaign price information.

The purpose is to provide a cleaner pricing feed than raw `Price List Line`.

### Operational endpoint

The operational OData endpoint is:

- [PerfionPricesOData.Page.al](/c:/Users/jespe/OneDrive%20-%20Scanpan/Scanpan%20(7.1.2015)/Development/SCANPAN%20API-DW%20OnPrem/src/page/PerfionPricesOData.Page.al:1)

Published by:

- [DWWSRegistrar.Codeunit.al](/c:/Users/jespe/OneDrive%20-%20Scanpan/Scanpan%20(7.1.2015)/Development/SCANPAN%20API-DW%20OnPrem/src/codeunit/DWWSRegistrar.Codeunit.al:1)

as:

- `PerfionPricesDW`

### Retained custom API page

The custom API variant still exists:

- [PerfionPricesAPI.Page.al](/c:/Users/jespe/OneDrive%20-%20Scanpan/Scanpan%20(7.1.2015)/Development/SCANPAN%20API-DW%20OnPrem/src/page/PerfionPricesAPI.Page.al:1)

It uses:

- `APIPublisher = 'harder'`
- `APIGroup = 'perfion'`
- `APIVersion = 'v1.0'`
- `EntitySetName = 'perfionPrices'`

### Dataset construction

The page uses a temporary `Price List Line` record set.

Flow:

1. `OnOpenPage()` clears the temporary page record set.
2. `BuildLatestValidPricesForToday()` reads active `Price List Line` rows.
3. Only records valid for `Today` are considered.
4. Only `Asset Type = Item` and `Source Type = Customer Price Group` are considered for the base price dataset.
5. The page respects incoming OData filters where relevant.
6. The page keeps one row per combination of:
   `Asset No. + Source No. + Currency Code + Unit of Measure Code`
7. If multiple rows exist, the page keeps the preferred row by:
   - latest `Starting Date`
   - then lowest `Unit Price` on equal starting date

### Campaign price logic

Campaign prices are calculated separately in `OnAfterGetRecord()`.

The page:

- searches `Price List Line` where `Source Type = Campaign`
- limits to active rows valid on the request date
- matches campaign to the sales code through `Campaign."Customer Price Group NOTO"`
- returns the lowest campaign price
- breaks ties on later `Starting Date`

This means the exported row contains:

- the selected base price row
- a derived `campaignPrice`
- a derived `campaignId`

### Source tables involved

The page reads from:

- `Price List Line`
- `Campaign`

### Important design note

The deduplication key does not include `Minimum Quantity`.

That means:

- the page returns one preferred line per item/sales code/currency/UoM combination
- it does not keep separate rows for multiple minimum quantity breaks within the same combination

This is intentional in the current design and should only be changed if the downstream consumer needs tier-based pricing as separate rows.

## Publication Model in BC

The operational publication logic is centralized in:

- [DWWSRegistrar.Codeunit.al](/c:/Users/jespe/OneDrive%20-%20Scanpan/Scanpan%20(7.1.2015)/Development/SCANPAN%20API-DW%20OnPrem/src/codeunit/DWWSRegistrar.Codeunit.al:1)

The codeunit:

- removes old web service rows for a page
- inserts one canonical published row
- preserves exact service naming

Relevant service names are:

- `AuningStockDW`
- `PerfionItemsDW`
- `PerfionPricesDW`

For Perfion, the registrar explicitly removes old publication for the custom API pages and publishes the OData pages as the canonical web-service entries.

## Schema Maintenance Note

The stock snapshot fields on `Item` are persisted business data from BC's schema perspective, even if the values are recalculated by Job Queue.

This means:

- technical field names must be treated as schema contract
- changing captions is safe
- renaming technical field names is not safe under normal `Synchronize`
- removing or renaming installed fields requires an upgrade strategy or a forced sync in a non-production-safe scenario

Operationally, this is important because Business Central will treat a field rename as a field removal plus a field addition unless a proper upgrade path is used.

## Permissions

Perfion permissions are gathered in:

- [PERFIONAPIREAD.PermissionSet.al](/c:/Users/jespe/OneDrive%20-%20Scanpan/Scanpan%20(7.1.2015)/Development/SCANPAN%20API-DW%20OnPrem/src/permission/PERFIONAPIREAD.PermissionSet.al:1)

AUNING stock permissions are gathered in:

- [AUNINGSTOCKREAD.PermissionSet.al](/c:/Users/jespe/OneDrive%20-%20Scanpan/Scanpan%20(7.1.2015)/Development/SCANPAN%20API-DW%20OnPrem/src/permission/AUNINGSTOCKREAD.PermissionSet.al:1)

Operationally, the consuming user or integration account must be able to:

- read the published page
- read the underlying source tables
- authenticate in the BC environment

## Operational Layer in Business Central

The BC operational model is:

1. Deploy the extension.
2. Run the registrar logic so the web services are published consistently.
3. Assign the relevant permission set to the integration user.
4. For stock, create and schedule a Job Queue entry for `codeunit 50042 "Auning Stock Update"`.
5. Monitor the stock job for successful completion and timestamp freshness.
6. Consume the published OData services from downstream systems.

For stock specifically, BC operations must manage:

- Job Queue schedule
- parameter string
- success/failure monitoring
- snapshot freshness on the Item Card FactBox

For Perfion specifically, BC operations must understand that:

- item and price datasets are calculated at request time
- item enrichment comes from related BC tables
- price export is curated and not a raw table dump

## Code Example and Explanation

The following excerpt shows the stock normalization logic:

```al
local procedure NormalizeAvailableQuantity(AvailableQuantity: Decimal; AvailableReductionPct: Decimal): Decimal
var
    ReducedAvailableQuantity: Decimal;
begin
    ReducedAvailableQuantity := AvailableQuantity;
    if AvailableReductionPct > 0 then
        ReducedAvailableQuantity := ReducedAvailableQuantity * (100 - AvailableReductionPct) / 100;

    exit(NormalizeQuantity(ReducedAvailableQuantity));
end;
```

What this does:

- starts from the calculated AUNING stock after 30-day sales-order demand has been subtracted
- applies a percentage reduction only when the parameter is above `0`
- sends the result through `NormalizeQuantity(...)`

And `NormalizeQuantity(...)` enforces:

- no negative values
- integer output only

This is why:

- `AvailableReductionPct=0` means no extra reduction
- `AvailableReductionPct=10` reduces available stock by 10%
- a negative or fractional raw result will never be stored as a negative stock value

The following excerpt shows the Perfion price selection pattern:

```al
if SP."Starting Date" > Existing."Starting Date" then
    ReplaceExisting := true
else
    if SP."Starting Date" = Existing."Starting Date" then begin
        if (SP."Unit Price" <> 0) and (Existing."Unit Price" <> 0) then begin
            if SP."Unit Price" < Existing."Unit Price" then
                ReplaceExisting := true;
        end else
            if (Existing."Unit Price" = 0) and (SP."Unit Price" <> 0) then
                ReplaceExisting := true;
    end;
```

What this does:

- compares a candidate price row to an already selected row
- prefers the row with the latest starting date
- if starting date is the same, prefers the lower unit price
- avoids returning multiple overlapping active rows for the same logical combination

This is the core of why `PerfionPricesDW` behaves like a curated pricing endpoint rather than a raw `Price List Line` export.

## Current Design Boundaries

Important current boundaries:

- `AuningStockDW` is a snapshot, not a live stock computation
- `PerfionItemsDW` is a live enriched item export
- `PerfionPricesDW` is a live curated temporary dataset
- stock export is scoped to `AUNING`
- stock export is scoped to `INTERN|EKSTERN|BRUND`
- item export is scoped to a narrower curated item population
- price export is date-sensitive and campaign-aware

## Files

Main implementation files:

- [AuningStockUpdate.Codeunit.al](/c:/Users/jespe/OneDrive%20-%20Scanpan/Scanpan%20(7.1.2015)/Development/SCANPAN%20API-DW%20OnPrem/src/codeunit/AuningStockUpdate.Codeunit.al:1)
- [DWItemAuningStock.TableExt.al](/c:/Users/jespe/OneDrive%20-%20Scanpan/Scanpan%20(7.1.2015)/Development/SCANPAN%20API-DW%20OnPrem/src/table/DWItemAuningStock.TableExt.al:1)
- [AuningStockOData.Page.al](/c:/Users/jespe/OneDrive%20-%20Scanpan/Scanpan%20(7.1.2015)/Development/SCANPAN%20API-DW%20OnPrem/src/page/AuningStockOData.Page.al:1)
- [AuningStockFactBox.Page.al](/c:/Users/jespe/OneDrive%20-%20Scanpan/Scanpan%20(7.1.2015)/Development/SCANPAN%20API-DW%20OnPrem/src/page/AuningStockFactBox.Page.al:1)
- [DWItemCardAuningStock.PageExt.al](/c:/Users/jespe/OneDrive%20-%20Scanpan/Scanpan%20(7.1.2015)/Development/SCANPAN%20API-DW%20OnPrem/src/page/DWItemCardAuningStock.PageExt.al:1)
- [PerfionItemsOData.Page.al](/c:/Users/jespe/OneDrive%20-%20Scanpan/Scanpan%20(7.1.2015)/Development/SCANPAN%20API-DW%20OnPrem/src/page/PerfionItemsOData.Page.al:1)
- [PerfionPricesOData.Page.al](/c:/Users/jespe/OneDrive%20-%20Scanpan/Scanpan%20(7.1.2015)/Development/SCANPAN%20API-DW%20OnPrem/src/page/PerfionPricesOData.Page.al:1)
- [PerfionItemsAPI.Page.al](/c:/Users/jespe/OneDrive%20-%20Scanpan/Scanpan%20(7.1.2015)/Development/SCANPAN%20API-DW%20OnPrem/src/page/PerfionItemsAPI.Page.al:1)
- [PerfionPricesAPI.Page.al](/c:/Users/jespe/OneDrive%20-%20Scanpan/Scanpan%20(7.1.2015)/Development/SCANPAN%20API-DW%20OnPrem/src/page/PerfionPricesAPI.Page.al:1)
- [DWWSRegistrar.Codeunit.al](/c:/Users/jespe/OneDrive%20-%20Scanpan/Scanpan%20(7.1.2015)/Development/SCANPAN%20API-DW%20OnPrem/src/codeunit/DWWSRegistrar.Codeunit.al:1)
- [PERFIONAPIREAD.PermissionSet.al](/c:/Users/jespe/OneDrive%20-%20Scanpan/Scanpan%20(7.1.2015)/Development/SCANPAN%20API-DW%20OnPrem/src/permission/PERFIONAPIREAD.PermissionSet.al:1)
- [AUNINGSTOCKREAD.PermissionSet.al](/c:/Users/jespe/OneDrive%20-%20Scanpan/Scanpan%20(7.1.2015)/Development/SCANPAN%20API-DW%20OnPrem/src/permission/AUNINGSTOCKREAD.PermissionSet.al:1)
