page 50246 "ProductionOrderAPI"
{
    /// <summary>
    /// Date        Name                    Version   Description
    /// 2025.11.20  Business Central AL     001.0     API page for Production Order (table 5405)
    /// </summary>

    Caption = 'ProductionOrderAPI';
    AdditionalSearchTerms = 'SCANPAN, API, datawarehouse, dw';
    UsageCategory = Administration;

    PageType = API;
    APIPublisher = 'scanpan';
    APIGroup = 'datawarehouse';
    APIVersion = 'beta', 'v1.0';

    EntitySetName = 'productionOrders';
    EntityName = 'productionOrder';

    DelayedInsert = true;
    Editable = false;

    SourceTable = "Production Order";
    SourceTableView = sorting(SystemId) order(ascending);
    ODataKeyFields = SystemId;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                Caption = 'Group';

                // --- OData key / status ---
                field(systemId; Rec.SystemId) { Caption = 'SystemId'; }

                field(status; Rec.Status) { Caption = 'Status'; }
                field(statusInt; statusInt) { Caption = 'Status INT'; }

                // --- Natural keys / identity ---
                field(no; Rec."No.") { Caption = 'No.'; }
                field(description; Rec.Description) { Caption = 'Description'; }

                // --- Item & UoM ---
                //field(itemNo; Rec."Item No.")                     { Caption = 'Item No.'; }
                field(variantCode; Rec."Variant Code") { Caption = 'Variant Code'; }
                //field(unitOfMeasureCode; Rec."Unit of Measure Code") { Caption = 'Unit of Measure Code'; }

                // --- Location / bin ---
                field(locationCode; Rec."Location Code") { Caption = 'Location Code'; }
                field(binCode; Rec."Bin Code") { Caption = 'Bin Code'; }

                // --- BOM / Routing ---
                //field(productionBOMNo; Rec."Production BOM No.")  { Caption = 'Production BOM No.'; }
                field(routingNo; Rec."Routing No.") { Caption = 'Routing No.'; }
                //field(routingRefNo; Rec."Routing Reference No.")  { Caption = 'Routing Reference No.'; }

                // --- Quantities ---
                field(quantity; Rec.Quantity) { Caption = 'Quantity'; }
                //field(quantityBase; Rec."Quantity (Base)")        { Caption = 'Quantity (Base)'; }
                //field(finishedQuantity; Rec."Finished Quantity") { Caption = 'Finished Quantity'; }
                //field(remainingQuantity; Rec."Remaining Quantity") { Caption = 'Remaining Quantity'; }
                //field(scrapPercent; Rec."Scrap %")                { Caption = 'Scrap %'; }

                // --- Dates ---
                //field(postingDate; Rec."Posting Date")            { Caption = 'Posting Date'; }
                field(startingDate; Rec."Starting Date") { Caption = 'Starting Date'; }
                field(endingDate; Rec."Ending Date") { Caption = 'Ending Date'; }
                field(dueDate; Rec."Due Date") { Caption = 'Due Date'; }

                // --- Responsibility / misc. ---
                field(assignedUserId; Rec."Assigned User ID") { Caption = 'Assigned User ID'; }
                field(shortcutDim1Code; Rec."Shortcut Dimension 1 Code") { Caption = 'Shortcut Dimension 1 Code'; }
                field(shortcutDim2Code; Rec."Shortcut Dimension 2 Code") { Caption = 'Shortcut Dimension 2 Code'; }

                // --- System (audit) ---
                field(systemCreatedAt; Rec.SystemCreatedAt) { Caption = 'SystemCreatedAt'; }
                field(systemCreatedBy; Rec.SystemCreatedBy) { Caption = 'SystemCreatedBy'; }
                field(systemModifiedAt; Rec.SystemModifiedAt) { Caption = 'SystemModifiedAt'; }
                field(systemModifiedBy; Rec.SystemModifiedBy) { Caption = 'SystemModifiedBy'; }
            }
        }
    }

    var
        statusInt: Integer;

    trigger OnAfterGetRecord()
    begin
        // Enum/Option -> Integer spejl (Status er Enum i nyere BC)
        statusInt := Rec.Status.AsInteger();
        // Hvis Status er Option i jeres version:
        // statusInt := Rec.Status;
    end;
}
