page 50264 "ProdBOMLineScrapAPI"
{
    /// <summary>
    /// Date        Name                    Version   Description
    /// 2025.11.20  Business Central AL     001.0     Scrap-focused API page for Production BOM Line (99000772)
    /// </summary>

    Caption = 'ProdBOMLineScrapAPI';
    AdditionalSearchTerms = 'SCANPAN, API, datawarehouse, dw, scrap';
    UsageCategory = Administration;

    PageType = API;
    APIPublisher = 'scanpan';
    APIGroup = 'datawarehouse';
    APIVersion = 'beta', 'v1.0';

    EntitySetName = 'productionBOMLineScraps';
    EntityName = 'productionBOMLineScrap';

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
                Caption = 'Scrap';

                // --- OData key ---
                field(systemId; Rec.SystemId)                                 { Caption = 'SystemId'; }

                // --- Natural keys / relations ---
                field(productionBOMNo; Rec."Production BOM No.")              { Caption = 'Production BOM No.'; }
                field(versionCode; Rec."Version Code")                        { Caption = 'Version Code'; }
                field(lineNo; Rec."Line No.")                                 { Caption = 'Line No.'; }
                field(no; Rec."No.")                                          { Caption = 'No.'; }
                field(routingLinkCode; Rec."Routing Link Code")               { Caption = 'Routing Link Code'; }
                field(position; Rec.Position)                                  { Caption = 'Position'; }

                // --- Scrap core ---
                field(scrapPercent; Rec."Scrap %")                            { Caption = 'Scrap %'; }

                // --- System fields ---
                field(systemCreatedAt; Rec.SystemCreatedAt)                   { Caption = 'SystemCreatedAt'; }
                field(systemCreatedBy; Rec.SystemCreatedBy)                   { Caption = 'SystemCreatedBy'; }
                field(systemModifiedAt; Rec.SystemModifiedAt)                 { Caption = 'SystemModifiedAt'; }
                field(systemModifiedBy; Rec.SystemModifiedBy)                 { Caption = 'SystemModifiedBy'; }
            }
        }
    }
}
