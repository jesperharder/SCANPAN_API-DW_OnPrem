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
- the OData publication model
- code examples with explanation

## Scope

The operational integration model currently uses three OData V4 web services as the canonical export layer:

1. `page 50233 "AuningStockOData"` published as `AuningStockDW`
2. `page 50226 "PerfionItemsOData"` published as `PerfionItemsDW`
3. `page 50228 "PerfionPricesOData"` published as `PerfionPricesDW`

Perfion integrations are exposed only through these OData pages.

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
- one temporary row per item is loaded
- fixed pivot fields are populated per exposed price combination in `OnAfterGetRecord()`

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
- calculates only blank variant because Scanpan does not use item variants for this feed
- rounds quantities down to integers
- clamps negative quantities to `0`
- stores one shared timestamp for the current run

### Stock definitions

`AUNING Stock On Hand`

- calculated from `Item.Inventory`
- filtered by location and blank variant
- rounded down to a whole number
- never stored below `0`

`AUNING Stock Available`

- calculated from `AUNING Stock On Hand`
- subtracts outstanding sales-order demand with `Shipment Date` up to `Today + 30D`
- includes overdue demand with `Shipment Date` before `Today`
- includes both `Open` and `Released` sales orders for location `AUNING`
- includes only blank sales-line variant code
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

`PerfionPricesDW` exposes a unique item list for today with fixed pivot fields per price combination.

The purpose is to provide a cleaner item-centric pricing feed than raw `Price List Line`.

### Operational endpoint

The operational OData endpoint is:

- [PerfionPricesOData.Page.al](/c:/Users/jespe/OneDrive%20-%20Scanpan/Scanpan%20(7.1.2015)/Development/SCANPAN%20API-DW%20OnPrem/src/page/PerfionPricesOData.Page.al:1)
- [PerfionPriceFields.md](/c:/Users/jespe/OneDrive%20-%20Scanpan/Scanpan%20(7.1.2015)/Development/SCANPAN%20API-DW%20OnPrem/docs/PerfionPriceFields.md:1)

Published by:

- [DWWSRegistrar.Codeunit.al](/c:/Users/jespe/OneDrive%20-%20Scanpan/Scanpan%20(7.1.2015)/Development/SCANPAN%20API-DW%20OnPrem/src/codeunit/DWWSRegistrar.Codeunit.al:1)

as:

- `PerfionPricesDW`

### Dataset construction

The page uses a temporary `Price List Line` record set and exposes one unique row per item.

Flow:

1. `OnOpenPage()` clears the temporary page record set.
2. `BuildItemRowsForToday()` reads active `Price List Line` rows.
3. Only records valid for `Today` are considered.
4. Only `Asset Type = Item`, `Source Type = Customer Price Group` and configured web source/currency/UoM combinations are considered for the base row set.
5. The endpoint currently exposes 4 configured web source/currency/UoM combinations.

`WEB-NO` is read from company `SCANPAN Norge`. The other price combinations are read from the current company.
6. The page respects incoming item filters where relevant.
7. The page keeps one temporary row per item by deduplicating on `Asset No.` before insertion.
8. For each exposed combination, the page fills:
   - `price*`
   - `recommendedPrice*`
   - `campaignPrice*`
   Zero values are exposed as empty text for these price fields.
9. If multiple rows exist for a combination, the page keeps the preferred row by:
   - lowest `Minimum Quantity`
   - then latest `Starting Date`
   - then lowest nonzero `Unit Price`

### Campaign price logic

Campaign prices are calculated per pivoted price combination.

The page:

- searches `Price List Line` where `Source Type = Campaign`
- limits to active rows valid on the request date
- matches campaign to the customer price group through `Campaign."Customer Price Group NOTO"`
- returns the preferred campaign price for the same item/currency/UoM combination

This means the exported row contains:

- `itemNo`
- `price*`, `recommendedPrice*` and `campaignPrice*` fields for each configured combination

### Source tables involved

The page reads from:

- `Price List Line`
- `Campaign`

### Important design note

The endpoint deliberately does not expose tier-price rows. It returns the active line with the lowest `Minimum Quantity` for each item and pivoted price combination.

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

For Perfion, the registrar publishes the OData pages as the canonical web-service entries.

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
if Candidate."Minimum Quantity" <> Existing."Minimum Quantity" then
    exit(Candidate."Minimum Quantity" < Existing."Minimum Quantity");

if Candidate."Starting Date" <> Existing."Starting Date" then
    exit(Candidate."Starting Date" > Existing."Starting Date");

if Existing."Unit Price" = 0 then
    exit(Candidate."Unit Price" <> 0);
if Candidate."Unit Price" = 0 then
    exit(false);

exit(Candidate."Unit Price" < Existing."Unit Price");
```

What this does:

- compares a candidate price row to an already selected row
- prefers the lowest minimum quantity
- if minimum quantity is the same, prefers the latest starting date
- if starting date is also the same, prefers the lower nonzero unit price
- avoids returning tier-price rows

This is the core of why `PerfionPricesDW` behaves like a curated pivoted pricing endpoint rather than a raw `Price List Line` export.

## Current Design Boundaries

Important current boundaries:

- `AuningStockDW` is a snapshot, not a live stock computation
- `PerfionItemsDW` is a live enriched item export
- `PerfionPricesDW` is a live curated pivoted temporary dataset
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
- [DWWSRegistrar.Codeunit.al](/c:/Users/jespe/OneDrive%20-%20Scanpan/Scanpan%20(7.1.2015)/Development/SCANPAN%20API-DW%20OnPrem/src/codeunit/DWWSRegistrar.Codeunit.al:1)
- [PERFIONAPIREAD.PermissionSet.al](/c:/Users/jespe/OneDrive%20-%20Scanpan/Scanpan%20(7.1.2015)/Development/SCANPAN%20API-DW%20OnPrem/src/permission/PERFIONAPIREAD.PermissionSet.al:1)
- [AUNINGSTOCKREAD.PermissionSet.al](/c:/Users/jespe/OneDrive%20-%20Scanpan/Scanpan%20(7.1.2015)/Development/SCANPAN%20API-DW%20OnPrem/src/permission/AUNINGSTOCKREAD.PermissionSet.al:1)
