page 50279 "ValueEntryAPI"
{
    /// <summary>
    /// Date        Name                    Version   Description
    /// 2025.11.20  Business Central AL     001.0     API page for Value Entry (table 5802)
    /// </summary>

    Caption = 'ValueEntryAPI';
    AdditionalSearchTerms = 'SCANPAN, API, datawarehouse, dw, value entry, costing, inventory';
    UsageCategory = Administration;

    PageType = API;
    APIPublisher = 'scanpan';
    APIGroup = 'datawarehouse';
    APIVersion = 'beta', 'v1.0';

    EntitySetName = 'valueEntries';
    EntityName = 'valueEntry';

    DelayedInsert = true;
    Editable = false;

    SourceTable = "Value Entry";
    SourceTableView = sorting("Entry No.") order(ascending);
    ODataKeyFields = "Entry No.";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                Caption = 'Group';

                // --- Key ---
                field(entryNo; Rec."Entry No.")                       { Caption = 'Entry No.'; }

                // --- Identity / relations ---
                field(itemNo; Rec."Item No.")                         { Caption = 'Item No.'; }
                field(variantCode; Rec."Variant Code")                { Caption = 'Variant Code'; }
                field(locationCode; Rec."Location Code")              { Caption = 'Location Code'; }
                field(itemLedgerEntryNo; Rec."Item Ledger Entry No.") { Caption = 'Item Ledger Entry No.'; }

                // --- Posting / dates ---
                field(postingDate; Rec."Posting Date")                { Caption = 'Posting Date'; }
                field(valuationDate; Rec."Valuation Date")            { Caption = 'Valuation Date'; }

                // --- Document refs ---
                field(documentNo; Rec."Document No.")                 { Caption = 'Document No.'; }
                field(externalDocumentNo; Rec."External Document No."){ Caption = 'External Document No.'; }

                // --- Enums/Options + INT-spejle ---
                field(entryType; Rec."Entry Type")                    { Caption = 'Entry Type'; }
                field(entryTypeInt; entryTypeInt)                     { Caption = 'Entry Type INT'; }

                field(sourceType; Rec."Source Type")                  { Caption = 'Source Type'; }
                field(sourceTypeInt; sourceTypeInt)                   { Caption = 'Source Type INT'; }

                // --- Dimensions / posting groups (typisk til stede på Value Entry) ---
                field(globalDim1Code; Rec."Global Dimension 1 Code")  { Caption = 'Global Dimension 1 Code'; }
                field(globalDim2Code; Rec."Global Dimension 2 Code")  { Caption = 'Global Dimension 2 Code'; }
                field(genBusPostingGroup; Rec."Gen. Bus. Posting Group") { Caption = 'Gen. Bus. Posting Group'; }
                field(genProdPostingGroup; Rec."Gen. Prod. Posting Group") { Caption = 'Gen. Prod. Posting Group'; }

                // --- Quantities & costs/sales amounts ---
                field(valuedQuantity; Rec."Valued Quantity")          { Caption = 'Valued Quantity'; }
                field(costPerUnit; Rec."Cost per Unit")               { Caption = 'Cost per Unit'; }

                field(costAmountActual; Rec."Cost Amount (Actual)")   { Caption = 'Cost Amount (Actual)'; }
                field(costAmountExpected; Rec."Cost Amount (Expected)"){ Caption = 'Cost Amount (Expected)'; }
                field(costPostedToGL; Rec."Cost Posted to G/L")       { Caption = 'Cost Posted to G/L'; }

                field(salesAmountActual; Rec."Sales Amount (Actual)") { Caption = 'Sales Amount (Actual)'; }
                field(salesAmountExpected; Rec."Sales Amount (Expected)") { Caption = 'Sales Amount (Expected)'; }

                // --- Misc. ---
                //field(appliedEntryToAdjust; Rec."Applied Entry to Adjust"){ Caption = 'Applied Entry to Adjust'; }
                field(itemChargeNo; Rec."Item Charge No.")            { Caption = 'Item Charge No.'; }

                // --- System fields ---
                field(systemId; Rec.SystemId)                         { Caption = 'SystemId'; }
                field(systemCreatedAt; Rec.SystemCreatedAt)           { Caption = 'SystemCreatedAt'; }
                field(systemCreatedBy; Rec.SystemCreatedBy)           { Caption = 'SystemCreatedBy'; }
                field(systemModifiedAt; Rec.SystemModifiedAt)         { Caption = 'SystemModifiedAt'; }
                field(systemModifiedBy; Rec.SystemModifiedBy)         { Caption = 'SystemModifiedBy'; }
            }
        }
    }

    var
        entryTypeInt: Integer;
        sourceTypeInt: Integer;

    trigger OnAfterGetRecord()
    begin
        // Enum/Option -> Integer spejle (Enums i nyere BC; Option i ældre)
        entryTypeInt := Rec."Entry Type".AsInteger();
        sourceTypeInt := Rec."Source Type".AsInteger();

        // Hvis nogle af felterne er Option i jeres version, brug direkte tildeling:
        // entryTypeInt := Rec."Entry Type";
        // sourceTypeInt := Rec."Source Type";
    end;
}
