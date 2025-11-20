page 50241 "ProdOrderComponentAPI"
{
    /// <summary>
    /// Date        Name                        Version   Description
    /// 2025.11.20  Business Central AL Asst.   001.0     API page for Prod. Order Component (table 5407)
    /// </summary>

    Caption = 'ProdOrderComponentAPI';
    AdditionalSearchTerms = 'SCANPAN, API, datawarehouse, dw';
    UsageCategory = Administration;

    PageType = API;
    APIPublisher = 'scanpan';
    APIGroup = 'datawarehouse';
    APIVersion = 'beta', 'v1.0';

    EntitySetName = 'prodOrderComponents';
    EntityName = 'prodOrderComponent';

    DelayedInsert = true;
    Editable = false;

    SourceTable = "Prod. Order Component";
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
                field(systemId; Rec.SystemId)                             { Caption = 'SystemId'; }

                // --- Header/relations ---
                field(status; Rec.Status)                                 { Caption = 'Status'; }
                field(statusInt; statusInt)                               { Caption = 'Status INT'; }

                field(prodOrderNo; Rec."Prod. Order No.")                 { Caption = 'Prod. Order No.'; }
                field(prodOrderLineNo; Rec."Prod. Order Line No.")        { Caption = 'Prod. Order Line No.'; }
                field(lineNo; Rec."Line No.")                             { Caption = 'Line No.'; }

                // --- Component identity ---
                //field(type; Rec.Type)                                     { Caption = 'Type'; }
                field(typeInt; typeInt)                                   { Caption = 'Type INT'; }

                field(itemNo; Rec."Item No.")                             { Caption = 'Item No.'; }
                field(variantCode; Rec."Variant Code")                    { Caption = 'Variant Code'; }
                field(description; Rec.Description)                       { Caption = 'Description'; }
                field(unitOfMeasureCode; Rec."Unit of Measure Code")      { Caption = 'Unit of Measure Code'; }
                field(locationCode; Rec."Location Code")                  { Caption = 'Location Code'; }
                field(binCode; Rec."Bin Code")                            { Caption = 'Bin Code'; }

                // --- Routing/operation link ---
                //field(operationNo; Rec."Operation No.")                   { Caption = 'Operation No.'; }
                field(routingLinkCode; Rec."Routing Link Code")           { Caption = 'Routing Link Code'; }

                // --- Quantities / calc ---
                field(quantityPer; Rec."Quantity per")                    { Caption = 'Quantity per'; }
                field(expectedQuantity; Rec."Expected Quantity")          { Caption = 'Expected Quantity'; }
                field(expectedQtyBase; Rec."Expected Qty. (Base)")        { Caption = 'Expected Qty. (Base)'; }
                field(remainingQuantity; Rec."Remaining Quantity")        { Caption = 'Remaining Quantity'; }
                field(remainingQtyBase; Rec."Remaining Qty. (Base)")      { Caption = 'Remaining Qty. (Base)'; }
                //field(consumedQuantity; Rec."Consumed Quantity")          { Caption = 'Consumed Quantity'; }
                //field(consumedQtyBase; Rec."Consumed Qty. (Base)")        { Caption = 'Consumed Qty. (Base)'; }
                field(scrapPercent; Rec."Scrap %")                        { Caption = 'Scrap %'; }
                //field(scrapQuantity; Rec."Scrap Quantity")                { Caption = 'Scrap Quantity'; }
                field(indirectCostPct; Rec."Indirect Cost %")             { Caption = 'Indirect Cost %'; }

                // --- Timing / policies ---
                //field(startingDate; Rec."Starting Date")                  { Caption = 'Starting Date'; }
                field(dueDate; Rec."Due Date")                            { Caption = 'Due Date'; }
                field(flushingMethod; Rec."Flushing Method")              { Caption = 'Flushing Method'; }
                field(flushingMethodInt; flushingMethodInt)               { Caption = 'Flushing Method INT'; }
                //field(backflushed; Rec.Backflushed)                       { Caption = 'Backflushed'; }

                // --- System fields ---
                field(systemCreatedAt; Rec.SystemCreatedAt)               { Caption = 'SystemCreatedAt'; }
                field(systemCreatedBy; Rec.SystemCreatedBy)               { Caption = 'SystemCreatedBy'; }
                field(systemModifiedAt; Rec.SystemModifiedAt)             { Caption = 'SystemModifiedAt'; }
                field(systemModifiedBy; Rec.SystemModifiedBy)             { Caption = 'SystemModifiedBy'; }
            }
        }
    }

    var
        statusInt: Integer;
        typeInt: Integer;
        flushingMethodInt: Integer;

    trigger OnAfterGetRecord()
    begin
        // Enum/Option -> Integer spejle
        // I nyere BC er disse felter Enums; brug AsInteger(). Hvis Option i jeres version, brug direkte tildeling.
        statusInt := Rec.Status.AsInteger();
        //typeInt := Rec.Type.AsInteger();               // hvis Option i jeres version: typeInt := Rec.Type;
        flushingMethodInt := Rec."Flushing Method".AsInteger();
    end;
}
