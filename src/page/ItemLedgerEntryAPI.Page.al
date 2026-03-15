page 50234 "ItemLedgerEntryAPI"
{
    /// <summary>
    /// 2026.03.12  Jesper Harder / DW Suite
    /// API page for Item Ledger Entry (table 32) – DW-friendly
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
                field(description; Rec.Description) { Caption = 'Description'; }
                field(itemDescription; ItemDescTxt) { Caption = 'Item Description'; }
                field(postingDate; Rec."Posting Date") { Caption = 'Posting Date'; }
                field(documentDate; Rec."Document Date") { Caption = 'Document Date'; }

                // --- Document ---
                field(documentType; Rec."Document Type") { Caption = 'Document Type'; }
                field(documentTypeInt; DocumentTypeInt) { Caption = 'Document Type INT'; }
                field(documentNo; Rec."Document No.") { Caption = 'Document No.'; }
                field(documentLineNo; Rec."Document Line No.") { Caption = 'Document Line No.'; }
                field(externalDocumentNo; Rec."External Document No.") { Caption = 'External Document No.'; }

                // --- Entry / source ---
                field(entryType; Rec."Entry Type") { Caption = 'Entry Type'; }
                field(entryTypeInt; EntryTypeInt) { Caption = 'Entry Type INT'; }

                field(sourceType; Rec."Source Type") { Caption = 'Source Type'; }
                field(sourceTypeInt; SourceTypeInt) { Caption = 'Source Type INT'; }
                field(sourceNo; Rec."Source No.") { Caption = 'Source No.'; }
                field(sourceName; SourceNameTxt) { Caption = 'Source Name'; }

                // --- Location / variant / UoM ---
                field(locationCode; Rec."Location Code") { Caption = 'Location Code'; }
                field(locationName; LocationNameTxt) { Caption = 'Location Name'; }
                field(variantCode; Rec."Variant Code") { Caption = 'Variant Code'; }
                field(unitOfMeasureCode; Rec."Unit of Measure Code") { Caption = 'Unit of Measure Code'; }
                field(qtyPerUnitOfMeasure; Rec."Qty. per Unit of Measure") { Caption = 'Qty. per Unit of Measure'; }

                // --- Quantities & flags ---
                field(quantity; Rec.Quantity) { Caption = 'Quantity'; DecimalPlaces = 0 : 5; }
                field(remainingQuantity; Rec."Remaining Quantity") { Caption = 'Remaining Quantity'; DecimalPlaces = 0 : 5; }
                field(invoicedQuantity; Rec."Invoiced Quantity") { Caption = 'Invoiced Quantity'; DecimalPlaces = 0 : 5; }
                field(reservedQuantity; Rec."Reserved Quantity") { Caption = 'Reserved Quantity'; DecimalPlaces = 0 : 5; }
                field(open; Rec.Open) { Caption = 'Open'; }
                field(positive; Rec.Positive) { Caption = 'Positive'; }
                field(dropShipment; Rec."Drop Shipment") { Caption = 'Drop Shipment'; }
                field(correction; Rec.Correction) { Caption = 'Correction'; }
                field(completelyInvoiced; Rec."Completely Invoiced") { Caption = 'Completely Invoiced'; }
                field(appliedEntryToAdjust; Rec."Applied Entry to Adjust") { Caption = 'Applied Entry to Adjust'; }
                field(assembleToOrder; Rec."Assemble to Order") { Caption = 'Assemble to Order'; }
                field(jobPurchase; Rec."Job Purchase") { Caption = 'Job Purchase'; }
                field(derivedFromBlanketOrder; Rec."Derived from Blanket Order") { Caption = 'Derived from Blanket Order'; }
                field(outOfStockSubstitution; Rec."Out-of-Stock Substitution") { Caption = 'Out-of-Stock Substitution'; }
                field(nonstock; Rec.Nonstock) { Caption = 'Nonstock'; }

                // --- Costs / values ---
                field(costAmountExpected; Rec."Cost Amount (Expected)") { Caption = 'Cost Amount (Expected)'; }
                field(costAmountActual; Rec."Cost Amount (Actual)") { Caption = 'Cost Amount (Actual)'; }
                field(costAmountNonInvtbl; Rec."Cost Amount (Non-Invtbl.)") { Caption = 'Cost Amount (Non-Invtbl.)'; }
                field(costAmountExpectedACY; Rec."Cost Amount (Expected) (ACY)") { Caption = 'Cost Amount (Expected) (ACY)'; }
                field(costAmountActualACY; Rec."Cost Amount (Actual) (ACY)") { Caption = 'Cost Amount (Actual) (ACY)'; }
                field(costAmountNonInvtblACY; Rec."Cost Amount (Non-Invtbl.)(ACY)") { Caption = 'Cost Amount (Non-Invtbl.)(ACY)'; }
                field(purchaseAmountExpected; Rec."Purchase Amount (Expected)") { Caption = 'Purchase Amount (Expected)'; }
                field(purchaseAmountActual; Rec."Purchase Amount (Actual)") { Caption = 'Purchase Amount (Actual)'; }
                field(salesAmountExpected; Rec."Sales Amount (Expected)") { Caption = 'Sales Amount (Expected)'; }
                field(salesAmountActual; Rec."Sales Amount (Actual)") { Caption = 'Sales Amount (Actual)'; }
                field(shippedQtyNotReturned; Rec."Shipped Qty. Not Returned") { Caption = 'Shipped Qty. Not Returned'; }

                // --- Tracking ---
                field(lotNo; Rec."Lot No.") { Caption = 'Lot No.'; }
                field(serialNo; Rec."Serial No.") { Caption = 'Serial No.'; }
                field(packageNo; Rec."Package No.") { Caption = 'Package No.'; }
                field(itemTracking; Rec."Item Tracking") { Caption = 'Item Tracking'; }
                field(itemTrackingInt; ItemTrackingInt) { Caption = 'Item Tracking INT'; }
                field(warrantyDate; Rec."Warranty Date") { Caption = 'Warranty Date'; }
                field(expirationDate; Rec."Expiration Date") { Caption = 'Expiration Date'; }

                // --- Dimensions ---
                field(globalDimension1Code; Rec."Global Dimension 1 Code") { Caption = 'Global Dimension 1 Code'; }
                field(globalDimension2Code; Rec."Global Dimension 2 Code") { Caption = 'Global Dimension 2 Code'; }
                field(shortcutDimension3Code; Rec."Shortcut Dimension 3 Code") { Caption = 'Shortcut Dimension 3 Code'; }
                field(shortcutDimension4Code; Rec."Shortcut Dimension 4 Code") { Caption = 'Shortcut Dimension 4 Code'; }
                field(shortcutDimension5Code; Rec."Shortcut Dimension 5 Code") { Caption = 'Shortcut Dimension 5 Code'; }
                field(shortcutDimension6Code; Rec."Shortcut Dimension 6 Code") { Caption = 'Shortcut Dimension 6 Code'; }
                field(shortcutDimension7Code; Rec."Shortcut Dimension 7 Code") { Caption = 'Shortcut Dimension 7 Code'; }
                field(shortcutDimension8Code; Rec."Shortcut Dimension 8 Code") { Caption = 'Shortcut Dimension 8 Code'; }
                field(dimensionSetId; Rec."Dimension Set ID") { Caption = 'Dimension Set ID'; }

                // --- Order / production / job context ---
                field(orderType; Rec."Order Type") { Caption = 'Order Type'; }
                field(orderTypeInt; OrderTypeInt) { Caption = 'Order Type INT'; }
                field(orderNo; Rec."Order No.") { Caption = 'Order No.'; }
                field(orderLineNo; Rec."Order Line No.") { Caption = 'Order Line No.'; }
                field(prodOrderCompLineNo; Rec."Prod. Order Comp. Line No.") { Caption = 'Prod. Order Comp. Line No.'; }
                field(jobNo; Rec."Job No.") { Caption = 'Job No.'; }
                field(jobTaskNo; Rec."Job Task No.") { Caption = 'Job Task No.'; }

                // --- Item / purchasing / references ---
                field(appliesToEntry; Rec."Applies-to Entry") { Caption = 'Applies-to Entry'; }
                field(itemCategoryCode; Rec."Item Category Code") { Caption = 'Item Category Code'; }
                field(purchasingCode; Rec."Purchasing Code") { Caption = 'Purchasing Code'; }
                field(itemReferenceNo; Rec."Item Reference No.") { Caption = 'Item Reference No.'; }
                field(originallyOrderedNo; Rec."Originally Ordered No.") { Caption = 'Originally Ordered No.'; }
                field(originallyOrderedVarCode; Rec."Originally Ordered Var. Code") { Caption = 'Originally Ordered Var. Code'; }
                field(lastInvoiceDate; Rec."Last Invoice Date") { Caption = 'Last Invoice Date'; }

                // --- Trade / logistics ---
                field(shptMethodCode; Rec."Shpt. Method Code") { Caption = 'Shpt. Method Code'; }
                field(transactionType; Rec."Transaction Type") { Caption = 'Transaction Type'; }
                field(transportMethod; Rec."Transport Method") { Caption = 'Transport Method'; }
                field(countryRegionCode; Rec."Country/Region Code") { Caption = 'Country/Region Code'; }
                field(entryExitPoint; Rec."Entry/Exit Point") { Caption = 'Entry/Exit Point'; }
                field(areaPoint; Rec.Area) { Caption = 'Area Point'; }
                field(transactionSpecification; Rec."Transaction Specification") { Caption = 'Transaction Specification'; }
                field(returnReasonCode; Rec."Return Reason Code") { Caption = 'Return Reason Code'; }
                field(noSeries; Rec."No. Series") { Caption = 'No. Series'; }

                // --- System fields ---
                field(systemCreatedAt; Rec.SystemCreatedAt) { Caption = 'SystemCreatedAt'; }
                field(systemCreatedBy; Rec.SystemCreatedBy) { Caption = 'SystemCreatedBy'; }
                field(systemModifiedAt; Rec.SystemModifiedAt) { Caption = 'SystemModifiedAt'; }
                field(systemModifiedBy; Rec.SystemModifiedBy) { Caption = 'SystemModifiedBy'; }
            }
        }
    }

    var
        EntryTypeInt: Integer;
        DocumentTypeInt: Integer;
        SourceTypeInt: Integer;
        OrderTypeInt: Integer;
        ItemTrackingInt: Integer;

        ItemDescTxt: Text[100];
        LocationNameTxt: Text[100];
        SourceNameTxt: Text[100];

    trigger OnAfterGetRecord()
    begin
        EntryTypeInt := Rec."Entry Type".AsInteger();
        DocumentTypeInt := Rec."Document Type".AsInteger();
        SourceTypeInt := Rec."Source Type".AsInteger();
        OrderTypeInt := Rec."Order Type".AsInteger();
        ItemTrackingInt := Rec."Item Tracking".AsInteger();

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