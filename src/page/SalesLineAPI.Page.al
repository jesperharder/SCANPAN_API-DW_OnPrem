page 50262 "SalesLineAPI"
{
    /// <summary>
    /// Date        Name                        Version   Description
    /// 2026.03.25  Jesper Harder / Codex       002.0     API page for Sales Line (table 37) - DW-friendly
    /// </summary>

    Caption = 'SalesLineAPI';
    AdditionalSearchTerms = 'SCANPAN, API, datawarehouse, dw, sales line, sales document line';
    UsageCategory = Administration;

    PageType = API;
    APIPublisher = 'scanpan';
    APIGroup = 'datawarehouse';
    APIVersion = 'beta', 'v1.0';

    EntitySetName = 'salesLines';
    EntityName = 'salesLine';

    DelayedInsert = true;
    Editable = false;

    SourceTable = "Sales Line";
    SourceTableView = sorting(SystemId) order(ascending);
    ODataKeyFields = SystemId;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                Caption = 'Group';

                // --- OData / tracking ---
                field(systemId; Rec.SystemId) { Caption = 'SystemId'; }

                // --- Natural business identity ---
                field(documentType; Rec."Document Type") { Caption = 'Document Type'; }
                field(documentTypeInt; DocumentTypeInt) { Caption = 'Document Type INT'; }
                field(documentNo; Rec."Document No.") { Caption = 'Document No.'; }
                field(lineNo; Rec."Line No.") { Caption = 'Line No.'; }

                // --- Customer / related document references ---
                field(sellToCustomerNo; Rec."Sell-to Customer No.") { Caption = 'Sell-to Customer No.'; }
                field(billToCustomerNo; Rec."Bill-to Customer No.") { Caption = 'Bill-to Customer No.'; }
                field(blanketOrderNo; Rec."Blanket Order No.") { Caption = 'Blanket Order No.'; }
                field(blanketOrderLineNo; Rec."Blanket Order Line No.") { Caption = 'Blanket Order Line No.'; }
                field(shipmentNo; Rec."Shipment No.") { Caption = 'Shipment No.'; }
                field(shipmentLineNo; Rec."Shipment Line No.") { Caption = 'Shipment Line No.'; }
                field(returnReceiptNo; Rec."Return Receipt No.") { Caption = 'Return Receipt No.'; }
                field(returnReceiptLineNo; Rec."Return Receipt Line No.") { Caption = 'Return Receipt Line No.'; }
                field(purchaseOrderNo; Rec."Purchase Order No.") { Caption = 'Purchase Order No.'; }
                field(purchOrderLineNo; Rec."Purch. Order Line No.") { Caption = 'Purch. Order Line No.'; }
                field(specialOrderPurchaseNo; Rec."Special Order Purchase No.") { Caption = 'Special Order Purchase No.'; }
                field(specialOrderPurchLineNo; Rec."Special Order Purch. Line No.") { Caption = 'Special Order Purch. Line No.'; }
                field(attachedToLineNo; Rec."Attached to Line No.") { Caption = 'Attached to Line No.'; }

                // --- Line identity ---
                field(type; Rec.Type) { Caption = 'Type'; }
                field(typeInt; TypeInt) { Caption = 'Type INT'; }
                field(no; Rec."No.") { Caption = 'No.'; }
                field(variantCode; Rec."Variant Code") { Caption = 'Variant Code'; }
                field(description; Rec.Description) { Caption = 'Description'; }
                field(description2; Rec."Description 2") { Caption = 'Description 2'; }
                field(subtype; Rec.Subtype) { Caption = 'Subtype'; }
                field(subtypeInt; SubtypeInt) { Caption = 'Subtype INT'; }

                // --- Location / UoM / inventory identity ---
                field(locationCode; Rec."Location Code") { Caption = 'Location Code'; }
                field(binCode; Rec."Bin Code") { Caption = 'Bin Code'; }
                field(unitOfMeasureCode; Rec."Unit of Measure Code") { Caption = 'Unit of Measure Code'; }
                field(unitOfMeasure; Rec."Unit of Measure") { Caption = 'Unit of Measure'; }
                field(qtyPerUnitOfMeasure; Rec."Qty. per Unit of Measure") { Caption = 'Qty. per Unit of Measure'; }
                field(postingGroup; Rec."Posting Group") { Caption = 'Posting Group'; }

                // --- Dates / planning ---
                field(postingDate; Rec."Posting Date") { Caption = 'Posting Date'; }
                field(shipmentDate; Rec."Shipment Date") { Caption = 'Shipment Date'; }
                field(requestedDeliveryDate; Rec."Requested Delivery Date") { Caption = 'Requested Delivery Date'; }
                field(promisedDeliveryDate; Rec."Promised Delivery Date") { Caption = 'Promised Delivery Date'; }
                field(plannedShipmentDate; Rec."Planned Shipment Date") { Caption = 'Planned Shipment Date'; }
                field(plannedDeliveryDate; Rec."Planned Delivery Date") { Caption = 'Planned Delivery Date'; }
                field(shippingTime; Format(Rec."Shipping Time")) { Caption = 'Shipping Time'; }
                field(outboundWhseHandlingTime; Format(Rec."Outbound Whse. Handling Time")) { Caption = 'Outbound Whse. Handling Time'; }

                // --- Quantities ---
                field(quantity; Rec.Quantity) { Caption = 'Quantity'; }
                field(quantityBase; Rec."Quantity (Base)") { Caption = 'Quantity (Base)'; }
                field(outstandingQuantity; Rec."Outstanding Quantity") { Caption = 'Outstanding Quantity'; }
                field(outstandingQtyBase; Rec."Outstanding Qty. (Base)") { Caption = 'Outstanding Qty. (Base)'; }
                field(qtyToInvoice; Rec."Qty. to Invoice") { Caption = 'Qty. to Invoice'; }
                field(qtyToInvoiceBase; Rec."Qty. to Invoice (Base)") { Caption = 'Qty. to Invoice (Base)'; }
                field(qtyToShip; Rec."Qty. to Ship") { Caption = 'Qty. to Ship'; }
                field(qtyToShipBase; Rec."Qty. to Ship (Base)") { Caption = 'Qty. to Ship (Base)'; }
                field(quantityShipped; Rec."Quantity Shipped") { Caption = 'Quantity Shipped'; }
                field(qtyShippedBase; Rec."Qty. Shipped (Base)") { Caption = 'Qty. Shipped (Base)'; }
                field(qtyShippedNotInvoiced; Rec."Qty. Shipped Not Invoiced") { Caption = 'Qty. Shipped Not Invoiced'; }
                field(qtyShippedNotInvdBase; Rec."Qty. Shipped Not Invd. (Base)") { Caption = 'Qty. Shipped Not Invd. (Base)'; }
                field(quantityInvoiced; Rec."Quantity Invoiced") { Caption = 'Quantity Invoiced'; }
                field(qtyInvoicedBase; Rec."Qty. Invoiced (Base)") { Caption = 'Qty. Invoiced (Base)'; }
                field(returnQtyToReceive; Rec."Return Qty. to Receive") { Caption = 'Return Qty. to Receive'; }
                field(returnQtyToReceiveBase; Rec."Return Qty. to Receive (Base)") { Caption = 'Return Qty. to Receive (Base)'; }
                field(returnQtyReceived; Rec."Return Qty. Received") { Caption = 'Return Qty. Received'; }
                field(returnQtyReceivedBase; Rec."Return Qty. Received (Base)") { Caption = 'Return Qty. Received (Base)'; }
                field(returnQtyRcdNotInvd; Rec."Return Qty. Rcd. Not Invd.") { Caption = 'Return Qty. Rcd. Not Invd.'; }
                field(retQtyRcdNotInvdBase; Rec."Ret. Qty. Rcd. Not Invd.(Base)") { Caption = 'Ret. Qty. Rcd. Not Invd.(Base)'; }
                field(qtyToAssign; Rec."Qty. to Assign") { Caption = 'Qty. to Assign'; }
                field(qtyAssigned; Rec."Qty. Assigned") { Caption = 'Qty. Assigned'; }
                field(reservedQuantity; Rec."Reserved Quantity") { Caption = 'Reserved Quantity'; }
                field(reservedQtyBase; Rec."Reserved Qty. (Base)") { Caption = 'Reserved Qty. (Base)'; }
                field(qtyToAssembleToOrder; Rec."Qty. to Assemble to Order") { Caption = 'Qty. to Assemble to Order'; }
                field(qtyToAsmToOrderBase; Rec."Qty. to Asm. to Order (Base)") { Caption = 'Qty. to Asm. to Order (Base)'; }
                field(whseOutstandingQty; Rec."Whse. Outstanding Qty.") { Caption = 'Whse. Outstanding Qty.'; }
                field(whseOutstandingQtyBase; Rec."Whse. Outstanding Qty. (Base)") { Caption = 'Whse. Outstanding Qty. (Base)'; }
                field(atoWhseOutstandingQty; Rec."ATO Whse. Outstanding Qty.") { Caption = 'ATO Whse. Outstanding Qty.'; }
                field(atoWhseOutstandingQtyBase; Rec."ATO Whse. Outstd. Qty. (Base)") { Caption = 'ATO Whse. Outstd. Qty. (Base)'; }
                field(grossWeight; Rec."Gross Weight") { Caption = 'Gross Weight'; }
                field(netWeight; Rec."Net Weight") { Caption = 'Net Weight'; }
                field(unitsPerParcel; Rec."Units per Parcel") { Caption = 'Units per Parcel'; }
                field(unitVolume; Rec."Unit Volume") { Caption = 'Unit Volume'; }

                // --- Pricing / amounts ---
                field(unitPrice; Rec."Unit Price") { Caption = 'Unit Price'; }
                field(unitCost; Rec."Unit Cost") { Caption = 'Unit Cost'; }
                field(unitCostLCY; Rec."Unit Cost (LCY)") { Caption = 'Unit Cost (LCY)'; }
                field(vatPercent; Rec."VAT %") { Caption = 'VAT %'; }
                field(profitPercent; Rec."Profit %") { Caption = 'Profit %'; }
                field(lineDiscountPercent; Rec."Line Discount %") { Caption = 'Line Discount %'; }
                field(lineDiscountAmount; Rec."Line Discount Amount") { Caption = 'Line Discount Amount'; }
                field(invDiscountAmount; Rec."Inv. Discount Amount") { Caption = 'Inv. Discount Amount'; }
                field(invDiscAmountToInvoice; Rec."Inv. Disc. Amount to Invoice") { Caption = 'Inv. Disc. Amount to Invoice'; }
                field(lineAmount; Rec."Line Amount") { Caption = 'Line Amount'; }
                field(amount; Rec.Amount) { Caption = 'Amount'; }
                field(amountIncludingVAT; Rec."Amount Including VAT") { Caption = 'Amount Including VAT'; }
                field(vatBaseAmount; Rec."VAT Base Amount") { Caption = 'VAT Base Amount'; }
                field(vatDifference; Rec."VAT Difference") { Caption = 'VAT Difference'; }
                field(outstandingAmount; Rec."Outstanding Amount") { Caption = 'Outstanding Amount'; }
                field(outstandingAmountLCY; Rec."Outstanding Amount (LCY)") { Caption = 'Outstanding Amount (LCY)'; }
                field(shippedNotInvoiced; Rec."Shipped Not Invoiced") { Caption = 'Shipped Not Invoiced'; }
                field(shippedNotInvoicedLCY; Rec."Shipped Not Invoiced (LCY)") { Caption = 'Shipped Not Invoiced (LCY)'; }
                field(shippedNotInvLCYNoVAT; Rec."Shipped Not Inv. (LCY) No VAT") { Caption = 'Shipped Not Inv. (LCY) No VAT'; }
                field(returnRcdNotInvd; Rec."Return Rcd. Not Invd.") { Caption = 'Return Rcd. Not Invd.'; }
                field(returnRcdNotInvdLCY; Rec."Return Rcd. Not Invd. (LCY)") { Caption = 'Return Rcd. Not Invd. (LCY)'; }
                field(prepaymentPercent; Rec."Prepayment %") { Caption = 'Prepayment %'; }
                field(prepmtLineAmount; Rec."Prepmt. Line Amount") { Caption = 'Prepmt. Line Amount'; }
                field(prepmtAmtInv; Rec."Prepmt. Amt. Inv.") { Caption = 'Prepmt. Amt. Inv.'; }
                field(prepmtAmtInclVAT; Rec."Prepmt. Amt. Incl. VAT") { Caption = 'Prepmt. Amt. Incl. VAT'; }
                field(prepaymentAmount; Rec."Prepayment Amount") { Caption = 'Prepayment Amount'; }
                field(prepmtVATBaseAmt; Rec."Prepmt. VAT Base Amt.") { Caption = 'Prepmt. VAT Base Amt.'; }
                field(prepaymentVATPercent; Rec."Prepayment VAT %") { Caption = 'Prepayment VAT %'; }
                field(prepmtAmtToDeduct; Rec."Prepmt Amt to Deduct") { Caption = 'Prepmt Amt to Deduct'; }
                field(prepmtAmtDeducted; Rec."Prepmt Amt Deducted") { Caption = 'Prepmt Amt Deducted'; }
                field(prepmtAmountInvInclVAT; Rec."Prepmt. Amount Inv. Incl. VAT") { Caption = 'Prepmt. Amount Inv. Incl. VAT'; }
                field(prepmtAmountInvLCY; Rec."Prepmt. Amount Inv. (LCY)") { Caption = 'Prepmt. Amount Inv. (LCY)'; }
                field(prepmtVATAmountInvLCY; Rec."Prepmt. VAT Amount Inv. (LCY)") { Caption = 'Prepmt. VAT Amount Inv. (LCY)'; }
                field(prepaymentVATDifference; Rec."Prepayment VAT Difference") { Caption = 'Prepayment VAT Difference'; }
                field(prepmtVATDiffToDeduct; Rec."Prepmt VAT Diff. to Deduct") { Caption = 'Prepmt VAT Diff. to Deduct'; }
                field(prepmtVATDiffDeducted; Rec."Prepmt VAT Diff. Deducted") { Caption = 'Prepmt VAT Diff. Deducted'; }
                field(pmtDiscountAmount; Rec."Pmt. Discount Amount") { Caption = 'Pmt. Discount Amount'; }

                // --- Posting / VAT / tax ---
                field(genBusPostingGroup; Rec."Gen. Bus. Posting Group") { Caption = 'Gen. Bus. Posting Group'; }
                field(genProdPostingGroup; Rec."Gen. Prod. Posting Group") { Caption = 'Gen. Prod. Posting Group'; }
                field(vatBusPostingGroup; Rec."VAT Bus. Posting Group") { Caption = 'VAT Bus. Posting Group'; }
                field(vatProdPostingGroup; Rec."VAT Prod. Posting Group") { Caption = 'VAT Prod. Posting Group'; }
                field(vatCalculationType; Rec."VAT Calculation Type") { Caption = 'VAT Calculation Type'; }
                field(vatCalculationTypeInt; VATCalculationTypeInt) { Caption = 'VAT Calculation Type INT'; }
                field(vatIdentifier; Rec."VAT Identifier") { Caption = 'VAT Identifier'; }
                field(vatClauseCode; Rec."VAT Clause Code") { Caption = 'VAT Clause Code'; }
                field(currencyCode; Rec."Currency Code") { Caption = 'Currency Code'; }
                field(taxAreaCode; Rec."Tax Area Code") { Caption = 'Tax Area Code'; }
                field(taxGroupCode; Rec."Tax Group Code") { Caption = 'Tax Group Code'; }
                field(taxLiable; Rec."Tax Liable") { Caption = 'Tax Liable'; }

                // --- Dimensions / responsibility ---
                field(shortcutDimension1Code; Rec."Shortcut Dimension 1 Code") { Caption = 'Shortcut Dimension 1 Code'; }
                field(shortcutDimension2Code; Rec."Shortcut Dimension 2 Code") { Caption = 'Shortcut Dimension 2 Code'; }
                field(dimensionSetId; Rec."Dimension Set ID") { Caption = 'Dimension Set ID'; }
                field(responsibilityCenter; Rec."Responsibility Center") { Caption = 'Responsibility Center'; }

                // --- Logistics / business flags ---
                field(dropShipment; Rec."Drop Shipment") { Caption = 'Drop Shipment'; }
                field(specialOrder; Rec."Special Order") { Caption = 'Special Order'; }
                field(completelyShipped; Rec."Completely Shipped") { Caption = 'Completely Shipped'; }
                field(planned; Rec.Planned) { Caption = 'Planned'; }
                field(allowInvoiceDisc; Rec."Allow Invoice Disc.") { Caption = 'Allow Invoice Disc.'; }
                field(allowLineDisc; Rec."Allow Line Disc.") { Caption = 'Allow Line Disc.'; }
                field(allowItemChargeAssignment; Rec."Allow Item Charge Assignment") { Caption = 'Allow Item Charge Assignment'; }
                field(recalculateInvoiceDisc; Rec."Recalculate Invoice Disc.") { Caption = 'Recalculate Invoice Disc.'; }
                field(systemCreatedEntry; Rec."System-Created Entry") { Caption = 'System-Created Entry'; }
                field(prepaymentLine; Rec."Prepayment Line") { Caption = 'Prepayment Line'; }
                field(copiedFromPostedDoc; Rec."Copied From Posted Doc.") { Caption = 'Copied From Posted Doc.'; }

                // --- Additional references / dimensions / pricing support ---
                field(customerPriceGroup; Rec."Customer Price Group") { Caption = 'Customer Price Group'; }
                field(customerDiscGroup; Rec."Customer Disc. Group") { Caption = 'Customer Disc. Group'; }
                field(itemCategoryCode; Rec."Item Category Code") { Caption = 'Item Category Code'; }
                field(purchasingCode; Rec."Purchasing Code") { Caption = 'Purchasing Code'; }
                field(returnReasonCode; Rec."Return Reason Code") { Caption = 'Return Reason Code'; }
                field(itemReferenceNo; Rec."Item Reference No.") { Caption = 'Item Reference No.'; }
                field(itemReferenceType; Rec."Item Reference Type") { Caption = 'Item Reference Type'; }
                field(itemReferenceTypeInt; ItemReferenceTypeInt) { Caption = 'Item Reference Type INT'; }
                field(itemReferenceTypeNo; Rec."Item Reference Type No.") { Caption = 'Item Reference Type No.'; }
                field(applToItemEntry; Rec."Appl.-to Item Entry") { Caption = 'Appl.-to Item Entry'; }
                field(applFromItemEntry; Rec."Appl.-from Item Entry") { Caption = 'Appl.-from Item Entry'; }
                field(attachedDocCount; Rec."Attached Doc Count") { Caption = 'Attached Doc Count'; }

                // --- Reserve / pricing method / classification ---
                field(reserve; Rec.Reserve) { Caption = 'Reserve'; }
                field(reserveInt; ReserveInt) { Caption = 'Reserve INT'; }
                field(priceCalculationMethod; Rec."Price Calculation Method") { Caption = 'Price Calculation Method'; }
                field(priceCalculationMethodInt; PriceCalculationMethodInt) { Caption = 'Price Calculation Method INT'; }

                // --- Job / work / application ---
                field(jobNo; Rec."Job No.") { Caption = 'Job No.'; }
                field(jobTaskNo; Rec."Job Task No.") { Caption = 'Job Task No.'; }
                field(jobContractEntryNo; Rec."Job Contract Entry No.") { Caption = 'Job Contract Entry No.'; }
                field(workTypeCode; Rec."Work Type Code") { Caption = 'Work Type Code'; }

                // --- System audit ---
                field(systemCreatedAt; Rec.SystemCreatedAt) { Caption = 'SystemCreatedAt'; }
                field(systemCreatedBy; Rec.SystemCreatedBy) { Caption = 'SystemCreatedBy'; }
                field(systemModifiedAt; Rec.SystemModifiedAt) { Caption = 'SystemModifiedAt'; }
                field(systemModifiedBy; Rec.SystemModifiedBy) { Caption = 'SystemModifiedBy'; }
            }
        }
    }

    var
        DocumentTypeInt: Integer;
        TypeInt: Integer;
        VATCalculationTypeInt: Integer;
        SubtypeInt: Integer;
        ReserveInt: Integer;
        PriceCalculationMethodInt: Integer;
        ItemReferenceTypeInt: Integer;

    trigger OnOpenPage()
    begin
        Rec.SetAutoCalcFields(
            "Posting Date",
            "Qty. to Assign",
            "Qty. Assigned",
            "Reserved Quantity",
            "Reserved Qty. (Base)",
            "Whse. Outstanding Qty.",
            "Whse. Outstanding Qty. (Base)",
            "ATO Whse. Outstanding Qty.",
            "ATO Whse. Outstd. Qty. (Base)",
            "Attached Doc Count");
    end;

    trigger OnAfterGetRecord()
    begin
        DocumentTypeInt := Rec."Document Type".AsInteger();
        TypeInt := Rec.Type.AsInteger();
        VATCalculationTypeInt := Rec."VAT Calculation Type".AsInteger();
        SubtypeInt := Rec.Subtype;
        ReserveInt := Rec.Reserve.AsInteger();
        PriceCalculationMethodInt := Rec."Price Calculation Method".AsInteger();
        ItemReferenceTypeInt := Rec."Item Reference Type".AsInteger();
    end;
}
