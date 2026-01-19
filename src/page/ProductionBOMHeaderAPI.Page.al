page 50290 "ProductionBOMHeaderAPI"
{
    /// <summary>
    /// Date        Name                    Version   Description
    /// 2026.01.19  Business Central AL     001.0     API page for Production BOM Header (table 99000771)
    /// </summary>

    Caption = 'ProductionBOMHeaderAPI';
    AdditionalSearchTerms = 'SCANPAN, API, datawarehouse, dw, production bom, bom header, manufacturing';
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

    // Natural key for this table
    ODataKeyFields = "No.";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                Caption = 'Group';

                // --- Key & identity ---
                field(no; Rec."No.") { Caption = 'No.'; }

                // --- Descriptions / search ---
                field(description; Rec.Description) { Caption = 'Description'; }
                field(description2; Rec."Description 2") { Caption = 'Description 2'; }
                field(searchName; Rec."Search Name") { Caption = 'Search Name'; }

                // --- UoM / structure ---
                field(unitOfMeasureCode; Rec."Unit of Measure Code") { Caption = 'Unit of Measure Code'; }
                field(lowLevelCode; Rec."Low-Level Code") { Caption = 'Low-Level Code'; }

                // FlowField (exists = comments)
                field(comment; Rec.Comment) { Caption = 'Comment'; }

                // --- Lifecycle dates ---
                field(creationDate; Rec."Creation Date") { Caption = 'Creation Date'; }
                field(lastDateModified; Rec."Last Date Modified") { Caption = 'Last Date Modified'; }

                // --- Status (enum + INT mirror) ---
                field(status; Rec.Status) { Caption = 'Status'; }
                field(statusInt; Rec.Status.AsInteger()) { Caption = 'Status (Int)'; }

                // --- Number series ---
                field(versionNos; Rec."Version Nos.") { Caption = 'Version Nos.'; }
                field(noSeries; Rec."No. Series") { Caption = 'No. Series'; }

                // --- System audit fields (for incremental loads / lineage) ---
                field(systemCreatedAt; Rec.SystemCreatedAt) { Caption = 'System Created At'; }
                field(systemCreatedBy; Rec.SystemCreatedBy) { Caption = 'System Created By'; }
                field(systemModifiedAt; Rec.SystemModifiedAt) { Caption = 'System Modified At'; }
                field(systemModifiedBy; Rec.SystemModifiedBy) { Caption = 'System Modified By'; }

                // Optional tracking identity (NOT used as key)
                field(systemId; Rec.SystemId) { Caption = 'SystemId'; }
            }
        }
    }
}
