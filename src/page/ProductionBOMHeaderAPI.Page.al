page 50244 "ProductionBOMHeaderAPI"
{
    /// <summary>
    /// Date        Name                        Version   Description
    /// 2025.11.20  Business Central AL Asst.   001.0     API page for Production BOM Header (table 99000771)
    /// </summary>

    Caption = 'SPN ProductionBOMHeaderAPI';
    AdditionalSearchTerms = 'SCANPAN, API, datawarehouse, dw';
    UsageCategory = Administration;

    PageType = API;
    APIPublisher = 'scanpan';
    APIGroup = 'datawarehouse';
    APIVersion = 'beta', 'v1.0';

    EntitySetName = 'productionBOMHeaders';
    EntityName = 'productionBOMHeader';

    DelayedInsert = true;
    Editable = false;

    SourceTable = "Production BOM Header";
    SourceTableView = sorting("No.") order(ascending);
    ODataKeyFields = "No.";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                Caption = 'Group';

                // --- Key ---
                field(no; Rec."No.")                            { Caption = 'No.'; }

                // --- Descriptive ---
                field(description; Rec.Description)             { Caption = 'Description'; }
                field(unitOfMeasureCode; Rec."Unit of Measure Code") { Caption = 'Unit of Measure Code'; }

                // --- Status (Enum/Option) + INT-spejl ---
                field(status; Rec.Status)                       { Caption = 'Status'; }
                field(statusInt; statusInt)                     { Caption = 'Status INT'; }

                // --- Versioning / maintenance ---
                field(versionNos; Rec."Version Nos.")           { Caption = 'Version Nos.'; }
                field(lastDateModified; Rec."Last Date Modified"){ Caption = 'Last Date Modified'; }

                // --- System fields ---
                field(systemId; Rec.SystemId)                   { Caption = 'SystemId'; }
                field(systemCreatedAt; Rec.SystemCreatedAt)     { Caption = 'SystemCreatedAt'; }
                field(systemCreatedBy; Rec.SystemCreatedBy)     { Caption = 'SystemCreatedBy'; }
                field(systemModifiedAt; Rec.SystemModifiedAt)   { Caption = 'SystemModifiedAt'; }
                field(systemModifiedBy; Rec.SystemModifiedBy)   { Caption = 'SystemModifiedBy'; }
            }
        }
    }

    var
        statusInt: Integer;

    trigger OnAfterGetRecord()
    begin
        // Enum/Option -> Integer spejl
        statusInt := Rec.Status.AsInteger();
        // Hvis Status er Option i jeres version, kan du alternativt bruge:
        // statusInt := Rec.Status;
    end;
}
