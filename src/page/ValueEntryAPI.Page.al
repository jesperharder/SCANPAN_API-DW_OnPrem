page 50279 "ValueEntryAPI"
{
    /// <summary>
    /// Date        Name                        Version   Description
    /// 2026.03.15  Jesper Harder / DW Suite    002.0     API page for Value Entry (table 5802) – DW-friendly
    /// </summary>

    Caption = 'ValueEntryAPI';
    AdditionalSearchTerms = 'SCANPAN, API, datawarehouse, dw, value entry, costing, inventory';
    UsageCategory = Administration;

    PageType = API;
    APIPublisher = 'scanpan';
    APIGroup = 'datawarehouse';
    APIVersion = 'beta', 'v1.0';

    EntitySetName = 'valueEntries';
    EntityName = 'valueEntry';

    DelayedInsert = true;
    Editable = false;

    SourceTable = "Value Entry";
    SourceTableView = sorting("Entry No.") order(ascending);
    ODataKeyFields = "Entry No.";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                Caption = 'Group';

                // --- Key ---
                field(entryNo; Rec."Entry No.")                                  { Caption = 'Entry No.'; }
                field(systemId; Rec.SystemId)                                    { Caption = 'SystemId'; }

                // --- Identity / relations ---
                field(itemNo; Rec."Item No.")                                    { Caption = 'Item No.'; }
                field(description; Rec.Description)                              { Caption = 'Description'; }
                field(variantCode; Rec."Variant Code")                           { Caption = 'Variant Code'; }
                field(locationCode; Rec."Location Code")                         { Caption = 'Location Code'; }
                field(itemLedgerEntryNo; Rec."Item Ledger Entry No.")            { Caption = 'Item Ledger Entry No.'; }

                // --- Posting / dates ---
                field(postingDate; Rec."Posting Date")                           { Caption = 'Posting Date'; }
                field(documentDate; Rec."Document Date")                         { Caption = 'Document Date'; }
                field(valuationDate; Rec."Valuation Date")                       { Caption = 'Valuation Date'; }

                // --- Document refs ---
                field(documentType; Rec."Document Type")                         { Caption = 'Document Type'; }
                field(documentTypeInt; documentTypeInt)                          { Caption = 'Document Type INT'; }
                field(documentNo; Rec."Document No.")                            { Caption = 'Document No.'; }
                field(documentLineNo; Rec."Document Line No.")                   { Caption = 'Document Line No.'; }
                field(externalDocumentNo; Rec."External Document No.")           { Caption = 'External Document No.'; }

                // --- Entry / source ---
                field(entryType; Rec."Entry Type")                               { Caption = 'Entry Type'; }
                field(entryTypeInt; entryTypeInt)                                { Caption = 'Entry Type INT'; }

                field(itemLedgerEntryType; Rec."Item Ledger Entry Type")         { Caption = 'Item Ledger Entry Type'; }
                field(itemLedgerEntryTypeInt; itemLedgerEntryTypeInt)            { Caption = 'Item Ledger Entry Type INT'; }

                field(sourceType; Rec."Source Type")                             { Caption = 'Source Type'; }
                field(sourceTypeInt; sourceTypeInt)                              { Caption = 'Source Type INT'; }
                field(sourceNo; Rec."Source No.")                                { Caption = 'Source No.'; }
                field(sourceCode; Rec."Source Code")                             { Caption = 'Source Code'; }

                field(orderType; Rec."Order Type")                               { Caption = 'Order Type'; }
                field(orderTypeInt; orderTypeInt)                                { Caption = 'Order Type INT'; }
                field(orderNo; Rec."Order No.")                                  { Caption = 'Order No.'; }
                field(orderLineNo; Rec."Order Line No.")                         { Caption = 'Order Line No.'; }

                field(varianceType; Rec."Variance Type")                         { Caption = 'Variance Type'; }
                field(varianceTypeInt; varianceTypeInt)                          { Caption = 'Variance Type INT'; }

                // --- Dimensions / posting groups ---
                field(globalDim1Code; Rec."Global Dimension 1 Code")             { Caption = 'Global Dimension 1 Code'; }
                field(globalDim2Code; Rec."Global Dimension 2 Code")             { Caption = 'Global Dimension 2 Code'; }
                field(shortcutDimension3Code; Rec."Shortcut Dimension 3 Code")   { Caption = 'Shortcut Dimension 3 Code'; }
                field(shortcutDimension4Code; Rec."Shortcut Dimension 4 Code")   { Caption = 'Shortcut Dimension 4 Code'; }
                field(shortcutDimension5Code; Rec."Shortcut Dimension 5 Code")   { Caption = 'Shortcut Dimension 5 Code'; }
                field(shortcutDimension6Code; Rec."Shortcut Dimension 6 Code")   { Caption = 'Shortcut Dimension 6 Code'; }
                field(shortcutDimension7Code; Rec."Shortcut Dimension 7 Code")   { Caption = 'Shortcut Dimension 7 Code'; }
                field(shortcutDimension8Code; Rec."Shortcut Dimension 8 Code")   { Caption = 'Shortcut Dimension 8 Code'; }
                field(dimensionSetId; Rec."Dimension Set ID")                    { Caption = 'Dimension Set ID'; }

                field(inventoryPostingGroup; Rec."Inventory Posting Group")      { Caption = 'Inventory Posting Group'; }
                field(sourcePostingGroup; Rec."Source Posting Group")            { Caption = 'Source Posting Group'; }
                field(genBusPostingGroup; Rec."Gen. Bus. Posting Group")         { Caption = 'Gen. Bus. Posting Group'; }
                field(genProdPostingGroup; Rec."Gen. Prod. Posting Group")       { Caption = 'Gen. Prod. Posting Group'; }

                // --- Quantities & values ---
                field(valuedQuantity; Rec."Valued Quantity")                     { Caption = 'Valued Quantity'; }
                field(itemLedgerEntryQuantity; Rec."Item Ledger Entry Quantity") { Caption = 'Item Ledger Entry Quantity'; }
                field(invoicedQuantity; Rec."Invoiced Quantity")                 { Caption = 'Invoiced Quantity'; }
                field(costPerUnit; Rec."Cost per Unit")                          { Caption = 'Cost per Unit'; }
                field(costPerUnitACY; Rec."Cost per Unit (ACY)")                 { Caption = 'Cost per Unit (ACY)'; }

                field(costAmountActual; Rec."Cost Amount (Actual)")              { Caption = 'Cost Amount (Actual)'; }
                field(costAmountExpected; Rec."Cost Amount (Expected)")          { Caption = 'Cost Amount (Expected)'; }
                field(costAmountNonInvtbl; Rec."Cost Amount (Non-Invtbl.)")      { Caption = 'Cost Amount (Non-Invtbl.)'; }
                field(costPostedToGL; Rec."Cost Posted to G/L")                  { Caption = 'Cost Posted to G/L'; }
                field(expectedCostPostedToGL; Rec."Expected Cost Posted to G/L") { Caption = 'Expected Cost Posted to G/L'; }

                field(costAmountActualACY; Rec."Cost Amount (Actual) (ACY)")         { Caption = 'Cost Amount (Actual) (ACY)'; }
                field(costAmountExpectedACY; Rec."Cost Amount (Expected) (ACY)")     { Caption = 'Cost Amount (Expected) (ACY)'; }
                field(costAmountNonInvtblACY; Rec."Cost Amount (Non-Invtbl.)(ACY)")  { Caption = 'Cost Amount (Non-Invtbl.)(ACY)'; }
                field(costPostedToGLACY; Rec."Cost Posted to G/L (ACY)")             { Caption = 'Cost Posted to G/L (ACY)'; }
                field(expCostPostedToGLACY; Rec."Exp. Cost Posted to G/L (ACY)")     { Caption = 'Exp. Cost Posted to G/L (ACY)'; }

                field(salesAmountActual; Rec."Sales Amount (Actual)")            { Caption = 'Sales Amount (Actual)'; }
                field(salesAmountExpected; Rec."Sales Amount (Expected)")        { Caption = 'Sales Amount (Expected)'; }
                field(purchaseAmountActual; Rec."Purchase Amount (Actual)")      { Caption = 'Purchase Amount (Actual)'; }
                field(purchaseAmountExpected; Rec."Purchase Amount (Expected)")  { Caption = 'Purchase Amount (Expected)'; }
                field(discountAmount; Rec."Discount Amount")                     { Caption = 'Discount Amount'; }

                // --- Misc ---
                field(appliesToEntry; Rec."Applies-to Entry")                    { Caption = 'Applies-to Entry'; }
                field(itemChargeNo; Rec."Item Charge No.")                       { Caption = 'Item Charge No.'; }
                field(reasonCode; Rec."Reason Code")                             { Caption = 'Reason Code'; }
                field(dropShipment; Rec."Drop Shipment")                         { Caption = 'Drop Shipment'; }
                field(journalBatchName; Rec."Journal Batch Name")                { Caption = 'Journal Batch Name'; }
                field(expectedCost; Rec."Expected Cost")                         { Caption = 'Expected Cost'; }
                field(valuedByAverageCost; Rec."Valued By Average Cost")         { Caption = 'Valued By Average Cost'; }
                field(partialRevaluation; Rec."Partial Revaluation")             { Caption = 'Partial Revaluation'; }
                field(inventoriable; Rec.Inventoriable)                          { Caption = 'Inventoriable'; }
                field(adjustment; Rec.Adjustment)                                { Caption = 'Adjustment'; }
                field(averageCostException; Rec."Average Cost Exception")        { Caption = 'Average Cost Exception'; }
                field(userId; Rec."User ID")                                     { Caption = 'User ID'; }
                field(salespersPurchCode; Rec."Salespers./Purch. Code")          { Caption = 'Salespers./Purch. Code'; }

                // --- Job / capacity ---
                field(jobNo; Rec."Job No.")                                      { Caption = 'Job No.'; }
                field(jobTaskNo; Rec."Job Task No.")                             { Caption = 'Job Task No.'; }
                field(jobLedgerEntryNo; Rec."Job Ledger Entry No.")              { Caption = 'Job Ledger Entry No.'; }
                field(capacityLedgerEntryNo; Rec."Capacity Ledger Entry No.")    { Caption = 'Capacity Ledger Entry No.'; }
                field(type; Rec.Type)                                            { Caption = 'Type'; }
                field(typeInt; typeInt)                                          { Caption = 'Type INT'; }
                field(no; Rec."No.")                                             { Caption = 'No.'; }
                field(returnReasonCode; Rec."Return Reason Code")                { Caption = 'Return Reason Code'; }

                // --- System fields ---
                field(systemCreatedAt; Rec.SystemCreatedAt)                      { Caption = 'SystemCreatedAt'; }
                field(systemCreatedBy; Rec.SystemCreatedBy)                      { Caption = 'SystemCreatedBy'; }
                field(systemModifiedAt; Rec.SystemModifiedAt)                    { Caption = 'SystemModifiedAt'; }
                field(systemModifiedBy; Rec.SystemModifiedBy)                    { Caption = 'SystemModifiedBy'; }
            }
        }
    }

    var
        entryTypeInt: Integer;
        sourceTypeInt: Integer;
        documentTypeInt: Integer;
        itemLedgerEntryTypeInt: Integer;
        orderTypeInt: Integer;
        varianceTypeInt: Integer;
        typeInt: Integer;

    trigger OnOpenPage()
    begin
        Rec.SetAutoCalcFields(
            "Shortcut Dimension 3 Code",
            "Shortcut Dimension 4 Code",
            "Shortcut Dimension 5 Code",
            "Shortcut Dimension 6 Code",
            "Shortcut Dimension 7 Code",
            "Shortcut Dimension 8 Code");
    end;

    trigger OnAfterGetRecord()
    begin
        entryTypeInt := Rec."Entry Type".AsInteger();
        sourceTypeInt := Rec."Source Type".AsInteger();
        documentTypeInt := Rec."Document Type".AsInteger();
        itemLedgerEntryTypeInt := Rec."Item Ledger Entry Type".AsInteger();
        orderTypeInt := Rec."Order Type".AsInteger();
        varianceTypeInt := Rec."Variance Type".AsInteger();
        typeInt := Rec.Type.AsInteger();
    end;
}