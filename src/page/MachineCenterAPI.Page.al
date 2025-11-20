page 50239 "MachineCenterAPI"
{
    /// <summary>
    /// Date        Name                        Version   Description
    /// 2025.11.20  Business Central AL Asst.   001.0     API page for Machine Center (table 99000758)
    /// </summary>

    Caption = 'MachineCenterAPI';
    AdditionalSearchTerms = 'SCANPAN, API, datawarehouse, dw';
    UsageCategory = Administration;

    PageType = API;
    APIPublisher = 'scanpan';
    APIGroup = 'datawarehouse';
    APIVersion = 'beta', 'v1.0';

    EntitySetName = 'machineCenters';
    EntityName = 'machineCenter';

    DelayedInsert = true;
    Editable = false;

    SourceTable = "Machine Center";
    SourceTableView = sorting("No.") order(ascending);
    ODataKeyFields = "No.";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                Caption = 'Group';

                // --- Key ---
                field(no; Rec."No.")                          { Caption = 'No.'; }

                // --- Descriptive ---
                field(description; Rec.Name)           { Caption = 'Description'; }
                field(searchName; Rec."Search Name")          { Caption = 'Search Name'; }
                field(workCenterNo; Rec."Work Center No.")    { Caption = 'Work Center No.'; }
                field(blocked; Rec.Blocked)                   { Caption = 'Blocked'; }

                // --- Capacity & efficiency ---
                field(capacity; Rec.Capacity)                 { Caption = 'Capacity'; }
                //field(efficiencyPct; Rec."Efficiency %")      { Caption = 'Efficiency %'; }
                //field(unitOfMeasureCode; Rec."Unit of Measure Code") { Caption = 'Unit of Measure Code'; }
                //field(calendarCode; Rec."Calendar Code")      { Caption = 'Calendar Code'; }
                //field(shopCalendarCode; Rec."Shop Calendar Code") { Caption = 'Shop Calendar Code'; }

                // --- Times (routing defaults) ---
                field(setupTime; Rec."Setup Time")            { Caption = 'Setup Time'; }
                //field(runTime; Rec."Run Time")                { Caption = 'Run Time'; }
                field(waitTime; Rec."Wait Time")              { Caption = 'Wait Time'; }
                field(moveTime; Rec."Move Time")              { Caption = 'Move Time'; }
                field(queueTime; Rec."Queue Time")            { Caption = 'Queue Time'; }

                // --- Costing (hvis feltet findes i din version) ---
                field(unitCost; Rec."Unit Cost")              { Caption = 'Unit Cost'; }
                field(overheadRate; Rec."Overhead Rate")      { Caption = 'Overhead Rate'; }

                // --- Subcontracting/vendor relation (hvis anvendt) ---
                //field(subcontractorNo; Rec."Subcontractor No.") { Caption = 'Subcontractor No.'; }

                // --- System fields ---
                field(systemId; Rec.SystemId)                 { Caption = 'SystemId'; }
                field(systemCreatedAt; Rec.SystemCreatedAt)   { Caption = 'SystemCreatedAt'; }
                field(systemCreatedBy; Rec.SystemCreatedBy)   { Caption = 'SystemCreatedBy'; }
                field(systemModifiedAt; Rec.SystemModifiedAt) { Caption = 'SystemModifiedAt'; }
                field(systemModifiedBy; Rec.SystemModifiedBy) { Caption = 'SystemModifiedBy'; }
            }
        }
    }

    // --- Option/Enum spejle ---
    // Standard "Machine Center" har som udgangspunkt ikke Option/Enum felter.
    // Hvis I har egne Option/Enum felter via tableextension, kan I spejle dem til INT sådan her:
    //
    // var
    //     myEnumInt: Integer;
    //
    // trigger OnAfterGetRecord()
    // begin
    //     // For Enum:
    //     // myEnumInt := Rec."My Enum Field".AsInteger();
    //     // For Option:
    //     // myEnumInt := Rec."My Option Field";
    // end;
}
