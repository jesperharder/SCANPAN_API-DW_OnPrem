page 50278 "UnitOfMeasureAPI"
{
    /// <summary>
    /// Date        Name                    Version   Description
    /// 2025.11.20  Business Central AL     001.0     API page for Unit of Measure (table 204)
    /// </summary>

    Caption = 'UnitOfMeasureAPI';
    AdditionalSearchTerms = 'SCANPAN, API, datawarehouse, dw, uom, unit of measure';
    UsageCategory = Administration;

    PageType = API;
    APIPublisher = 'scanpan';
    APIGroup = 'datawarehouse';
    APIVersion = 'beta', 'v1.0';

    EntitySetName = 'unitsOfMeasure';
    EntityName = 'unitOfMeasure';

    DelayedInsert = true;
    Editable = false;

    SourceTable = "Unit of Measure";
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
                field(code; Rec.Code)                                { Caption = 'Code'; }

                // --- Descriptive ---
                field(description; Rec.Description)                  { Caption = 'Description'; }
                field(internationalStandardCode; Rec."International Standard Code")
                {
                    Caption = 'International Standard Code';
                }

                // --- System fields ---
                field(systemId; Rec.SystemId)                        { Caption = 'SystemId'; }
                field(systemCreatedAt; Rec.SystemCreatedAt)          { Caption = 'SystemCreatedAt'; }
                field(systemCreatedBy; Rec.SystemCreatedBy)          { Caption = 'SystemCreatedBy'; }
                field(systemModifiedAt; Rec.SystemModifiedAt)        { Caption = 'SystemModifiedAt'; }
                field(systemModifiedBy; Rec.SystemModifiedBy)        { Caption = 'SystemModifiedBy'; }
            }
        }
    }

    // Ingen Option/Enum-felter i standard → ingen INT-spejle.
}
