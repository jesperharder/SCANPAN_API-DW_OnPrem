page 50269 "ScrapAPI"
{
    /// <summary>
    /// Date        Name                    Version   Description
    /// 2026.03.12  Business Central AL     001.0     API page for Scrap (table 99000762)
    /// </summary>

    Caption = 'ScrapAPI';
    AdditionalSearchTerms = 'SCANPAN, API, datawarehouse, dw, scrap';
    UsageCategory = Administration;

    PageType = API;
    APIPublisher = 'scanpan'; 
    APIGroup = 'datawarehouse';
    APIVersion = 'beta', 'v1.0';

    EntitySetName = 'scraps';
    EntityName = 'scrap';

    DelayedInsert = true;
    Editable = false;

    SourceTable = Scrap;
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
                field(code; Rec.Code) { Caption = 'Code'; }

                // --- Descriptive ---
                field(description; Rec.Description) { Caption = 'Description'; }

                // --- System fields ---
                field(systemId; Rec.SystemId) { Caption = 'SystemId'; }
                field(systemCreatedAt; Rec.SystemCreatedAt) { Caption = 'SystemCreatedAt'; }
                field(systemCreatedBy; Rec.SystemCreatedBy) { Caption = 'SystemCreatedBy'; }
                field(systemModifiedAt; Rec.SystemModifiedAt) { Caption = 'SystemModifiedAt'; }
                field(systemModifiedBy; Rec.SystemModifiedBy) { Caption = 'SystemModifiedBy'; }
            }
        }
    }
}
