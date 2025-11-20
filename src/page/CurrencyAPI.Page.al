page 50205 "CurrencyAPI"
{
    /// <summary>
    /// Date        Name                    Version   Description
    /// 2025.10.23  Business Central AL     001.0     API page for Currency (table 4) – all logic contained in page
    /// </summary>

    Caption = 'CurrencyAPI';
    AdditionalSearchTerms = 'SCANPAN, API, datawarehouse, dw';
    UsageCategory = Administration;

    PageType = API;
    APIPublisher = 'scanpan';
    APIGroup = 'datawarehouse';
    APIVersion = 'beta', 'v1.0';

    EntitySetName = 'currencies';
    EntityName = 'currency';

    DelayedInsert = true;
    Editable = false;

    SourceTable = 4; // Currency
    SourceTableView = sorting(Code) order(ascending);
    ODataKeyFields = Code;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                Caption = 'Group';

                // Nøgle & basis
                field(code; Rec.Code) { Caption = 'Code'; }
                field(description; Rec.Description) { Caption = 'Description'; }
                field(isoCode; Rec."ISO Code") { Caption = 'ISO Code'; }

                // Afrundingsopsætning
                field(amountRoundingPrecision; Rec."Amount Rounding Precision")
                {
                    Caption = 'Amount Rounding Precision';
                }
                field(unitAmountRoundingPrecision; Rec."Unit-Amount Rounding Precision")
                {
                    Caption = 'Unit-Amount Rounding Precision';
                }
                field(invoiceRoundingPrecision; Rec."Invoice Rounding Precision")
                {
                    Caption = 'Invoice Rounding Precision';
                }
                field(invoiceRoundingType; Rec."Invoice Rounding Type")
                {
                    Caption = 'Invoice Rounding Type'; // Enum "Rounding Type"
                }
                field(invoiceRoundingTypeInt; invoiceRoundingTypeInt)
                {
                    Caption = 'Invoice Rounding Type INT'; // Enum -> INT spejl til DW
                }

                // Systemfelter
                field(systemId; Rec.SystemId) { Caption = 'SystemId'; }
                field(systemCreatedAt; Rec.SystemCreatedAt) { Caption = 'SystemCreatedAt'; }
                field(systemCreatedBy; Rec.SystemCreatedBy) { Caption = 'SystemCreatedBy'; }
                field(systemModifiedAt; Rec.SystemModifiedAt) { Caption = 'SystemModifiedAt'; }
                field(systemModifiedBy; Rec.SystemModifiedBy) { Caption = 'SystemModifiedBy'; }
            }
        }
    }

    // Alt kode/variabler holdes her i pagen – ingen eksterne afhængigheder.
    var
        invoiceRoundingTypeInt: Integer;

    trigger OnAfterGetRecord()
    begin
        // Enum -> integer spejl for stabil DW mapping
        invoiceRoundingTypeInt := Rec."Invoice Rounding Type"; //.AsInteger();
    end;
}
