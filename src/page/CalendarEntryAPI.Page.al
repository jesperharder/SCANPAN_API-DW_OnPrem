page 50200 "CalendarEntryAPI"
{
    /// <remarks>
    /// This page is intended for integration scenarios where calendar entry data is required.
    /// It provides access to calendar entries including work center and capacity details.
    /// Permissions are set to allow read access to the "Calendar Entry" table.
    /// </remarks>

    Caption = 'Calendar Entries';
    AdditionalSearchTerms = 'Calendar Entry, API, Work Center, Capacity, Work Shift';
    PageType = API;
    APIPublisher = 'yourcompany';
    APIGroup = 'calendar';
    APIVersion = 'v1.0';
    EntityName = 'calendarEntry';
    EntitySetName = 'calendarEntries';
    SourceTable = "Calendar Entry";
    DelayedInsert = true;
    ODataKeyFields = SystemId;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(id; Rec.SystemId)
                {
                    Caption = 'Id';
                    Editable = false;
                }
                field(capacityType; Rec."Capacity Type")
                {
                    Caption = 'Capacity Type';
                }
                field(capacityTypeInt; CapacityTypeInt)
                {
                    Caption = 'Capacity Type (Int)';

                    trigger OnValidate()
                    begin
                        Rec."Capacity Type" := Enum::"Capacity Type".FromInteger(CapacityTypeInt);
                    end;
                }
                field(number; Rec."No.")
                {
                    Caption = 'No.';
                }
                field(date; Rec.Date)
                {
                    Caption = 'Date';
                }
                field(workShiftCode; Rec."Work Shift Code")
                {
                    Caption = 'Work Shift Code';
                }
                field(startingTime; Rec."Starting Time")
                {
                    Caption = 'Starting Time';
                }
                field(endingTime; Rec."Ending Time")
                {
                    Caption = 'Ending Time';
                }
                field(workCenterNo; Rec."Work Center No.")
                {
                    Caption = 'Work Center No.';
                    Editable = false;
                }
                field(workCenterGroupCode; Rec."Work Center Group Code")
                {
                    Caption = 'Work Center Group Code';
                    Editable = false;
                }
                field(capacityTotal; Rec."Capacity (Total)")
                {
                    Caption = 'Capacity (Total)';
                    Editable = false;
                }
                field(capacityEffective; Rec."Capacity (Effective)")
                {
                    Caption = 'Capacity (Effective)';
                    Editable = false;
                }
                field(efficiency; Rec.Efficiency)
                {
                    Caption = 'Efficiency';
                }
                field(capacity; Rec.Capacity)
                {
                    Caption = 'Capacity';
                }
                field(absenceEfficiency; Rec."Absence Efficiency")
                {
                    Caption = 'Absence Efficiency';
                    Editable = false;
                }
                field(absenceCapacity; Rec."Absence Capacity")
                {
                    Caption = 'Absence Capacity';
                    Editable = false;
                }
                field(startingDateTime; Rec."Starting Date-Time")
                {
                    Caption = 'Starting Date-Time';
                }
                field(endingDateTime; Rec."Ending Date-Time")
                {
                    Caption = 'Ending Date-Time';
                }
                field(systemCreatedAt; Rec.SystemCreatedAt)
                {
                    Caption = 'Created At';
                    Editable = false;
                }
                field(systemModifiedAt; Rec.SystemModifiedAt)
                {
                    Caption = 'Modified At';
                    Editable = false;
                }
            }
        }
    }

    var
        CapacityTypeInt: Integer;

    trigger OnAfterGetRecord()
    begin
        CapacityTypeInt := Rec."Capacity Type".AsInteger();
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        CapacityTypeInt := 0;
    end;
}