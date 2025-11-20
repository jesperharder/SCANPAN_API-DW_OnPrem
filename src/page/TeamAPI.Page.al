page 50274 "TeamAPI"
{
    /// <summary>
    /// Date        Name                    Version   Description
    /// 2025.11.20  Business Central AL     001.0     API page for Team (master data; adjust SourceTable/fields if different in your env.)
    /// </summary>

    Caption = 'TeamAPI';
    AdditionalSearchTerms = 'SCANPAN, API, datawarehouse, dw, team, group';
    UsageCategory = Administration;

    PageType = API;
    APIPublisher = 'scanpan';
    APIGroup = 'datawarehouse';
    APIVersion = 'beta', 'v1.0';

    EntitySetName = 'teams';
    EntityName = 'team';

    DelayedInsert = true;
    Editable = false;

    // NOTE: If your table has a different name/id (e.g., "Sales Team", "Service Team"), change this accordingly.
    SourceTable = Team;
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
                field(description; Rec.Name)  { Caption = 'Name'; }

                // --- Optional/common flag (remove if not present) ---
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

    // Ingen Option/Enum-felter antaget → ingen INT-spejle.
    // Hvis jeres "Team" har Enum/Option felter (fx Team Type), så tilføj <felt>Int og map i OnAfterGetRecord():
    // var
    //     teamTypeInt: Integer;
    // trigger OnAfterGetRecord()
    // begin
    //     teamTypeInt := Rec."Team Type".AsInteger(); // eller direkte ved Option
    // end;
}
