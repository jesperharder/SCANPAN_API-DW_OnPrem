page 50099 DimnsionValueAPI
{
    /// <summary>
    /// Date        Name                Version.SubVersion      Description
    /// 2025.07.08  Jesper Harder       001.2                   API page for Dimension Values
    /// </summary>

    Caption = 'DimnsionValueAPI';
    AdditionalSearchTerms = 'SCANPAN, API, datawarehouse, dw';
    UsageCategory = Administration;

    PageType = API;
    APIPublisher = 'scanpan';
    APIGroup = 'datawarehouse';
    APIVersion = 'beta', 'v1.0';
    EntitySetName = 'dimensionValues';
    EntityName = 'dimensionValue';
    //DelayedInsert = true;
    Editable = false;

    SourceTable = "Dimension Value";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("code"; Rec."Code")
                {
                    Caption = 'Code';
                }
                field(consolidationCode; Rec."Consolidation Code")
                {
                    Caption = 'Consolidation Code';
                }
                field(dimensionCode; Rec."Dimension Code")
                {
                    Caption = 'Dimension Code';
                }
                field(dimensionId; Rec."Dimension Id")
                {
                    Caption = 'Dimension Id';
                }
                field(dimensionValueID; Rec."Dimension Value ID")
                {
                    Caption = 'Dimension Value ID';
                }
                field(dimensionValueType; Rec."Dimension Value Type")
                {
                    Caption = 'Dimension Value Type';
                }
                field(dimensionValueTypeInt; DimensionValueTypeInt)
                {
                    Caption = 'Dimension Value Type Int';
                }

                field(globalDimensionNo; Rec."Global Dimension No.")
                {
                    Caption = 'Global Dimension No.';
                }
                field(indentation; Rec.Indentation)
                {
                    Caption = 'Indentation';
                }
                field(lastModifiedDateTime; Rec."Last Modified Date Time")
                {
                    Caption = 'Last Modified Date Time';
                }
                field(mapToICDimensionCode; Rec."Map-to IC Dimension Code")
                {
                    Caption = 'Map-to IC Dimension Code';
                }
                field(mapToICDimensionValueCode; Rec."Map-to IC Dimension Value Code")
                {
                    Caption = 'Map-to IC Dimension Value Code';
                }
                field(name; Rec.Name)
                {
                    Caption = 'Name';
                }
                field(systemCreatedAt; Rec.SystemCreatedAt)
                {
                    Caption = 'SystemCreatedAt';
                }
                field(systemCreatedBy; Rec.SystemCreatedBy)
                {
                    Caption = 'SystemCreatedBy';
                }
                field(systemId; Rec.SystemId)
                {
                    Caption = 'SystemId';
                }
                field(systemModifiedAt; Rec.SystemModifiedAt)
                {
                    Caption = 'SystemModifiedAt';
                }
                field(systemModifiedBy; Rec.SystemModifiedBy)
                {
                    Caption = 'SystemModifiedBy';
                }
                field(totaling; Rec.Totaling)
                {
                    Caption = 'Totaling';
                }
            }
        }
    }
    var
        DimensionValueTypeInt: Integer;
  
    trigger OnAfterGetRecord()
    begin
        // Option-feltet kan tildeles direkte til Integer-variablen
        DimensionValueTypeInt := Rec."Dimension Value Type";
    end;

}
