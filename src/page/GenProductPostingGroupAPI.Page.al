page 50221 "GenProductPostingGroupAPI"
{
    /// <summary>
    /// 2025.10.27  SPN DW Suite  v001.0
    /// API page for Gen. Product Posting Group (table 251) – DW export.
    /// </summary>

    Caption = 'GenProductPostingGroupAPI';
    AdditionalSearchTerms = 'SCANPAN, API, datawarehouse, posting group, product';
    UsageCategory = Administration;

    PageType = API;
    APIPublisher = 'scanpan';
    APIGroup = 'datawarehouse';
    APIVersion = 'beta', 'v1.0';

    EntitySetName = 'genProductPostingGroups';
    EntityName = 'genProductPostingGroup';

    DelayedInsert = true;
    Editable = false;

    SourceTable = "Gen. Product Posting Group";
    SourceTableView = sorting(Code) order(ascending);
    ODataKeyFields = Code;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                Caption = 'General';

                // Keys
                field(code; Rec.Code) { Caption = 'Code'; }
                field(description; Rec.Description) { Caption = 'Description'; }

                // Defaults (safe vanilla field; if your build lacks it, remove this line)
                field(defVatProdPostingGroup; Rec."Def. VAT Prod. Posting Group")
                {
                    Caption = 'Default VAT Prod. Posting Group';
                }

                // System fields for incremental loads
                field(systemId; Rec.SystemId)               { Caption = 'SystemId'; }
                field(systemCreatedAt; Rec.SystemCreatedAt) { Caption = 'SystemCreatedAt'; }
                field(systemCreatedBy; Rec.SystemCreatedBy) { Caption = 'SystemCreatedBy'; }
                field(systemModifiedAt; Rec.SystemModifiedAt) { Caption = 'SystemModifiedAt'; }
                field(systemModifiedBy; Rec.SystemModifiedBy) { Caption = 'SystemModifiedBy'; }
            }
        }
    }
}
