page 50228 "PerfionPricesOData"
{ 
    Caption = 'Perfion Prices OData';
    AdditionalSearchTerms = 'SCANPAN, OData, Perfion, dw, price, pricelist';
    UsageCategory = Administration;

    PageType = List;
    SourceTable = "Price List Line";
    SourceTableTemporary = true;
    ODataKeyFields = SystemId;

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
                field(priceListCode; Rec."Price List Code") { Caption = 'priceListCode'; }
                field(lineNo; Rec."Line No.") { Caption = 'lineNo'; }
                field(itemNo; Rec."Asset No.") { Caption = 'itemNo'; }
                field(salesCode; Rec."Source No.") { Caption = 'salesCode'; }
                field(currencyCode; Rec."Currency Code") { Caption = 'currencyCode'; }
                field(unitListPrice; Rec."Unit List Price") { Caption = 'unitListPrice'; }
                field(unitPrice; Rec."Unit Price") { Caption = 'unitPrice'; }
                field(startingDate; Rec."Starting Date") { Caption = 'startingDate'; }
                field(endingDate; Rec."Ending Date") { Caption = 'endingDate'; }
                field(unitOfMeasureCode; Rec."Unit of Measure Code") { Caption = 'unitOfMeasureCode'; }
                field(minimumQuantity; Rec."Minimum Quantity") { Caption = 'minimumQuantity'; }
                field(status; StatusInt) { Caption = 'status'; }
                field(statusText; StatusText) { Caption = 'statusText'; }
                field(campaignPrice; CampaignPrice) { Caption = 'campaignPrice'; }
                field(campaignId; CampaignId) { Caption = 'campaignId'; }
            }
        }
    }

    trigger OnInit()
    begin
        IncludeCampaignPrices := true;
    end;

    trigger OnOpenPage()
    begin
        Rec.Reset();
        Rec.DeleteAll();
        BuildLatestValidPricesForToday();
        Rec.Reset();
    end;

    trigger OnAfterGetRecord()
    begin
        StatusInt := Rec.Status.AsInteger();
        StatusText := Format(Rec.Status);

        if IncludeCampaignPrices then begin
            CampaignPrice := 0;
            CampaignId := '';
            TryGetBestCampaignPrice(
                Rec."Asset No.",
                Rec."Source No.",
                Rec."Currency Code",
                Rec."Unit of Measure Code",
                Today,
                CampaignPrice,
                CampaignId);
        end else begin
            CampaignPrice := 0;
            CampaignId := '';
        end;
    end;

    var
        StatusInt: Integer;
        StatusText: Text[30];
        CampaignPrice: Decimal;
        CampaignId: Code[20];
        IncludeCampaignPrices: Boolean;

    local procedure BuildLatestValidPricesForToday()
    var
        SP: Record "Price List Line";
        Existing: Record "Price List Line" temporary;
        TodayDate: Date;
        FilterItemNo: Text;
        FilterSalesCode: Text;
        FilterCurrency: Text;
        FilterUoM: Text;
        FilterPriceListCode: Text;
        FilterMinQty: Text;
        ReplaceExisting: Boolean;
    begin
        TodayDate := Today;

        FilterItemNo := Rec.GetFilter("Asset No.");
        FilterSalesCode := Rec.GetFilter("Source No.");
        FilterCurrency := Rec.GetFilter("Currency Code");
        FilterUoM := Rec.GetFilter("Unit of Measure Code");
        FilterPriceListCode := Rec.GetFilter("Price List Code");
        FilterMinQty := Rec.GetFilter("Minimum Quantity");

        SP.Reset();
        SP.SetRange("Asset Type", SP."Asset Type"::Item);
        SP.SetRange("Source Type", SP."Source Type"::"Customer Price Group");
        SP.SetRange(Status, SP.Status::Active);
        SP.SetFilter("Starting Date", '..%1', TodayDate);
        SP.SetFilter("Ending Date", '%1..|%2', TodayDate, 0D);

        if FilterItemNo <> '' then
            SP.SetFilter("Asset No.", FilterItemNo);
        if FilterSalesCode <> '' then
            SP.SetFilter("Source No.", FilterSalesCode);
        if FilterCurrency <> '' then
            SP.SetFilter("Currency Code", FilterCurrency);
        if FilterUoM <> '' then
            SP.SetFilter("Unit of Measure Code", FilterUoM);
        if FilterPriceListCode <> '' then
            SP.SetFilter("Price List Code", FilterPriceListCode);
        if FilterMinQty <> '' then
            SP.SetFilter("Minimum Quantity", FilterMinQty);

        if SP.FindSet() then begin
            repeat
                Existing.Reset();
                Existing.Copy(Rec, true);
                Existing.SetRange("Asset No.", SP."Asset No.");
                Existing.SetRange("Source No.", SP."Source No.");
                Existing.SetRange("Currency Code", SP."Currency Code");
                Existing.SetRange("Unit of Measure Code", SP."Unit of Measure Code");

                if not Existing.FindFirst() then begin
                    Rec := SP;
                    Rec.Insert();
                end else begin
                    ReplaceExisting := false;

                    if SP."Starting Date" > Existing."Starting Date" then
                        ReplaceExisting := true
                    else
                        if SP."Starting Date" = Existing."Starting Date" then begin
                            if (SP."Unit Price" <> 0) and (Existing."Unit Price" <> 0) then begin
                                if SP."Unit Price" < Existing."Unit Price" then
                                    ReplaceExisting := true;
                            end else
                                if (Existing."Unit Price" = 0) and (SP."Unit Price" <> 0) then
                                    ReplaceExisting := true;
                        end;

                    if ReplaceExisting then begin
                        Rec.Reset();
                        Rec.SetRange(SystemId, Existing.SystemId);
                        if Rec.FindFirst() then
                            Rec.Delete();

                        Rec := SP;
                        Rec.Insert();
                    end;
                end;
            until SP.Next() = 0;
        end;
    end;

    local procedure TryGetBestCampaignPrice(
        ItemNo: Code[20];
        SalesCode: Code[20];
        CurrencyCode: Code[10];
        UoMCode: Code[10];
        AsOfDate: Date;
        var BestPrice: Decimal;
        var BestCampaignId: Code[20]
    ): Boolean
    var
        CA: Record "Price List Line";
        Camp: Record Campaign;
        Found: Boolean;
        CandidateStart: Date;
        CurrentBestStart: Date;
        Ok: Boolean;
    begin
        BestPrice := 0;
        BestCampaignId := '';
        Found := false;

        CA.SetRange("Asset Type", CA."Asset Type"::Item);
        CA.SetRange("Asset No.", ItemNo);
        CA.SetRange("Source Type", CA."Source Type"::Campaign);
        CA.SetRange(Status, CA.Status::Active);
        CA.SetFilter("Starting Date", '..%1', AsOfDate);
        CA.SetFilter("Ending Date", '%1..|%2', AsOfDate, 0D);

        if CurrencyCode <> '' then
            CA.SetRange("Currency Code", CurrencyCode);
        if UoMCode <> '' then
            CA.SetRange("Unit of Measure Code", UoMCode);

        if CA.FindSet() then begin
            repeat
                Ok := false;

                if Camp.Get(CA."Source No.") then
                    if Camp."Customer Price Group NOTO" = SalesCode then
                        Ok := true;

                if Ok then begin
                    if not Found then begin
                        BestPrice := CA."Unit Price";
                        BestCampaignId := CA."Source No.";
                        Found := true;
                    end else begin
                        if CA."Unit Price" < BestPrice then begin
                            BestPrice := CA."Unit Price";
                            BestCampaignId := CA."Source No.";
                        end else
                            if CA."Unit Price" = BestPrice then begin
                                CandidateStart := CA."Starting Date";
                                CurrentBestStart := GetCampaignStartDate(BestCampaignId, ItemNo, SalesCode, CurrencyCode, UoMCode, AsOfDate);

                                if CandidateStart > CurrentBestStart then
                                    BestCampaignId := CA."Source No.";
                            end;
                    end;
                end;
            until CA.Next() = 0;
        end;

        exit(Found);
    end;

    local procedure GetCampaignStartDate(
        CampaignNo: Code[20];
        ItemNo: Code[20];
        SalesCode: Code[20];
        CurrencyCode: Code[10];
        UoMCode: Code[10];
        AsOfDate: Date
    ): Date
    var
        CA: Record "Price List Line";
        Camp: Record Campaign;
        Result: Date;
    begin
        Result := 0D;

        CA.SetRange("Asset Type", CA."Asset Type"::Item);
        CA.SetRange("Asset No.", ItemNo);
        CA.SetRange("Source Type", CA."Source Type"::Campaign);
        CA.SetRange("Source No.", CampaignNo);
        CA.SetRange(Status, CA.Status::Active);
        CA.SetFilter("Starting Date", '..%1', AsOfDate);
        CA.SetFilter("Ending Date", '%1..|%2', AsOfDate, 0D);

        if CurrencyCode <> '' then
            CA.SetRange("Currency Code", CurrencyCode);
        if UoMCode <> '' then
            CA.SetRange("Unit of Measure Code", UoMCode);

        if CA.FindFirst() then begin
            if Camp.Get(CA."Source No.") then
                if Camp."Customer Price Group NOTO" = SalesCode then
                    Result := CA."Starting Date";
        end;

        exit(Result);
    end;
}
