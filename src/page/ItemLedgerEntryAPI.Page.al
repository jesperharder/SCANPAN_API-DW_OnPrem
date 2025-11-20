/// <summary>
/// API Page: Item Ledger Entry API v1 (table 32).
/// </summary>
/// <remarks>
/// 2024.11  Initial version (no prefix). Read-only. Adds integer mirrors:
/// entryTypeInt, documentTypeInt, sourceTypeInt, orderTypeInt, itemTrackingInt.
/// Also includes convenience fields (itemDescription, locationName, sourceName)
/// and AdditionalSearchTerms for discoverability.
/// </remarks>
page 50234 "ItemLedgerEntryAPI"
{
    PageType = API;
    Caption = 'ItemLedgerEntryAPI';
    APIPublisher = 'custom';
    APIGroup = 'items';
    APIVersion = 'v1.0';

    EntityName = 'item_ledger_entry';
    EntitySetName = 'item_ledger_entries';

    SourceTable = "Item Ledger Entry";
    ODataKeyFields = SystemId;
    DelayedInsert = true;
    Extensible = false;

    // Read-only surface
    InsertAllowed = false;
    ModifyAllowed = false;
    DeleteAllowed = false;

    AdditionalSearchTerms = 'Item Ledger, ILE, Stock, Inventory, Cost, Lot, Serial, Warehouse, Value Entry';

    layout
    {
        area(content)
        {
            repeater(General)
            {
                // Identity
                field(id; Rec.SystemId) { Caption = 'Id'; Editable = false; }
                field(entryNo; Rec."Entry No.") { Caption = 'Entry No.'; Editable = false; }

                // Core
                field(itemNo; Rec."Item No.") { Caption = 'Item No.'; Editable = false; }
                field(itemDescription; ItemDescTxt) { Caption = 'Item Description'; Editable = false; }
                field(postingDate; Rec."Posting Date") { Caption = 'Posting Date'; Editable = false; }

                field(documentType; Rec."Document Type") { Caption = 'Document Type'; Editable = false; }
                field(documentTypeInt; DocumentTypeInt) { Caption = 'Document Type (Int)'; Editable = false; }
                field(documentNo; Rec."Document No.") { Caption = 'Document No.'; Editable = false; }

                field(entryType; Rec."Entry Type") { Caption = 'Entry Type'; Editable = false; }
                field(entryTypeInt; EntryTypeInt) { Caption = 'Entry Type (Int)'; Editable = false; }

                field(sourceType; Rec."Source Type") { Caption = 'Source Type'; Editable = false; }
                field(sourceTypeInt; SourceTypeInt) { Caption = 'Source Type (Int)'; Editable = false; }
                field(sourceNo; Rec."Source No.") { Caption = 'Source No.'; Editable = false; }
                field(sourceName; SourceNameTxt) { Caption = 'Source Name'; Editable = false; }

                field(locationCode; Rec."Location Code") { Caption = 'Location Code'; Editable = false; }
                field(locationName; LocationNameTxt) { Caption = 'Location Name'; Editable = false; }
                field(variantCode; Rec."Variant Code") { Caption = 'Variant Code'; Editable = false; }

                // Quantities & flags
                field(quantity; Rec.Quantity) { Caption = 'Quantity'; Editable = false; DecimalPlaces = 0 : 5; }
                field(remainingQuantity; Rec."Remaining Quantity") { Caption = 'Remaining Quantity'; Editable = false; DecimalPlaces = 0 : 5; }
                field(invoicedQuantity; Rec."Invoiced Quantity") { Caption = 'Invoiced Quantity'; Editable = false; DecimalPlaces = 0 : 5; }
                field(open; Rec.Open) { Caption = 'Open'; Editable = false; }
                field(positive; Rec.Positive) { Caption = 'Positive'; Editable = false; }

                // Costs (FlowFields)
                field(costAmountExpected; Rec."Cost Amount (Expected)") { Caption = 'Cost Amount (Expected)'; Editable = false; }
                field(costAmountActual; Rec."Cost Amount (Actual)") { Caption = 'Cost Amount (Actual)'; Editable = false; }

                // Tracking
                field(lotNo; Rec."Lot No.") { Caption = 'Lot No.'; Editable = false; }
                field(serialNo; Rec."Serial No.") { Caption = 'Serial No.'; Editable = false; }
                field(itemTracking; Rec."Item Tracking") { Caption = 'Item Tracking'; Editable = false; }
                field(itemTrackingInt; ItemTrackingInt) { Caption = 'Item Tracking (Int)'; Editable = false; }

                // Dimensions
                field(globalDimension1Code; Rec."Global Dimension 1 Code") { Caption = 'Global Dimension 1 Code'; Editable = false; }
                field(globalDimension2Code; Rec."Global Dimension 2 Code") { Caption = 'Global Dimension 2 Code'; Editable = false; }
                field(dimensionSetId; Rec."Dimension Set ID") { Caption = 'Dimension Set ID'; Editable = false; }

                // Order context (read-only in table)
                field(orderType; Rec."Order Type") { Caption = 'Order Type'; Editable = false; }
                field(orderTypeInt; OrderTypeInt) { Caption = 'Order Type (Int)'; Editable = false; }
                field(orderNo; Rec."Order No.") { Caption = 'Order No.'; Editable = false; }
                field(orderLineNo; Rec."Order Line No.") { Caption = 'Order Line No.'; Editable = false; }

                // Applied / linkage help
                field(appliesToEntry; Rec."Applies-to Entry") { Caption = 'Applies-to Entry'; Editable = false; }
            }
        }
    }

    actions { }

    var
        // Integer mirrors (computed)
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
        // Integer mirrors (explicit mapping for stability across versions)
        EntryTypeInt := GetEntryTypeInt();
        DocumentTypeInt := GetDocumentTypeInt();
        SourceTypeInt := GetSourceTypeInt();
        OrderTypeInt := GetOrderTypeInt();
        ItemTrackingInt := GetItemTrackingInt();

        // Convenience text lookups
        ItemDescTxt := GetItemDescription(Rec."Item No.");
        LocationNameTxt := GetLocationName(Rec."Location Code");
        SourceNameTxt := GetSourceName();
    end;

    // ===== Integer mirror helpers =====
    local procedure GetEntryTypeInt(): Integer
    begin
        // Enum "Item Ledger Entry Type"
        exit(Rec."Entry Type".AsInteger()); // Use AsInteger() to avoid manual mapping
        
    end;


    local procedure GetDocumentTypeInt(): Integer
    begin
        // Enum "Item Ledger Document Type"
        exit(rec."Document Type".AsInteger()); // Use AsInteger() to avoid manual mapping
    end;

    local procedure GetSourceTypeInt(): Integer
    begin
        // Enum "Analysis Source Type"
        exit(Rec."Source Type".AsInteger()); // Use AsInteger() to avoid manual mapping
    end;

    local procedure GetOrderTypeInt(): Integer
    begin
        // Enum "Inventory Order Type"
        exit(Rec."Order Type".AsInteger()); // Use AsInteger() to avoid manual mapping
    end;

    local procedure GetItemTrackingInt(): Integer
    begin
        // Enum "Item Tracking Entry Type"
        exit(Rec."Item Tracking".AsInteger()); // Use AsInteger() to avoid manual mapping
    end;

    // ===== Convenience lookups =====
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

    local procedure GetSourceName(): Text[100]
    var
        Cust: Record Customer;
        Vend: Record Vendor;
        Item: Record Item;
    begin
        if Rec."Source No." = '' then
            exit('');
        case Rec."Source Type" of
            Rec."Source Type"::Customer:
                if Cust.Get(Rec."Source No.") then
                    exit(CopyStr(Cust.Name, 1, 100));
            Rec."Source Type"::Vendor:
                if Vend.Get(Rec."Source No.") then
                    exit(CopyStr(Vend.Name, 1, 100));
            Rec."Source Type"::Item:
                if Item.Get(Rec."Source No.") then
                    exit(CopyStr(Item.Description, 1, 100));
        end;
        exit('');
    end;
}
