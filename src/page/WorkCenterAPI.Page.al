page 50282 "WorkCenterAPI"
{
    /// <summary>
    /// Date        Name                    Version   Description
    /// 2026.03.16  ChatGPT                 002.0     API page for Work Center (table 99000754)
    /// </summary>

    Caption = 'WorkCenterAPI';
    AdditionalSearchTerms = 'SCANPAN, API, datawarehouse, dw, work center, manufacturing, capacity';
    UsageCategory = Administration;

    PageType = API;
    APIPublisher = 'scanpan';
    APIGroup = 'datawarehouse';
    APIVersion = 'beta', 'v1.0';

    EntitySetName = 'workCenters';
    EntityName = 'workCenter';

    DelayedInsert = true;
    Editable = false;

    SourceTable = "Work Center";
    SourceTableView = sorting("No.") order(ascending);
    ODataKeyFields = "No.";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                Caption = 'Group';

                // --- Natural/business key ---
                field(no; Rec."No.") { Caption = 'No.'; }

                // --- Identity / description ---
                field(name; Rec.Name) { Caption = 'Name'; }
                field(searchName; Rec."Search Name") { Caption = 'Search Name'; }
                field(name2; Rec."Name 2") { Caption = 'Name 2'; }

                // --- Address ---
                field(address; Rec.Address) { Caption = 'Address'; }
                field(address2; Rec."Address 2") { Caption = 'Address 2'; }
                field(city; Rec.City) { Caption = 'City'; }
                field(postCode; Rec."Post Code") { Caption = 'Post Code'; }
                field(county; Rec.County) { Caption = 'County'; }
                field(countryRegionCode; Rec."Country/Region Code") { Caption = 'Country/Region Code'; }

                // --- Relations / classification ---
                field(alternateWorkCenter; Rec."Alternate Work Center") { Caption = 'Alternate Work Center'; }
                field(workCenterGroupCode; Rec."Work Center Group Code") { Caption = 'Work Center Group Code'; }
                field(globalDimension1Code; Rec."Global Dimension 1 Code") { Caption = 'Global Dimension 1 Code'; }
                field(globalDimension2Code; Rec."Global Dimension 2 Code") { Caption = 'Global Dimension 2 Code'; }
                field(subcontractorNo; Rec."Subcontractor No.") { Caption = 'Subcontractor No.'; }
                field(noSeries; Rec."No. Series") { Caption = 'No. Series'; }
                field(genProdPostingGroup; Rec."Gen. Prod. Posting Group") { Caption = 'Gen. Prod. Posting Group'; }

                // --- Cost / capacity ---
                field(directUnitCost; Rec."Direct Unit Cost") { Caption = 'Direct Unit Cost'; }
                field(indirectCostPct; Rec."Indirect Cost %") { Caption = 'Indirect Cost %'; }
                field(unitCost; Rec."Unit Cost") { Caption = 'Unit Cost'; }
                field(overheadRate; Rec."Overhead Rate") { Caption = 'Overhead Rate'; }

                field(queueTime; Rec."Queue Time") { Caption = 'Queue Time'; }
                field(queueTimeUnitOfMeasureCode; Rec."Queue Time Unit of Meas. Code") { Caption = 'Queue Time Unit of Meas. Code'; }
                field(unitOfMeasureCode; Rec."Unit of Measure Code") { Caption = 'Unit of Measure Code'; }

                field(capacity; Rec.Capacity) { Caption = 'Capacity'; }
                field(efficiency; Rec.Efficiency) { Caption = 'Efficiency'; }
                field(maximumEfficiency; Rec."Maximum Efficiency") { Caption = 'Maximum Efficiency'; }
                field(minimumEfficiency; Rec."Minimum Efficiency") { Caption = 'Minimum Efficiency'; }
                field(calendarRoundingPrecision; Rec."Calendar Rounding Precision") { Caption = 'Calendar Rounding Precision'; }

                // --- Option / Enum as text ---
                field(simulationType; Format(Rec."Simulation Type")) { Caption = 'Simulation Type'; }
                field(unitCostCalculation; Format(Rec."Unit Cost Calculation")) { Caption = 'Unit Cost Calculation'; }
                field(flushingMethod; Format(Rec."Flushing Method")) { Caption = 'Flushing Method'; }

                // --- Option / Enum INT mirrors ---
                field(simulationTypeInt; simulationTypeInt) { Caption = 'Simulation Type Int'; }
                field(unitCostCalculationInt; unitCostCalculationInt) { Caption = 'Unit Cost Calculation Int'; }
                field(flushingMethodInt; flushingMethodInt) { Caption = 'Flushing Method Int'; }

                // --- Control ---
                field(shopCalendarCode; Rec."Shop Calendar Code") { Caption = 'Shop Calendar Code'; }
                field(blocked; Rec.Blocked) { Caption = 'Blocked'; }
                field(specificUnitCost; Rec."Specific Unit Cost") { Caption = 'Specific Unit Cost'; }
                field(consolidatedCalendar; Rec."Consolidated Calendar") { Caption = 'Consolidated Calendar'; }
                field(lastDateModified; Rec."Last Date Modified") { Caption = 'Last Date Modified'; }

                // --- Warehouse / location ---
                field(locationCode; Rec."Location Code") { Caption = 'Location Code'; }
                field(openShopFloorBinCode; Rec."Open Shop Floor Bin Code") { Caption = 'Open Shop Floor Bin Code'; }
                field(toProductionBinCode; Rec."To-Production Bin Code") { Caption = 'To-Production Bin Code'; }
                field(fromProductionBinCode; Rec."From-Production Bin Code") { Caption = 'From-Production Bin Code'; }

                // --- System fields ---
                field(systemId; Rec.SystemId) { Caption = 'SystemId'; }
                field(systemCreatedAt; Rec.SystemCreatedAt) { Caption = 'SystemCreatedAt'; }
                field(systemCreatedBy; Rec.SystemCreatedBy) { Caption = 'SystemCreatedBy'; }
                field(systemModifiedAt; Rec.SystemModifiedAt) { Caption = 'SystemModifiedAt'; }
                field(systemModifiedBy; Rec.SystemModifiedBy) { Caption = 'SystemModifiedBy'; }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        simulationTypeInt := Rec."Simulation Type";
        unitCostCalculationInt := Rec."Unit Cost Calculation";
        flushingMethodInt := Rec."Flushing Method".AsInteger();
    end;

    var
        simulationTypeInt: Integer;
        unitCostCalculationInt: Integer;
        flushingMethodInt: Integer;
}