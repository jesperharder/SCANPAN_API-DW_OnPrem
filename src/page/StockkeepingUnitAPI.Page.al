page 50267 "StockkeepingUnitAPI"
{
    /// <summary>
    /// Date        Name                    Version   Description
    /// 2025.11.20  Business Central AL     001.0     API page for Stockkeeping Unit (table 5700)
    /// </summary>

    Caption = 'StockkeepingUnitAPI';
    AdditionalSearchTerms = 'SCANPAN, API, datawarehouse, dw, sku, planning';
    UsageCategory = Administration;

    PageType = API;
    APIPublisher = 'scanpan';
    APIGroup = 'datawarehouse';
    APIVersion = 'beta', 'v1.0';

    EntitySetName = 'stockkeepingUnits';
    EntityName = 'stockkeepingUnit';

    DelayedInsert = true;
    Editable = false;

    SourceTable = "Stockkeeping Unit";
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

                // --- Natural keys / identity ---
                field(itemNo; Rec."Item No.")                             { Caption = 'Item No.'; }
                field(variantCode; Rec."Variant Code")                    { Caption = 'Variant Code'; }
                field(locationCode; Rec."Location Code")                  { Caption = 'Location Code'; }
                //field(binCode; Rec."Bin Code")                            { Caption = 'Bin Code'; }

                // --- Planning policies (Enums/Options) + INT-spejle ---
                field(replenishmentSystem; Rec."Replenishment System")    { Caption = 'Replenishment System'; }
                field(replenishmentSystemInt; replenishmentSystemInt)     { Caption = 'Replenishment System INT'; }

                field(reorderingPolicy; Rec."Reordering Policy")          { Caption = 'Reordering Policy'; }
                field(reorderingPolicyInt; reorderingPolicyInt)           { Caption = 'Reordering Policy INT'; }

                //field(planningFlexibility; Rec."Planning Flexibility")    { Caption = 'Planning Flexibility'; }
                field(planningFlexibilityInt; planningFlexibilityInt)     { Caption = 'Planning Flexibility INT'; }

                field(flushingMethod; Rec."Flushing Method")              { Caption = 'Flushing Method'; }
                field(flushingMethodInt; flushingMethodInt)               { Caption = 'Flushing Method INT'; }

                // --- Replenishment data ---
                field(vendorNo; Rec."Vendor No.")                         { Caption = 'Vendor No.'; }
                field(leadTimeCalculation; Rec."Lead Time Calculation")   { Caption = 'Lead Time Calculation'; }
                field(safetyLeadTime; Rec."Safety Lead Time")             { Caption = 'Safety Lead Time'; }
                field(reorderPoint; Rec."Reorder Point")                  { Caption = 'Reorder Point'; }
                field(reorderQuantity; Rec."Reorder Quantity")            { Caption = 'Reorder Quantity'; }
                field(maximumInventory; Rec."Maximum Inventory")          { Caption = 'Maximum Inventory'; }
                field(orderMultiple; Rec."Order Multiple")                { Caption = 'Order Multiple'; }
                field(minimumOrderQty; Rec."Minimum Order Quantity")      { Caption = 'Minimum Order Quantity'; }
                field(maximumOrderQty; Rec."Maximum Order Quantity")      { Caption = 'Maximum Order Quantity'; }
                field(lotAccumulationPeriod; Rec."Lot Accumulation Period"){ Caption = 'Lot Accumulation Period'; }

                // --- Item setup on SKU level ---
                //field(unitOfMeasureCode; Rec."Unit of Measure Code")      { Caption = 'Unit of Measure Code'; }
                field(shelfNo; Rec."Shelf No.")                           { Caption = 'Shelf No.'; }
                field(assemblyPolicy; Rec."Assembly Policy")              { Caption = 'Assembly Policy'; } // Code/Enum afhænger af version
                field(productionBOMNo; Rec."Production BOM No.")          { Caption = 'Production BOM No.'; }
                field(routingNo; Rec."Routing No.")                       { Caption = 'Routing No.'; }

                // --- Inventory figures (ikke calc. flowfields) ---
                field(safetyStockQty; Rec."Safety Stock Quantity")        { Caption = 'Safety Stock Quantity'; }
                field(overflowLevel; Rec."Overflow Level")                { Caption = 'Overflow Level'; }
                //field(inventoryPostingGroup; Rec."Inventory Posting Group"){ Caption = 'Inventory Posting Group'; }

                // --- Warehouse defaults ---
                field(putAwayTemplateCode; Rec."Put-away Template Code")  { Caption = 'Put-away Template Code'; }
                //field(pickTemplateCode; Rec."Pick Template Code")         { Caption = 'Pick Template Code'; }

                // --- System fields ---
                field(systemCreatedAt; Rec.SystemCreatedAt)               { Caption = 'SystemCreatedAt'; }
                field(systemCreatedBy; Rec.SystemCreatedBy)               { Caption = 'SystemCreatedBy'; }
                field(systemModifiedAt; Rec.SystemModifiedAt)             { Caption = 'SystemModifiedAt'; }
                field(systemModifiedBy; Rec.SystemModifiedBy)             { Caption = 'SystemModifiedBy'; }
            }
        }
    }

    var
        replenishmentSystemInt: Integer;
        reorderingPolicyInt: Integer;
        planningFlexibilityInt: Integer;
        flushingMethodInt: Integer;

    trigger OnAfterGetRecord()
    begin
        // Enum/Option -> Integer spejle (Enums i nyere BC; Option i ældre)
        replenishmentSystemInt := Rec."Replenishment System".AsInteger();
        reorderingPolicyInt := Rec."Reordering Policy".AsInteger();
        //planningFlexibilityInt := Rec."Planning Flexibility".AsInteger();
        flushingMethodInt := Rec."Flushing Method".AsInteger();

        // Hvis nogle af ovenstående er Option i din version, brug direkte tildeling i stedet, f.eks.:
        // reorderingPolicyInt := Rec."Reordering Policy";
    end;
}
