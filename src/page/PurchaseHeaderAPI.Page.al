page  50247 "PurchaseHeaderAPI"
{
    /// <summary>
    /// Date        Name                    Version   Description
    /// 2025.11.20  Business Central AL     001.0     API page for Purchase Header (table 38)
    /// </summary>

    Caption = 'PurchaseHeaderAPI';
    AdditionalSearchTerms = 'SCANPAN, API, datawarehouse, dw';
    UsageCategory = Administration;

    PageType = API;
    APIPublisher = 'scanpan';
    APIGroup = 'datawarehouse';
    APIVersion = 'beta', 'v1.0';

    EntitySetName = 'purchaseHeaders';
    EntityName = 'purchaseHeader';

    DelayedInsert = true;
    Editable = false;

    SourceTable = "Purchase Header";
    SourceTableView = sorting(SystemId) order(ascending);
    ODataKeyFields = SystemId;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                Caption = 'Group';

                // --- OData key ---
                field(systemId; Rec.SystemId)                             { Caption = 'SystemId'; }

                // --- Document identity ---
                field(documentType; Rec."Document Type")                  { Caption = 'Document Type'; }
                field(documentTypeInt; documentTypeInt)                   { Caption = 'Document Type INT'; }
                field(no; Rec."No.")                                      { Caption = 'No.'; }

                field(status; Rec.Status)                                 { Caption = 'Status'; }
                field(statusInt; statusInt)                               { Caption = 'Status INT'; }

                // --- Vendor (buy-from/pay-to) ---
                field(buyFromVendorNo; Rec."Buy-from Vendor No.")         { Caption = 'Buy-from Vendor No.'; }
                field(buyFromVendorName; Rec."Buy-from Vendor Name")      { Caption = 'Buy-from Vendor Name'; }
                field(payToVendorNo; Rec."Pay-to Vendor No.")             { Caption = 'Pay-to Vendor No.'; }
                field(payToName; Rec."Pay-to Name")                       { Caption = 'Pay-to Name'; }
                field(yourReference; Rec."Your Reference")                { Caption = 'Your Reference'; }
                field(assignedUserId; Rec."Assigned User ID")             { Caption = 'Assigned User ID'; }

                // --- Dates ---
                field(orderDate; Rec."Order Date")                        { Caption = 'Order Date'; }
                field(postingDate; Rec."Posting Date")                    { Caption = 'Posting Date'; }
                field(documentDate; Rec."Document Date")                  { Caption = 'Document Date'; }
                field(dueDate; Rec."Due Date")                            { Caption = 'Due Date'; }
                field(expectedReceiptDate; Rec."Expected Receipt Date")   { Caption = 'Expected Receipt Date'; }

                // --- Amounts / currency / VAT flags ---
                field(currencyCode; Rec."Currency Code")                  { Caption = 'Currency Code'; }
                field(pricesIncludingVAT; Rec."Prices Including VAT")     { Caption = 'Prices Including VAT'; }
                field(amount; Rec.Amount)                                 { Caption = 'Amount'; }
                field(amountIncludingVAT; Rec."Amount Including VAT")     { Caption = 'Amount Including VAT'; }
                field(vendorInvoiceNo; Rec."Vendor Invoice No.")          { Caption = 'Vendor Invoice No.'; }

                // --- Location / dimensions ---
                field(locationCode; Rec."Location Code")                  { Caption = 'Location Code'; }
                field(shortcutDim1Code; Rec."Shortcut Dimension 1 Code")  { Caption = 'Shortcut Dimension 1 Code'; }
                field(shortcutDim2Code; Rec."Shortcut Dimension 2 Code")  { Caption = 'Shortcut Dimension 2 Code'; }

                // --- Posting / setup ---
                field(vatBusPostingGroup; Rec."VAT Bus. Posting Group")   { Caption = 'VAT Bus. Posting Group'; }
                field(genBusPostingGroup; Rec."Gen. Bus. Posting Group")  { Caption = 'Gen. Bus. Posting Group'; }
                field(paymentTermsCode; Rec."Payment Terms Code")         { Caption = 'Payment Terms Code'; }
                field(paymentMethodCode; Rec."Payment Method Code")       { Caption = 'Payment Method Code'; }
                field(shipmentMethodCode; Rec."Shipment Method Code")     { Caption = 'Shipment Method Code'; }

                // --- System (audit) ---
                field(systemCreatedAt; Rec.SystemCreatedAt)               { Caption = 'SystemCreatedAt'; }
                field(systemCreatedBy; Rec.SystemCreatedBy)               { Caption = 'SystemCreatedBy'; }
                field(systemModifiedAt; Rec.SystemModifiedAt)             { Caption = 'SystemModifiedAt'; }
                field(systemModifiedBy; Rec.SystemModifiedBy)             { Caption = 'SystemModifiedBy'; }
            }
        }
    }

    var
        documentTypeInt: Integer;
        statusInt: Integer;

    trigger OnAfterGetRecord()
    begin
        // Enum/Option -> Integer spejle
        documentTypeInt := Rec."Document Type".AsInteger(); // Option i ældre versioner: documentTypeInt := Rec."Document Type";
        statusInt := Rec.Status.AsInteger();                // Option i ældre versioner: statusInt := Rec.Status;
    end;
}
