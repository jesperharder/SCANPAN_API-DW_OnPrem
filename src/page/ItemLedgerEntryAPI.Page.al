page 50234 "ItemLedgerEntryAPI"
{
    /// <summary>
    /// 2025.12.17  Jesper Harder / DW Suite
    /// API page for Item Ledger Entry (table 32) – DW-friendly (system fields + enum INT mirrors + convenience lookups)
    /// </summary>

    Caption = 'ItemLedgerEntryAPI';
    AdditionalSearchTerms = 'SCANPAN, API, datawarehouse, dw, Item Ledger, ILE, Stock, Inventory, Lot, Serial, Warehouse, Value Entry';
    UsageCategory = Administration;

    PageType = API;
    APIPublisher = 'scanpan';
    APIGroup = 'datawarehouse';
    APIVersion = 'beta', 'v1.0';

    EntityName = 'itemLedgerEntry';
    EntitySetName = 'itemLedgerEntries';

    SourceTable = "Item Ledger Entry";
    SourceTableView = sorting("Entry No.") order(ascending);

    // DW: naturlig nøgle (bedst til Synapse upsert)
    ODataKeyFields = "Entry No.";

    DelayedInsert = true;
    Editable = false;
    Extensible = false;

    InsertAllowed = false;
    ModifyAllowed = false;
    DeleteAllowed = false;

    Permissions =
        tabledata "Item Ledger Entry" = R,
        tabledata Item = R,
        tabledata Location = R,
        tabledata Customer = R,
        tabledata Vendor = R;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                Caption = 'Item Ledger Entry';

                // --- Keys / identity ---
                field(entryNo; Rec."Entry No.") { Caption = 'Entry No.'; }
                field(systemId; Rec.SystemId) { Caption = 'SystemId'; }

                // --- Core ---
                field(itemNo; Rec."Item No.") { Caption = 'Item No.'; }
                field(itemDescription; ItemDescTxt) { Caption = 'Item Description'; }
                field(postingDate; Rec."Posting Date") { Caption = 'Posting Date'; }

                field(documentType; Rec."Document Type") { Caption = 'Document Type'; }
                field(documentTypeInt; DocumentTypeInt) { Caption = 'Document Type INT'; }
                field(documentNo; Rec."Document No.") { Caption = 'Document No.'; }

                field(entryType; Rec."Entry Type") { Caption = 'Entry Type'; }
                field(entryTypeInt; EntryTypeInt) { Caption = 'Entry Type INT'; }

                field(sourceType; Rec."Source Type") { Caption = 'Source Type'; }
                field(sourceTypeInt; SourceTypeInt) { Caption = 'Source Type INT'; }
                field(sourceNo; Rec."Source No.") { Caption = 'Source No.'; }
                field(sourceName; SourceNameTxt) { Caption = 'Source Name'; }

                field(locationCode; Rec."Location Code") { Caption = 'Location Code'; }
                field(locationName; LocationNameTxt) { Caption = 'Location Name'; }
                field(variantCode; Rec."Variant Code") { Caption = 'Variant Code'; }

                // --- Quantities & flags ---
                field(quantity; Rec.Quantity) { Caption = 'Quantity'; DecimalPlaces = 0 : 5; }
                field(remainingQuantity; Rec."Remaining Quantity") { Caption = 'Remaining Quantity'; DecimalPlaces = 0 : 5; }
                field(invoicedQuantity; Rec."Invoiced Quantity") { Caption = 'Invoiced Quantity'; DecimalPlaces = 0 : 5; }
                field(open; Rec.Open) { Caption = 'Open'; }
                field(positive; Rec.Positive) { Caption = 'Positive'; }

                // --- Costs (FlowFields) ---
                field(costAmountExpected; Rec."Cost Amount (Expected)") { Caption = 'Cost Amount (Expected)'; }
                field(costAmountActual; Rec."Cost Amount (Actual)") { Caption = 'Cost Amount (Actual)'; }

                // --- Tracking ---
                field(lotNo; Rec."Lot No.") { Caption = 'Lot No.'; }
                field(serialNo; Rec."Serial No.") { Caption = 'Serial No.'; }
                field(itemTracking; Rec."Item Tracking") { Caption = 'Item Tracking'; }
                field(itemTrackingInt; ItemTrackingInt) { Caption = 'Item Tracking INT'; }

                // --- Dimensions ---
                field(globalDimension1Code; Rec."Global Dimension 1 Code") { Caption = 'Global Dimension 1 Code'; }
                field(globalDimension2Code; Rec."Global Dimension 2 Code") { Caption = 'Global Dimension 2 Code'; }
                field(dimensionSetId; Rec."Dimension Set ID") { Caption = 'Dimension Set ID'; }

                // --- Order context ---
                field(orderType; Rec."Order Type") { Caption = 'Order Type'; }
                field(orderTypeInt; OrderTypeInt) { Caption = 'Order Type INT'; }
                field(orderNo; Rec."Order No.") { Caption = 'Order No.'; }
                field(orderLineNo; Rec."Order Line No.") { Caption = 'Order Line No.'; }

                // --- Linkage ---
                field(appliesToEntry; Rec."Applies-to Entry") { Caption = 'Applies-to Entry'; }

                // --- System fields (for incremental loads) ---
                field(systemCreatedAt; Rec.SystemCreatedAt) { Caption = 'SystemCreatedAt'; }
                field(systemCreatedBy; Rec.SystemCreatedBy) { Caption = 'SystemCreatedBy'; }
                field(systemModifiedAt; Rec.SystemModifiedAt) { Caption = 'SystemModifiedAt'; }
                field(systemModifiedBy; Rec.SystemModifiedBy) { Caption = 'SystemModifiedBy'; }
            }
        }
    }

    var
        // Enum mirrors
        EntryTypeInt: Integer;
        DocumentTypeInt: Integer;
        SourceTypeInt: Integer;
        OrderTypeInt: Integer;
        ItemTrackingInt: Integer;

        // Convenience texts
        ItemDescTxt: Text[100];
        LocationNameTxt: Text[100];
        SourceNameTxt: Text[100];

    trigger OnAfterGetRecord()
    begin
        // Enum -> INT mirrors (stabil DW mapping)
        EntryTypeInt := Rec."Entry Type".AsInteger();
        DocumentTypeInt := Rec."Document Type".AsInteger();
        SourceTypeInt := Rec."Source Type".AsInteger();
        OrderTypeInt := Rec."Order Type".AsInteger();
        ItemTrackingInt := Rec."Item Tracking".AsInteger();

        // Convenience lookups
        ItemDescTxt := GetItemDescription(Rec."Item No.");
        LocationNameTxt := GetLocationName(Rec."Location Code");
        SourceNameTxt := GetSourceName(Rec."Source Type", Rec."Source No.");
    end;

    local procedure GetItemDescription(ItemNo: Code[20]): Text[100]
    var
        Item: Record Item;
    begin
        if ItemNo = '' then
            exit('');
        if Item.Get(ItemNo) then
            exit(CopyStr(Item.Description, 1, 100));
        exit('');
    end;

    local procedure GetLocationName(LocationCode: Code[10]): Text[100]
    var
        Location: Record Location;
    begin
        if LocationCode = '' then
            exit('');
        if Location.Get(LocationCode) then
            exit(CopyStr(Location.Name, 1, 100));
        exit('');
    end;

    local procedure GetSourceName(SourceType: Enum "Analysis Source Type"; SourceNo: Code[20]): Text[100]
    var
        Cust: Record Customer;
        Vend: Record Vendor;
        Item: Record Item;
    begin
        if SourceNo = '' then
            exit('');

        case SourceType of
            SourceType::Customer:
                if Cust.Get(SourceNo) then
                    exit(CopyStr(Cust.Name, 1, 100));
            SourceType::Vendor:
                if Vend.Get(SourceNo) then
                    exit(CopyStr(Vend.Name, 1, 100));
            SourceType::Item:
                if Item.Get(SourceNo) then
                    exit(CopyStr(Item.Description, 1, 100));
        end;

        exit('');
    end;
}
