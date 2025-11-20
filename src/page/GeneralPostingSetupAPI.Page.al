page 50220 "GeneralPostingSetupAPI"
{
    /// <summary>
    /// 2025.10.27  SPN AL Assistant  v001.0
    /// API page for General Posting Setup (DW export)
    /// </summary>
    Caption = 'GeneralPostingSetupAPI';
    AdditionalSearchTerms = 'SCANPAN, API, datawarehouse, posting setup';
    UsageCategory = Administration;

    PageType = API;
    APIPublisher = 'scanpan';
    APIGroup = 'datawarehouse';
    APIVersion = 'beta', 'v1.0';

    EntitySetName = 'generalPostingSetups';
    EntityName = 'generalPostingSetup';

    DelayedInsert = true;
    Editable = false;

    SourceTable = "General Posting Setup";
    SourceTableView = sorting("Gen. Bus. Posting Group", "Gen. Prod. Posting Group") order(ascending);
    ODataKeyFields = "Gen. Bus. Posting Group", "Gen. Prod. Posting Group";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                Caption = 'General Posting Setup';

                // Keys
                field(genBusPostingGroup; Rec."Gen. Bus. Posting Group") { Caption = 'Gen. Bus. Posting Group'; }
                field(genProdPostingGroup; Rec."Gen. Prod. Posting Group") { Caption = 'Gen. Prod. Posting Group'; }

                // Common accounts (adjust to your database if any are missing)
                field(salesAccount; Rec."Sales Account") { Caption = 'Sales Account'; }
                field(purchAccount; Rec."Purch. Account") { Caption = 'Purch. Account'; }
                field(cogsAccount; Rec."COGS Account") { Caption = 'COGS Account'; }

                // Often present in vanilla:
                field(salesLineDiscAccount; Rec."Sales Line Disc. Account") { Caption = 'Sales Line Disc. Account'; }
                field(purchLineDiscAccount; Rec."Purch. Line Disc. Account") { Caption = 'Purch. Line Disc. Account'; }
                field(salesInvDiscAccount; Rec."Sales Inv. Disc. Account") { Caption = 'Sales Inv. Disc. Account'; }
                field(purchInvDiscAccount; Rec."Purch. Inv. Disc. Account") { Caption = 'Purch. Inv. Disc. Account'; }

                // If present in your build:
                field(salesCreditMemoAccount; Rec."Sales Credit Memo Account") { Caption = 'Sales Credit Memo Account'; }
                field(purchCrMemoAccount; Rec."Purch. Credit Memo Account") { Caption = 'Purch. Credit Memo Account'; }

                //field(cogsInterimAccount; Rec."COGS Interim Account") { Caption = 'COGS Interim Account'; }

                field(inventoryAdjmtAccount; Rec."Inventory Adjmt. Account") { Caption = 'Inventory Adjmt. Account'; } // sometimes lives elsewhere; remove if not in 252

                // System fields
                field(systemId; Rec.SystemId) { Caption = 'SystemId'; }
                field(systemCreatedAt; Rec.SystemCreatedAt) { Caption = 'SystemCreatedAt'; }
                field(systemCreatedBy; Rec.SystemCreatedBy) { Caption = 'SystemCreatedBy'; }
                field(systemModifiedAt; Rec.SystemModifiedAt) { Caption = 'SystemModifiedAt'; }
                field(systemModifiedBy; Rec.SystemModifiedBy) { Caption = 'SystemModifiedBy'; }
            }
        }
    }
}
