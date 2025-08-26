page 50098 GlAccountAPI
{
    /// <summary>
    /// Date        Name                Version.SubVersion      Description
    /// 2025.08.20  Jesper Harder       001.3                   API page for G/L Accounts
    /// </summary>

    AdditionalSearchTerms = 'SCANPAN, API, datawarehouse, dw';
    APIGroup = 'datawarehouse';
    APIPublisher = 'scanpan';
    APIVersion = 'beta', 'v1.0';

    Caption = 'GlAccountAPI';
    DeleteAllowed = false;

    Editable = false;
    EntityName = 'glAccount';
    EntitySetName = 'glAccounts';
    InsertAllowed = false;
    ModifyAllowed = false;
    ODataKeyFields = "No.";

    PageType = API;

    SourceTable = "G/L Account";
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(no; Rec."No.")
                {
                    Caption = 'No.';
                }
                field(name; Rec.Name)
                {
                    Caption = 'Name';
                }
                field(blocked; Rec.Blocked)
                {
                    Caption = 'Blocked';
                }
                field(directPosting; Rec."Direct Posting")
                {
                    Caption = 'Direct Posting';
                }
                field(accountType; Rec."Account Type")
                {
                    Caption = 'Account Type';
                }
                field(accountTypeInt; AccountTypeInt)
                {
                    Caption = 'Account Type Int';
                }
                field(incomeBalance; Rec."Income/Balance")
                {
                    Caption = 'Income/Balance';
                }
                field(incomeBalanceInt; IncomeBalanceInt)
                {
                    Caption = 'Income/Balance Int';
                }
                field(accountCategory; Rec."Account Category")
                {
                    Caption = 'Account Category';
                }
                field(totaling; Rec.Totaling)
                {
                    Caption = 'Totaling';
                }
                field(indentation; Rec.Indentation)
                {
                    Caption = 'Indentation';
                }
                field(lastModifiedDateTime; Rec."Last Modified Date Time")
                {
                    Caption = 'Last Modified Date Time';
                }
                field(systemCreatedAt; Rec.SystemCreatedAt)
                {
                    Caption = 'SystemCreatedAt';
                }
                field(systemCreatedBy; Rec.SystemCreatedBy)
                {
                    Caption = 'SystemCreatedBy';
                }
                field(systemId; Rec.SystemId)
                {
                    Caption = 'SystemId';
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

    var
        AccountTypeInt: Integer;
        IncomeBalanceInt: Integer;

    trigger OnAfterGetRecord()
    begin
        // Map enum/option til integer for nem downstream-brug
        AccountTypeInt := Rec."Account Type";
        IncomeBalanceInt := Rec."Income/Balance";
    end;
}
