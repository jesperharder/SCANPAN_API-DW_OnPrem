page 50275 "TeamSalesPersonAPI"
{
    /// <summary>
    /// Date        Name                    Version   Description
    /// 2025.11.20  Business Central AL     001.0     API page for Team–Salesperson link (junction table)
    /// </summary>

    Caption = 'TeamSalesPersonAPI';
    AdditionalSearchTerms = 'SCANPAN, API, datawarehouse, dw, team, salesperson, junction';
    UsageCategory = Administration;

    PageType = API;
    APIPublisher = 'scanpan';
    APIGroup = 'datawarehouse';
    APIVersion = 'beta', 'v1.0';

    EntitySetName = 'teamSalesPersons';
    EntityName = 'teamSalesPerson';

    DelayedInsert = true;
    Editable = false;

    // NOTE: Adjust if your table name/id differs (e.g., "Team Sales Person", "TeamSalesPerson").
    SourceTable = "Team Salesperson";
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
                field(systemId; Rec.SystemId)                         { Caption = 'SystemId'; }

                // --- Relations ---
                field(teamCode; Rec."Team Code")                      { Caption = 'Team Code'; }
                field(salespersonCode; Rec."Salesperson Code")        { Caption = 'Salesperson Code'; }

                // --- (Optional) More fields if present in your table ---
                // field(fromDate; Rec."From Date")                    { Caption = 'From Date'; }
                // field(toDate; Rec."To Date")                        { Caption = 'To Date'; }
                // field(role; Rec.Role)                               { Caption = 'Role'; }          // Enum/Option
                // field(roleInt; roleInt)                             { Caption = 'Role INT'; }      // INT-spejl

                // --- System fields (audit) ---
                field(systemCreatedAt; Rec.SystemCreatedAt)           { Caption = 'SystemCreatedAt'; }
                field(systemCreatedBy; Rec.SystemCreatedBy)           { Caption = 'SystemCreatedBy'; }
                field(systemModifiedAt; Rec.SystemModifiedAt)         { Caption = 'SystemModifiedAt'; }
                field(systemModifiedBy; Rec.SystemModifiedBy)         { Caption = 'SystemModifiedBy'; }
            }
        }
    }

    // --- INT mirrors (only if you uncomment Enum/Option fields above) ---
    // var
    //     roleInt: Integer;
    //
    // trigger OnAfterGetRecord()
    // begin
    //     // Enum -> Int:
    //     // roleInt := Rec.Role.AsInteger();
    //     // Option -> Int:
    //     // roleInt := Rec.Role;
    // end;
}
