page  50222 "GLItemLedgerRelationAPI"
{
    /// <summary>
    /// 2025.10.27  SPN DW Suite  v001.0
    /// API page for table 5823 "G/L - Item Ledger Relation" (DW export).
    /// </summary>

    Caption = 'GLItemLedgerRelationAPI';
    AdditionalSearchTerms = 'SCANPAN, DW, GL-ValueEntry link, reconciliation';
    UsageCategory = Administration;

    PageType = API;
    APIPublisher = 'scanpan';
    APIGroup = 'datawarehouse';
    APIVersion = 'beta', 'v1.0';

    EntitySetName = 'glItemLedgerRelations';
    EntityName = 'glItemLedgerRelation';

    DelayedInsert = true;
    Editable = false;

    SourceTable = "G/L - Item Ledger Relation";
    SourceTableView = sorting("G/L Entry No.", "Value Entry No.") order(ascending);
    ODataKeyFields = "G/L Entry No.", "Value Entry No.";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                Caption = 'GL-Item Link';

                // Composite key (stable join handles on DW side)
                field(glEntryNo; Rec."G/L Entry No.") { Caption = 'G/L Entry No.'; }
                field(valueEntryNo; Rec."Value Entry No.") { Caption = 'Value Entry No.'; }

                // Traceability
                field(glRegisterNo; Rec."G/L Register No.") { Caption = 'G/L Register No.'; }

                // System fields for CDC / incremental loads
                field(systemId; Rec.SystemId) { Caption = 'SystemId'; }
                field(systemCreatedAt; Rec.SystemCreatedAt) { Caption = 'SystemCreatedAt'; }
                field(systemCreatedBy; Rec.SystemCreatedBy) { Caption = 'SystemCreatedBy'; }
                field(systemModifiedAt; Rec.SystemModifiedAt) { Caption = 'SystemModifiedAt'; }
                field(systemModifiedBy; Rec.SystemModifiedBy) { Caption = 'SystemModifiedBy'; }
            }
        }
    }

    // No triggers/vars needed – pure link table, no enums/options to mirror.
}
