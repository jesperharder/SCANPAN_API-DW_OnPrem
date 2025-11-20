page 50223 "GLBudgetEntryAPI"
{
    /// <summary>
    /// 2025.10.27  SPN DW Suite  v001.0
    /// API page for table 96 "G/L Budget Entry" (DW export).
    /// </summary>

    Caption = 'GLBudgetEntryAPI';
    AdditionalSearchTerms = 'SCANPAN, datawarehouse, budget, GL';
    UsageCategory = Administration;

    PageType = API;
    APIPublisher = 'scanpan';
    APIGroup = 'datawarehouse';
    APIVersion = 'beta', 'v1.0';

    EntitySetName = 'glBudgetEntries';
    EntityName = 'glBudgetEntry';

    DelayedInsert = true;
    Editable = false;

    SourceTable = "G/L Budget Entry";
    SourceTableView = sorting("Budget Name", "G/L Account No.", "Date", "Business Unit Code", "Global Dimension 1 Code", "Global Dimension 2 Code")
                      order(ascending);
    ODataKeyFields = "Budget Name", "G/L Account No.", "Date", "Business Unit Code", "Global Dimension 1 Code", "Global Dimension 2 Code";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                Caption = 'G/L Budget Entry';

                // --- Composite key fields ---
                field(budgetName; Rec."Budget Name") { Caption = 'Budget Name'; }
                field(glAccountNo; Rec."G/L Account No.") { Caption = 'G/L Account No.'; }
                field(date; Rec."Date") { Caption = 'Date'; }
                field(businessUnitCode; Rec."Business Unit Code") { Caption = 'Business Unit Code'; }
                field(globalDimension1Code; Rec."Global Dimension 1 Code") { Caption = 'Global Dimension 1 Code'; }
                field(globalDimension2Code; Rec."Global Dimension 2 Code") { Caption = 'Global Dimension 2 Code'; }

                // --- Measure ---
                field(amount; Rec."Amount") { Caption = 'Amount'; }

                // --- Optional (comment out if not in your build) ---
                field(dimensionSetId; Rec."Dimension Set ID") { Caption = 'Dimension Set ID'; }

                // --- System fields for incremental loads ---
                field(systemId; Rec.SystemId) { Caption = 'SystemId'; }
                field(systemCreatedAt; Rec.SystemCreatedAt) { Caption = 'SystemCreatedAt'; }
                field(systemCreatedBy; Rec.SystemCreatedBy) { Caption = 'SystemCreatedBy'; }
                field(systemModifiedAt; Rec.SystemModifiedAt) { Caption = 'SystemModifiedAt'; }
                field(systemModifiedBy; Rec.SystemModifiedBy) { Caption = 'SystemModifiedBy'; }
            }
        }
    }

    // Pure read-only exposure; no triggers/vars needed.
}
