page 50243 "ProdOrderRoutingLineAPI"
{
    /// <summary>
    /// Date        Name                        Version   Description
    /// 2025.11.20  Business Central AL Asst.   001.0     API page for Prod. Order Routing Line (table 5409)
    /// </summary>

    Caption = 'ProdOrderRoutingLineAPI';
    AdditionalSearchTerms = 'SCANPAN, API, datawarehouse, dw';
    UsageCategory = Administration;

    PageType = API;
    APIPublisher = 'scanpan';
    APIGroup = 'datawarehouse';
    APIVersion = 'beta', 'v1.0';

    EntitySetName = 'prodOrderRoutingLines';
    EntityName = 'prodOrderRoutingLine';

    DelayedInsert = true;
    Editable = false;

    SourceTable = "Prod. Order Routing Line";
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
                field(systemId; Rec.SystemId)                         { Caption = 'SystemId'; }

                // --- Header/relations ---
                field(status; Rec.Status)                             { Caption = 'Status'; }
                field(statusInt; statusInt)                           { Caption = 'Status INT'; }

                field(prodOrderNo; Rec."Prod. Order No.")             { Caption = 'Prod. Order No.'; }
                field(routingRefNo; Rec."Routing Reference No.")      { Caption = 'Routing Reference No.'; }
                field(operationNo; Rec."Operation No.")               { Caption = 'Operation No.'; }
                field(nextOperationNo; Rec."Next Operation No.")      { Caption = 'Next Operation No.'; }
                //field(lineNo; Rec."Line No.")                         { Caption = 'Line No.'; }

                // --- Capacity reference ---
                field(type; Rec.Type)                                 { Caption = 'Type'; }
                field(typeInt; typeInt)                               { Caption = 'Type INT'; }
                field(workCenterNo; Rec."Work Center No.")            { Caption = 'Work Center No.'; }
                //field(machineCenterNo; Rec."Machine Center No.")      { Caption = 'Machine Center No.'; }

                // --- Routing numbers (if present) ---
                field(routingNo; Rec."Routing No.")                   { Caption = 'Routing No.'; }

                // --- Times / queue / move / wait ---
                field(setupTime; Rec."Setup Time")                    { Caption = 'Setup Time'; }
                field(runTime; Rec."Run Time")                        { Caption = 'Run Time'; }
                field(waitTime; Rec."Wait Time")                      { Caption = 'Wait Time'; }
                field(moveTime; Rec."Move Time")                      { Caption = 'Move Time'; }
                //field(queueTime; Rec."Queue Time")                    { Caption = 'Queue Time'; }

                // --- Location/bin context (if used at line level) ---
                field(locationCode; Rec."Location Code")              { Caption = 'Location Code'; }
                //field(binCode; Rec."Bin Code")                        { Caption = 'Bin Code'; }

                // --- System (audit) ---
                field(systemCreatedAt; Rec.SystemCreatedAt)           { Caption = 'SystemCreatedAt'; }
                field(systemCreatedBy; Rec.SystemCreatedBy)           { Caption = 'SystemCreatedBy'; }
                field(systemModifiedAt; Rec.SystemModifiedAt)         { Caption = 'SystemModifiedAt'; }
                field(systemModifiedBy; Rec.SystemModifiedBy)         { Caption = 'SystemModifiedBy'; }
            }
        }
    }

    var
        statusInt: Integer;
        typeInt: Integer;

    trigger OnAfterGetRecord()
    begin
        // Enum/Option -> Integer spejle
        statusInt := Rec.Status.AsInteger();
        typeInt := Rec.Type.AsInteger(); // hvis Option i jeres version: typeInt := Rec.Type;
    end;
}
