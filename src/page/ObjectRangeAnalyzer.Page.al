page 50211 "Object Range Analyzer"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    Caption = 'Object Range Analyzer';
    SourceTable = "Object Range Buffer";
    SourceTableTemporary = true;
    Editable = false;
    
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Object Type"; Rec."Object Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'The type of object (Table, Page, Report, etc.)';
                }
                field("Range Start"; Rec."Range Start")
                {
                    ApplicationArea = All;
                    ToolTip = 'Starting object number of the range';
                }
                field("Range End"; Rec."Range End")
                {
                    ApplicationArea = All;
                    ToolTip = 'Ending object number of the range';
                }
                field("Status"; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'Whether this range is Used or Available';
                    StyleExpr = StatusStyle;
                }
                field("Object Count"; Rec."Object Count")
                {
                    ApplicationArea = All;
                    ToolTip = 'Number of objects in this range';
                }
            }
        }
    }
    
    actions
    {
        area(Processing)
        {
            action(AnalyzeRanges)
            {
                ApplicationArea = All;
                Caption = 'Analyze Object Ranges';
                Image = Refresh;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Scan all objects and identify available ranges';
                
                trigger OnAction()
                begin
                    AnalyzeObjectRanges();
                end;
            }
            
            action(ShowCustomRangeOnly)
            {
                ApplicationArea = All;
                Caption = 'Show Custom Range (50000-99999)';
                Image = Filter;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Filter to show only custom object range';
                
                trigger OnAction()
                begin
                    AnalyzeObjectRanges();
                    Rec.SetFilter("Range Start", '>=50000');
                end;
            }
        }
    }
    
    trigger OnOpenPage()
    begin
        AnalyzeObjectRanges();
    end;
    
    local procedure AnalyzeObjectRanges()
    var
        AllObj: Record AllObj;
        ObjType: Integer;
        LastID: Integer;
        RangeStart: Integer;
        ObjectCount: Integer;
    begin
        Rec.DeleteAll();
        
        // Analyze each object type
        for ObjType := 1 to 9 do begin
            if ObjType in [1, 3, 5, 6, 8, 9] then begin // Table, Report, Codeunit, XMLport, Page, Query
                AllObj.SetRange("Object Type", ObjType);
                AllObj.SetFilter("Object ID", '>=50000&<=99999'); // Focus on custom range
                
                if AllObj.FindSet() then begin
                    LastID := 49999;
                    repeat
                        // Check for gap
                        if AllObj."Object ID" > LastID + 1 then begin
                            // Found available range
                            AddRange(ObjType, LastID + 1, AllObj."Object ID" - 1, false, 0);
                        end;
                        
                        // Track this used object
                        RangeStart := AllObj."Object ID";
                        ObjectCount := 1;
                        
                        // Check if next objects are consecutive
                        while AllObj.Next() <> 0 do begin
                            if AllObj."Object ID" = LastID + ObjectCount + 1 then
                                ObjectCount += 1
                            else begin
                                AllObj.Next(-1); // Step back
                                break;
                            end;
                        end;
                        
                        // Add used range
                        AddRange(ObjType, RangeStart, RangeStart + ObjectCount - 1, true, ObjectCount);
                        LastID := RangeStart + ObjectCount - 1;
                        
                    until AllObj.Next() = 0;
                    
                    // Check for gap at the end (up to 99999)
                    if LastID < 99999 then
                        AddRange(ObjType, LastID + 1, 99999, false, 0);
                end else begin
                    // No objects found in this type, entire range available
                    AddRange(ObjType, 50000, 99999, false, 0);
                end;
                
                AllObj.Reset();
            end;
        end;
        
        if Rec.FindFirst() then;
    end;
    
    local procedure AddRange(ObjType: Integer; StartID: Integer; EndID: Integer; IsUsed: Boolean; Count: Integer)
    begin
        Rec.Init();
        Rec."Entry No." := Rec."Entry No." + 1;
        Rec."Object Type" := ConvertObjectType(ObjType);
        Rec."Range Start" := StartID;
        Rec."Range End" := EndID;
        if IsUsed then
            Rec.Status := Rec.Status::Used
        else
            Rec.Status := Rec.Status::Available;
        Rec."Object Count" := Count;
        Rec.Insert();
    end;
    
    local procedure ConvertObjectType(ObjType: Integer): Integer
    begin
        case ObjType of
            1: exit(0); // Table
            8: exit(1); // Page
            3: exit(2); // Report
            5: exit(3); // Codeunit
            9: exit(4); // Query
            6: exit(5); // XMLport
        end;
    end;
    
    var
        StatusStyle: Text;
        
    trigger OnAfterGetRecord()
    begin
        if Rec.Status = Rec.Status::Available then
            StatusStyle := 'Favorable'
        else
            StatusStyle := 'Unfavorable';
    end;
}