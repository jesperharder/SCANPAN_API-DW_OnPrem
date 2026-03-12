page 50224 "ItemAPI"
{
    PageType = API;
    SourceTable = Item;

    APIPublisher = 'scanpan';
    APIGroup = 'datawarehouse';
    APIVersion = 'beta', 'v1.0';
    EntityName = 'item';
    EntitySetName = 'items';

    ODataKeyFields = SystemId;

    Caption = 'Item API (DW)';
    UsageCategory = Administration;
    AdditionalSearchTerms = 'SCANPAN, API, datawarehouse, dw, item';

    Editable = false;
    DelayedInsert = true;
    Extensible = false;

    InsertAllowed = false;
    ModifyAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                // ---------------------------------------------------------
                // Identity
                // ---------------------------------------------------------
                field(systemId; Rec.SystemId) { ApplicationArea = All; Caption = 'systemId'; }
                field(number; Rec."No.") { ApplicationArea = All; Caption = 'number'; }
                field(number2; Rec."No. 2") { ApplicationArea = All; Caption = 'number2'; }
                //field(legacyId; Rec.Id) { ApplicationArea = All; Caption = 'legacyId'; }

                // ---------------------------------------------------------
                // Descriptions
                // ---------------------------------------------------------
                field(description; Rec.Description) { ApplicationArea = All; Caption = 'description'; }
                field(description2; Rec."Description 2") { ApplicationArea = All; Caption = 'description2'; }
                field(searchDescription; Rec."Search Description") { ApplicationArea = All; Caption = 'searchDescription'; }
                field(shelfNo; Rec."Shelf No.") { ApplicationArea = All; Caption = 'shelfNo'; }
                field(commonItemNo; Rec."Common Item No.") { ApplicationArea = All; Caption = 'commonItemNo'; }

                // ---------------------------------------------------------
                // Classification
                // ---------------------------------------------------------
                field(type; Rec.Type) { ApplicationArea = All; Caption = 'type'; }
                field(typeInt; TypeInt) { ApplicationArea = All; Caption = 'typeInt'; }

                field(itemCategoryCode; Rec."Item Category Code") { ApplicationArea = All; Caption = 'itemCategoryCode'; }
                field(itemCategoryId; Rec."Item Category Id") { ApplicationArea = All; Caption = 'itemCategoryId'; }
                field(manufacturerCode; Rec."Manufacturer Code") { ApplicationArea = All; Caption = 'manufacturerCode'; }
                field(serviceItemGroup; Rec."Service Item Group") { ApplicationArea = All; Caption = 'serviceItemGroup'; }

                // ---------------------------------------------------------
                // Posting & tax
                // ---------------------------------------------------------
                field(inventoryPostingGroup; Rec."Inventory Posting Group") { ApplicationArea = All; Caption = 'inventoryPostingGroup'; }
                field(genProdPostingGroup; Rec."Gen. Prod. Posting Group") { ApplicationArea = All; Caption = 'genProdPostingGroup'; }
                field(vatProdPostingGroup; Rec."VAT Prod. Posting Group") { ApplicationArea = All; Caption = 'vatProdPostingGroup'; }
                field(vatBusPostingGrpPrice; Rec."VAT Bus. Posting Gr. (Price)") { ApplicationArea = All; Caption = 'vatBusPostingGrpPrice'; }
                field(taxGroupCode; Rec."Tax Group Code") { ApplicationArea = All; Caption = 'taxGroupCode'; }
                field(taxGroupId; Rec."Tax Group Id") { ApplicationArea = All; Caption = 'taxGroupId'; }
                field(dutyCode; Rec."Duty Code") { ApplicationArea = All; Caption = 'dutyCode'; }
                field(dutyDuePct; Rec."Duty Due %") { ApplicationArea = All; Caption = 'dutyDuePct'; }
                field(dutyUnitConversion; Rec."Duty Unit Conversion") { ApplicationArea = All; Caption = 'dutyUnitConversion'; }
                field(tariffNo; Rec."Tariff No.") { ApplicationArea = All; Caption = 'tariffNo'; }
                field(countryRegionPurchasedCode; Rec."Country/Region Purchased Code") { ApplicationArea = All; Caption = 'countryRegionPurchasedCode'; }
                field(countryRegionOfOriginCode; Rec."Country/Region of Origin Code") { ApplicationArea = All; Caption = 'countryRegionOfOriginCode'; }

                // ---------------------------------------------------------
                // Units of measure
                // ---------------------------------------------------------
                field(baseUnitOfMeasure; Rec."Base Unit of Measure") { ApplicationArea = All; Caption = 'baseUnitOfMeasure'; }
                field(unitOfMeasureId; Rec."Unit of Measure Id") { ApplicationArea = All; Caption = 'unitOfMeasureId'; }
                field(salesUnitOfMeasure; Rec."Sales Unit of Measure") { ApplicationArea = All; Caption = 'salesUnitOfMeasure'; }
                field(purchUnitOfMeasure; Rec."Purch. Unit of Measure") { ApplicationArea = All; Caption = 'purchUnitOfMeasure'; }
                field(putAwayUnitOfMeasureCode; Rec."Put-away Unit of Measure Code") { ApplicationArea = All; Caption = 'putAwayUnitOfMeasureCode'; }

                // ---------------------------------------------------------
                // Prices / costs
                // ---------------------------------------------------------
                field(priceUnitConversion; Rec."Price Unit Conversion") { ApplicationArea = All; Caption = 'priceUnitConversion'; }
                field(unitPrice; Rec."Unit Price") { ApplicationArea = All; Caption = 'unitPrice'; }
                field(unitCost; Rec."Unit Cost") { ApplicationArea = All; Caption = 'unitCost'; }
                field(standardCost; Rec."Standard Cost") { ApplicationArea = All; Caption = 'standardCost'; }
                field(lastDirectCost; Rec."Last Direct Cost") { ApplicationArea = All; Caption = 'lastDirectCost'; }
                field(unitListPrice; Rec."Unit List Price") { ApplicationArea = All; Caption = 'unitListPrice'; }
                field(priceIncludesVAT; Rec."Price Includes VAT") { ApplicationArea = All; Caption = 'priceIncludesVAT'; }
                field(priceProfitCalculation; Rec."Price/Profit Calculation") { ApplicationArea = All; Caption = 'priceProfitCalculation'; }
                field(priceProfitCalculationInt; PriceProfitCalculationInt) { ApplicationArea = All; Caption = 'priceProfitCalculationInt'; }
                field(profitPct; Rec."Profit %") { ApplicationArea = All; Caption = 'profitPct'; }
                field(costingMethod; Rec."Costing Method") { ApplicationArea = All; Caption = 'costingMethod'; }
                field(costingMethodInt; CostingMethodInt) { ApplicationArea = All; Caption = 'costingMethodInt'; }
                field(indirectCostPct; Rec."Indirect Cost %") { ApplicationArea = All; Caption = 'indirectCostPct'; }
                field(overheadRate; Rec."Overhead Rate") { ApplicationArea = All; Caption = 'overheadRate'; }
                field(costIsAdjusted; Rec."Cost is Adjusted") { ApplicationArea = All; Caption = 'costIsAdjusted'; }
                field(allowOnlineAdjustment; Rec."Allow Online Adjustment") { ApplicationArea = All; Caption = 'allowOnlineAdjustment'; }
                field(costIsPostedToGL; Rec."Cost is Posted to G/L")
                {
                    ApplicationArea = All;
                    Caption = 'costIsPostedToGL';
                    Editable = false;
                }

                // ---------------------------------------------------------
                // Vendor & identifiers
                // ---------------------------------------------------------
                field(vendorNo; Rec."Vendor No.") { ApplicationArea = All; Caption = 'vendorNo'; }
                field(vendorItemNo; Rec."Vendor Item No.") { ApplicationArea = All; Caption = 'vendorItemNo'; }
                field(leadTimeCalculation; Rec."Lead Time Calculation") { ApplicationArea = All; Caption = 'leadTimeCalculation'; }
                field(purchasingCode; Rec."Purchasing Code") { ApplicationArea = All; Caption = 'purchasingCode'; }
                field(gtin; Rec.GTIN) { ApplicationArea = All; Caption = 'gtin'; }
                field(identifierCode; Rec."Identifier Code")
                {
                    ApplicationArea = All;
                    Caption = 'identifierCode';
                    Editable = false;
                }
                field(alternativeItemNo; Rec."Alternative Item No.") { ApplicationArea = All; Caption = 'alternativeItemNo'; }

                // ---------------------------------------------------------
                // Dimensions / grouping / governance
                // ---------------------------------------------------------
                field(itemDiscGroup; Rec."Item Disc. Group") { ApplicationArea = All; Caption = 'itemDiscGroup'; }
                field(allowInvoiceDisc; Rec."Allow Invoice Disc.") { ApplicationArea = All; Caption = 'allowInvoiceDisc'; }
                field(statisticsGroup; Rec."Statistics Group") { ApplicationArea = All; Caption = 'statisticsGroup'; }
                field(commissionGroup; Rec."Commission Group") { ApplicationArea = All; Caption = 'commissionGroup'; }
                field(globalDimension1Code; Rec."Global Dimension 1 Code") { ApplicationArea = All; Caption = 'globalDimension1Code'; }
                field(globalDimension2Code; Rec."Global Dimension 2 Code") { ApplicationArea = All; Caption = 'globalDimension2Code'; }
                field(blockReason; Rec."Block Reason") { ApplicationArea = All; Caption = 'blockReason'; }
                field(noSeries; Rec."No. Series") { ApplicationArea = All; Caption = 'noSeries'; }
                field(defaultDeferralTemplateCode; Rec."Default Deferral Template Code") { ApplicationArea = All; Caption = 'defaultDeferralTemplateCode'; }
                field(applicationWkshUserId; Rec."Application Wksh. User ID") { ApplicationArea = All; Caption = 'applicationWkshUserId'; }

                // ---------------------------------------------------------
                // Operational flags
                // ---------------------------------------------------------
                field(blocked; Rec.Blocked) { ApplicationArea = All; Caption = 'blocked'; }
                field(salesBlocked; Rec."Sales Blocked") { ApplicationArea = All; Caption = 'salesBlocked'; }
                field(purchasingBlocked; Rec."Purchasing Blocked") { ApplicationArea = All; Caption = 'purchasingBlocked'; }
                field(stockoutWarning; Rec."Stockout Warning") { ApplicationArea = All; Caption = 'stockoutWarning'; }
                field(stockoutWarningInt; StockoutWarningInt) { ApplicationArea = All; Caption = 'stockoutWarningInt'; }
                field(preventNegativeInventory; Rec."Prevent Negative Inventory") { ApplicationArea = All; Caption = 'preventNegativeInventory'; }
                field(preventNegativeInventoryInt; PreventNegativeInventoryInt) { ApplicationArea = All; Caption = 'preventNegativeInventoryInt'; }
                field(createdFromNonstockItem; Rec."Created From Nonstock Item") { ApplicationArea = All; Caption = 'createdFromNonstockItem'; }
                field(automaticExtTexts; Rec."Automatic Ext. Texts") { ApplicationArea = All; Caption = 'automaticExtTexts'; }
                field(useCrossDocking; Rec."Use Cross-Docking") { ApplicationArea = All; Caption = 'useCrossDocking'; }
                field(critical; Rec.Critical) { ApplicationArea = All; Caption = 'critical'; }
                field(inventoryValueZero; Rec."Inventory Value Zero") { ApplicationArea = All; Caption = 'inventoryValueZero'; }

                // ---------------------------------------------------------
                // Physical / logistics
                // ---------------------------------------------------------
                field(grossWeight; Rec."Gross Weight") { ApplicationArea = All; Caption = 'grossWeight'; }
                field(netWeight; Rec."Net Weight") { ApplicationArea = All; Caption = 'netWeight'; }
                field(unitsPerParcel; Rec."Units per Parcel") { ApplicationArea = All; Caption = 'unitsPerParcel'; }
                field(unitVolume; Rec."Unit Volume") { ApplicationArea = All; Caption = 'unitVolume'; }
                field(durability; Rec.Durability) { ApplicationArea = All; Caption = 'durability'; }
                field(freightType; Rec."Freight Type") { ApplicationArea = All; Caption = 'freightType'; }
                field(warehouseClassCode; Rec."Warehouse Class Code") { ApplicationArea = All; Caption = 'warehouseClassCode'; }
                field(specialEquipmentCode; Rec."Special Equipment Code") { ApplicationArea = All; Caption = 'specialEquipmentCode'; }
                field(putAwayTemplateCode; Rec."Put-away Template Code") { ApplicationArea = All; Caption = 'putAwayTemplateCode'; }
                field(physInvtCountingPeriodCode; Rec."Phys Invt Counting Period Code") { ApplicationArea = All; Caption = 'physInvtCountingPeriodCode'; }
                field(lastCountingPeriodUpdate; Rec."Last Counting Period Update") { ApplicationArea = All; Caption = 'lastCountingPeriodUpdate'; }
                field(nextCountingStartDate; Rec."Next Counting Start Date") { ApplicationArea = All; Caption = 'nextCountingStartDate'; }
                field(nextCountingEndDate; Rec."Next Counting End Date") { ApplicationArea = All; Caption = 'nextCountingEndDate'; }

                // ---------------------------------------------------------
                // Planning / replenishment / manufacturing
                // ---------------------------------------------------------
                field(reserve; Rec.Reserve) { ApplicationArea = All; Caption = 'reserve'; }
                field(reserveInt; ReserveInt) { ApplicationArea = All; Caption = 'reserveInt'; }

                field(assemblyPolicy; Rec."Assembly Policy") { ApplicationArea = All; Caption = 'assemblyPolicy'; }
                field(assemblyPolicyInt; AssemblyPolicyInt) { ApplicationArea = All; Caption = 'assemblyPolicyInt'; }

                field(replenishmentSystem; Rec."Replenishment System") { ApplicationArea = All; Caption = 'replenishmentSystem'; }
                field(replenishmentSystemInt; ReplenishmentSystemInt) { ApplicationArea = All; Caption = 'replenishmentSystemInt'; }

                field(reorderingPolicy; Rec."Reordering Policy") { ApplicationArea = All; Caption = 'reorderingPolicy'; }
                field(reorderingPolicyInt; ReorderingPolicyInt) { ApplicationArea = All; Caption = 'reorderingPolicyInt'; }

                field(manufacturingPolicy; Rec."Manufacturing Policy") { ApplicationArea = All; Caption = 'manufacturingPolicy'; }
                field(manufacturingPolicyInt; ManufacturingPolicyInt) { ApplicationArea = All; Caption = 'manufacturingPolicyInt'; }

                field(flushingMethod; Rec."Flushing Method") { ApplicationArea = All; Caption = 'flushingMethod'; }
                field(flushingMethodInt; FlushingMethodInt) { ApplicationArea = All; Caption = 'flushingMethodInt'; }

                field(orderTrackingPolicy; Rec."Order Tracking Policy") { ApplicationArea = All; Caption = 'orderTrackingPolicy'; }
                field(orderTrackingPolicyInt; OrderTrackingPolicyInt) { ApplicationArea = All; Caption = 'orderTrackingPolicyInt'; }

                field(routingNo; Rec."Routing No.") { ApplicationArea = All; Caption = 'routingNo'; }
                field(productionBomNo; Rec."Production BOM No.") { ApplicationArea = All; Caption = 'productionBomNo'; }
                field(overReceiptCode; Rec."Over-Receipt Code") { ApplicationArea = All; Caption = 'overReceiptCode'; }

                field(reorderPoint; Rec."Reorder Point") { ApplicationArea = All; Caption = 'reorderPoint'; }
                field(maximumInventory; Rec."Maximum Inventory") { ApplicationArea = All; Caption = 'maximumInventory'; }
                field(reorderQuantity; Rec."Reorder Quantity") { ApplicationArea = All; Caption = 'reorderQuantity'; }
                field(lotSize; Rec."Lot Size") { ApplicationArea = All; Caption = 'lotSize'; }
                field(scrapPct; Rec."Scrap %") { ApplicationArea = All; Caption = 'scrapPct'; }
                field(discreteOrderQuantity; Rec."Discrete Order Quantity") { ApplicationArea = All; Caption = 'discreteOrderQuantity'; }
                field(minimumOrderQuantity; Rec."Minimum Order Quantity") { ApplicationArea = All; Caption = 'minimumOrderQuantity'; }
                field(maximumOrderQuantity; Rec."Maximum Order Quantity") { ApplicationArea = All; Caption = 'maximumOrderQuantity'; }
                field(safetyStockQuantity; Rec."Safety Stock Quantity") { ApplicationArea = All; Caption = 'safetyStockQuantity'; }
                field(orderMultiple; Rec."Order Multiple") { ApplicationArea = All; Caption = 'orderMultiple'; }
                field(safetyLeadTime; Rec."Safety Lead Time") { ApplicationArea = All; Caption = 'safetyLeadTime'; }
                field(timeBucket; Rec."Time Bucket") { ApplicationArea = All; Caption = 'timeBucket'; }
                field(roundingPrecision; Rec."Rounding Precision") { ApplicationArea = All; Caption = 'roundingPrecision'; }
                field(includeInventory; Rec."Include Inventory") { ApplicationArea = All; Caption = 'includeInventory'; }
                field(reschedulingPeriod; Rec."Rescheduling Period") { ApplicationArea = All; Caption = 'reschedulingPeriod'; }
                field(lotAccumulationPeriod; Rec."Lot Accumulation Period") { ApplicationArea = All; Caption = 'lotAccumulationPeriod'; }
                field(dampenerPeriod; Rec."Dampener Period") { ApplicationArea = All; Caption = 'dampenerPeriod'; }
                field(dampenerQuantity; Rec."Dampener Quantity") { ApplicationArea = All; Caption = 'dampenerQuantity'; }
                field(overflowLevel; Rec."Overflow Level") { ApplicationArea = All; Caption = 'overflowLevel'; }
                field(lowLevelCode; Rec."Low-Level Code") { ApplicationArea = All; Caption = 'lowLevelCode'; }
                field(lastUnitCostCalcDate; Rec."Last Unit Cost Calc. Date") { ApplicationArea = All; Caption = 'lastUnitCostCalcDate'; }
                field(rolledUpMaterialCost; Rec."Rolled-up Material Cost") { ApplicationArea = All; Caption = 'rolledUpMaterialCost'; }
                field(rolledUpCapacityCost; Rec."Rolled-up Capacity Cost") { ApplicationArea = All; Caption = 'rolledUpCapacityCost'; }
                field(singleLevelMaterialCost; Rec."Single-Level Material Cost") { ApplicationArea = All; Caption = 'singleLevelMaterialCost'; }
                field(singleLevelCapacityCost; Rec."Single-Level Capacity Cost") { ApplicationArea = All; Caption = 'singleLevelCapacityCost'; }
                field(singleLevelSubcontrdCost; Rec."Single-Level Subcontrd. Cost") { ApplicationArea = All; Caption = 'singleLevelSubcontrdCost'; }
                field(singleLevelCapOvhdCost; Rec."Single-Level Cap. Ovhd Cost") { ApplicationArea = All; Caption = 'singleLevelCapOvhdCost'; }
                field(singleLevelMfgOvhdCost; Rec."Single-Level Mfg. Ovhd Cost") { ApplicationArea = All; Caption = 'singleLevelMfgOvhdCost'; }
                field(rolledUpSubcontractedCost; Rec."Rolled-up Subcontracted Cost") { ApplicationArea = All; Caption = 'rolledUpSubcontractedCost'; }
                field(rolledUpMfgOvhdCost; Rec."Rolled-up Mfg. Ovhd Cost") { ApplicationArea = All; Caption = 'rolledUpMfgOvhdCost'; }
                field(rolledUpCapOverheadCost; Rec."Rolled-up Cap. Overhead Cost") { ApplicationArea = All; Caption = 'rolledUpCapOverheadCost'; }

                // ---------------------------------------------------------
                // Tracking / serial / lot
                // ---------------------------------------------------------
                field(itemTrackingCode; Rec."Item Tracking Code") { ApplicationArea = All; Caption = 'itemTrackingCode'; }
                field(serialNos; Rec."Serial Nos.") { ApplicationArea = All; Caption = 'serialNos'; }
                field(lotNos; Rec."Lot Nos.") { ApplicationArea = All; Caption = 'lotNos'; }
                field(expirationCalculation; Rec."Expiration Calculation") { ApplicationArea = All; Caption = 'expirationCalculation'; }

                // ---------------------------------------------------------
                // Date / modification
                // ---------------------------------------------------------
                field(lastDateTimeModified; Rec."Last DateTime Modified") { ApplicationArea = All; Caption = 'lastDateTimeModified'; }
                field(lastDateModified; Rec."Last Date Modified") { ApplicationArea = All; Caption = 'lastDateModified'; }
                field(lastTimeModified; Rec."Last Time Modified") { ApplicationArea = All; Caption = 'lastTimeModified'; }

                // ---------------------------------------------------------
                // FlowFields / calculated
                // ---------------------------------------------------------
                /*
                field(assemblyBom; Rec."Assembly BOM")
                {
                    ApplicationArea = All;
                    Caption = 'assemblyBom';
                    Editable = false;
                }
                field(inventory; Rec.Inventory)
                {
                    ApplicationArea = All;
                    Caption = 'inventory';
                    Editable = false;
                }
                field(netInvoicedQty; Rec."Net Invoiced Qty.")
                {
                    ApplicationArea = All;
                    Caption = 'netInvoicedQty';
                    Editable = false;
                }
                field(netChange; Rec."Net Change")
                {
                    ApplicationArea = All;
                    Caption = 'netChange';
                    Editable = false;
                }
                field(purchasesQty; Rec."Purchases (Qty.)")
                {
                    ApplicationArea = All;
                    Caption = 'purchasesQty';
                    Editable = false;
                }
                field(salesQty; Rec."Sales (Qty.)")
                {
                    ApplicationArea = All;
                    Caption = 'salesQty';
                    Editable = false;
                }
                field(positiveAdjmtQty; Rec."Positive Adjmt. (Qty.)")
                {
                    ApplicationArea = All;
                    Caption = 'positiveAdjmtQty';
                    Editable = false;
                }
                field(negativeAdjmtQty; Rec."Negative Adjmt. (Qty.)")
                {
                    ApplicationArea = All;
                    Caption = 'negativeAdjmtQty';
                    Editable = false;
                }
                field(purchasesLCY; Rec."Purchases (LCY)")
                {
                    ApplicationArea = All;
                    Caption = 'purchasesLCY';
                    Editable = false;
                }
                field(salesLCY; Rec."Sales (LCY)")
                {
                    ApplicationArea = All;
                    Caption = 'salesLCY';
                    Editable = false;
                }
                field(positiveAdjmtLCY; Rec."Positive Adjmt. (LCY)")
                {
                    ApplicationArea = All;
                    Caption = 'positiveAdjmtLCY';
                    Editable = false;
                }
                field(negativeAdjmtLCY; Rec."Negative Adjmt. (LCY)")
                {
                    ApplicationArea = All;
                    Caption = 'negativeAdjmtLCY';
                    Editable = false;
                }
                field(cogsLCY; Rec."COGS (LCY)")
                {
                    ApplicationArea = All;
                    Caption = 'cogsLCY';
                    Editable = false;
                }
                field(qtyOnPurchOrder; Rec."Qty. on Purch. Order")
                {
                    ApplicationArea = All;
                    Caption = 'qtyOnPurchOrder';
                    Editable = false;
                }
                field(qtyOnSalesOrder; Rec."Qty. on Sales Order")
                {
                    ApplicationArea = All;
                    Caption = 'qtyOnSalesOrder';
                    Editable = false;
                }
                field(transferredQty; Rec."Transferred (Qty.)")
                {
                    ApplicationArea = All;
                    Caption = 'transferredQty';
                    Editable = false;
                }
                field(transferredLCY; Rec."Transferred (LCY)")
                {
                    ApplicationArea = All;
                    Caption = 'transferredLCY';
                    Editable = false;
                }
                field(comment; Rec.Comment)
                {
                    ApplicationArea = All;
                    Caption = 'comment';
                    Editable = false;
                }
                field(reservedQtyOnInventory; Rec."Reserved Qty. on Inventory")
                {
                    ApplicationArea = All;
                    Caption = 'reservedQtyOnInventory';
                    Editable = false;
                }
                field(reservedQtyOnPurchOrders; Rec."Reserved Qty. on Purch. Orders")
                {
                    ApplicationArea = All;
                    Caption = 'reservedQtyOnPurchOrders';
                    Editable = false;
                }
                field(reservedQtyOnSalesOrders; Rec."Reserved Qty. on Sales Orders")
                {
                    ApplicationArea = All;
                    Caption = 'reservedQtyOnSalesOrders';
                    Editable = false;
                }
                field(resQtyOnOutboundTransfer; Rec."Res. Qty. on Outbound Transfer")
                {
                    ApplicationArea = All;
                    Caption = 'resQtyOnOutboundTransfer';
                    Editable = false;
                }
                field(resQtyOnInboundTransfer; Rec."Res. Qty. on Inbound Transfer")
                {
                    ApplicationArea = All;
                    Caption = 'resQtyOnInboundTransfer';
                    Editable = false;
                }
                field(resQtyOnSalesReturns; Rec."Res. Qty. on Sales Returns")
                {
                    ApplicationArea = All;
                    Caption = 'resQtyOnSalesReturns';
                    Editable = false;
                }
                field(resQtyOnPurchReturns; Rec."Res. Qty. on Purch. Returns")
                {
                    ApplicationArea = All;
                    Caption = 'resQtyOnPurchReturns';
                    Editable = false;
                }
                field(costOfOpenProductionOrders; Rec."Cost of Open Production Orders")
                {
                    ApplicationArea = All;
                    Caption = 'costOfOpenProductionOrders';
                    Editable = false;
                }
                field(resQtyOnAssemblyOrder; Rec."Res. Qty. on Assembly Order")
                {
                    ApplicationArea = All;
                    Caption = 'resQtyOnAssemblyOrder';
                    Editable = false;
                }
                field(resQtyOnAsmComp; Rec."Res. Qty. on  Asm. Comp.")
                {
                    ApplicationArea = All;
                    Caption = 'resQtyOnAsmComp';
                    Editable = false;
                }
                field(qtyOnAssemblyOrder; Rec."Qty. on Assembly Order")
                {
                    ApplicationArea = All;
                    Caption = 'qtyOnAssemblyOrder';
                    Editable = false;
                }
                field(qtyOnAsmComponent; Rec."Qty. on Asm. Component")
                {
                    ApplicationArea = All;
                    Caption = 'qtyOnAsmComponent';
                    Editable = false;
                }
                field(qtyOnJobOrder; Rec."Qty. on Job Order")
                {
                    ApplicationArea = All;
                    Caption = 'qtyOnJobOrder';
                    Editable = false;
                }
                field(resQtyOnJobOrder; Rec."Res. Qty. on Job Order")
                {
                    ApplicationArea = All;
                    Caption = 'resQtyOnJobOrder';
                    Editable = false;
                }
                field(scheduledReceiptQty; Rec."Scheduled Receipt (Qty.)")
                {
                    ApplicationArea = All;
                    Caption = 'scheduledReceiptQty';
                    Editable = false;
                }
                field(reservedQtyOnProdOrder; Rec."Reserved Qty. on Prod. Order")
                {
                    ApplicationArea = All;
                    Caption = 'reservedQtyOnProdOrder';
                    Editable = false;
                }
                field(resQtyOnProdOrderComp; Rec."Res. Qty. on Prod. Order Comp.")
                {
                    ApplicationArea = All;
                    Caption = 'resQtyOnProdOrderComp';
                    Editable = false;
                }
                field(resQtyOnReqLine; Rec."Res. Qty. on Req. Line")
                {
                    ApplicationArea = All;
                    Caption = 'resQtyOnReqLine';
                    Editable = false;
                }
                field(planningTransferShipQty; Rec."Planning Transfer Ship. (Qty).")
                {
                    ApplicationArea = All;
                    Caption = 'planningTransferShipQty';
                    Editable = false;
                }
                field(planningWorksheetQty; Rec."Planning Worksheet (Qty.)")
                {
                    ApplicationArea = All;
                    Caption = 'planningWorksheetQty';
                    Editable = false;
                }
                field(stockkeepingUnitExists; Rec."Stockkeeping Unit Exists")
                {
                    ApplicationArea = All;
                    Caption = 'stockkeepingUnitExists';
                    Editable = false;
                }
                field(substitutesExist; Rec."Substitutes Exist")
                {
                    ApplicationArea = All;
                    Caption = 'substitutesExist';
                    Editable = false;
                }
                field(qtyInTransit; Rec."Qty. in Transit")
                {
                    ApplicationArea = All;
                    Caption = 'qtyInTransit';
                    Editable = false;
                }
                field(transOrdReceiptQty; Rec."Trans. Ord. Receipt (Qty.)")
                {
                    ApplicationArea = All;
                    Caption = 'transOrdReceiptQty';
                    Editable = false;
                }
                field(transOrdShipmentQty; Rec."Trans. Ord. Shipment (Qty.)")
                {
                    ApplicationArea = All;
                    Caption = 'transOrdShipmentQty';
                    Editable = false;
                }
                field(qtyAssignedToShip; Rec."Qty. Assigned to ship")
                {
                    ApplicationArea = All;
                    Caption = 'qtyAssignedToShip';
                    Editable = false;
                }
                field(qtyPicked; Rec."Qty. Picked")
                {
                    ApplicationArea = All;
                    Caption = 'qtyPicked';
                    Editable = false;
                }
                field(qtyOnServiceOrder; Rec."Qty. on Service Order")
                {
                    ApplicationArea = All;
                    Caption = 'qtyOnServiceOrder';
                    Editable = false;
                }
                field(resQtyOnServiceOrders; Rec."Res. Qty. on Service Orders")
                {
                    ApplicationArea = All;
                    Caption = 'resQtyOnServiceOrders';
                    Editable = false;
                }
                field(qtyOnPurchReturn; Rec."Qty. on Purch. Return")
                {
                    ApplicationArea = All;
                    Caption = 'qtyOnPurchReturn';
                    Editable = false;
                }
                field(qtyOnSalesReturn; Rec."Qty. on Sales Return")
                {
                    ApplicationArea = All;
                    Caption = 'qtyOnSalesReturn';
                    Editable = false;
                }
                field(noOfSubstitutes; Rec."No. of Substitutes")
                {
                    ApplicationArea = All;
                    Caption = 'noOfSubstitutes';
                    Editable = false;
                }
                field(lastPhysInvtDate; Rec."Last Phys. Invt. Date")
                {
                    ApplicationArea = All;
                    Caption = 'lastPhysInvtDate';
                    Editable = false;
                }
                field(prodForecastQuantityBase; Rec."Prod. Forecast Quantity (Base)")
                {
                    ApplicationArea = All;
                    Caption = 'prodForecastQuantityBase';
                    Editable = false;
                }
                field(qtyOnProdOrder; Rec."Qty. on Prod. Order")
                {
                    ApplicationArea = All;
                    Caption = 'qtyOnProdOrder';
                    Editable = false;
                }
                field(qtyOnComponentLines; Rec."Qty. on Component Lines")
                {
                    ApplicationArea = All;
                    Caption = 'qtyOnComponentLines';
                    Editable = false;
                }
                field(planningIssuesQty; Rec."Planning Issues (Qty.)")
                {
                    ApplicationArea = All;
                    Caption = 'planningIssuesQty';
                    Editable = false;
                }
                field(planningReceiptQty; Rec."Planning Receipt (Qty.)")
                {
                    ApplicationArea = All;
                    Caption = 'planningReceiptQty';
                    Editable = false;
                }
                field(plannedOrderReceiptQty; Rec."Planned Order Receipt (Qty.)")
                {
                    ApplicationArea = All;
                    Caption = 'plannedOrderReceiptQty';
                    Editable = false;
                }
                field(fpOrderReceiptQty; Rec."FP Order Receipt (Qty.)")
                {
                    ApplicationArea = All;
                    Caption = 'fpOrderReceiptQty';
                    Editable = false;
                }
                field(relOrderReceiptQty; Rec."Rel. Order Receipt (Qty.)")
                {
                    ApplicationArea = All;
                    Caption = 'relOrderReceiptQty';
                    Editable = false;
                }
                field(planningReleaseQty; Rec."Planning Release (Qty.)")
                {
                    ApplicationArea = All;
                    Caption = 'planningReleaseQty';
                    Editable = false;
                }
                field(plannedOrderReleaseQty; Rec."Planned Order Release (Qty.)")
                {
                    ApplicationArea = All;
                    Caption = 'plannedOrderReleaseQty';
                    Editable = false;
                }
                field(purchReqReceiptQty; Rec."Purch. Req. Receipt (Qty.)")
                {
                    ApplicationArea = All;
                    Caption = 'purchReqReceiptQty';
                    Editable = false;
                }
                field(purchReqReleaseQty; Rec."Purch. Req. Release (Qty.)")
                {
                    ApplicationArea = All;
                    Caption = 'purchReqReleaseQty';
                    Editable = false;
                }
                */
                
                // ---------------------------------------------------------
                // Custom fields - NOTO + ItemExt
                // ---------------------------------------------------------
                field(itemBrand; Rec."Item Brand") { ApplicationArea = All; Caption = 'itemBrand'; }
                field(productLineCode; Rec."Product Line Code") { ApplicationArea = All; Caption = 'productLineCode'; }
                field(productUsage; Rec."Product Usage") { ApplicationArea = All; Caption = 'productUsage'; }
                field(productGroupCode; Rec."Prod. Group Code") { ApplicationArea = All; Caption = 'productGroupCode'; }
                field(itemSize; Rec."Item Size") { ApplicationArea = All; Caption = 'itemSize'; }
                field(itemSizeUnit; Rec."Item Size Unit") { ApplicationArea = All; Caption = 'itemSizeUnit'; }
                field(itemFeature; Rec."Item Feature") { ApplicationArea = All; Caption = 'itemFeature'; }
                field(packingMethod; Rec."Packing Method") { ApplicationArea = All; Caption = 'packingMethod'; }
                field(abcdCategory; Rec."ABCD Category") { ApplicationArea = All; Caption = 'abcdCategory'; }
                field(coating; Rec.Coating) { ApplicationArea = All; Caption = 'coating'; }
                field(quality; Rec.Quality) { ApplicationArea = All; Caption = 'quality'; }
                field(qualityInt; QualityInt) { ApplicationArea = All; Caption = 'qualityInt'; }
                field(withLid; Rec."With Lid") { ApplicationArea = All; Caption = 'withLid'; }
                field(weightClassification; Rec."Weight Classification NOTO") { ApplicationArea = All; Caption = 'weightClassification'; }

                field(calculatedAvailable; Rec."Calculated Available NOTO")
                {
                    ApplicationArea = All;
                    Caption = 'calculatedAvailable';
                    Editable = false;
                }
                field(calculatedAvailableExternal; Rec."Calculated Available Ext. NOTO")
                {
                    ApplicationArea = All;
                    Caption = 'calculatedAvailableExternal';
                    Editable = false;
                }
                field(calculatedAvailableDate; Rec."Calculated Available Date NOTO")
                {
                    ApplicationArea = All;
                    Caption = 'calculatedAvailableDate';
                    Editable = false;
                }

                field(itemBodyType; Rec."ItemBodyType")
                {
                    ApplicationArea = All;
                    Caption = 'itemBodyType';
                }
                field(itemBodyTypeInt; ItemBodyTypeInt)
                {
                    ApplicationArea = All;
                    Caption = 'itemBodyTypeInt';
                }

                // ---------------------------------------------------------
                // System fields
                // ---------------------------------------------------------
                field(systemCreatedAt; Rec.SystemCreatedAt) { ApplicationArea = All; Caption = 'systemCreatedAt'; }
                field(systemCreatedBy; Rec.SystemCreatedBy) { ApplicationArea = All; Caption = 'systemCreatedBy'; }
                field(systemModifiedAt; Rec.SystemModifiedAt) { ApplicationArea = All; Caption = 'systemModifiedAt'; }
                field(systemModifiedBy; Rec.SystemModifiedBy) { ApplicationArea = All; Caption = 'systemModifiedBy'; }
            }
        }
    }

    var
        TypeInt: Integer;
        PriceProfitCalculationInt: Integer;
        CostingMethodInt: Integer;
        ReserveInt: Integer;
        StockoutWarningInt: Integer;
        PreventNegativeInventoryInt: Integer;
        AssemblyPolicyInt: Integer;
        FlushingMethodInt: Integer;
        ReplenishmentSystemInt: Integer;
        ReorderingPolicyInt: Integer;
        ManufacturingPolicyInt: Integer;
        OrderTrackingPolicyInt: Integer;
        QualityInt: Integer;
        ItemBodyTypeInt: Integer;

    trigger OnAfterGetRecord()
    begin
        TypeInt := Rec.Type.AsInteger();

        PriceProfitCalculationInt := Rec."Price/Profit Calculation";
        CostingMethodInt := Rec."Costing Method".AsInteger();
        ReserveInt := Rec.Reserve.AsInteger();
        StockoutWarningInt := Rec."Stockout Warning";
        PreventNegativeInventoryInt := Rec."Prevent Negative Inventory";
        AssemblyPolicyInt := Rec."Assembly Policy".AsInteger();
        FlushingMethodInt := Rec."Flushing Method".AsInteger();
        ReplenishmentSystemInt := Rec."Replenishment System".AsInteger();
        ReorderingPolicyInt := Rec."Reordering Policy".AsInteger();
        ManufacturingPolicyInt := Rec."Manufacturing Policy".AsInteger();
        OrderTrackingPolicyInt := Rec."Order Tracking Policy".AsInteger();

        QualityInt := Rec.Quality.AsInteger();
        ItemBodyTypeInt := Rec."ItemBodyType".AsInteger();
    end;
}