page 50251 "PurchaseLineAPI"
{
    /// <summary>
    /// Date        Name                        Version   Description
    /// 2026.03.15  Jesper Harder / DW Suite    002.0     API page for Purchase Line (table 39) – DW-friendly
    /// </summary>

    Caption = 'PurchaseLineAPI';
    AdditionalSearchTerms = 'SCANPAN, API, datawarehouse, dw, purchase line, purchase document line';
    UsageCategory = Administration;

    PageType = API;
    APIPublisher = 'scanpan';
    APIGroup = 'datawarehouse';
    APIVersion = 'beta', 'v1.0';

    EntitySetName = 'purchaseLines';
    EntityName = 'purchaseLine';

    DelayedInsert = true;
    Editable = false;

    SourceTable = "Purchase Line";
    SourceTableView = sorting("Document Type", "Document No.", "Line No.") order(ascending);
    ODataKeyFields = "Document Type", "Document No.", "Line No.";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                Caption = 'Group';

                // --- Natural key / identity ---
                field(documentType; Rec."Document Type")                           { Caption = 'Document Type'; }
                field(documentTypeInt; documentTypeInt)                            { Caption = 'Document Type INT'; }
                field(documentNo; Rec."Document No.")                              { Caption = 'Document No.'; }
                field(lineNo; Rec."Line No.")                                      { Caption = 'Line No.'; }
                field(systemId; Rec.SystemId)                                      { Caption = 'SystemId'; }

                // --- Vendor / document relation ---
                field(buyFromVendorNo; Rec."Buy-from Vendor No.")                  { Caption = 'Buy-from Vendor No.'; }
                field(payToVendorNo; Rec."Pay-to Vendor No.")                      { Caption = 'Pay-to Vendor No.'; }
                field(orderNo; Rec."Order No.")                                    { Caption = 'Order No.'; }
                field(orderLineNo; Rec."Order Line No.")                           { Caption = 'Order Line No.'; }
                field(blanketOrderNo; Rec."Blanket Order No.")                     { Caption = 'Blanket Order No.'; }
                field(blanketOrderLineNo; Rec."Blanket Order Line No.")            { Caption = 'Blanket Order Line No.'; }
                field(receiptNo; Rec."Receipt No.")                                { Caption = 'Receipt No.'; }
                field(receiptLineNo; Rec."Receipt Line No.")                       { Caption = 'Receipt Line No.'; }
                field(returnShipmentNo; Rec."Return Shipment No.")                 { Caption = 'Return Shipment No.'; }
                field(returnShipmentLineNo; Rec."Return Shipment Line No.")        { Caption = 'Return Shipment Line No.'; }

                // --- Line identity ---
                field(type; Rec.Type)                                              { Caption = 'Type'; }
                field(typeInt; typeInt)                                            { Caption = 'Type INT'; }
                field(no; Rec."No.")                                               { Caption = 'No.'; }
                field(variantCode; Rec."Variant Code")                             { Caption = 'Variant Code'; }
                field(description; Rec.Description)                                { Caption = 'Description'; }
                field(description2; Rec."Description 2")                           { Caption = 'Description 2'; }
                field(unitOfMeasureCode; Rec."Unit of Measure Code")               { Caption = 'Unit of Measure Code'; }
                field(unitOfMeasure; Rec."Unit of Measure")                        { Caption = 'Unit of Measure'; }
                field(qtyPerUnitOfMeasure; Rec."Qty. per Unit of Measure")         { Caption = 'Qty. per Unit of Measure'; }

                // --- Location / inventory / planning ---
                field(locationCode; Rec."Location Code")                           { Caption = 'Location Code'; }
                field(binCode; Rec."Bin Code")                                     { Caption = 'Bin Code'; }
                field(postingGroup; Rec."Posting Group")                           { Caption = 'Posting Group'; }
                field(expectedReceiptDate; Rec."Expected Receipt Date")            { Caption = 'Expected Receipt Date'; }
                field(requestedReceiptDate; Rec."Requested Receipt Date")          { Caption = 'Requested Receipt Date'; }
                field(promisedReceiptDate; Rec."Promised Receipt Date")            { Caption = 'Promised Receipt Date'; }
                field(plannedReceiptDate; Rec."Planned Receipt Date")              { Caption = 'Planned Receipt Date'; }
                field(orderDate; Rec."Order Date")                                 { Caption = 'Order Date'; }
                field(leadTimeCalculation; format(Rec."Lead Time Calculation"))    { Caption = 'Lead Time Calculation'; }
                field(inboundWhseHandlingTime; format(Rec."Inbound Whse. Handling Time")) { Caption = 'Inbound Whse. Handling Time'; }
                field(safetyLeadTime; format(Rec."Safety Lead Time"))              { Caption = 'Safety Lead Time'; }

                // --- Quantities ---
                field(quantity; Rec.Quantity)                                      { Caption = 'Quantity'; }
                field(quantityBase; Rec."Quantity (Base)")                         { Caption = 'Quantity (Base)'; }
                field(outstandingQuantity; Rec."Outstanding Quantity")             { Caption = 'Outstanding Quantity'; }
                field(outstandingQtyBase; Rec."Outstanding Qty. (Base)")           { Caption = 'Outstanding Qty. (Base)'; }
                field(qtyToInvoice; Rec."Qty. to Invoice")                         { Caption = 'Qty. to Invoice'; }
                field(qtyToInvoiceBase; Rec."Qty. to Invoice (Base)")              { Caption = 'Qty. to Invoice (Base)'; }
                field(qtyToReceive; Rec."Qty. to Receive")                         { Caption = 'Qty. to Receive'; }
                field(qtyToReceiveBase; Rec."Qty. to Receive (Base)")              { Caption = 'Qty. to Receive (Base)'; }
                field(quantityReceived; Rec."Quantity Received")                   { Caption = 'Quantity Received'; }
                field(qtyReceivedBase; Rec."Qty. Received (Base)")                 { Caption = 'Qty. Received (Base)'; }
                field(quantityInvoiced; Rec."Quantity Invoiced")                   { Caption = 'Quantity Invoiced'; }
                field(qtyInvoicedBase; Rec."Qty. Invoiced (Base)")                 { Caption = 'Qty. Invoiced (Base)'; }
                field(qtyRcdNotInvoiced; Rec."Qty. Rcd. Not Invoiced")             { Caption = 'Qty. Rcd. Not Invoiced'; }
                field(qtyRcdNotInvoicedBase; Rec."Qty. Rcd. Not Invoiced (Base)")  { Caption = 'Qty. Rcd. Not Invoiced (Base)'; }

                field(returnQtyToShip; Rec."Return Qty. to Ship")                  { Caption = 'Return Qty. to Ship'; }
                field(returnQtyToShipBase; Rec."Return Qty. to Ship (Base)")       { Caption = 'Return Qty. to Ship (Base)'; }
                field(returnQtyShipped; Rec."Return Qty. Shipped")                 { Caption = 'Return Qty. Shipped'; }
                field(returnQtyShippedBase; Rec."Return Qty. Shipped (Base)")      { Caption = 'Return Qty. Shipped (Base)'; }
                field(returnQtyShippedNotInvd; Rec."Return Qty. Shipped Not Invd.") { Caption = 'Return Qty. Shipped Not Invd.'; }
                field(retQtyShpdNotInvdBase; Rec."Ret. Qty. Shpd Not Invd.(Base)") { Caption = 'Ret. Qty. Shpd Not Invd.(Base)'; }

                field(reservedQuantity; Rec."Reserved Quantity")                   { Caption = 'Reserved Quantity'; }
                field(reservedQtyBase; Rec."Reserved Qty. (Base)")                 { Caption = 'Reserved Qty. (Base)'; }
                field(whseOutstandingQtyBase; Rec."Whse. Outstanding Qty. (Base)") { Caption = 'Whse. Outstanding Qty. (Base)'; }

                // --- Pricing / amounts ---
                field(directUnitCost; Rec."Direct Unit Cost")                      { Caption = 'Direct Unit Cost'; }
                field(unitCost; Rec."Unit Cost")                                   { Caption = 'Unit Cost'; }
                field(unitCostLCY; Rec."Unit Cost (LCY)")                          { Caption = 'Unit Cost (LCY)'; }
                field(unitPriceLCY; Rec."Unit Price (LCY)")                        { Caption = 'Unit Price (LCY)'; }
                field(lineDiscountPercent; Rec."Line Discount %")                  { Caption = 'Line Discount %'; }
                field(lineDiscountAmount; Rec."Line Discount Amount")              { Caption = 'Line Discount Amount'; }
                field(invDiscountAmount; Rec."Inv. Discount Amount")               { Caption = 'Inv. Discount Amount'; }
                field(invDiscAmountToInvoice; Rec."Inv. Disc. Amount to Invoice")  { Caption = 'Inv. Disc. Amount to Invoice'; }
                field(lineAmount; Rec."Line Amount")                               { Caption = 'Line Amount'; }
                field(amount; Rec.Amount)                                          { Caption = 'Amount'; }
                field(amountIncludingVAT; Rec."Amount Including VAT")              { Caption = 'Amount Including VAT'; }
                field(vatBaseAmount; Rec."VAT Base Amount")                        { Caption = 'VAT Base Amount'; }
                field(vatDifference; Rec."VAT Difference")                         { Caption = 'VAT Difference'; }
                field(outstandingAmount; Rec."Outstanding Amount")                 { Caption = 'Outstanding Amount'; }
                field(outstandingAmountLCY; Rec."Outstanding Amount (LCY)")        { Caption = 'Outstanding Amount (LCY)'; }
                field(outstandingAmtExVATLCY; Rec."Outstanding Amt. Ex. VAT (LCY)") { Caption = 'Outstanding Amt. Ex. VAT (LCY)'; }
                field(amtRcdNotInvoiced; Rec."Amt. Rcd. Not Invoiced")             { Caption = 'Amt. Rcd. Not Invoiced'; }
                field(amtRcdNotInvoicedLCY; Rec."Amt. Rcd. Not Invoiced (LCY)")    { Caption = 'Amt. Rcd. Not Invoiced (LCY)'; }
                field(returnShpdNotInvd; Rec."Return Shpd. Not Invd.")             { Caption = 'Return Shpd. Not Invd.'; }
                field(returnShpdNotInvdLCY; Rec."Return Shpd. Not Invd. (LCY)")    { Caption = 'Return Shpd. Not Invd. (LCY)'; }

                // --- Posting / VAT / tax ---
                field(genBusPostingGroup; Rec."Gen. Bus. Posting Group")           { Caption = 'Gen. Bus. Posting Group'; }
                field(genProdPostingGroup; Rec."Gen. Prod. Posting Group")         { Caption = 'Gen. Prod. Posting Group'; }
                field(vatBusPostingGroup; Rec."VAT Bus. Posting Group")            { Caption = 'VAT Bus. Posting Group'; }
                field(vatProdPostingGroup; Rec."VAT Prod. Posting Group")          { Caption = 'VAT Prod. Posting Group'; }
                field(vatCalculationType; Rec."VAT Calculation Type")              { Caption = 'VAT Calculation Type'; }
                field(vatCalculationTypeInt; vatCalculationTypeInt)                { Caption = 'VAT Calculation Type INT'; }
                field(vatPercent; Rec."VAT %")                                     { Caption = 'VAT %'; }
                field(vatIdentifier; Rec."VAT Identifier")                         { Caption = 'VAT Identifier'; }
                field(currencyCode; Rec."Currency Code")                           { Caption = 'Currency Code'; }
                field(taxAreaCode; Rec."Tax Area Code")                            { Caption = 'Tax Area Code'; }
                field(taxGroupCode; Rec."Tax Group Code")                          { Caption = 'Tax Group Code'; }
                field(taxLiable; Rec."Tax Liable")                                 { Caption = 'Tax Liable'; }
                field(useTax; Rec."Use Tax")                                       { Caption = 'Use Tax'; }

                // --- Dimensions ---
                field(shortcutDimension1Code; Rec."Shortcut Dimension 1 Code")     { Caption = 'Shortcut Dimension 1 Code'; }
                field(shortcutDimension2Code; Rec."Shortcut Dimension 2 Code")     { Caption = 'Shortcut Dimension 2 Code'; }
                field(dimensionSetId; Rec."Dimension Set ID")                      { Caption = 'Dimension Set ID'; }

                // --- Logistics / references ---
                field(dropShipment; Rec."Drop Shipment")                           { Caption = 'Drop Shipment'; }
                field(specialOrder; Rec."Special Order")                           { Caption = 'Special Order'; }
                field(salesOrderNo; Rec."Sales Order No.")                         { Caption = 'Sales Order No.'; }
                field(salesOrderLineNo; Rec."Sales Order Line No.")                { Caption = 'Sales Order Line No.'; }
                field(specialOrderSalesNo; Rec."Special Order Sales No.")          { Caption = 'Special Order Sales No.'; }
                field(specialOrderSalesLineNo; Rec."Special Order Sales Line No.") { Caption = 'Special Order Sales Line No.'; }
                field(itemReferenceNo; Rec."Item Reference No.")                   { Caption = 'Item Reference No.'; }
                field(vendorItemNo; Rec."Vendor Item No.")                         { Caption = 'Vendor Item No.'; }
                field(itemCategoryCode; Rec."Item Category Code")                  { Caption = 'Item Category Code'; }
                field(purchasingCode; Rec."Purchasing Code")                       { Caption = 'Purchasing Code'; }
                field(returnReasonCode; Rec."Return Reason Code")                  { Caption = 'Return Reason Code'; }
                field(attachedToLineNo; Rec."Attached to Line No.")                { Caption = 'Attached to Line No.'; }
                field(attachedDocCount; Rec."Attached Doc Count")                  { Caption = 'Attached Doc Count'; }
                field(completelyReceived; Rec."Completely Received")                { Caption = 'Completely Received'; }

                // --- Job / FA / prod. ---
                field(jobNo; Rec."Job No.")                                        { Caption = 'Job No.'; }
                field(jobTaskNo; Rec."Job Task No.")                               { Caption = 'Job Task No.'; }
                field(jobPlanningLineNo; Rec."Job Planning Line No.")              { Caption = 'Job Planning Line No.'; }
                field(jobLineType; Rec."Job Line Type")                            { Caption = 'Job Line Type'; }
                field(jobLineTypeInt; jobLineTypeInt)                              { Caption = 'Job Line Type INT'; }
                field(prodOrderNo; Rec."Prod. Order No.")                          { Caption = 'Prod. Order No.'; }
                field(prodOrderLineNo; Rec."Prod. Order Line No.")                 { Caption = 'Prod. Order Line No.'; }
                field(routingNo; Rec."Routing No.")                                { Caption = 'Routing No.'; }
                field(operationNo; Rec."Operation No.")                            { Caption = 'Operation No.'; }
                field(workCenterNo; Rec."Work Center No.")                         { Caption = 'Work Center No.'; }
                field(faPostingType; format(Rec."FA Posting Type"))                { Caption = 'FA Posting Type'; }

                // --- Over-receipt ---
                field(overReceiptQuantity; Rec."Over-Receipt Quantity")            { Caption = 'Over-Receipt Quantity'; }
                field(overReceiptCode; Rec."Over-Receipt Code")                    { Caption = 'Over-Receipt Code'; }
                field(overReceiptApprovalStatus; Rec."Over-Receipt Approval Status") { Caption = 'Over-Receipt Approval Status'; }
                field(overReceiptApprovalStatusInt; overReceiptApprovalStatusInt)  { Caption = 'Over-Receipt Approval Status INT'; }

                // --- System audit ---
                field(systemCreatedAt; Rec.SystemCreatedAt)                        { Caption = 'SystemCreatedAt'; }
                field(systemCreatedBy; Rec.SystemCreatedBy)                        { Caption = 'SystemCreatedBy'; }
                field(systemModifiedAt; Rec.SystemModifiedAt)                      { Caption = 'SystemModifiedAt'; }
                field(systemModifiedBy; Rec.SystemModifiedBy)                      { Caption = 'SystemModifiedBy'; }
            }
        }
    }

    var
        documentTypeInt: Integer;
        typeInt: Integer;
        vatCalculationTypeInt: Integer;
        jobLineTypeInt: Integer;
        overReceiptApprovalStatusInt: Integer;

    trigger OnOpenPage()
    begin
        Rec.SetAutoCalcFields(
            "Reserved Quantity",
            "Reserved Qty. (Base)",
            "Whse. Outstanding Qty. (Base)",
            "Attached Doc Count");
    end;

    trigger OnAfterGetRecord()
    begin
        documentTypeInt := Rec."Document Type".AsInteger();
        typeInt := Rec.Type.AsInteger();
        vatCalculationTypeInt := Rec."VAT Calculation Type".AsInteger();
        jobLineTypeInt := Rec."Job Line Type".AsInteger();
        overReceiptApprovalStatusInt := Rec."Over-Receipt Approval Status".AsInteger();
    end;
}