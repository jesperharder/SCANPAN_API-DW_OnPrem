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
        Price_DE: Text[30];
        RecommendedPrice_DE: Text[30];
        CampaignPrice_DE: Text[30];
        Price_DAN: Text[30];
        RecommendedPrice_DAN: Text[30];
        CampaignPrice_DAN: Text[30];
        Price_NLD: Text[30];
        RecommendedPrice_NLD: Text[30];
        CampaignPrice_NLD: Text[30];
        Price_NOR: Text[30];
        RecommendedPrice_NOR: Text[30];
        CampaignPrice_NOR: Text[30];

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
    var
        PriceValue: Decimal;
        RecommendedPriceValue: Decimal;
        CampaignPriceValue: Decimal;
    begin
        SetPriceSet(ItemNo, 'WEB-DE', 'EUR', 'STK', '', PriceValue, RecommendedPriceValue, CampaignPriceValue);
        SetPriceOutput(PriceValue, RecommendedPriceValue, CampaignPriceValue, Price_DE, RecommendedPrice_DE, CampaignPrice_DE);

        SetPriceSet(ItemNo, 'WEB-DK', 'LCY', 'STK', '', PriceValue, RecommendedPriceValue, CampaignPriceValue);
        SetPriceOutput(PriceValue, RecommendedPriceValue, CampaignPriceValue, Price_DAN, RecommendedPrice_DAN, CampaignPrice_DAN);

        SetPriceSet(ItemNo, 'WEB-NL', 'EUR', 'STK', '', PriceValue, RecommendedPriceValue, CampaignPriceValue);
        SetPriceOutput(PriceValue, RecommendedPriceValue, CampaignPriceValue, Price_NLD, RecommendedPrice_NLD, CampaignPrice_NLD);

        SetPriceSet(ItemNo, 'WEB-NO', 'LCY', 'STK', GetNorwayCompanyName(), PriceValue, RecommendedPriceValue, CampaignPriceValue);
        SetPriceOutput(PriceValue, RecommendedPriceValue, CampaignPriceValue, Price_NOR, RecommendedPrice_NOR, CampaignPrice_NOR);
    end;

    local procedure SetPriceOutput(PriceValue: Decimal; RecommendedPriceValue: Decimal; CampaignPriceValue: Decimal; var PriceText: Text[30]; var RecommendedPriceText: Text[30]; var CampaignPriceText: Text[30])
    begin
        PriceText := FormatPriceValue(PriceValue);
        RecommendedPriceText := FormatPriceValue(RecommendedPriceValue);
        CampaignPriceText := FormatPriceValue(CampaignPriceValue);
    end;

    local procedure FormatPriceValue(PriceValue: Decimal): Text[30]
    begin
        if PriceValue = 0 then
            exit('');

        exit(CopyStr(Format(PriceValue, 0, 9), 1, 30));
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
