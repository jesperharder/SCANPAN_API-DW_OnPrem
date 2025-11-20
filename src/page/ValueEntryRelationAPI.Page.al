page 50280 "ValueEntryRelationAPI"
{
    /// <summary>
    /// Date        Name                    Version   Description
    /// 2025.11.20  Business Central AL     001.0     API page for Value Entry Relation (standard link table)
    /// </summary>

    Caption = 'ValueEntryRelationAPI';
    AdditionalSearchTerms = 'SCANPAN, API, datawarehouse, dw, value entry, relation, costing, inventory';
    UsageCategory = Administration;

    PageType = API;
    APIPublisher = 'scanpan';
    APIGroup = 'datawarehouse';
    APIVersion = 'beta', 'v1.0';

    EntitySetName = 'valueEntryRelations';
    EntityName = 'valueEntryRelation';

    DelayedInsert = true;
    Editable = false;

    // Standardnavn er normalt "Value Entry Relation"
    SourceTable = "Value Entry Relation";
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

                // --- Relation keys (stabile i standard) ---
                field(valueEntryNo; Rec."Value Entry No.")                { Caption = 'Value Entry No.'; }
                //field(itemLedgerEntryNo; Rec."Item Ledger Entry No.")     { Caption = 'Item Ledger Entry No.'; }

                // (Tilføj evt. flere nøgler, hvis de findes i jeres base – fx andre relaterede entry-numre.)

                // --- System (audit) ---
                field(systemCreatedAt; Rec.SystemCreatedAt)               { Caption = 'SystemCreatedAt'; }
                field(systemCreatedBy; Rec.SystemCreatedBy)               { Caption = 'SystemCreatedBy'; }
                field(systemModifiedAt; Rec.SystemModifiedAt)             { Caption = 'SystemModifiedAt'; }
                field(systemModifiedBy; Rec.SystemModifiedBy)             { Caption = 'SystemModifiedBy'; }
            }
        }
    }

    // Standard antages uden Option/Enum felter her → ingen INT-spejle.
    // Hvis I har Enum/Option felter (fx Relation Type), så:
    //
    // var
    //     relationTypeInt: Integer;
    //
    // trigger OnAfterGetRecord()
    // begin
    //     // For Enum:
    //     // relationTypeInt := Rec."Relation Type".AsInteger();
    //     // For Option:
    //     // relationTypeInt := Rec."Relation Type";
    // end;
}
