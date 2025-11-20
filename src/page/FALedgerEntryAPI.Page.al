page 50216 "FALedgerEntryAPI"
{
    /// <summary>
    /// Date        Name             Version   Description
    /// 2025.10.24  SPN AL Assistant 001.0     API page for FA Ledger Entry (table 5601)
    /// </summary>

    Caption = 'FALedgerEntryAPI';
    AdditionalSearchTerms = 'SCANPAN, API, datawarehouse, dw, fixed assets';
    UsageCategory = Administration;

    PageType = API;
    APIPublisher = 'scanpan';
    APIGroup = 'datawarehouse';
    APIVersion = 'beta', 'v1.0';

    EntitySetName = 'faLedgerEntries';
    EntityName = 'faLedgerEntry';

    DelayedInsert = true;
    Editable = false;

    SourceTable = "FA Ledger Entry";
    SourceTableView = sorting("Entry No.") order(ascending);
    ODataKeyFields = "Entry No.";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                Caption = 'Group';

                field(entryNo; Rec."Entry No.")                                      { Caption = 'Entry No.'; }
                field(glEntryNo; Rec."G/L Entry No.")                                 { Caption = 'G/L Entry No.'; }
                field(faNo; Rec."FA No.")                                             { Caption = 'FA No.'; }
                field(faPostingDate; Rec."FA Posting Date")                            { Caption = 'FA Posting Date'; }
                field(postingDate; Rec."Posting Date")                                { Caption = 'Posting Date'; }
                field(documentType; Rec."Document Type")                               { Caption = 'Document Type'; }
                field(documentNo; Rec."Document No.")                                  { Caption = 'Document No.'; }
                field(description; Rec.Description)                                    { Caption = 'Description'; }

                field(faPostingType; Rec."FA Posting Type")                             { Caption = 'FA Posting Type'; }
                field(faPostingTypeInt; faPostingTypeInt)                               { Caption = 'FA Posting Type INT'; }

                field(amount; Rec.Amount)                                              { Caption = 'Amount'; }
                field(debitAmount; Rec."Debit Amount")                                 { Caption = 'Debit Amount'; }
                field(creditAmount; Rec."Credit Amount")                               { Caption = 'Credit Amount'; }

                field(globalDimension1Code; Rec."Global Dimension 1 Code")             { Caption = 'Global Dimension 1 Code'; }
                field(globalDimension2Code; Rec."Global Dimension 2 Code")             { Caption = 'Global Dimension 2 Code'; }

                // system fields
                field(systemId; Rec.SystemId)                                         { Caption = 'SystemId'; }
                field(systemCreatedAt; Rec.SystemCreatedAt)                           { Caption = 'SystemCreatedAt'; }
                field(systemCreatedBy; Rec.SystemCreatedBy)                           { Caption = 'SystemCreatedBy'; }
                field(systemModifiedAt; Rec.SystemModifiedAt)                         { Caption = 'SystemModifiedAt'; }
                field(systemModifiedBy; Rec.SystemModifiedBy)                         { Caption = 'SystemModifiedBy'; }
            }
        }
    }

    var
        faPostingTypeInt: Integer;

    trigger OnAfterGetRecord()
    begin
        case Rec."FA Posting Type" of
            Rec."FA Posting Type"::"Acquisition Cost":
                faPostingTypeInt := 0;
            Rec."FA Posting Type"::Depreciation:
                faPostingTypeInt := 1;
            Rec."FA Posting Type"::"Write-Down":
                faPostingTypeInt := 2;
            Rec."FA Posting Type"::Appreciation:
                faPostingTypeInt := 3;
            Rec."FA Posting Type"::"Custom 1":
                faPostingTypeInt := 4;
            Rec."FA Posting Type"::"Custom 2":
                faPostingTypeInt := 5;
            Rec."FA Posting Type"::"Proceeds on Disposal":
                faPostingTypeInt := 6;
            Rec."FA Posting Type"::"Salvage Value":
                faPostingTypeInt := 7;
            Rec."FA Posting Type"::"Gain/Loss":
                faPostingTypeInt := 8;
            Rec."FA Posting Type"::"Book Value on Disposal":
                faPostingTypeInt := 9;
            else
                faPostingTypeInt := -1;
        end;
    end;
}
