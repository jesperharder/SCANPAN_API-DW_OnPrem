page 50263 "SalespersonPurchaserAPI"
{
    /// <summary>
    /// Date        Name                    Version   Description
    /// 2025.11.20  Business Central AL     001.0     API page for Salesperson/Purchaser (table 13)
    /// </summary>

    Caption = 'SalespersonPurchaserAPI';
    AdditionalSearchTerms = 'SCANPAN, API, datawarehouse, dw';
    UsageCategory = Administration;

    PageType = API;
    APIPublisher = 'scanpan';
    APIGroup = 'datawarehouse';
    APIVersion = 'beta', 'v1.0';

    EntitySetName = 'salespersonsPurchasers';
    EntityName = 'salespersonPurchaser';

    DelayedInsert = true;
    Editable = false;

    SourceTable = "Salesperson/Purchaser";
    SourceTableView = sorting(Code) order(ascending);
    ODataKeyFields = Code;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                Caption = 'Group';

                // --- Key ---
                field(code; Rec.Code)                      { Caption = 'Code'; }

                // --- Descriptive / contact ---
                field(name; Rec.Name)                      { Caption = 'Name'; }
                field(email; Rec."E-Mail")                 { Caption = 'E-Mail'; }
                field(phoneNo; Rec."Phone No.")            { Caption = 'Phone No.'; }
                //field(userId; Rec."User ID")               { Caption = 'User ID'; }
                //field(contactNo; Rec."Contact No.")        { Caption = 'Contact No.'; }

                // --- Commercial settings ---
                field(commissionPct; Rec."Commission %")   { Caption = 'Commission %'; }
                //field(respCenter; Rec."Responsibility Center") { Caption = 'Responsibility Center'; }

                // --- System fields ---
                field(systemId; Rec.SystemId)                 { Caption = 'SystemId'; }
                field(systemCreatedAt; Rec.SystemCreatedAt)   { Caption = 'SystemCreatedAt'; }
                field(systemCreatedBy; Rec.SystemCreatedBy)   { Caption = 'SystemCreatedBy'; }
                field(systemModifiedAt; Rec.SystemModifiedAt) { Caption = 'SystemModifiedAt'; }
                field(systemModifiedBy; Rec.SystemModifiedBy) { Caption = 'SystemModifiedBy'; }
            }
        }
    }

    // Ingen Option/Enum-felter i standard → ingen INT-spejle.
    // Hvis I har egne Option/Enum felter via tableextensions, kan de spejles her:
    //
    // var
    //     myEnumInt: Integer;
    //
    // trigger OnAfterGetRecord()
    // begin
    //     // myEnumInt := Rec."My Enum Field".AsInteger(); // eller Option: myEnumInt := Rec."My Option Field";
    // end;
}
