page 50207 DimensionSetEntryAPI
{
    /// 2025.08.22  Jesper Harder  001.4  API page for Dimension Set Entry (SQL-paritet)
    PageType = API;
    APIPublisher = 'scanpan';
    APIGroup = 'datawarehouse';
    APIVersion = 'beta', 'v1.0';

    Caption = 'DimensionSetEntryAPI';
    EntityName = 'dimensionSetEntry';
    EntitySetName = 'dimensionSetEntries';

    SourceTable = "Dimension Set Entry";
    SourceTableView = sorting("Dimension Set ID", "Dimension Code") order(ascending);

    // Stabil, sammensat nøgle (giver pæne OData-URL’er)
    ODataKeyFields = "Dimension Set ID", "Dimension Code";

    UsageCategory = Administration;
    AdditionalSearchTerms = 'SCANPAN, API, datawarehouse, dw';

    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(dimensionSetId; Rec."Dimension Set ID") { Caption = 'Dimension Set ID'; }
                field(dimensionCode; Rec."Dimension Code") { Caption = 'Dimension Code'; }
                field(dimensionValueCode; Rec."Dimension Value Code") { Caption = 'Dimension Value Code'; }
                field(dimensionValueId; Rec."Dimension Value ID") { Caption = 'Dimension Value ID'; }
                field(globalDimensionNo; Rec."Global Dimension No.") { Caption = 'Global Dimension No.'; }

                // BC systemfelter (brug dem til inkrementel load i stedet for SQL rowversion)
                field(systemId; Rec.SystemId) { Caption = 'SystemId'; }
                field(systemCreatedAt; Rec.SystemCreatedAt) { Caption = 'SystemCreatedAt'; }
                field(systemCreatedBy; Rec.SystemCreatedBy) { Caption = 'SystemCreatedBy'; }
                field(systemModifiedAt; Rec.SystemModifiedAt) { Caption = 'SystemModifiedAt'; }
                field(systemModifiedBy; Rec.SystemModifiedBy) { Caption = 'SystemModifiedBy'; }
            }
        }
    }
    
    
}
