page 50218 "GenBusinessPostingGroupAPI"
{
    /// <summary>
    /// 2025.10.24  Jesper Harder – v001.0
    /// API page for Gen. Business Posting Group (DW export)
    /// </summary>

    Caption = 'GenBusinessPostingGroupAPI';
    AdditionalSearchTerms = 'SCANPAN, API, datawarehouse, posting group';
    UsageCategory = Administration;

    PageType = API;
    APIPublisher = 'scanpan';
    APIGroup = 'datawarehouse';
    APIVersion = 'beta', 'v1.0';

    EntitySetName = 'genBusinessPostingGroups';
    EntityName = 'genBusinessPostingGroup';

    DelayedInsert = true;
    Editable = false;

    SourceTable = "Gen. Business Posting Group";
    SourceTableView = sorting(Code) order(ascending);
    ODataKeyFields = Code;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                Caption = 'General';

                // --- Identification ---
                field(code; Rec.Code) { Caption = 'Code'; }
                field(description; Rec.Description) { Caption = 'Description'; }

                // --- Settings ---
                field(defVATBusPostingGroup; Rec."Def. VAT Bus. Posting Group")
                {
                    Caption = 'Default VAT Bus. Posting Group';
                }

                // --- Audit fields ---

                // --- System fields ---
                field(systemId; Rec.SystemId)
                {
                    Caption = 'SystemId';
                }
                field(systemCreatedAt; Rec.SystemCreatedAt)
                {
                    Caption = 'SystemCreatedAt';
                }
                field(systemCreatedBy; Rec.SystemCreatedBy)
                {
                    Caption = 'SystemCreatedBy';
                }
                field(systemModifiedAt; Rec.SystemModifiedAt)
                {
                    Caption = 'SystemModifiedAt';
                }
                field(systemModifiedBy; Rec.SystemModifiedBy)
                {
                    Caption = 'SystemModifiedBy';
                }
            }
        }
    }

    // Ingen lokale variabler eller triggere er nødvendige,
    // da alle felter er simple (ingen enums/options).
}
