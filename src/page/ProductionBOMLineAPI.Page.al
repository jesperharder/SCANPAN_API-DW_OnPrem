page 50245 "ProductionBOMLineAPI"
{
    /// <summary>
    /// Date        Name                        Version   Description
    /// 2025.11.20  Business Central AL Asst.   001.0     API page for Production BOM Line (table 99000772)
    /// </summary>

    Caption = 'ProductionBOMLineAPI';
    AdditionalSearchTerms = 'SCANPAN, API, datawarehouse, dw';
    UsageCategory = Administration;

    PageType = API;
    APIPublisher = 'scanpan';
    APIGroup = 'datawarehouse';
    APIVersion = 'beta', 'v1.0';

    EntitySetName = 'productionBOMLines';
    EntityName = 'productionBOMLine';

    DelayedInsert = true;
    Editable = false;

    SourceTable = "Production BOM Line";
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
                field(systemId; Rec.SystemId)                                 { Caption = 'SystemId'; }

                // --- Natural keys / relations ---
                field(productionBOMNo; Rec."Production BOM No.")              { Caption = 'Production BOM No.'; }
                field(versionCode; Rec."Version Code")                        { Caption = 'Version Code'; }
                field(lineNo; Rec."Line No.")                                 { Caption = 'Line No.'; }

                // --- Identity / classification ---
                field(type; Rec.Type)                                         { Caption = 'Type'; }
                field(typeInt; typeInt)                                       { Caption = 'Type INT'; }

                field(no; Rec."No.")                                          { Caption = 'No.'; }
                field(variantCode; Rec."Variant Code")                        { Caption = 'Variant Code'; }
                field(description; Rec.Description)                           { Caption = 'Description'; }
                field(unitOfMeasureCode; Rec."Unit of Measure Code")          { Caption = 'Unit of Measure Code'; }

                // --- Quantities & calc ---
                field(quantityPer; Rec."Quantity per")                        { Caption = 'Quantity per'; }
                field(scrapPercent; Rec."Scrap %")                            { Caption = 'Scrap %'; }

                // --- Linking / positioning ---
                field(routingLinkCode; Rec."Routing Link Code")               { Caption = 'Routing Link Code'; }
                field(position; Rec.Position)                                  { Caption = 'Position'; }

                // --- System fields ---
                field(systemCreatedAt; Rec.SystemCreatedAt)                   { Caption = 'SystemCreatedAt'; }
                field(systemCreatedBy; Rec.SystemCreatedBy)                   { Caption = 'SystemCreatedBy'; }
                field(systemModifiedAt; Rec.SystemModifiedAt)                 { Caption = 'SystemModifiedAt'; }
                field(systemModifiedBy; Rec.SystemModifiedBy)                 { Caption = 'SystemModifiedBy'; }
            }
        }
    }

    var
        typeInt: Integer;

    trigger OnAfterGetRecord()
    begin
        // Enum/Option -> Integer spejl
        // I nyere BC er Type en Enum; brug AsInteger(). Hvis det er Option i jeres version, kan du tildele direkte.
        typeInt := Rec.Type.AsInteger();
        // Hvis Option:
        // typeInt := Rec.Type;
    end;
}
