page 50212 "CurrencyExchangeRateAPI"
{
    /// <summary>
    /// Date        Name                    Version   Description
    /// 2025.10.24  Business Central AL     001.0     API page for Currency Exchange Rate (table 330)
    /// </summary>

    Caption = 'CurrencyExchangeRateAPI';
    AdditionalSearchTerms = 'SCANPAN, API, datawarehouse, dw';
    UsageCategory = Administration;

    PageType = API;
    APIPublisher = 'scanpan';
    APIGroup = 'datawarehouse';
    APIVersion = 'beta', 'v1.0';

    EntitySetName = 'currencyExchangeRates';
    EntityName = 'currencyExchangeRate';

    DelayedInsert = true;
    Editable = false;

    SourceTable = "Currency Exchange Rate";
    SourceTableView = sorting("Currency Code", "Starting Date") order(ascending);
    ODataKeyFields = "Currency Code", "Starting Date";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                Caption = 'Group';

                // --- Keys ---
                field(currencyCode; Rec."Currency Code")        { Caption = 'Currency Code'; }
                field(startingDate; Rec."Starting Date")        { Caption = 'Starting Date'; }

                // --- Exchange rates ---
                field(exchangeRateAmount; Rec."Exchange Rate Amount")                 { Caption = 'Exchange Rate Amount'; }
                field(adjustmentExchRateAmount; Rec."Adjustment Exch. Rate Amount")  { Caption = 'Adjustment Exch. Rate Amount'; }
                field(relationalCurrencyCode; Rec."Relational Currency Code")        { Caption = 'Relational Currency Code'; }
                field(relationalExchRateAmount; Rec."Relational Exch. Rate Amount")  { Caption = 'Relational Exch. Rate Amount'; }
                field(relationalAdjmtExchRateAmt; Rec."Relational Adjmt Exch Rate Amt") { Caption = 'Relational Adjmt Exch Rate Amt'; }

                // --- Fix type (Option) + INT mirror ---
                field(fixExchangeRateAmount; Rec."Fix Exchange Rate Amount")
                {
                    Caption = 'Fix Exchange Rate Amount';
                }
                field(fixExchangeRateAmountInt; fixExchangeRateAmountInt)
                {
                    Caption = 'Fix Exchange Rate Amount INT';
                }

                // --- System fields ---
                field(systemId; Rec.SystemId)                       { Caption = 'SystemId'; }
                field(systemCreatedAt; Rec.SystemCreatedAt)         { Caption = 'SystemCreatedAt'; }
                field(systemCreatedBy; Rec.SystemCreatedBy)         { Caption = 'SystemCreatedBy'; }
                field(systemModifiedAt; Rec.SystemModifiedAt)       { Caption = 'SystemModifiedAt'; }
                field(systemModifiedBy; Rec.SystemModifiedBy)       { Caption = 'SystemModifiedBy'; }
            }
        }
    }

    // --- Lokale variabler og triggers ---
    var
        fixExchangeRateAmountInt: Integer;

    trigger OnAfterGetRecord()
    begin
        fixExchangeRateAmountInt := Rec."Fix Exchange Rate Amount";
    end;
}
