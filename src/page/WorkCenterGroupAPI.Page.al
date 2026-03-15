page 50283 "WorkCenterGroupAPI"
{
    /// <summary>
    /// Date        Name                    Version   Description
    /// 2026.03.12  Business Central AL     001.0     API page for Work Center Group (table 99000756)
    /// </summary>

    Caption = 'WorkCenterGroupAPI';
    AdditionalSearchTerms = 'SCANPAN, API, datawarehouse, dw, manufacturing, work center group';
    UsageCategory = Administration;

    PageType = API;
    APIPublisher = 'scanpan';
    APIGroup = 'datawarehouse';
    APIVersion = 'beta', 'v1.0';

    EntitySetName = 'workCenterGroups';
    EntityName = 'workCenterGroup';

    DelayedInsert = true;
    Editable = false;

    SourceTable = "Work Center Group";
    SourceTableView = sorting(Code) order(ascending);
    ODataKeyFields = Code;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                Caption = 'Group';

                // --- Key / identity ---
                field(code; Rec.Code)                                { Caption = 'Code'; }
                field(name; Rec.Name)                                { Caption = 'Name'; }

                // --- System fields ---
                field(systemId; Rec.SystemId)                        { Caption = 'SystemId'; }
                field(systemCreatedAt; Rec.SystemCreatedAt)          { Caption = 'SystemCreatedAt'; }
                field(systemCreatedBy; Rec.SystemCreatedBy)          { Caption = 'SystemCreatedBy'; }
                field(systemModifiedAt; Rec.SystemModifiedAt)        { Caption = 'SystemModifiedAt'; }
                field(systemModifiedBy; Rec.SystemModifiedBy)        { Caption = 'SystemModifiedBy'; }
            }
        }
    }
}