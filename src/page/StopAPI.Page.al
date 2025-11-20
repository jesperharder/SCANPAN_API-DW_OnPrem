page 50268 "StopAPI"
{
    /// <summary>
    /// Date        Name                    Version   Description
    /// 2025.11.20  Business Central AL     001.0     API page for Stop (master data)
    /// NOTE: If your environment uses a different table id/name for Stop,
    ///       adjust SourceTable accordingly.
    /// </summary>

    Caption = 'StopAPI';
    AdditionalSearchTerms = 'SCANPAN, API, datawarehouse, dw, manufacturing, downtime, stop';
    UsageCategory = Administration;

    PageType = API;
    APIPublisher = 'scanpan';
    APIGroup = 'datawarehouse';
    APIVersion = 'beta', 'v1.0';

    EntitySetName = 'stops';
    EntityName = 'stop';

    DelayedInsert = true;
    Editable = false;

    // ASSUMPTION: Table is named "Stop" in your environment.
    // If yours is e.g. "SPF Stop" or similar, replace SourceTable with that name/id.
    SourceTable = Stop;
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

                // --- Optional/common flag (if present in your table) ---
                /*field(blocked; Rec.Blocked)
                {
                    Caption = 'Blocked';
                    // Remove this field if your Stop table doesn't have it.
                }
                */

                // --- System fields ---
                field(systemId; Rec.SystemId)                 { Caption = 'SystemId'; }
                field(systemCreatedAt; Rec.SystemCreatedAt)   { Caption = 'SystemCreatedAt'; }
                field(systemCreatedBy; Rec.SystemCreatedBy)   { Caption = 'SystemCreatedBy'; }
                field(systemModifiedAt; Rec.SystemModifiedAt) { Caption = 'SystemModifiedAt'; }
                field(systemModifiedBy; Rec.SystemModifiedBy) { Caption = 'SystemModifiedBy'; }
            }
        }
    }

    // No Option/Enum fields assumed → no INT mirrors needed.
    // If your Stop table includes Option/Enum fields (e.g., Category, Severity),
    // add <fieldName>Int variables and map them in OnAfterGetRecord() with .AsInteger().
}
