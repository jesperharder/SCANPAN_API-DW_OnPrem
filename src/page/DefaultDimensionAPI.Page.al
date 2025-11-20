page 50214 "DefaultDimensionAPI"
{
    /// <summary>
    /// Date        Name                    Version   Description
    /// 2025.10.24  Business Central AL     001.0     API page for Default Dimension (table 352)
    /// </summary>

    Caption = 'DefaultDimensionAPI';
    AdditionalSearchTerms = 'SCANPAN, API, datawarehouse, dw, dimension';
    UsageCategory = Administration;

    PageType = API;
    APIPublisher = 'scanpan';
    APIGroup = 'datawarehouse';
    APIVersion = 'beta', 'v1.0';

    EntitySetName = 'defaultDimensions';
    EntityName = 'defaultDimension';

    DelayedInsert = true;
    Editable = false;

    SourceTable = "Default Dimension";
    SourceTableView = sorting("Table ID", "No.", "Dimension Code") order(ascending);
    ODataKeyFields = "Table ID", "No.", "Dimension Code";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                Caption = 'Default Dimension Fields';

                // --- Key fields ---
                field(tableId; Rec."Table ID")           { Caption = 'Table ID'; }
                field(no; Rec."No.")                     { Caption = 'No.'; }
                field(dimensionCode; Rec."Dimension Code") { Caption = 'Dimension Code'; }

                // --- Main content ---
                field(dimensionValueCode; Rec."Dimension Value Code") { Caption = 'Dimension Value Code'; }
                field(valuePosting; Rec."Value Posting")              { Caption = 'Value Posting'; }
                field(valuePostingInt; valuePostingInt)               { Caption = 'Value Posting INT'; }
                field(tableIdInt; tableIdInt)                         { Caption = 'Table ID INT'; }

                // --- System fields ---
                field(systemId; Rec.SystemId)                 { Caption = 'SystemId'; }
                field(systemCreatedAt; Rec.SystemCreatedAt)   { Caption = 'SystemCreatedAt'; }
                field(systemCreatedBy; Rec.SystemCreatedBy)   { Caption = 'SystemCreatedBy'; }
                field(systemModifiedAt; Rec.SystemModifiedAt) { Caption = 'SystemModifiedAt'; }
                field(systemModifiedBy; Rec.SystemModifiedBy) { Caption = 'SystemModifiedBy'; }
            }
        }
    }

    var
        valuePostingInt: Integer;
        tableIdInt: Integer;

    trigger OnAfterGetRecord()
    begin
        // --- Convert Table ID to integer (direct copy)
        tableIdInt := Rec."Table ID";

        // --- Map Value Posting (Option or Enum) to integer
        case Rec."Value Posting" of
            Rec."Value Posting"::" ":
                valuePostingInt := 0; // Blank = None
            Rec."Value Posting"::"Code Mandatory":
                valuePostingInt := 1;
            Rec."Value Posting"::"Same Code":
                valuePostingInt := 2;
            Rec."Value Posting"::"No Code":
                valuePostingInt := 3;
            else
                valuePostingInt := -1;
        end;
    end;
}
