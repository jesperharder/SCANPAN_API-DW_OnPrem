page 50228 "PerfionPricesOData"
{
    Caption = 'Perfion Prices OData';
    AdditionalSearchTerms = 'SCANPAN, OData, Perfion, price, pricelist';
    UsageCategory = Administration;

    PageType = List;
    SourceTable = Item;
    SourceTableTemporary = true;
    ODataKeyFields = "No.";

    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    DeleteAllowed = false;

    Permissions =
        tabledata "Price List Line" = R,
        tabledata Campaign = R;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(systemId; Rec.SystemId) { Caption = 'systemId'; }
                field(itemNo; Rec."No.") { Caption = 'itemNo'; }

                field(priceAmazonDeEurStk; PriceAmazonDeEurStk) { Caption = 'priceAmazonDeEurStk'; }
                field(recommendedPriceAmazonDeEurStk; RecommendedPriceAmazonDeEurStk) { Caption = 'recommendedPriceAmazonDeEurStk'; }
                field(campaignPriceAmazonDeEurStk; CampaignPriceAmazonDeEurStk) { Caption = 'campaignPriceAmazonDeEurStk'; }
                field(priceAmazonEsEurStk; PriceAmazonEsEurStk) { Caption = 'priceAmazonEsEurStk'; }
                field(recommendedPriceAmazonEsEurStk; RecommendedPriceAmazonEsEurStk) { Caption = 'recommendedPriceAmazonEsEurStk'; }
                field(campaignPriceAmazonEsEurStk; CampaignPriceAmazonEsEurStk) { Caption = 'campaignPriceAmazonEsEurStk'; }
                field(priceAuUsdBase; PriceAuUsdBase) { Caption = 'priceAuUsdBase'; }
                field(recommendedPriceAuUsdBase; RecommendedPriceAuUsdBase) { Caption = 'recommendedPriceAuUsdBase'; }
                field(campaignPriceAuUsdBase; CampaignPriceAuUsdBase) { Caption = 'campaignPriceAuUsdBase'; }
                field(priceAuUsdCdu; PriceAuUsdCdu) { Caption = 'priceAuUsdCdu'; }
                field(recommendedPriceAuUsdCdu; RecommendedPriceAuUsdCdu) { Caption = 'recommendedPriceAuUsdCdu'; }
                field(campaignPriceAuUsdCdu; CampaignPriceAuUsdCdu) { Caption = 'campaignPriceAuUsdCdu'; }
                field(priceAuUsdStk; PriceAuUsdStk) { Caption = 'priceAuUsdStk'; }
                field(recommendedPriceAuUsdStk; RecommendedPriceAuUsdStk) { Caption = 'recommendedPriceAuUsdStk'; }
                field(campaignPriceAuUsdStk; CampaignPriceAuUsdStk) { Caption = 'campaignPriceAuUsdStk'; }
                field(priceAusLcyStk; PriceAusLcyStk) { Caption = 'priceAusLcyStk'; }
                field(recommendedPriceAusLcyStk; RecommendedPriceAusLcyStk) { Caption = 'recommendedPriceAusLcyStk'; }
                field(campaignPriceAusLcyStk; CampaignPriceAusLcyStk) { Caption = 'campaignPriceAusLcyStk'; }
                field(priceDkLcyStk; PriceDkLcyStk) { Caption = 'priceDkLcyStk'; }
                field(recommendedPriceDkLcyStk; RecommendedPriceDkLcyStk) { Caption = 'recommendedPriceDkLcyStk'; }
                field(campaignPriceDkLcyStk; CampaignPriceDkLcyStk) { Caption = 'campaignPriceDkLcyStk'; }
                field(priceExpEurBase; PriceExpEurBase) { Caption = 'priceExpEurBase'; }
                field(recommendedPriceExpEurBase; RecommendedPriceExpEurBase) { Caption = 'recommendedPriceExpEurBase'; }
                field(campaignPriceExpEurBase; CampaignPriceExpEurBase) { Caption = 'campaignPriceExpEurBase'; }
                field(priceExpEurStk; PriceExpEurStk) { Caption = 'priceExpEurStk'; }
                field(recommendedPriceExpEurStk; RecommendedPriceExpEurStk) { Caption = 'recommendedPriceExpEurStk'; }
                field(campaignPriceExpEurStk; CampaignPriceExpEurStk) { Caption = 'campaignPriceExpEurStk'; }
                field(priceFobUsdStk; PriceFobUsdStk) { Caption = 'priceFobUsdStk'; }
                field(recommendedPriceFobUsdStk; RecommendedPriceFobUsdStk) { Caption = 'recommendedPriceFobUsdStk'; }
                field(campaignPriceFobUsdStk; CampaignPriceFobUsdStk) { Caption = 'campaignPriceFobUsdStk'; }
                field(priceIncLcyStk; PriceIncLcyStk) { Caption = 'priceIncLcyStk'; }
                field(recommendedPriceIncLcyStk; RecommendedPriceIncLcyStk) { Caption = 'recommendedPriceIncLcyStk'; }
                field(campaignPriceIncLcyStk; CampaignPriceIncLcyStk) { Caption = 'campaignPriceIncLcyStk'; }
                field(priceRrpEurBase; PriceRrpEurBase) { Caption = 'priceRrpEurBase'; }
                field(recommendedPriceRrpEurBase; RecommendedPriceRrpEurBase) { Caption = 'recommendedPriceRrpEurBase'; }
                field(campaignPriceRrpEurBase; CampaignPriceRrpEurBase) { Caption = 'campaignPriceRrpEurBase'; }
                field(priceRrpEurStk; PriceRrpEurStk) { Caption = 'priceRrpEurStk'; }
                field(recommendedPriceRrpEurStk; RecommendedPriceRrpEurStk) { Caption = 'recommendedPriceRrpEurStk'; }
                field(campaignPriceRrpEurStk; CampaignPriceRrpEurStk) { Caption = 'campaignPriceRrpEurStk'; }
                field(priceSaUsdStk; PriceSaUsdStk) { Caption = 'priceSaUsdStk'; }
                field(recommendedPriceSaUsdStk; RecommendedPriceSaUsdStk) { Caption = 'recommendedPriceSaUsdStk'; }
                field(campaignPriceSaUsdStk; CampaignPriceSaUsdStk) { Caption = 'campaignPriceSaUsdStk'; }
                field(priceSapEurStk; PriceSapEurStk) { Caption = 'priceSapEurStk'; }
                field(recommendedPriceSapEurStk; RecommendedPriceSapEurStk) { Caption = 'recommendedPriceSapEurStk'; }
                field(campaignPriceSapEurStk; CampaignPriceSapEurStk) { Caption = 'campaignPriceSapEurStk'; }
                field(priceVgrowUsdStk; PriceVgrowUsdStk) { Caption = 'priceVgrowUsdStk'; }
                field(recommendedPriceVgrowUsdStk; RecommendedPriceVgrowUsdStk) { Caption = 'recommendedPriceVgrowUsdStk'; }
                field(campaignPriceVgrowUsdStk; CampaignPriceVgrowUsdStk) { Caption = 'campaignPriceVgrowUsdStk'; }
                field(priceWebDeEurStk; PriceWebDeEurStk) { Caption = 'priceWebDeEurStk'; }
                field(recommendedPriceWebDeEurStk; RecommendedPriceWebDeEurStk) { Caption = 'recommendedPriceWebDeEurStk'; }
                field(campaignPriceWebDeEurStk; CampaignPriceWebDeEurStk) { Caption = 'campaignPriceWebDeEurStk'; }
                field(priceWebDkLcyStk; PriceWebDkLcyStk) { Caption = 'priceWebDkLcyStk'; }
                field(recommendedPriceWebDkLcyStk; RecommendedPriceWebDkLcyStk) { Caption = 'recommendedPriceWebDkLcyStk'; }
                field(campaignPriceWebDkLcyStk; CampaignPriceWebDkLcyStk) { Caption = 'campaignPriceWebDkLcyStk'; }
                field(priceWebNlEurStk; PriceWebNlEurStk) { Caption = 'priceWebNlEurStk'; }
                field(recommendedPriceWebNlEurStk; RecommendedPriceWebNlEurStk) { Caption = 'recommendedPriceWebNlEurStk'; }
                field(campaignPriceWebNlEurStk; CampaignPriceWebNlEurStk) { Caption = 'campaignPriceWebNlEurStk'; }
            }
        }
    }

    trigger OnOpenPage()
    begin
        BuildItemRowsForToday();
        Rec.Reset();
    end;

    trigger OnAfterGetRecord()
    begin
        SetPriceFieldsForItem(Rec."No.");
    end;

    var
        PriceAmazonDeEurStk: Decimal;
        RecommendedPriceAmazonDeEurStk: Decimal;
        CampaignPriceAmazonDeEurStk: Decimal;
        PriceAmazonEsEurStk: Decimal;
        RecommendedPriceAmazonEsEurStk: Decimal;
        CampaignPriceAmazonEsEurStk: Decimal;
        PriceAuUsdBase: Decimal;
        RecommendedPriceAuUsdBase: Decimal;
        CampaignPriceAuUsdBase: Decimal;
        PriceAuUsdCdu: Decimal;
        RecommendedPriceAuUsdCdu: Decimal;
        CampaignPriceAuUsdCdu: Decimal;
        PriceAuUsdStk: Decimal;
        RecommendedPriceAuUsdStk: Decimal;
        CampaignPriceAuUsdStk: Decimal;
        PriceAusLcyStk: Decimal;
        RecommendedPriceAusLcyStk: Decimal;
        CampaignPriceAusLcyStk: Decimal;
        PriceDkLcyStk: Decimal;
        RecommendedPriceDkLcyStk: Decimal;
        CampaignPriceDkLcyStk: Decimal;
        PriceExpEurBase: Decimal;
        RecommendedPriceExpEurBase: Decimal;
        CampaignPriceExpEurBase: Decimal;
        PriceExpEurStk: Decimal;
        RecommendedPriceExpEurStk: Decimal;
        CampaignPriceExpEurStk: Decimal;
        PriceFobUsdStk: Decimal;
        RecommendedPriceFobUsdStk: Decimal;
        CampaignPriceFobUsdStk: Decimal;
        PriceIncLcyStk: Decimal;
        RecommendedPriceIncLcyStk: Decimal;
        CampaignPriceIncLcyStk: Decimal;
        PriceRrpEurBase: Decimal;
        RecommendedPriceRrpEurBase: Decimal;
        CampaignPriceRrpEurBase: Decimal;
        PriceRrpEurStk: Decimal;
        RecommendedPriceRrpEurStk: Decimal;
        CampaignPriceRrpEurStk: Decimal;
        PriceSaUsdStk: Decimal;
        RecommendedPriceSaUsdStk: Decimal;
        CampaignPriceSaUsdStk: Decimal;
        PriceSapEurStk: Decimal;
        RecommendedPriceSapEurStk: Decimal;
        CampaignPriceSapEurStk: Decimal;
        PriceVgrowUsdStk: Decimal;
        RecommendedPriceVgrowUsdStk: Decimal;
        CampaignPriceVgrowUsdStk: Decimal;
        PriceWebDeEurStk: Decimal;
        RecommendedPriceWebDeEurStk: Decimal;
        CampaignPriceWebDeEurStk: Decimal;
        PriceWebDkLcyStk: Decimal;
        RecommendedPriceWebDkLcyStk: Decimal;
        CampaignPriceWebDkLcyStk: Decimal;
        PriceWebNlEurStk: Decimal;
        RecommendedPriceWebNlEurStk: Decimal;
        CampaignPriceWebNlEurStk: Decimal;

    local procedure BuildItemRowsForToday()
    var
        ItemRec: Record Item;
        PriceLine: Record "Price List Line";
        FilterItemNo: Text;
    begin
        FilterItemNo := Rec.GetFilter("No.");

        Rec.Reset();
        Rec.DeleteAll();

        if FilterItemNo <> '' then begin
            ItemRec.Reset();
            ItemRec.SetFilter("No.", FilterItemNo);

            if ItemRec.FindSet() then
                repeat
                    if HasAnyExposedPriceLine(ItemRec."No.") then
                        InsertItemRow(ItemRec."No.");
                until ItemRec.Next() = 0;
            exit;
        end;

        PriceLine.Reset();
        PriceLine.SetRange("Asset Type", PriceLine."Asset Type"::Item);
        PriceLine.SetRange("Source Type", PriceLine."Source Type"::"Customer Price Group");
        PriceLine.SetRange(Status, PriceLine.Status::Active);
        PriceLine.SetFilter("Starting Date", '..%1', Today);
        PriceLine.SetFilter("Ending Date", '%1..|%2', Today, 0D);

        if PriceLine.FindSet() then
            repeat
                if IsExposedPriceCombination(PriceLine."Source No.", GetExportCurrencyCode(PriceLine."Currency Code"), PriceLine."Unit of Measure Code") then begin
                    InsertItemRow(PriceLine."Asset No.");
                end;
            until PriceLine.Next() = 0;
    end;

    local procedure HasAnyExposedPriceLine(ItemNo: Code[20]): Boolean
    var
        PriceLine: Record "Price List Line";
    begin
        PriceLine.Reset();
        PriceLine.SetRange("Asset Type", PriceLine."Asset Type"::Item);
        PriceLine.SetRange("Asset No.", ItemNo);
        PriceLine.SetRange(Status, PriceLine.Status::Active);
        PriceLine.SetFilter("Starting Date", '..%1', Today);
        PriceLine.SetFilter("Ending Date", '%1..|%2', Today, 0D);

        if PriceLine.FindSet() then
            repeat
                if IsExposedPriceCombination(PriceLine."Source No.", GetExportCurrencyCode(PriceLine."Currency Code"), PriceLine."Unit of Measure Code") then
                    exit(true);
            until PriceLine.Next() = 0;

        exit(false);
    end;

    local procedure InsertItemRow(ItemNo: Code[20])
    begin
        if Rec.Get(ItemNo) then
            exit;

        Rec.Init();
        Rec.SystemId := CreateGuid();
        Rec."No." := ItemNo;
        Rec.Insert();
    end;

    local procedure SetPriceFieldsForItem(ItemNo: Code[20])
    begin
        SetPriceSet(ItemNo, 'AMAZON.DE', 'EUR', 'STK', PriceAmazonDeEurStk, RecommendedPriceAmazonDeEurStk, CampaignPriceAmazonDeEurStk);
        SetPriceSet(ItemNo, 'AMAZON.ES', 'EUR', 'STK', PriceAmazonEsEurStk, RecommendedPriceAmazonEsEurStk, CampaignPriceAmazonEsEurStk);
        SetPriceSet(ItemNo, 'AU', 'USD', 'BASE', PriceAuUsdBase, RecommendedPriceAuUsdBase, CampaignPriceAuUsdBase);
        SetPriceSet(ItemNo, 'AU', 'USD', 'CDU', PriceAuUsdCdu, RecommendedPriceAuUsdCdu, CampaignPriceAuUsdCdu);
        SetPriceSet(ItemNo, 'AU', 'USD', 'STK', PriceAuUsdStk, RecommendedPriceAuUsdStk, CampaignPriceAuUsdStk);
        SetPriceSet(ItemNo, 'AUS', 'LCY', 'STK', PriceAusLcyStk, RecommendedPriceAusLcyStk, CampaignPriceAusLcyStk);
        SetPriceSet(ItemNo, 'DK', 'LCY', 'STK', PriceDkLcyStk, RecommendedPriceDkLcyStk, CampaignPriceDkLcyStk);
        SetPriceSet(ItemNo, 'EXP', 'EUR', 'BASE', PriceExpEurBase, RecommendedPriceExpEurBase, CampaignPriceExpEurBase);
        SetPriceSet(ItemNo, 'EXP', 'EUR', 'STK', PriceExpEurStk, RecommendedPriceExpEurStk, CampaignPriceExpEurStk);
        SetPriceSet(ItemNo, 'FOB', 'USD', 'STK', PriceFobUsdStk, RecommendedPriceFobUsdStk, CampaignPriceFobUsdStk);
        SetPriceSet(ItemNo, 'INC', 'LCY', 'STK', PriceIncLcyStk, RecommendedPriceIncLcyStk, CampaignPriceIncLcyStk);
        SetPriceSet(ItemNo, 'RRP', 'EUR', 'BASE', PriceRrpEurBase, RecommendedPriceRrpEurBase, CampaignPriceRrpEurBase);
        SetPriceSet(ItemNo, 'RRP', 'EUR', 'STK', PriceRrpEurStk, RecommendedPriceRrpEurStk, CampaignPriceRrpEurStk);
        SetPriceSet(ItemNo, 'SA', 'USD', 'STK', PriceSaUsdStk, RecommendedPriceSaUsdStk, CampaignPriceSaUsdStk);
        SetPriceSet(ItemNo, 'SAP', 'EUR', 'STK', PriceSapEurStk, RecommendedPriceSapEurStk, CampaignPriceSapEurStk);
        SetPriceSet(ItemNo, 'VGROW', 'USD', 'STK', PriceVgrowUsdStk, RecommendedPriceVgrowUsdStk, CampaignPriceVgrowUsdStk);
        SetPriceSet(ItemNo, 'WEB-DE', 'EUR', 'STK', PriceWebDeEurStk, RecommendedPriceWebDeEurStk, CampaignPriceWebDeEurStk);
        SetPriceSet(ItemNo, 'WEB-DK', 'LCY', 'STK', PriceWebDkLcyStk, RecommendedPriceWebDkLcyStk, CampaignPriceWebDkLcyStk);
        SetPriceSet(ItemNo, 'WEB-NL', 'EUR', 'STK', PriceWebNlEurStk, RecommendedPriceWebNlEurStk, CampaignPriceWebNlEurStk);
    end;

    local procedure SetPriceSet(ItemNo: Code[20]; SourceNo: Code[20]; CurrencyCode: Code[10]; UoMCode: Code[10]; var PriceValue: Decimal; var RecommendedPriceValue: Decimal; var CampaignPriceValue: Decimal)
    begin
        PriceValue := 0;
        RecommendedPriceValue := 0;
        CampaignPriceValue := 0;

        TryGetPreferredCustomerPrice(ItemNo, SourceNo, CurrencyCode, UoMCode, Today, PriceValue, RecommendedPriceValue);
        TryGetBestCampaignPrice(ItemNo, SourceNo, CurrencyCode, UoMCode, Today, CampaignPriceValue);
    end;

    local procedure TryGetPreferredCustomerPrice(ItemNo: Code[20]; SourceNo: Code[20]; CurrencyCode: Code[10]; UoMCode: Code[10]; AsOfDate: Date; var PriceValue: Decimal; var RecommendedPriceValue: Decimal): Boolean
    var
        PriceLine: Record "Price List Line";
        BestPriceLine: Record "Price List Line";
        Found: Boolean;
    begin
        ApplyCommonPriceFilters(PriceLine, ItemNo, CurrencyCode, UoMCode, AsOfDate);
        PriceLine.SetRange("Source Type", PriceLine."Source Type"::"Customer Price Group");
        PriceLine.SetRange("Source No.", SourceNo);

        if PriceLine.FindSet() then
            repeat
                if (not Found) or IsBetterPriceLine(PriceLine, BestPriceLine) then begin
                    BestPriceLine := PriceLine;
                    Found := true;
                end;
            until PriceLine.Next() = 0;

        if Found then begin
            PriceValue := BestPriceLine."Unit Price";
            RecommendedPriceValue := BestPriceLine."Unit List Price";
        end;

        exit(Found);
    end;

    local procedure TryGetBestCampaignPrice(ItemNo: Code[20]; SourceNo: Code[20]; CurrencyCode: Code[10]; UoMCode: Code[10]; AsOfDate: Date; var CampaignPriceValue: Decimal): Boolean
    var
        CampaignPriceLine: Record "Price List Line";
        BestCampaignPriceLine: Record "Price List Line";
        Campaign: Record Campaign;
        Found: Boolean;
    begin
        ApplyCommonPriceFilters(CampaignPriceLine, ItemNo, CurrencyCode, UoMCode, AsOfDate);
        CampaignPriceLine.SetRange("Source Type", CampaignPriceLine."Source Type"::Campaign);

        if CampaignPriceLine.FindSet() then
            repeat
                if Campaign.Get(CampaignPriceLine."Source No.") then
                    if Campaign."Customer Price Group NOTO" = SourceNo then
                        if (not Found) or IsBetterPriceLine(CampaignPriceLine, BestCampaignPriceLine) then begin
                            BestCampaignPriceLine := CampaignPriceLine;
                            Found := true;
                        end;
            until CampaignPriceLine.Next() = 0;

        if Found then
            CampaignPriceValue := BestCampaignPriceLine."Unit Price";

        exit(Found);
    end;

    local procedure ApplyCommonPriceFilters(var PriceLine: Record "Price List Line"; ItemNo: Code[20]; CurrencyCode: Code[10]; UoMCode: Code[10]; AsOfDate: Date)
    begin
        PriceLine.Reset();
        PriceLine.SetRange("Asset Type", PriceLine."Asset Type"::Item);
        PriceLine.SetRange("Asset No.", ItemNo);
        PriceLine.SetRange(Status, PriceLine.Status::Active);
        PriceLine.SetFilter("Starting Date", '..%1', AsOfDate);
        PriceLine.SetFilter("Ending Date", '%1..|%2', AsOfDate, 0D);
        SetCurrencyCodeFilter(PriceLine, CurrencyCode);
        PriceLine.SetRange("Unit of Measure Code", UoMCode);
    end;

    local procedure SetCurrencyCodeFilter(var PriceLine: Record "Price List Line"; CurrencyCode: Code[10])
    begin
        if CurrencyCode = 'LCY' then begin
            PriceLine.SetRange("Currency Code", '');
            exit;
        end;

        PriceLine.SetRange("Currency Code", CurrencyCode);
    end;

    local procedure IsBetterPriceLine(Candidate: Record "Price List Line"; Existing: Record "Price List Line"): Boolean
    begin
        if Candidate."Minimum Quantity" <> Existing."Minimum Quantity" then
            exit(Candidate."Minimum Quantity" < Existing."Minimum Quantity");

        if Candidate."Starting Date" <> Existing."Starting Date" then
            exit(Candidate."Starting Date" > Existing."Starting Date");

        if Existing."Unit Price" = 0 then
            exit(Candidate."Unit Price" <> 0);
        if Candidate."Unit Price" = 0 then
            exit(false);

        exit(Candidate."Unit Price" < Existing."Unit Price");
    end;

    local procedure IsExposedPriceCombination(SourceNo: Code[20]; CurrencyCode: Code[10]; UoMCode: Code[10]): Boolean
    begin
        case SourceNo of
            'AMAZON.DE':
                exit((CurrencyCode = 'EUR') and (UoMCode = 'STK'));
            'AMAZON.ES':
                exit((CurrencyCode = 'EUR') and (UoMCode = 'STK'));
            'AU':
                exit((CurrencyCode = 'USD') and (UoMCode in ['BASE', 'CDU', 'STK']));
            'AUS':
                exit((CurrencyCode = 'LCY') and (UoMCode = 'STK'));
            'DK':
                exit((CurrencyCode = 'LCY') and (UoMCode = 'STK'));
            'EXP':
                exit((CurrencyCode = 'EUR') and (UoMCode in ['BASE', 'STK']));
            'FOB':
                exit((CurrencyCode = 'USD') and (UoMCode = 'STK'));
            'INC':
                exit((CurrencyCode = 'LCY') and (UoMCode = 'STK'));
            'RRP':
                exit((CurrencyCode = 'EUR') and (UoMCode in ['BASE', 'STK']));
            'SA':
                exit((CurrencyCode = 'USD') and (UoMCode = 'STK'));
            'SAP':
                exit((CurrencyCode = 'EUR') and (UoMCode = 'STK'));
            'VGROW':
                exit((CurrencyCode = 'USD') and (UoMCode = 'STK'));
            'WEB-DE':
                exit((CurrencyCode = 'EUR') and (UoMCode = 'STK'));
            'WEB-DK':
                exit((CurrencyCode = 'LCY') and (UoMCode = 'STK'));
            'WEB-NL':
                exit((CurrencyCode = 'EUR') and (UoMCode = 'STK'));
        end;

        exit(false);
    end;

    local procedure GetExportCurrencyCode(CurrencyCode: Code[10]): Code[10]
    begin
        if CurrencyCode = '' then
            exit('LCY');

        exit(CurrencyCode);
    end;
}
