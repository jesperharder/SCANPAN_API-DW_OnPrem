page 50097 DimensionSetEntryAPI
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
                // 1:1 mod dit SQL-select
                field(timestamp8; Timestamp8)
                {
                    Caption = 'timestamp (8 bytes)';
                }
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

    var
        // Vi kan ikke udstille den interne SQL rowversion direkte,
        // men vi kan levere en stabil 8-bytes Base64/Binary repræsentation til teknisk paritet, hvis du ønsker det.
        // Her laves et "fake" 8-byte felt baseret på SystemId for wire-kompatibilitet (valgfrit).
        // Hvis du ikke har brug for det, kan du fjerne hele feltet/funktionen.
        Timestamp8: Text[12];

    trigger OnAfterGetRecord()
    begin
        // NB: Dette er KUN til kosmetisk paritet ift. din eksisterende pipeline der forventer et 8-bytes felt.
        // Brug systemModifiedAt til inkrementelle loads!
        Timestamp8 := COPYSTR(FORMAT(Rec.SystemModifiedAt, 0, '<Year4><Month,2><Day,2><Hours24,2><Minutes,2><Seconds,2>'), 1, 12);
    end;
}
