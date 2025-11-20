page 50260 "SalesInvHeaderAPI"
{
    /// <summary>
    /// Date        Name                    Version   Description
    /// 2025.11.20  Business Central AL     001.0     API page for Sales Invoice Header (table 112)
    /// </summary>

    Caption = 'SalesInvHeaderAPI';
    AdditionalSearchTerms = 'SCANPAN, API, datawarehouse, dw';
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

                // --- OData key ---
                field(systemId; Rec.SystemId)                             { Caption = 'SystemId'; }

                // --- Document identity ---
                field(no; Rec."No.")                                      { Caption = 'No.'; }
                field(externalDocumentNo; Rec."External Document No.")    { Caption = 'External Document No.'; }
                field(yourReference; Rec."Your Reference")                { Caption = 'Your Reference'; }
                //field(assignedUserId; Rec."Assigned User ID")             { Caption = 'Assigned User ID'; }
                field(reasonCode; Rec."Reason Code")                      { Caption = 'Reason Code'; }

                // --- Sell-to / Bill-to ---
                field(sellToCustomerNo; Rec."Sell-to Customer No.")       { Caption = 'Sell-to Customer No.'; }
                field(sellToCustomerName; Rec."Sell-to Customer Name")    { Caption = 'Sell-to Customer Name'; }
                field(billToCustomerNo; Rec."Bill-to Customer No.")       { Caption = 'Bill-to Customer No.'; }
                field(billToName; Rec."Bill-to Name")                     { Caption = 'Bill-to Name'; }

                // --- Dates ---
                field(postingDate; Rec."Posting Date")                    { Caption = 'Posting Date'; }
                field(documentDate; Rec."Document Date")                  { Caption = 'Document Date'; }
                field(dueDate; Rec."Due Date")                            { Caption = 'Due Date'; }

                // --- Amounts / currency / VAT flags ---
                field(currencyCode; Rec."Currency Code")                  { Caption = 'Currency Code'; }
                field(pricesIncludingVAT; Rec."Prices Including VAT")     { Caption = 'Prices Including VAT'; }
                field(amount; Rec.Amount)                                 { Caption = 'Amount'; }
                field(amountIncludingVAT; Rec."Amount Including VAT")     { Caption = 'Amount Including VAT'; }

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

    // Ingen Option/Enum-felter i standard → ingen INT-spejle.
    // Hvis I har egne Option/Enum-felter via tableextensions, kan de spejles her:
    // var
    //     myEnumInt: Integer;
    // trigger OnAfterGetRecord()
    // begin
    //     // myEnumInt := Rec."My Enum Field".AsInteger(); // eller Option: myEnumInt := Rec."My Option Field";
    // end;
}
