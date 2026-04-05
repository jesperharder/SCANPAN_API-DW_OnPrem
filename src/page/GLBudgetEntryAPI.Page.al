page 50223 "GLBudgetEntryAPI"
{
    /// <summary>
    /// 2025.10.27  SPN DW Suite  v001.0
    /// API page for table 96 "G/L Budget Entry" (DW export).
    /// 2026.04.05  Codex         v001.1
    /// Added Entry No. for shared BudgetEntry V1 key model.
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
    SourceTableView = sorting("Entry No.") order(ascending);
    ODataKeyFields = "Entry No.";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                Caption = 'G/L Budget Entry';

                // Key
                field(entryNo; Rec."Entry No.") { Caption = 'Entry No.'; }

                // Composite business fields
                field(budgetName; Rec."Budget Name") { Caption = 'Budget Name'; }
                field(glAccountNo; Rec."G/L Account No.") { Caption = 'G/L Account No.'; }
                field(date; Rec."Date") { Caption = 'Date'; }
                field(businessUnitCode; Rec."Business Unit Code") { Caption = 'Business Unit Code'; }
                field(globalDimension1Code; Rec."Global Dimension 1 Code") { Caption = 'Global Dimension 1 Code'; }
                field(globalDimension2Code; Rec."Global Dimension 2 Code") { Caption = 'Global Dimension 2 Code'; }

                // Budget dimensions
                field(budgetDimension1Code; Rec."Budget Dimension 1 Code") { Caption = 'Budget Dimension 1 Code'; }
                field(budgetDimension2Code; Rec."Budget Dimension 2 Code") { Caption = 'Budget Dimension 2 Code'; }
                field(budgetDimension3Code; Rec."Budget Dimension 3 Code") { Caption = 'Budget Dimension 3 Code'; }
                field(budgetDimension4Code; Rec."Budget Dimension 4 Code") { Caption = 'Budget Dimension 4 Code'; }

                // Measure / attributes
                field(amount; Rec.Amount) { Caption = 'Amount'; }
                field(description; Rec.Description) { Caption = 'Description'; }
                field(userId; Rec."User ID") { Caption = 'User ID'; }
                field(lastDateModified; Rec."Last Date Modified") { Caption = 'Last Date Modified'; }
                field(dimensionSetId; Rec."Dimension Set ID") { Caption = 'Dimension Set ID'; }

                // System fields for incremental loads
                field(systemId; Rec.SystemId) { Caption = 'SystemId'; }
                field(systemCreatedAt; Rec.SystemCreatedAt) { Caption = 'SystemCreatedAt'; }
                field(systemCreatedBy; Rec.SystemCreatedBy) { Caption = 'SystemCreatedBy'; }
                field(systemModifiedAt; Rec.SystemModifiedAt) { Caption = 'SystemModifiedAt'; }
                field(systemModifiedBy; Rec.SystemModifiedBy) { Caption = 'SystemModifiedBy'; }
            }
        }
    }
}
