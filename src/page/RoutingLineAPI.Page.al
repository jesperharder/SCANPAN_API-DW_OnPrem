page 50256 "RoutingLineAPI"
{
    /// <summary>
    /// Date        Name                    Version   Description
    /// 2025.11.20  Business Central AL     001.0     API page for Routing Line (table 99000763)
    /// </summary>

    Caption = 'RoutingLineAPI';
    AdditionalSearchTerms = 'SCANPAN, API, datawarehouse, dw';
    UsageCategory = Administration;

    PageType = API;
    APIPublisher = 'scanpan';
    APIGroup = 'datawarehouse';
    APIVersion = 'beta', 'v1.0';

    EntitySetName = 'routingLines';
    EntityName = 'routingLine';

    DelayedInsert = true;
    Editable = false;

    SourceTable = "Routing Line";
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

                // --- Natural keys / relations ---
                field(routingNo; Rec."Routing No.")                       { Caption = 'Routing No.'; }
                field(versionCode; Rec."Version Code")                    { Caption = 'Version Code'; }
                field(operationNo; Rec."Operation No.")                   { Caption = 'Operation No.'; }
                field(nextOperationNo; Rec."Next Operation No.")          { Caption = 'Next Operation No.'; }
                //field(lineNo; Rec."Line No.")                             { Caption = 'Line No.'; }

                // --- Capacity reference ---
                field(type; Rec.Type)                                     { Caption = 'Type'; }
                field(typeInt; typeInt)                                   { Caption = 'Type INT'; }
                field(no; Rec."No.")                                      { Caption = 'No.'; } // Work/Machine Center No.

                // --- Times / queue / move / wait ---
                field(setupTime; Rec."Setup Time")                        { Caption = 'Setup Time'; }
                field(runTime; Rec."Run Time")                            { Caption = 'Run Time'; }
                field(waitTime; Rec."Wait Time")                          { Caption = 'Wait Time'; }
                field(moveTime; Rec."Move Time")                          { Caption = 'Move Time'; }
                //field(queueTime; Rec."Queue Time")                        { Caption = 'Queue Time'; }

                // --- Other routing data ---
                field(standardTaskCode; Rec."Standard Task Code")         { Caption = 'Standard Task Code'; }
                field(routingLinkCode; Rec."Routing Link Code")           { Caption = 'Routing Link Code'; }
                //field(unitOfMeasureCode; Rec."Unit of Measure Code")      { Caption = 'Unit of Measure Code'; }
                field(minimumProcessTime; Rec."Minimum Process Time")     { Caption = 'Minimum Process Time'; } // hvis tilgængelig i jeres base
                field(maximumProcessTime; Rec."Maximum Process Time")     { Caption = 'Maximum Process Time'; } // hvis tilgængelig
                //field(fixedScrapPercent; Rec."Fixed Scrap %")             { Caption = 'Fixed Scrap %'; }        // hvis tilgængelig
                field(lotSize; Rec."Lot Size")                            { Caption = 'Lot Size'; }             // hvis tilgængelig

                // --- System (audit) ---
                field(systemCreatedAt; Rec.SystemCreatedAt)               { Caption = 'SystemCreatedAt'; }
                field(systemCreatedBy; Rec.SystemCreatedBy)               { Caption = 'SystemCreatedBy'; }
                field(systemModifiedAt; Rec.SystemModifiedAt)             { Caption = 'SystemModifiedAt'; }
                field(systemModifiedBy; Rec.SystemModifiedBy)             { Caption = 'SystemModifiedBy'; }
            }
        }
    }

    var
        typeInt: Integer;

    trigger OnAfterGetRecord()
    begin
        // Enum/Option -> Integer spejl
        typeInt := Rec.Type.AsInteger(); // Hvis Option i jeres version: typeInt := Rec.Type;
    end;
}
