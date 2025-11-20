page 50242 "ProdOrderLineAPI"
{
    /// <summary>
    /// Date        Name                        Version   Description
    /// 2025.11.20  Business Central AL Asst.   001.0     API page for Prod. Order Line (table 5406)
    /// </summary>

    Caption = 'ProdOrderLineAPI';
    AdditionalSearchTerms = 'SCANPAN, API, datawarehouse, dw';
    UsageCategory = Administration;

    PageType = API;
    APIPublisher = 'scanpan';
    APIGroup = 'datawarehouse';
    APIVersion = 'beta', 'v1.0';

    EntitySetName = 'prodOrderLines';
    EntityName = 'prodOrderLine';

    DelayedInsert = true;
    Editable = false;

    SourceTable = "Prod. Order Line";
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

                // --- Header/relations ---
                field(status; Rec.Status)                             { Caption = 'Status'; }
                field(statusInt; statusInt)                           { Caption = 'Status INT'; }

                field(prodOrderNo; Rec."Prod. Order No.")             { Caption = 'Prod. Order No.'; }
                field(lineNo; Rec."Line No.")                         { Caption = 'Line No.'; }

                // --- Item identity ---
                field(itemNo; Rec."Item No.")                         { Caption = 'Item No.'; }
                field(variantCode; Rec."Variant Code")                { Caption = 'Variant Code'; }
                field(description; Rec.Description)                   { Caption = 'Description'; }
                field(unitOfMeasureCode; Rec."Unit of Measure Code")  { Caption = 'Unit of Measure Code'; }

                // --- Location/bin ---
                field(locationCode; Rec."Location Code")              { Caption = 'Location Code'; }
                field(binCode; Rec."Bin Code")                        { Caption = 'Bin Code'; }

                // --- BOM / Routing reference ---
                field(productionBOMNo; Rec."Production BOM No.")      { Caption = 'Production BOM No.'; }
                field(routingNo; Rec."Routing No.")                   { Caption = 'Routing No.'; }
                field(routingRefNo; Rec."Routing Reference No.")      { Caption = 'Routing Reference No.'; }

                // --- Quantities ---
                field(quantity; Rec.Quantity)                         { Caption = 'Quantity'; }
                field(quantityBase; Rec."Quantity (Base)")            { Caption = 'Quantity (Base)'; }
                field(remainingQuantity; Rec."Remaining Quantity")    { Caption = 'Remaining Quantity'; }
                field(finishedQuantity; Rec."Finished Quantity")      { Caption = 'Finished Quantity'; }
                field(scrapPercent; Rec."Scrap %")                    { Caption = 'Scrap %'; }

                // --- Dates ---
                field(startingDate; Rec."Starting Date")              { Caption = 'Starting Date'; }
                field(endingDate; Rec."Ending Date")                  { Caption = 'Ending Date'; }
                field(dueDate; Rec."Due Date")                        { Caption = 'Due Date'; }

                // --- System fields (audit) ---
                field(systemCreatedAt; Rec.SystemCreatedAt)           { Caption = 'SystemCreatedAt'; }
                field(systemCreatedBy; Rec.SystemCreatedBy)           { Caption = 'SystemCreatedBy'; }
                field(systemModifiedAt; Rec.SystemModifiedAt)         { Caption = 'SystemModifiedAt'; }
                field(systemModifiedBy; Rec.SystemModifiedBy)         { Caption = 'SystemModifiedBy'; }
            }
        }
    }

    var
        statusInt: Integer;

    trigger OnAfterGetRecord()
    begin
        // Enum/Option -> Integer spejl
        statusInt := Rec.Status.AsInteger();
        // Tilføj flere spejle her, hvis I har ekstra Option/Enum-felter via tableextensions:
        // myEnumInt := Rec."My Enum Field".AsInteger();
        // myOptionInt := Rec."My Option Field";
    end;
}
