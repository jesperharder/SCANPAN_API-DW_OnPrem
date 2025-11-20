page 50282 "WorkCenterAPI"
{
    /// <summary>
    /// Date        Name                    Version   Description
    /// 2025.11.20  Business Central AL     001.0     API page for Work Center (table 99000754)
    /// </summary>

    Caption = 'WorkCenterAPI';
    AdditionalSearchTerms = 'SCANPAN, API, datawarehouse, dw, work center, capacity';
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

                // --- Key & identity ---
                field(no; Rec."No.") { Caption = 'No.'; }
                field(name; Rec.Name) { Caption = 'Name'; }
                field(searchName; Rec."Search Name") { Caption = 'Search Name'; }

                // --- Classification & relations ---
                field(workCenterGroupCode; Rec."Work Center Group Code") { Caption = 'Work Center Group Code'; }
                field(locationCode; Rec."Location Code") { Caption = 'Location Code'; }
                field(shopCalendarCode; Rec."Shop Calendar Code") { Caption = 'Shop Calendar Code'; }

                // --- Capacity & efficiency ---
                field(unitOfMeasureCode; Rec."Unit of Measure Code") { Caption = 'Unit of Measure Code'; }
                field(capacity; Rec.Capacity) { Caption = 'Capacity'; }
                //field(efficiencyPct; Rec."Efficiency %" )         { Caption = 'Efficiency %'; }
                //field(scrapPct; Rec."Scrap %")                    { Caption = 'Scrap %'; }

                // --- Costing (if present on your version) ---
                field(overheadRate; Rec."Overhead Rate") { Caption = 'Overhead Rate'; }
                field(indirectCostPct; Rec."Indirect Cost %") { Caption = 'Indirect Cost %'; }

                // --- Shop calendar / times (light) ---
                //field(shopCalendarCode2; Rec."Shop Calendar Code 2") { Caption = 'Shop Calendar Code 2'; } // hvis findes i jeres base

                // --- Control ---
                field(blocked; Rec.Blocked) { Caption = 'Blocked'; }

                // --- System fields ---
                field(systemId; Rec.SystemId) { Caption = 'SystemId'; }
                field(systemCreatedAt; Rec.SystemCreatedAt) { Caption = 'SystemCreatedAt'; }
                field(systemCreatedBy; Rec.SystemCreatedBy) { Caption = 'SystemCreatedBy'; }
                field(systemModifiedAt; Rec.SystemModifiedAt) { Caption = 'SystemModifiedAt'; }
                field(systemModifiedBy; Rec.SystemModifiedBy) { Caption = 'SystemModifiedBy'; }
            }
        }
    }

    // Standard indeholder typisk ingen Option/Enum-felter på Work Center → ingen INT-spejle.
    // Hvis jeres extension har Enum/Option-felter (fx "Capacity Type"), kan du tilføje:
    //
    // var
    //     capacityTypeInt: Integer;
    //
    // trigger OnAfterGetRecord()
    // begin
    //     // capacityTypeInt := Rec."Capacity Type".AsInteger(); // eller direkte ved Option
    // end;
}
