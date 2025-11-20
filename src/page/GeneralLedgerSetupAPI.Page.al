page 50219 "GeneralLedgerSetupAPI"
{
    /// <summary>
    /// 2025.10.24 – Jesper Harder / SCANPAN
    /// Data Warehouse API for General Ledger Setup (table 98)
    /// </summary>

    Caption = 'GeneralLedgerSetupAPI';
    AdditionalSearchTerms = 'SCANPAN, datawarehouse, GL setup, accounting setup';
    UsageCategory = Administration;

    PageType = API;
    APIPublisher = 'scanpan';
    APIGroup = 'datawarehouse';
    APIVersion = 'beta', 'v1.0';

    EntitySetName = 'generalLedgerSetups';
    EntityName = 'generalLedgerSetup';

    DelayedInsert = true;
    Editable = false;

    SourceTable = "General Ledger Setup";
    SourceTableView = sorting("Primary Key") order(ascending);
    ODataKeyFields = "Primary Key";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                Caption = 'General Ledger Setup';

                // --- Identification ---
                field(primaryKey; Rec."Primary Key") { Caption = 'Primary Key'; }

                // --- Posting period control ---
                field(allowPostingFrom; Rec."Allow Posting From") { Caption = 'Allow Posting From'; }
                field(allowPostingTo; Rec."Allow Posting To") { Caption = 'Allow Posting To'; }

                // --- Currency & rounding ---
                field(lcyCode; Rec."LCY Code") { Caption = 'LCY Code'; }
                field(additionalReportingCurrency; Rec."Additional Reporting Currency") { Caption = 'Additional Reporting Currency'; }
                field(amountRoundingPrecision; Rec."Amount Rounding Precision") { Caption = 'Amount Rounding Precision'; }
                field(unitAmountRoundingPrecision; Rec."Unit-Amount Rounding Precision") { Caption = 'Unit-Amount Rounding Precision'; }
                field(invRoundingPrecisionLCY; Rec."Inv. Rounding Precision (LCY)") { Caption = 'Inv. Rounding Precision (LCY)'; }

                field(invRoundingTypeLCY; Rec."Inv. Rounding Type (LCY)") { Caption = 'Inv. Rounding Type (LCY)'; }
                field(invRoundingTypeLCYInt; invRoundingTypeLCYInt) { Caption = 'Inv. Rounding Type (LCY) INT'; }

                field(vatRoundingType; Rec."VAT Rounding Type") { Caption = 'VAT Rounding Type'; }
                field(vatRoundingTypeInt; vatRoundingTypeInt) { Caption = 'VAT Rounding Type INT'; }

                // --- Dimension setup ---
                field(globalDimension1Code; Rec."Global Dimension 1 Code") { Caption = 'Global Dimension 1 Code'; }
                field(globalDimension2Code; Rec."Global Dimension 2 Code") { Caption = 'Global Dimension 2 Code'; }
                field(shortcutDim1Code; Rec."Shortcut Dimension 1 Code") { Caption = 'Shortcut Dimension 1 Code'; }
                field(shortcutDim2Code; Rec."Shortcut Dimension 2 Code") { Caption = 'Shortcut Dimension 2 Code'; }
                field(shortcutDim3Code; Rec."Shortcut Dimension 3 Code") { Caption = 'Shortcut Dimension 3 Code'; }
                field(shortcutDim4Code; Rec."Shortcut Dimension 4 Code") { Caption = 'Shortcut Dimension 4 Code'; }
                field(shortcutDim5Code; Rec."Shortcut Dimension 5 Code") { Caption = 'Shortcut Dimension 5 Code'; }
                field(shortcutDim6Code; Rec."Shortcut Dimension 6 Code") { Caption = 'Shortcut Dimension 6 Code'; }
                field(shortcutDim7Code; Rec."Shortcut Dimension 7 Code") { Caption = 'Shortcut Dimension 7 Code'; }
                field(shortcutDim8Code; Rec."Shortcut Dimension 8 Code") { Caption = 'Shortcut Dimension 8 Code'; }

                // --- VAT & payment tolerance ---
                field(unrealizedVAT; Rec."Unrealized VAT") { Caption = 'Unrealized VAT'; }
                field(prepaymentUnrealizedVAT; Rec."Prepayment Unrealized VAT") { Caption = 'Prepayment Unrealized VAT'; }
                field(vatTolerancePct; Rec."VAT Tolerance %") { Caption = 'VAT Tolerance %'; }
                field(maxVATDiffAllowed; Rec."Max. VAT Difference Allowed") { Caption = 'Max. VAT Difference Allowed'; }
                field(paymentTolerancePct; Rec."Payment Tolerance %") { Caption = 'Payment Tolerance %'; }
                field(maxPaymentToleranceAmt; Rec."Max. Payment Tolerance Amount") { Caption = 'Max. Payment Tolerance Amount'; }

                // --- General behaviour flags ---
                field(registerTime; Rec."Register Time") { Caption = 'Register Time'; }
                field(postWithJobQueue; Rec."Post with Job Queue") { Caption = 'Post with Job Queue'; }
                field(postAndPrintWithJobQueue; Rec."Post & Print with Job Queue") { Caption = 'Post & Print with Job Queue'; }
                field(notifyOnSuccess; Rec."Notify On Success") { Caption = 'Notify On Success'; }
                field(summarizeGLEntries; Rec."Summarize G/L Entries") { Caption = 'Summarize G/L Entries'; }

                // --- Address / local formatting ---
                field(localAddressFormat; Rec."Local Address Format") { Caption = 'Local Address Format'; }
                field(localAddressFormatInt; localAddressFormatInt) { Caption = 'Local Address Format INT'; }
                field(localContAddrFormat; Rec."Local Cont. Addr. Format") { Caption = 'Local Cont. Addr. Format'; }
                field(localContAddrFormatInt; localContAddrFormatInt) { Caption = 'Local Cont. Addr. Format INT'; }

                // --- Miscellaneous ---
                field(showAmounts; Rec."Show Amounts") { Caption = 'Show Amounts'; }
                field(showAmountsInt; showAmountsInt) { Caption = 'Show Amounts INT'; }
                field(markCrMemosAsCorrections; Rec."Mark Cr. Memos as Corrections") { Caption = 'Mark Cr. Memos as Corrections'; }
                field(sepaNonEuroExport; Rec."SEPA Non-Euro Export") { Caption = 'SEPA Non-Euro Export'; }
                field(sepaExportWithoutBankAccData; Rec."SEPA Export w/o Bank Acc. Data") { Caption = 'SEPA Export w/o Bank Acc. Data'; }

                // --- System fields ---
                field(systemId; Rec.SystemId) { Caption = 'SystemId'; }
                field(systemCreatedAt; Rec.SystemCreatedAt) { Caption = 'SystemCreatedAt'; }
                field(systemCreatedBy; Rec.SystemCreatedBy) { Caption = 'SystemCreatedBy'; }
                field(systemModifiedAt; Rec.SystemModifiedAt) { Caption = 'SystemModifiedAt'; }
                field(systemModifiedBy; Rec.SystemModifiedBy) { Caption = 'SystemModifiedBy'; }
            }
        }
    }

    var
        invRoundingTypeLCYInt: Integer;
        vatRoundingTypeInt: Integer;
        localAddressFormatInt: Integer;
        localContAddrFormatInt: Integer;
        showAmountsInt: Integer;

    trigger OnAfterGetRecord()
    begin
        // Enum/Option -> Integer mirrors for DW mapping

        // Inv. Rounding Type (LCY)
        case Rec."Inv. Rounding Type (LCY)" of
            Rec."Inv. Rounding Type (LCY)"::Nearest: invRoundingTypeLCYInt := 0;
            Rec."Inv. Rounding Type (LCY)"::Up: invRoundingTypeLCYInt := 1;
            Rec."Inv. Rounding Type (LCY)"::Down: invRoundingTypeLCYInt := 2;
            else invRoundingTypeLCYInt := -1;
        end;

        // VAT Rounding Type
        case Rec."VAT Rounding Type" of
            Rec."VAT Rounding Type"::Nearest: vatRoundingTypeInt := 0;
            Rec."VAT Rounding Type"::Up: vatRoundingTypeInt := 1;
            Rec."VAT Rounding Type"::Down: vatRoundingTypeInt := 2;
            else vatRoundingTypeInt := -1;
        end;

        // Local Address Format
        case Rec."Local Address Format" of
            Rec."Local Address Format"::"Post Code+City": localAddressFormatInt := 0;
            Rec."Local Address Format"::"City+Post Code": localAddressFormatInt := 1;
            Rec."Local Address Format"::"City+County+Post Code": localAddressFormatInt := 2;
            Rec."Local Address Format"::"Blank Line+Post Code+City": localAddressFormatInt := 3;
            else localAddressFormatInt := -1;
        end;

        // Local Contact Address Format
        case Rec."Local Cont. Addr. Format" of
            Rec."Local Cont. Addr. Format"::First: localContAddrFormatInt := 0;
            Rec."Local Cont. Addr. Format"::"After Company Name": localContAddrFormatInt := 1;
            Rec."Local Cont. Addr. Format"::Last: localContAddrFormatInt := 2;
            else localContAddrFormatInt := -1;
        end;

        // Show Amounts
        case Rec."Show Amounts" of
            Rec."Show Amounts"::"Amount Only": showAmountsInt := 0;
            Rec."Show Amounts"::"Debit/Credit Only": showAmountsInt := 1;
            Rec."Show Amounts"::"All Amounts": showAmountsInt := 2;
            else showAmountsInt := -1;
        end;
    end;
}
