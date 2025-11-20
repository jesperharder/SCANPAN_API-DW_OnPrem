page 50254 "ReturnReasonAPI"
{
    /// <summary>
    /// Date        Name                    Version   Description
    /// 2025.11.20  Business Central AL     001.0     API page for Return Reason (standard table)
    /// </summary>

    Caption = 'ReturnReasonAPI';
    AdditionalSearchTerms = 'SCANPAN, API, datawarehouse, dw';
    UsageCategory = Administration;

    PageType = API;
    APIPublisher = 'scanpan';
    APIGroup = 'datawarehouse';
    APIVersion = 'beta', 'v1.0';

    EntitySetName = 'returnReasons';
    EntityName = 'returnReason';

    DelayedInsert = true;
    Editable = false;

    SourceTable = "Return Reason";
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
                field(code; Rec.Code)                { Caption = 'Code'; }

                // --- Descriptive ---
                field(description; Rec.Description)  { Caption = 'Description'; }

                // --- Optional standard field (Boolean) ---
                //field(blocked; Rec.Blocked)          { Caption = 'Blocked'; }

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
    // Hvis du har egne Option/Enum felter via tableextensions, kan du tilføje variabler + OnAfterGetRecord() tilsvarende:
    //
    // var
    //     myEnumInt: Integer;
    //
    // trigger OnAfterGetRecord()
    // begin
    //     // For Enum:
    //     // myEnumInt := Rec."My Enum Field".AsInteger();
    //     // For Option:
    //     // myEnumInt := Rec."My Option Field";
    // end;
}
