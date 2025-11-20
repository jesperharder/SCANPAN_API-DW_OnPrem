page 50252 "PurchCrMemoHdrAPI"
{
    /// <summary>
    /// Date        Name                    Version   Description
    /// 2025.11.20  Business Central AL     001.0     API page for Purch. Cr. Memo Hdr. (table 124)
    /// </summary>

    Caption = 'PurchCrMemoHdrAPI';
    AdditionalSearchTerms = 'SCANPAN, API, datawarehouse, dw';
    UsageCategory = Administration;

    PageType = API;
    APIPublisher = 'scanpan';
    APIGroup = 'datawarehouse';
    APIVersion = 'beta', 'v1.0';

    EntitySetName = 'purchaseCreditMemoHeaders';
    EntityName = 'purchaseCreditMemoHeader';

    DelayedInsert = true;
    Editable = false;

    SourceTable = "Purch. Cr. Memo Hdr.";
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
                field(vendorCrMemoNo; Rec."Vendor Cr. Memo No.")          { Caption = 'Vendor Cr. Memo No.'; }

                // --- Vendor (buy-from/pay-to) ---
                field(buyFromVendorNo; Rec."Buy-from Vendor No.")         { Caption = 'Buy-from Vendor No.'; }
                field(buyFromVendorName; Rec."Buy-from Vendor Name")      { Caption = 'Buy-from Vendor Name'; }
                field(payToVendorNo; Rec."Pay-to Vendor No.")             { Caption = 'Pay-to Vendor No.'; }
                field(payToName; Rec."Pay-to Name")                       { Caption = 'Pay-to Name'; }
                field(yourReference; Rec."Your Reference")                { Caption = 'Your Reference'; }
                //field(assignedUserId; Rec."Assigned User ID")             { Caption = 'Assigned User ID'; }

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
    // Har I egne Option/Enum felter via tableextensions, så tilføj her:
    //
    // var
    //     myEnumInt: Integer;
    //
    // trigger OnAfterGetRecord()
    // begin
    //     // Enum:
    //     // myEnumInt := Rec."My Enum Field".AsInteger();
    //     // Option:
    //     // myEnumInt := Rec."My Option Field";
    // end;
}
