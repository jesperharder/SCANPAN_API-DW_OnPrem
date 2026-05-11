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

                field(priceAmazonEurStkDe; PriceAmazonEurStkDe) { Caption = 'priceAmazonEurStkDe'; }
                field(recommendedPriceAmazonEurStkDe; RecommendedPriceAmazonEurStkDe) { Caption = 'recommendedPriceAmazonEurStkDe'; }
                field(campaignPriceAmazonEurStkDe; CampaignPriceAmazonEurStkDe) { Caption = 'campaignPriceAmazonEurStkDe'; }
                field(priceAmazonEurStkEs; PriceAmazonEurStkEs) { Caption = 'priceAmazonEurStkEs'; }
                field(recommendedPriceAmazonEurStkEs; RecommendedPriceAmazonEurStkEs) { Caption = 'recommendedPriceAmazonEurStkEs'; }
                field(campaignPriceAmazonEurStkEs; CampaignPriceAmazonEurStkEs) { Caption = 'campaignPriceAmazonEurStkEs'; }
                field(priceAuUsdBaseAu; PriceAuUsdBaseAu) { Caption = 'priceAuUsdBaseAu'; }
                field(recommendedPriceAuUsdBaseAu; RecommendedPriceAuUsdBaseAu) { Caption = 'recommendedPriceAuUsdBaseAu'; }
                field(campaignPriceAuUsdBaseAu; CampaignPriceAuUsdBaseAu) { Caption = 'campaignPriceAuUsdBaseAu'; }
                field(priceAuUsdCduAu; PriceAuUsdCduAu) { Caption = 'priceAuUsdCduAu'; }
                field(recommendedPriceAuUsdCduAu; RecommendedPriceAuUsdCduAu) { Caption = 'recommendedPriceAuUsdCduAu'; }
                field(campaignPriceAuUsdCduAu; CampaignPriceAuUsdCduAu) { Caption = 'campaignPriceAuUsdCduAu'; }
                field(priceAuUsdStkAu; PriceAuUsdStkAu) { Caption = 'priceAuUsdStkAu'; }
                field(recommendedPriceAuUsdStkAu; RecommendedPriceAuUsdStkAu) { Caption = 'recommendedPriceAuUsdStkAu'; }
                field(campaignPriceAuUsdStkAu; CampaignPriceAuUsdStkAu) { Caption = 'campaignPriceAuUsdStkAu'; }
                field(priceAusLcyStkAus; PriceAusLcyStkAus) { Caption = 'priceAusLcyStkAus'; }
                field(recommendedPriceAusLcyStkAus; RecommendedPriceAusLcyStkAus) { Caption = 'recommendedPriceAusLcyStkAus'; }
                field(campaignPriceAusLcyStkAus; CampaignPriceAusLcyStkAus) { Caption = 'campaignPriceAusLcyStkAus'; }
                field(priceDkLcyStkDk; PriceDkLcyStkDk) { Caption = 'priceDkLcyStkDk'; }
                field(recommendedPriceDkLcyStkDk; RecommendedPriceDkLcyStkDk) { Caption = 'recommendedPriceDkLcyStkDk'; }
                field(campaignPriceDkLcyStkDk; CampaignPriceDkLcyStkDk) { Caption = 'campaignPriceDkLcyStkDk'; }
                field(priceExpEurBaseExp; PriceExpEurBaseExp) { Caption = 'priceExpEurBaseExp'; }
                field(recommendedPriceExpEurBaseExp; RecommendedPriceExpEurBaseExp) { Caption = 'recommendedPriceExpEurBaseExp'; }
                field(campaignPriceExpEurBaseExp; CampaignPriceExpEurBaseExp) { Caption = 'campaignPriceExpEurBaseExp'; }
                field(priceExpEurStkExp; PriceExpEurStkExp) { Caption = 'priceExpEurStkExp'; }
                field(recommendedPriceExpEurStkExp; RecommendedPriceExpEurStkExp) { Caption = 'recommendedPriceExpEurStkExp'; }
                field(campaignPriceExpEurStkExp; CampaignPriceExpEurStkExp) { Caption = 'campaignPriceExpEurStkExp'; }
                field(priceFobUsdStkFob; PriceFobUsdStkFob) { Caption = 'priceFobUsdStkFob'; }
                field(recommendedPriceFobUsdStkFob; RecommendedPriceFobUsdStkFob) { Caption = 'recommendedPriceFobUsdStkFob'; }
                field(campaignPriceFobUsdStkFob; CampaignPriceFobUsdStkFob) { Caption = 'campaignPriceFobUsdStkFob'; }
                field(priceIncLcyStkInc; PriceIncLcyStkInc) { Caption = 'priceIncLcyStkInc'; }
                field(recommendedPriceIncLcyStkInc; RecommendedPriceIncLcyStkInc) { Caption = 'recommendedPriceIncLcyStkInc'; }
                field(campaignPriceIncLcyStkInc; CampaignPriceIncLcyStkInc) { Caption = 'campaignPriceIncLcyStkInc'; }
                field(priceRrpEurBaseRrp; PriceRrpEurBaseRrp) { Caption = 'priceRrpEurBaseRrp'; }
                field(recommendedPriceRrpEurBaseRrp; RecommendedPriceRrpEurBaseRrp) { Caption = 'recommendedPriceRrpEurBaseRrp'; }
                field(campaignPriceRrpEurBaseRrp; CampaignPriceRrpEurBaseRrp) { Caption = 'campaignPriceRrpEurBaseRrp'; }
                field(priceRrpEurStkRrp; PriceRrpEurStkRrp) { Caption = 'priceRrpEurStkRrp'; }
                field(recommendedPriceRrpEurStkRrp; RecommendedPriceRrpEurStkRrp) { Caption = 'recommendedPriceRrpEurStkRrp'; }
                field(campaignPriceRrpEurStkRrp; CampaignPriceRrpEurStkRrp) { Caption = 'campaignPriceRrpEurStkRrp'; }
                field(priceSaUsdStkSa; PriceSaUsdStkSa) { Caption = 'priceSaUsdStkSa'; }
                field(recommendedPriceSaUsdStkSa; RecommendedPriceSaUsdStkSa) { Caption = 'recommendedPriceSaUsdStkSa'; }
                field(campaignPriceSaUsdStkSa; CampaignPriceSaUsdStkSa) { Caption = 'campaignPriceSaUsdStkSa'; }
                field(priceSapEurStkSap; PriceSapEurStkSap) { Caption = 'priceSapEurStkSap'; }
                field(recommendedPriceSapEurStkSap; RecommendedPriceSapEurStkSap) { Caption = 'recommendedPriceSapEurStkSap'; }
                field(campaignPriceSapEurStkSap; CampaignPriceSapEurStkSap) { Caption = 'campaignPriceSapEurStkSap'; }
                field(priceVgrowUsdStkVgrow; PriceVgrowUsdStkVgrow) { Caption = 'priceVgrowUsdStkVgrow'; }
                field(recommendedPriceVgrowUsdStkVgrow; RecommendedPriceVgrowUsdStkVgrow) { Caption = 'recommendedPriceVgrowUsdStkVgrow'; }
                field(campaignPriceVgrowUsdStkVgrow; CampaignPriceVgrowUsdStkVgrow) { Caption = 'campaignPriceVgrowUsdStkVgrow'; }
                field(price_DE; Price_DE) { Caption = 'price_DE'; }
                field(recommendedPrice_DE; RecommendedPrice_DE) { Caption = 'recommendedPrice_DE'; }
                field(campaignPrice_DE; CampaignPrice_DE) { Caption = 'campaignPrice_DE'; }
                field(price_DAN; Price_DAN) { Caption = 'price_DAN'; }
                field(recommendedPrice_DAN; RecommendedPrice_DAN) { Caption = 'recommendedPrice_DAN'; }
                field(campaignPrice_DAN; CampaignPrice_DAN) { Caption = 'campaignPrice_DAN'; }
                field(price_NLD; Price_NLD) { Caption = 'price_NLD'; }
                field(recommendedPrice_NLD; RecommendedPrice_NLD) { Caption = 'recommendedPrice_NLD'; }
                field(campaignPrice_NLD; CampaignPrice_NLD) { Caption = 'campaignPrice_NLD'; }
                field(price_NOR; Price_NOR) { Caption = 'price_NOR'; }
                field(recommendedPrice_NOR; RecommendedPrice_NOR) { Caption = 'recommendedPrice_NOR'; }
                field(campaignPrice_NOR; CampaignPrice_NOR) { Caption = 'campaignPrice_NOR'; }
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
        PriceAmazonEurStkDe: Decimal;
        RecommendedPriceAmazonEurStkDe: Decimal;
        CampaignPriceAmazonEurStkDe: Decimal;
        PriceAmazonEurStkEs: Decimal;
        RecommendedPriceAmazonEurStkEs: Decimal;
        CampaignPriceAmazonEurStkEs: Decimal;
        PriceAuUsdBaseAu: Decimal;
        RecommendedPriceAuUsdBaseAu: Decimal;
        CampaignPriceAuUsdBaseAu: Decimal;
        PriceAuUsdCduAu: Decimal;
        RecommendedPriceAuUsdCduAu: Decimal;
        CampaignPriceAuUsdCduAu: Decimal;
        PriceAuUsdStkAu: Decimal;
        RecommendedPriceAuUsdStkAu: Decimal;
        CampaignPriceAuUsdStkAu: Decimal;
        PriceAusLcyStkAus: Decimal;
        RecommendedPriceAusLcyStkAus: Decimal;
        CampaignPriceAusLcyStkAus: Decimal;
        PriceDkLcyStkDk: Decimal;
        RecommendedPriceDkLcyStkDk: Decimal;
        CampaignPriceDkLcyStkDk: Decimal;
        PriceExpEurBaseExp: Decimal;
        RecommendedPriceExpEurBaseExp: Decimal;
        CampaignPriceExpEurBaseExp: Decimal;
        PriceExpEurStkExp: Decimal;
        RecommendedPriceExpEurStkExp: Decimal;
        CampaignPriceExpEurStkExp: Decimal;
        PriceFobUsdStkFob: Decimal;
        RecommendedPriceFobUsdStkFob: Decimal;
        CampaignPriceFobUsdStkFob: Decimal;
        PriceIncLcyStkInc: Decimal;
        RecommendedPriceIncLcyStkInc: Decimal;
        CampaignPriceIncLcyStkInc: Decimal;
        PriceRrpEurBaseRrp: Decimal;
        RecommendedPriceRrpEurBaseRrp: Decimal;
        CampaignPriceRrpEurBaseRrp: Decimal;
        PriceRrpEurStkRrp: Decimal;
        RecommendedPriceRrpEurStkRrp: Decimal;
        CampaignPriceRrpEurStkRrp: Decimal;
        PriceSaUsdStkSa: Decimal;
        RecommendedPriceSaUsdStkSa: Decimal;
        CampaignPriceSaUsdStkSa: Decimal;
        PriceSapEurStkSap: Decimal;
        RecommendedPriceSapEurStkSap: Decimal;
        CampaignPriceSapEurStkSap: Decimal;
        PriceVgrowUsdStkVgrow: Decimal;
        RecommendedPriceVgrowUsdStkVgrow: Decimal;
        CampaignPriceVgrowUsdStkVgrow: Decimal;
        Price_DE: Decimal;
        RecommendedPrice_DE: Decimal;
        CampaignPrice_DE: Decimal;
        Price_DAN: Decimal;
        RecommendedPrice_DAN: Decimal;
        CampaignPrice_DAN: Decimal;
        Price_NLD: Decimal;
        RecommendedPrice_NLD: Decimal;
        CampaignPrice_NLD: Decimal;
        Price_NOR: Decimal;
        RecommendedPrice_NOR: Decimal;
        CampaignPrice_NOR: Decimal;

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

            AddNorwayCompanyItemRows(FilterItemNo);
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

        AddNorwayCompanyItemRows(FilterItemNo);
    end;

    local procedure AddNorwayCompanyItemRows(FilterItemNo: Text)
    var
        PriceLine: Record "Price List Line";
    begin
        ChangePriceListLineCompany(PriceLine, GetNorwayCompanyName());
        PriceLine.Reset();
        PriceLine.SetRange("Asset Type", PriceLine."Asset Type"::Item);
        PriceLine.SetRange("Source Type", PriceLine."Source Type"::"Customer Price Group");
        PriceLine.SetRange(Status, PriceLine.Status::Active);
        PriceLine.SetFilter("Starting Date", '..%1', Today);
        PriceLine.SetFilter("Ending Date", '%1..|%2', Today, 0D);

        if FilterItemNo <> '' then
            PriceLine.SetFilter("Asset No.", FilterItemNo);

        if PriceLine.FindSet() then
            repeat
                if IsNorwayCompanyPriceCombination(PriceLine."Source No.", GetExportCurrencyCode(PriceLine."Currency Code"), PriceLine."Unit of Measure Code") then
                    InsertItemRow(PriceLine."Asset No.");
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
        SetPriceSet(ItemNo, 'AMAZON.DE', 'EUR', 'STK', '', PriceAmazonEurStkDe, RecommendedPriceAmazonEurStkDe, CampaignPriceAmazonEurStkDe);
        SetPriceSet(ItemNo, 'AMAZON.ES', 'EUR', 'STK', '', PriceAmazonEurStkEs, RecommendedPriceAmazonEurStkEs, CampaignPriceAmazonEurStkEs);
        SetPriceSet(ItemNo, 'AU', 'USD', 'BASE', '', PriceAuUsdBaseAu, RecommendedPriceAuUsdBaseAu, CampaignPriceAuUsdBaseAu);
        SetPriceSet(ItemNo, 'AU', 'USD', 'CDU', '', PriceAuUsdCduAu, RecommendedPriceAuUsdCduAu, CampaignPriceAuUsdCduAu);
        SetPriceSet(ItemNo, 'AU', 'USD', 'STK', '', PriceAuUsdStkAu, RecommendedPriceAuUsdStkAu, CampaignPriceAuUsdStkAu);
        SetPriceSet(ItemNo, 'AUS', 'LCY', 'STK', '', PriceAusLcyStkAus, RecommendedPriceAusLcyStkAus, CampaignPriceAusLcyStkAus);
        SetPriceSet(ItemNo, 'DK', 'LCY', 'STK', '', PriceDkLcyStkDk, RecommendedPriceDkLcyStkDk, CampaignPriceDkLcyStkDk);
        SetPriceSet(ItemNo, 'EXP', 'EUR', 'BASE', '', PriceExpEurBaseExp, RecommendedPriceExpEurBaseExp, CampaignPriceExpEurBaseExp);
        SetPriceSet(ItemNo, 'EXP', 'EUR', 'STK', '', PriceExpEurStkExp, RecommendedPriceExpEurStkExp, CampaignPriceExpEurStkExp);
        SetPriceSet(ItemNo, 'FOB', 'USD', 'STK', '', PriceFobUsdStkFob, RecommendedPriceFobUsdStkFob, CampaignPriceFobUsdStkFob);
        SetPriceSet(ItemNo, 'INC', 'LCY', 'STK', '', PriceIncLcyStkInc, RecommendedPriceIncLcyStkInc, CampaignPriceIncLcyStkInc);
        SetPriceSet(ItemNo, 'RRP', 'EUR', 'BASE', '', PriceRrpEurBaseRrp, RecommendedPriceRrpEurBaseRrp, CampaignPriceRrpEurBaseRrp);
        SetPriceSet(ItemNo, 'RRP', 'EUR', 'STK', '', PriceRrpEurStkRrp, RecommendedPriceRrpEurStkRrp, CampaignPriceRrpEurStkRrp);
        SetPriceSet(ItemNo, 'SA', 'USD', 'STK', '', PriceSaUsdStkSa, RecommendedPriceSaUsdStkSa, CampaignPriceSaUsdStkSa);
        SetPriceSet(ItemNo, 'SAP', 'EUR', 'STK', '', PriceSapEurStkSap, RecommendedPriceSapEurStkSap, CampaignPriceSapEurStkSap);
        SetPriceSet(ItemNo, 'VGROW', 'USD', 'STK', '', PriceVgrowUsdStkVgrow, RecommendedPriceVgrowUsdStkVgrow, CampaignPriceVgrowUsdStkVgrow);
        SetPriceSet(ItemNo, 'WEB-DE', 'EUR', 'STK', '', Price_DE, RecommendedPrice_DE, CampaignPrice_DE);
        SetPriceSet(ItemNo, 'WEB-DK', 'LCY', 'STK', '', Price_DAN, RecommendedPrice_DAN, CampaignPrice_DAN);
        SetPriceSet(ItemNo, 'WEB-NL', 'EUR', 'STK', '', Price_NLD, RecommendedPrice_NLD, CampaignPrice_NLD);
        SetPriceSet(ItemNo, 'WEB-NO', 'LCY', 'STK', GetNorwayCompanyName(), Price_NOR, RecommendedPrice_NOR, CampaignPrice_NOR);
    end;

    local procedure SetPriceSet(ItemNo: Code[20]; SourceNo: Code[20]; CurrencyCode: Code[10]; UoMCode: Code[10]; CompanyName: Text[30]; var PriceValue: Decimal; var RecommendedPriceValue: Decimal; var CampaignPriceValue: Decimal)
    begin
        PriceValue := 0;
        RecommendedPriceValue := 0;
        CampaignPriceValue := 0;

        TryGetPreferredCustomerPrice(ItemNo, SourceNo, CurrencyCode, UoMCode, CompanyName, Today, PriceValue, RecommendedPriceValue);
        TryGetBestCampaignPrice(ItemNo, SourceNo, CurrencyCode, UoMCode, CompanyName, Today, CampaignPriceValue);
    end;

    local procedure TryGetPreferredCustomerPrice(ItemNo: Code[20]; SourceNo: Code[20]; CurrencyCode: Code[10]; UoMCode: Code[10]; CompanyName: Text[30]; AsOfDate: Date; var PriceValue: Decimal; var RecommendedPriceValue: Decimal): Boolean
    var
        PriceLine: Record "Price List Line";
        BestPriceLine: Record "Price List Line";
        Found: Boolean;
    begin
        ChangePriceListLineCompany(PriceLine, CompanyName);
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

    local procedure TryGetBestCampaignPrice(ItemNo: Code[20]; SourceNo: Code[20]; CurrencyCode: Code[10]; UoMCode: Code[10]; CompanyName: Text[30]; AsOfDate: Date; var CampaignPriceValue: Decimal): Boolean
    var
        CampaignPriceLine: Record "Price List Line";
        BestCampaignPriceLine: Record "Price List Line";
        Campaign: Record Campaign;
        Found: Boolean;
    begin
        ChangePriceListLineCompany(CampaignPriceLine, CompanyName);
        ChangeCampaignCompany(Campaign, CompanyName);
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
        if Existing."Unit Price" = 0 then
            exit(Candidate."Unit Price" <> 0);
        if Candidate."Unit Price" = 0 then
            exit(false);

        if Candidate."Minimum Quantity" <> Existing."Minimum Quantity" then
            exit(Candidate."Minimum Quantity" < Existing."Minimum Quantity");

        if Candidate."Starting Date" <> Existing."Starting Date" then
            exit(Candidate."Starting Date" > Existing."Starting Date");

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

    local procedure IsNorwayCompanyPriceCombination(SourceNo: Code[20]; CurrencyCode: Code[10]; UoMCode: Code[10]): Boolean
    begin
        case SourceNo of
            'WEB-NO':
                exit((CurrencyCode = 'LCY') and (UoMCode = 'STK'));
        end;

        exit(false);
    end;

    local procedure ChangePriceListLineCompany(var PriceLine: Record "Price List Line"; CompanyName: Text[30])
    begin
        if CompanyName = '' then
            exit;

        if not PriceLine.ChangeCompany(CompanyName) then
            Error('Could not change Price List Line company to %1.', CompanyName);
    end;

    local procedure ChangeCampaignCompany(var Campaign: Record Campaign; CompanyName: Text[30])
    begin
        if CompanyName = '' then
            exit;

        if not Campaign.ChangeCompany(CompanyName) then
            Error('Could not change Campaign company to %1.', CompanyName);
    end;

    local procedure GetExportCurrencyCode(CurrencyCode: Code[10]): Code[10]
    begin
        if CurrencyCode = '' then
            exit('LCY');

        exit(CurrencyCode);
    end;

    local procedure GetNorwayCompanyName(): Text[30]
    begin
        exit('SCANPAN Norge');
    end;
}
