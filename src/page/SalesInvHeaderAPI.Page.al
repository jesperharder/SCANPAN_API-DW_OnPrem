page 50260 "SalesInvHeaderAPI"
{
    /// <summary>
    /// Date        Name                    Version   Description
    /// 2026.03.17  Jesper / ChatGPT        002.0     API page for Sales Invoice Header (table 112) for DW staging
    /// </summary>

    Caption = 'SalesInvHeaderAPI';
    AdditionalSearchTerms = 'SCANPAN, API, datawarehouse, dw, sales invoice, posted invoice';
    UsageCategory = Administration;

    PageType = API;
    APIPublisher = 'scanpan';
    APIGroup = 'datawarehouse';
    APIVersion = 'beta', 'v1.0';

    EntitySetName = 'salesInvoiceHeaders';
    EntityName = 'salesInvoiceHeader';

    DelayedInsert = true;
    Editable = false;

    SourceTable = "Sales Invoice Header";
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
                field(no; Rec."No.") { Caption = 'No.'; }
                field(orderNo; Rec."Order No.") { Caption = 'Order No.'; }
                field(preAssignedNo; Rec."Pre-Assigned No.") { Caption = 'Pre-Assigned No.'; }
                field(externalDocumentNo; Rec."External Document No.") { Caption = 'External Document No.'; }
                field(yourReference; Rec."Your Reference") { Caption = 'Your Reference'; }
                field(reasonCode; Rec."Reason Code") { Caption = 'Reason Code'; }
                field(postingDescription; Rec."Posting Description") { Caption = 'Posting Description'; }

                // --- Customer / contact ---
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
                field(sellToPhoneNo; Rec."Sell-to Phone No.") { Caption = 'Sell-to Phone No.'; }
                field(sellToEmail; Rec."Sell-to E-Mail") { Caption = 'Sell-to E-Mail'; }

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
                field(remainingAmount; Rec."Remaining Amount") { Caption = 'Remaining Amount'; }

                // --- Posting / setup / dimensions ---
                field(locationCode; Rec."Location Code") { Caption = 'Location Code'; }
                field(shortcutDim1Code; Rec."Shortcut Dimension 1 Code") { Caption = 'Shortcut Dimension 1 Code'; }
                field(shortcutDim2Code; Rec."Shortcut Dimension 2 Code") { Caption = 'Shortcut Dimension 2 Code'; }
                field(dimensionSetId; Rec."Dimension Set ID") { Caption = 'Dimension Set ID'; }
                field(customerPostingGroup; Rec."Customer Posting Group") { Caption = 'Customer Posting Group'; }
                field(customerPriceGroup; Rec."Customer Price Group") { Caption = 'Customer Price Group'; }
                field(customerDiscGroup; Rec."Customer Disc. Group") { Caption = 'Customer Disc. Group'; }
                field(vatBusPostingGroup; Rec."VAT Bus. Posting Group") { Caption = 'VAT Bus. Posting Group'; }
                field(genBusPostingGroup; Rec."Gen. Bus. Posting Group") { Caption = 'Gen. Bus. Posting Group'; }
                field(paymentTermsCode; Rec."Payment Terms Code") { Caption = 'Payment Terms Code'; }
                field(paymentMethodCode; Rec."Payment Method Code") { Caption = 'Payment Method Code'; }
                field(shipmentMethodCode; Rec."Shipment Method Code") { Caption = 'Shipment Method Code'; }
                field(languageCode; Rec."Language Code") { Caption = 'Language Code'; }
                field(salespersonCode; Rec."Salesperson Code") { Caption = 'Salesperson Code'; }
                field(responsibilityCenter; Rec."Responsibility Center") { Caption = 'Responsibility Center'; }
                field(sourceCode; Rec."Source Code") { Caption = 'Source Code'; }
                field(taxAreaCode; Rec."Tax Area Code") { Caption = 'Tax Area Code'; }
                field(taxLiable; Rec."Tax Liable") { Caption = 'Tax Liable'; }
                field(vatRegistrationNo; Rec."VAT Registration No.") { Caption = 'VAT Registration No.'; }
                field(vatCountryRegionCode; Rec."VAT Country/Region Code") { Caption = 'VAT Country/Region Code'; }
                field(transactionType; Rec."Transaction Type") { Caption = 'Transaction Type'; }
                field(transactionSpecification; Rec."Transaction Specification") { Caption = 'Transaction Specification'; }
                field(transportMethod; Rec."Transport Method") { Caption = 'Transport Method'; }
                field("area"; Rec.Area) { Caption = 'Area'; }
                field(exitPoint; Rec."Exit Point") { Caption = 'Exit Point'; }

                // --- Other business flags ---
                field(comment; Rec.Comment) { Caption = 'Comment'; }
                field(correction; Rec.Correction) { Caption = 'Correction'; }
                field(closed; Rec.Closed) { Caption = 'Closed'; }
                field(cancelled; Rec.Cancelled) { Caption = 'Cancelled'; }
                field(corrective; Rec.Corrective) { Caption = 'Corrective'; }
                field(reversed; Rec.Reversed) { Caption = 'Reversed'; }
                field(sentAsEmail; Rec."Sent as Email") { Caption = 'Sent as Email'; }
                field(lastEmailNotifCleared; Rec."Last Email Notif Cleared") { Caption = 'Last Email Notif Cleared'; }
                field(prepaymentInvoice; Rec."Prepayment Invoice") { Caption = 'Prepayment Invoice'; }
                field(prepaymentOrderNo; Rec."Prepayment Order No.") { Caption = 'Prepayment Order No.'; }
                field(prepaymentNoSeries; Rec."Prepayment No. Series") { Caption = 'Prepayment No. Series'; }
                field(quoteNo; Rec."Quote No.") { Caption = 'Quote No.'; }
                field(campaignNo; Rec."Campaign No.") { Caption = 'Campaign No.'; }
                field(opportunityNo; Rec."Opportunity No.") { Caption = 'Opportunity No.'; }
                field(eu3PartyTrade; Rec."EU 3-Party Trade") { Caption = 'EU 3-Party Trade'; }
                field(onHold; Rec."On Hold") { Caption = 'On Hold'; }
                field(userId; Rec."User ID") { Caption = 'User ID'; }
                field(paymentReference; Rec."Payment Reference") { Caption = 'Payment Reference'; }
                field(paymentServiceSetId; Rec."Payment Service Set ID") { Caption = 'Payment Service Set ID'; }
                field(documentExchangeIdentifier; Rec."Document Exchange Identifier") { Caption = 'Document Exchange Identifier'; }
                field(docExchOriginalIdentifier; Rec."Doc. Exch. Original Identifier") { Caption = 'Doc. Exch. Original Identifier'; }
                field(directDebitMandateId; Rec."Direct Debit Mandate ID") { Caption = 'Direct Debit Mandate ID'; }
                field(packageTrackingNo; Rec."Package Tracking No.") { Caption = 'Package Tracking No.'; }
                field(shippingAgentCode; Rec."Shipping Agent Code") { Caption = 'Shipping Agent Code'; }

                // --- Enum / Option text fields ---
                field(appliesToDocType; Rec."Applies-to Doc. Type") { Caption = 'Applies-to Doc. Type'; }
                field(balAccountType; Rec."Bal. Account Type") { Caption = 'Bal. Account Type'; }
                field(invoiceDiscountCalculation; Rec."Invoice Discount Calculation") { Caption = 'Invoice Discount Calculation'; }
                field(lastEmailSentStatus; Rec."Last Email Sent Status") { Caption = 'Last Email Sent Status'; }
                field(documentExchangeStatus; Rec."Document Exchange Status") { Caption = 'Document Exchange Status'; }
                field(priceCalculationMethod; Rec."Price Calculation Method") { Caption = 'Price Calculation Method'; }

                // --- Enum / Option INT mirrors ---
                field(appliesToDocTypeInt; AppliesToDocTypeInt) { Caption = 'Applies-to Doc. Type Int'; }
                field(balAccountTypeInt; BalAccountTypeInt) { Caption = 'Bal. Account Type Int'; }
                field(invoiceDiscountCalculationInt; InvoiceDiscountCalculationInt) { Caption = 'Invoice Discount Calculation Int'; }
                field(lastEmailSentStatusInt; LastEmailSentStatusInt) { Caption = 'Last Email Sent Status Int'; }
                field(documentExchangeStatusInt; DocumentExchangeStatusInt) { Caption = 'Document Exchange Status Int'; }
                field(priceCalculationMethodInt; PriceCalculationMethodInt) { Caption = 'Price Calculation Method Int'; }

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
        AppliesToDocTypeInt := Rec."Applies-to Doc. Type".AsInteger();
        BalAccountTypeInt := Rec."Bal. Account Type".AsInteger();
        DocumentExchangeStatusInt := Rec."Document Exchange Status".AsInteger();
        PriceCalculationMethodInt := Rec."Price Calculation Method".AsInteger();

        InvoiceDiscountCalculationInt := Rec."Invoice Discount Calculation";
        LastEmailSentStatusInt := Rec."Last Email Sent Status";
    end;

    var
        AppliesToDocTypeInt: Integer;
        BalAccountTypeInt: Integer;
        InvoiceDiscountCalculationInt: Integer;
        LastEmailSentStatusInt: Integer;
        DocumentExchangeStatusInt: Integer;
        PriceCalculationMethodInt: Integer;
}