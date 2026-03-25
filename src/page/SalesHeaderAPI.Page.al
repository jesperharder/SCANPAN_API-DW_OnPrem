page 50259 "SalesHeaderAPI"
{
    /// <summary>
    /// Date        Name               Version   Description
    /// 2026.03.17  Jesper / ChatGPT   002.0     API page for Sales Header (table 36) for DW staging
    /// </summary>

    Caption = 'SalesHeaderAPI';
    AdditionalSearchTerms = 'SCANPAN, API, datawarehouse, dw, sales header, sales document';
    UsageCategory = Administration;

    PageType = API;
    APIPublisher = 'scanpan';
    APIGroup = 'datawarehouse';
    APIVersion = 'beta', 'v1.0';

    EntitySetName = 'salesHeaders';
    EntityName = 'salesHeader';

    DelayedInsert = true;
    Editable = false;

    SourceTable = "Sales Header";
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
                field(no; Rec."No.") { Caption = 'No.'; }
                field(status; Rec.Status) { Caption = 'Status'; }
                field(statusInt; StatusInt) { Caption = 'Status INT'; }

                // --- Identity / references ---
                field(externalDocumentNo; Rec."External Document No.") { Caption = 'External Document No.'; }
                field(yourReference; Rec."Your Reference") { Caption = 'Your Reference'; }
                field(assignedUserId; Rec."Assigned User ID") { Caption = 'Assigned User ID'; }
                field(salespersonCode; Rec."Salesperson Code") { Caption = 'Salesperson Code'; }
                field(reasonCode; Rec."Reason Code") { Caption = 'Reason Code'; }
                field(orderClass; Rec."Order Class") { Caption = 'Order Class'; }
                field(postingDescription; Rec."Posting Description") { Caption = 'Posting Description'; }
                field(opportunityNo; Rec."Opportunity No.") { Caption = 'Opportunity No.'; }
                field(quoteNo; Rec."Quote No.") { Caption = 'Quote No.'; }
                field(quoteValidUntilDate; Rec."Quote Valid Until Date") { Caption = 'Quote Valid Until Date'; }
                field(quoteSentToCustomer; Rec."Quote Sent to Customer") { Caption = 'Quote Sent to Customer'; }
                field(quoteAccepted; Rec."Quote Accepted") { Caption = 'Quote Accepted'; }
                field(quoteAcceptedDate; Rec."Quote Accepted Date") { Caption = 'Quote Accepted Date'; }

                // --- Sell-to ---
                field(sellToCustomerNo; Rec."Sell-to Customer No.") { Caption = 'Sell-to Customer No.'; }
                field(sellToCustomerName; Rec."Sell-to Customer Name") { Caption = 'Sell-to Customer Name'; }
                field(sellToCustomerName2; Rec."Sell-to Customer Name 2") { Caption = 'Sell-to Customer Name 2'; }
                field(sellToAddress; Rec."Sell-to Address") { Caption = 'Sell-to Address'; }
                field(sellToAddress2; Rec."Sell-to Address 2") { Caption = 'Sell-to Address 2'; }
                field(sellToCity; Rec."Sell-to City") { Caption = 'Sell-to City'; }
                field(sellToPostCode; Rec."Sell-to Post Code") { Caption = 'Sell-to Post Code'; }
                field(sellToCounty; Rec."Sell-to County") { Caption = 'Sell-to County'; }
                field(sellToCountryRegionCode; Rec."Sell-to Country/Region Code") { Caption = 'Sell-to Country/Region Code'; }
                field(sellToContact; Rec."Sell-to Contact") { Caption = 'Sell-to Contact'; }
                field(sellToContactNo; Rec."Sell-to Contact No.") { Caption = 'Sell-to Contact No.'; }
                field(sellToPhoneNo; Rec."Sell-to Phone No.") { Caption = 'Sell-to Phone No.'; }
                field(sellToEmail; Rec."Sell-to E-Mail") { Caption = 'Sell-to E-Mail'; }

                // --- Bill-to ---
                field(billToCustomerNo; Rec."Bill-to Customer No.") { Caption = 'Bill-to Customer No.'; }
                field(billToName; Rec."Bill-to Name") { Caption = 'Bill-to Name'; }
                field(billToName2; Rec."Bill-to Name 2") { Caption = 'Bill-to Name 2'; }
                field(billToAddress; Rec."Bill-to Address") { Caption = 'Bill-to Address'; }
                field(billToAddress2; Rec."Bill-to Address 2") { Caption = 'Bill-to Address 2'; }
                field(billToCity; Rec."Bill-to City") { Caption = 'Bill-to City'; }
                field(billToPostCode; Rec."Bill-to Post Code") { Caption = 'Bill-to Post Code'; }
                field(billToCounty; Rec."Bill-to County") { Caption = 'Bill-to County'; }
                field(billToCountryRegionCode; Rec."Bill-to Country/Region Code") { Caption = 'Bill-to Country/Region Code'; }
                field(billToContact; Rec."Bill-to Contact") { Caption = 'Bill-to Contact'; }
                field(billToContactNo; Rec."Bill-to Contact No.") { Caption = 'Bill-to Contact No.'; }

                // --- Ship-to ---
                field(shipToCode; Rec."Ship-to Code") { Caption = 'Ship-to Code'; }
                field(shipToName; Rec."Ship-to Name") { Caption = 'Ship-to Name'; }
                field(shipToName2; Rec."Ship-to Name 2") { Caption = 'Ship-to Name 2'; }
                field(shipToAddress; Rec."Ship-to Address") { Caption = 'Ship-to Address'; }
                field(shipToAddress2; Rec."Ship-to Address 2") { Caption = 'Ship-to Address 2'; }
                field(shipToCity; Rec."Ship-to City") { Caption = 'Ship-to City'; }
                field(shipToPostCode; Rec."Ship-to Post Code") { Caption = 'Ship-to Post Code'; }
                field(shipToCounty; Rec."Ship-to County") { Caption = 'Ship-to County'; }
                field(shipToCountryRegionCode; Rec."Ship-to Country/Region Code") { Caption = 'Ship-to Country/Region Code'; }
                field(shipToContact; Rec."Ship-to Contact") { Caption = 'Ship-to Contact'; }

                // --- Dates ---
                field(orderDate; Rec."Order Date") { Caption = 'Order Date'; }
                field(postingDate; Rec."Posting Date") { Caption = 'Posting Date'; }
                field(shipmentDate; Rec."Shipment Date") { Caption = 'Shipment Date'; }
                field(documentDate; Rec."Document Date") { Caption = 'Document Date'; }
                field(dueDate; Rec."Due Date") { Caption = 'Due Date'; }
                field(pmtDiscountDate; Rec."Pmt. Discount Date") { Caption = 'Pmt. Discount Date'; }
                field(requestedDeliveryDate; Rec."Requested Delivery Date") { Caption = 'Requested Delivery Date'; }
                field(promisedDeliveryDate; Rec."Promised Delivery Date") { Caption = 'Promised Delivery Date'; }
                field(shippingTime; Rec."Shipping Time") { Caption = 'Shipping Time'; }
                field(outboundWhseHandlingTime; Rec."Outbound Whse. Handling Time") { Caption = 'Outbound Whse. Handling Time'; }
                field(lastShipmentDate; Rec."Last Shipment Date") { Caption = 'Last Shipment Date'; }
                field(lastEmailSentTime; Rec."Last Email Sent Time") { Caption = 'Last Email Sent Time'; }

                // --- Amounts / currency ---
                field(currencyCode; Rec."Currency Code") { Caption = 'Currency Code'; }
                field(currencyFactor; Rec."Currency Factor") { Caption = 'Currency Factor'; }
                field(pricesIncludingVAT; Rec."Prices Including VAT") { Caption = 'Prices Including VAT'; }
                field(amount; Rec.Amount) { Caption = 'Amount'; }
                field(amountIncludingVAT; Rec."Amount Including VAT") { Caption = 'Amount Including VAT'; }
                field(invoiceDiscountValue; Rec."Invoice Discount Value") { Caption = 'Invoice Discount Value'; }
                field(invoiceDiscountAmount; Rec."Invoice Discount Amount") { Caption = 'Invoice Discount Amount'; }
                field(paymentDiscountPct; Rec."Payment Discount %") { Caption = 'Payment Discount %'; }
                field(vatBaseDiscountPct; Rec."VAT Base Discount %") { Caption = 'VAT Base Discount %'; }
                field(prepaymentPct; Rec."Prepayment %") { Caption = 'Prepayment %'; }
                field(amtShipNotInvLCY; Rec."Amt. Ship. Not Inv. (LCY)") { Caption = 'Amt. Ship. Not Inv. (LCY)'; }
                field(amtShipNotInvLCYBase; Rec."Amt. Ship. Not Inv. (LCY) Base") { Caption = 'Amt. Ship. Not Inv. (LCY) Base'; }

                // --- Posting / setup / dimensions ---
                field(locationCode; Rec."Location Code") { Caption = 'Location Code'; }
                field(shortcutDim1Code; Rec."Shortcut Dimension 1 Code") { Caption = 'Shortcut Dimension 1 Code'; }
                field(shortcutDim2Code; Rec."Shortcut Dimension 2 Code") { Caption = 'Shortcut Dimension 2 Code'; }
                field(dimensionSetId; Rec."Dimension Set ID") { Caption = 'Dimension Set ID'; }
                field(customerPostingGroup; Rec."Customer Posting Group") { Caption = 'Customer Posting Group'; }
                field(customerPriceGroup; Rec."Customer Price Group") { Caption = 'Customer Price Group'; }
                field(customerDiscGroup; Rec."Customer Disc. Group") { Caption = 'Customer Disc. Group'; }
                field(invoiceDiscCode; Rec."Invoice Disc. Code") { Caption = 'Invoice Disc. Code'; }
                field(vatBusPostingGroup; Rec."VAT Bus. Posting Group") { Caption = 'VAT Bus. Posting Group'; }
                field(genBusPostingGroup; Rec."Gen. Bus. Posting Group") { Caption = 'Gen. Bus. Posting Group'; }
                field(paymentTermsCode; Rec."Payment Terms Code") { Caption = 'Payment Terms Code'; }
                field(paymentMethodCode; Rec."Payment Method Code") { Caption = 'Payment Method Code'; }
                field(shipmentMethodCode; Rec."Shipment Method Code") { Caption = 'Shipment Method Code'; }
                field(languageCode; Rec."Language Code") { Caption = 'Language Code'; }
                field(responsibilityCenter; Rec."Responsibility Center") { Caption = 'Responsibility Center'; }
                //field(sourceCode; Rec."Source Code") { Caption = 'Source Code'; }
                field(taxAreaCode; Rec."Tax Area Code") { Caption = 'Tax Area Code'; }
                field(taxLiable; Rec."Tax Liable") { Caption = 'Tax Liable'; }
                field(vatRegistrationNo; Rec."VAT Registration No.") { Caption = 'VAT Registration No.'; }
                field(vatCountryRegionCode; Rec."VAT Country/Region Code") { Caption = 'VAT Country/Region Code'; }
                field(transactionType; Rec."Transaction Type") { Caption = 'Transaction Type'; }
                field(transactionSpecification; Rec."Transaction Specification") { Caption = 'Transaction Specification'; }
                field(transportMethod; Rec."Transport Method") { Caption = 'Transport Method'; }
                field("area"; Rec.Area) { Caption = 'Area'; }
                field(exitPoint; Rec."Exit Point") { Caption = 'Exit Point'; }

                // --- Logistics / posting refs ---
                field(shippingNo; Rec."Shipping No.") { Caption = 'Shipping No.'; }
                field(postingNo; Rec."Posting No.") { Caption = 'Posting No.'; }
                field(lastShippingNo; Rec."Last Shipping No.") { Caption = 'Last Shipping No.'; }
                field(lastPostingNo; Rec."Last Posting No.") { Caption = 'Last Posting No.'; }
                field(returnReceiptNo; Rec."Return Receipt No.") { Caption = 'Return Receipt No.'; }
                field(lastReturnReceiptNo; Rec."Last Return Receipt No.") { Caption = 'Last Return Receipt No.'; }
                field(prepaymentNo; Rec."Prepayment No.") { Caption = 'Prepayment No.'; }
                field(lastPrepaymentNo; Rec."Last Prepayment No.") { Caption = 'Last Prepayment No.'; }
                field(prepaymentNoSeries; Rec."Prepayment No. Series") { Caption = 'Prepayment No. Series'; }
                field(prepaymentDueDate; Rec."Prepayment Due Date") { Caption = 'Prepayment Due Date'; }
                field(prepmtCrMemoNo; Rec."Prepmt. Cr. Memo No.") { Caption = 'Prepmt. Cr. Memo No.'; }
                field(prepmtCrMemoNoSeries; Rec."Prepmt. Cr. Memo No. Series") { Caption = 'Prepmt. Cr. Memo No. Series'; }
                field(prepmtPaymentTermsCode; Rec."Prepmt. Payment Terms Code") { Caption = 'Prepmt. Payment Terms Code'; }
                field(prepmtPaymentDiscountPct; Rec."Prepmt. Payment Discount %") { Caption = 'Prepmt. Payment Discount %'; }
                field(prepmtPmtDiscountDate; Rec."Prepmt. Pmt. Discount Date") { Caption = 'Prepmt. Pmt. Discount Date'; }

                // --- Other flags / refs ---
                field(comment; Rec.Comment) { Caption = 'Comment'; }
                field(recalculateInvoiceDisc; Rec."Recalculate Invoice Disc.") { Caption = 'Recalculate Invoice Disc.'; }
                field(ship; Rec.Ship) { Caption = 'Ship'; }
                field(invoice; Rec.Invoice) { Caption = 'Invoice'; }
                field(receive; Rec.Receive) { Caption = 'Receive'; }
                field(printPostedDocuments; Rec."Print Posted Documents") { Caption = 'Print Posted Documents'; }
                field(combineShipments; Rec."Combine Shipments") { Caption = 'Combine Shipments'; }
                field(correction; Rec.Correction) { Caption = 'Correction'; }
                field(onHold; Rec."On Hold") { Caption = 'On Hold'; }
                field(sentAsEmail; Rec."Sent as Email") { Caption = 'Sent as Email'; }
                field(lastEmailNotifCleared; Rec."Last Email Notif Cleared") { Caption = 'Last Email Notif Cleared'; }
                field(isTest; Rec.IsTest) { Caption = 'IsTest'; }
                field(packageTrackingNo; Rec."Package Tracking No.") { Caption = 'Package Tracking No.'; }
                field(shippingAgentCode; Rec."Shipping Agent Code") { Caption = 'Shipping Agent Code'; }
                field(shippingAgentServiceCode; Rec."Shipping Agent Service Code") { Caption = 'Shipping Agent Service Code'; }
                field(paymentServiceSetId; Rec."Payment Service Set ID") { Caption = 'Payment Service Set ID'; }
                field(directDebitMandateId; Rec."Direct Debit Mandate ID") { Caption = 'Direct Debit Mandate ID'; }
                field(incomingDocumentEntryNo; Rec."Incoming Document Entry No.") { Caption = 'Incoming Document Entry No.'; }
                field(jobQueueEntryId; Rec."Job Queue Entry ID") { Caption = 'Job Queue Entry ID'; }
                field(noOfArchivedVersions; Rec."No. of Archived Versions") { Caption = 'No. of Archived Versions'; }
                field(docNoOccurrence; Rec."Doc. No. Occurrence") { Caption = 'Doc. No. Occurrence'; }
                field(campaignNo; Rec."Campaign No.") { Caption = 'Campaign No.'; }
                field(allowLineDisc; Rec."Allow Line Disc.") { Caption = 'Allow Line Disc.'; }
                field(getShipmentUsed; Rec."Get Shipment Used") { Caption = 'Get Shipment Used'; }
                field(shippedNotInvoiced; Rec."Shipped Not Invoiced") { Caption = 'Shipped Not Invoiced'; }
                field(completelyShipped; Rec."Completely Shipped") { Caption = 'Completely Shipped'; }
                field(shipped; Rec.Shipped) { Caption = 'Shipped'; }
                field(lateOrderShipping; Rec."Late Order Shipping") { Caption = 'Late Order Shipping'; }

                // --- Enum / option text ---
                field(appliesToDocType; Rec."Applies-to Doc. Type") { Caption = 'Applies-to Doc. Type'; }
                field(balAccountType; Rec."Bal. Account Type") { Caption = 'Bal. Account Type'; }
                field(reserve; Rec.Reserve) { Caption = 'Reserve'; }
                field(invoiceDiscountCalculation; Rec."Invoice Discount Calculation") { Caption = 'Invoice Discount Calculation'; }
                field(icStatus; Rec."IC Status") { Caption = 'IC Status'; }
                field(icDirection; Rec."IC Direction") { Caption = 'IC Direction'; }
                field(jobQueueStatus; Rec."Job Queue Status") { Caption = 'Job Queue Status'; }
                field(lastEmailSentStatus; Rec."Last Email Sent Status") { Caption = 'Last Email Sent Status'; }
                field(priceCalculationMethod; Rec."Price Calculation Method") { Caption = 'Price Calculation Method'; }
                field(shippingAdvice; Rec."Shipping Advice") { Caption = 'Shipping Advice'; }

                // --- Enum / option int ---
                field(appliesToDocTypeInt; AppliesToDocTypeInt) { Caption = 'Applies-to Doc. Type INT'; }
                field(balAccountTypeInt; BalAccountTypeInt) { Caption = 'Bal. Account Type INT'; }
                field(reserveInt; ReserveInt) { Caption = 'Reserve INT'; }
                field(invoiceDiscountCalculationInt; InvoiceDiscountCalculationInt) { Caption = 'Invoice Discount Calculation INT'; }
                field(icStatusInt; ICStatusInt) { Caption = 'IC Status INT'; }
                field(icDirectionInt; ICDirectionInt) { Caption = 'IC Direction INT'; }
                field(jobQueueStatusInt; JobQueueStatusInt) { Caption = 'Job Queue Status INT'; }
                field(lastEmailSentStatusInt; LastEmailSentStatusInt) { Caption = 'Last Email Sent Status INT'; }
                field(priceCalculationMethodInt; PriceCalculationMethodInt) { Caption = 'Price Calculation Method INT'; }
                field(shippingAdviceInt; ShippingAdviceInt) { Caption = 'Shipping Advice INT'; }

                // --- System audit ---
                field(systemCreatedAt; Rec.SystemCreatedAt) { Caption = 'SystemCreatedAt'; }
                field(systemCreatedBy; Rec.SystemCreatedBy) { Caption = 'SystemCreatedBy'; }
                field(systemModifiedAt; Rec.SystemModifiedAt) { Caption = 'SystemModifiedAt'; }
                field(systemModifiedBy; Rec.SystemModifiedBy) { Caption = 'SystemModifiedBy'; }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        DocumentTypeInt := Rec."Document Type".AsInteger();
        StatusInt := Rec.Status.AsInteger();
        AppliesToDocTypeInt := Rec."Applies-to Doc. Type".AsInteger();
        BalAccountTypeInt := Rec."Bal. Account Type".AsInteger();
        ReserveInt := Rec.Reserve.AsInteger();
        ICStatusInt := Rec."IC Status".AsInteger();
        PriceCalculationMethodInt := Rec."Price Calculation Method".AsInteger();
        ShippingAdviceInt := Rec."Shipping Advice".AsInteger();

        InvoiceDiscountCalculationInt := Rec."Invoice Discount Calculation";
        ICDirectionInt := Rec."IC Direction";
        JobQueueStatusInt := Rec."Job Queue Status";
        LastEmailSentStatusInt := Rec."Last Email Sent Status";
    end;

    var
        DocumentTypeInt: Integer;
        StatusInt: Integer;
        AppliesToDocTypeInt: Integer;
        BalAccountTypeInt: Integer;
        ReserveInt: Integer;
        InvoiceDiscountCalculationInt: Integer;
        ICStatusInt: Integer;
        ICDirectionInt: Integer;
        JobQueueStatusInt: Integer;
        LastEmailSentStatusInt: Integer;
        PriceCalculationMethodInt: Integer;
        ShippingAdviceInt: Integer;
}