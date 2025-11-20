page 50202 "CapacityLedgerEntryAPI"
{
    /// <summary>
    /// Date        Name                    Version   Description
    /// 2025.10.23  Business Central AL     001.0     API page for Capacity Ledger Entry (5832) – DW-friendly
    /// </summary>

    Caption = 'CapacityLedgerEntryAPI';
    AdditionalSearchTerms = 'SCANPAN, API, datawarehouse, dw';
    UsageCategory = Administration;

    PageType = API;
    APIPublisher = 'scanpan';
    APIGroup = 'datawarehouse';
    APIVersion = 'beta', 'v1.0';

    EntitySetName = 'capacityLedgerEntries';
    EntityName = 'capacityLedgerEntry';

    DelayedInsert = true;
    Editable = false;

    SourceTable = 5832; // Capacity Ledger Entry
    SourceTableView = sorting("Entry No.") order(ascending);
    ODataKeyFields = "Entry No.";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                Caption = 'Group';

                // Nøgle/identifikation
                field(entryNo; Rec."Entry No.") { Caption = 'Entry No.'; }
                field(no; Rec."No.") { Caption = 'No.'; }
                field(type; Rec.Type) { Caption = 'Type'; }
                field(typeInt; typeInt) { Caption = 'Type INT'; }

                // Dato/tid & dokument
                field(postingDate; Rec."Posting Date") { Caption = 'Posting Date'; } // DATE
                field(documentNo; Rec."Document No.") { Caption = 'Document No.'; }
                field(documentDate; Rec."Document Date") { Caption = 'Document Date'; } // DATE
                field(externalDocumentNo; Rec."External Document No.") { Caption = 'External Document No.'; }
                field(startingTime; Rec."Starting Time") { Caption = 'Starting Time'; } // TIME
                field(endingTime; Rec."Ending Time") { Caption = 'Ending Time'; } // TIME
                field(description; Rec.Description) { Caption = 'Description'; }

                // Produktionsreference
                field(operationNo; Rec."Operation No.") { Caption = 'Operation No.'; }
                field(workCenterNo; Rec."Work Center No.") { Caption = 'Work Center No.'; }
                field(routingNo; Rec."Routing No.") { Caption = 'Routing No.'; }
                field(routingReferenceNo; Rec."Routing Reference No.") { Caption = 'Routing Reference No.'; }

                // Vare & enheder
                field(itemNo; Rec."Item No.") { Caption = 'Item No.'; }
                field(variantCode; Rec."Variant Code") { Caption = 'Variant Code'; }
                field(unitOfMeasureCode; Rec."Unit of Measure Code") { Caption = 'Unit of Measure Code'; }
                field(qtyPerUnitOfMeasure; Rec."Qty. per Unit of Measure") { Caption = 'Qty. per Unit of Measure'; }

                // Kapacitet & tid/antal
                field(quantity; Rec.Quantity) { Caption = 'Quantity'; }
                field(setupTime; Rec."Setup Time") { Caption = 'Setup Time'; }
                field(runTime; Rec."Run Time") { Caption = 'Run Time'; }
                field(stopTime; Rec."Stop Time") { Caption = 'Stop Time'; }
                field(invoicedQuantity; Rec."Invoiced Quantity") { Caption = 'Invoiced Quantity'; }
                field(outputQuantity; Rec."Output Quantity") { Caption = 'Output Quantity'; }
                field(scrapQuantity; Rec."Scrap Quantity") { Caption = 'Scrap Quantity'; }
                field(concurrentCapacity; Rec."Concurrent Capacity") { Caption = 'Concurrent Capacity'; }

                // Kapacitets UOM
                field(capUnitOfMeasureCode; Rec."Cap. Unit of Measure Code") { Caption = 'Cap. Unit of Measure Code'; }
                field(qtyPerCapUnitOfMeasure; Rec."Qty. per Cap. Unit of Measure") { Caption = 'Qty. per Cap. Unit of Measure'; }

                // Work center grouping
                field(workCenterGroupCode; Rec."Work Center Group Code") { Caption = 'Work Center Group Code'; }
                field(workShiftCode; Rec."Work Shift Code") { Caption = 'Work Shift Code'; }
                field(lastOutputLine; Rec."Last Output Line") { Caption = 'Last Output Line'; }
                field(completelyInvoiced; Rec."Completely Invoiced") { Caption = 'Completely Invoiced'; }
                field(subcontracting; Rec.Subcontracting) { Caption = 'Subcontracting'; }

                // Årsager
                field(stopCode; Rec."Stop Code") { Caption = 'Stop Code'; }
                field(scrapCode; Rec."Scrap Code") { Caption = 'Scrap Code'; }

                // Ordre reference + enum spejl
                field(orderType; Rec."Order Type") { Caption = 'Order Type'; }
                field(orderTypeInt; orderTypeInt) { Caption = 'Order Type INT'; }
                field(orderNo; Rec."Order No.") { Caption = 'Order No.'; }
                field(orderLineNo; Rec."Order Line No.") { Caption = 'Order Line No.'; }

                // Dimensioner
                field(globalDimension1Code; Rec."Global Dimension 1 Code") { Caption = 'Global Dimension 1 Code'; }
                field(globalDimension2Code; Rec."Global Dimension 2 Code") { Caption = 'Global Dimension 2 Code'; }
                field(dimensionSetId; Rec."Dimension Set ID") { Caption = 'Dimension Set ID'; }
                field(shortcutDim3Code; Rec."Shortcut Dimension 3 Code") { Caption = 'Shortcut Dimension 3 Code'; }
                field(shortcutDim4Code; Rec."Shortcut Dimension 4 Code") { Caption = 'Shortcut Dimension 4 Code'; }
                field(shortcutDim5Code; Rec."Shortcut Dimension 5 Code") { Caption = 'Shortcut Dimension 5 Code'; }
                field(shortcutDim6Code; Rec."Shortcut Dimension 6 Code") { Caption = 'Shortcut Dimension 6 Code'; }
                field(shortcutDim7Code; Rec."Shortcut Dimension 7 Code") { Caption = 'Shortcut Dimension 7 Code'; }
                field(shortcutDim8Code; Rec."Shortcut Dimension 8 Code") { Caption = 'Shortcut Dimension 8 Code'; }

                // Omkostninger (FlowFields)
                field(directCost; Rec."Direct Cost") { Caption = 'Direct Cost'; }
                field(overheadCost; Rec."Overhead Cost") { Caption = 'Overhead Cost'; }
                field(directCostACY; Rec."Direct Cost (ACY)") { Caption = 'Direct Cost (ACY)'; }
                field(overheadCostACY; Rec."Overhead Cost (ACY)") { Caption = 'Overhead Cost (ACY)'; }

                // Systemfelter
                field(systemId; Rec.SystemId) { Caption = 'SystemId'; }
                field(systemCreatedAt; Rec.SystemCreatedAt) { Caption = 'SystemCreatedAt'; }
                field(systemCreatedBy; Rec.SystemCreatedBy) { Caption = 'SystemCreatedBy'; }
                field(systemModifiedAt; Rec.SystemModifiedAt) { Caption = 'SystemModifiedAt'; }
                field(systemModifiedBy; Rec.SystemModifiedBy) { Caption = 'SystemModifiedBy'; }
            }
        }
    }

    var
        typeInt: Integer;
        orderTypeInt: Integer;

    trigger OnAfterGetRecord()
    begin
        // Enum -> integer spejlfelter for stabil DW-mapping
        typeInt := Rec.Type.AsInteger();
        orderTypeInt := Rec."Order Type".AsInteger();
    end;
}
