page 50226 "PerfionItemsOData"
{
    Caption = 'Perfion Items OData';
    AdditionalSearchTerms = 'SCANPAN, OData, Perfion, dw';
    UsageCategory = Administration;

    PageType = List;
    SourceTable = Item;
    SourceTableView = sorting("No.") order(ascending) where(
        "Gen. Prod. Posting Group" = filter('INTERN|EKSTERN|BRUND'),
        "ABCD Category" = filter(<> 'E' & <> 'D'),
        "Product Usage" = filter(<> 'PRODUCTION' & <> 'MARKETING'),
        "Prod. Group Code" = filter(<> 'RÅVARE')
    );
    ODataKeyFields = "No.";

    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    DeleteAllowed = false;

    Permissions =
        tabledata Item = R,
        tabledata "Item Reference" = R,
        tabledata "Item Translation" = R,
        tabledata "Item Unit of Measure" = R;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(itemNo; Rec."No.") { Caption = 'itemNo'; }
                field(itemType; ItemTypeInt) { Caption = 'itemType'; }
                field(itemTypeTextDa; ItemTypeText) { Caption = 'itemTypeTextDa'; }
                field(baseUnitCode; Rec."Base Unit of Measure") { Caption = 'baseUnitCode'; }
                field(genProdPostingGroup; Rec."Gen. Prod. Posting Group") { Caption = 'genProdPostingGroup'; }
                field(usageGroup; Rec."Product Usage") { Caption = 'usageGroup'; }
                field(brandCode; Rec."Item Brand") { Caption = 'brandCode'; }
                field(productLineCode; Rec."Product Line Code") { Caption = 'productLineCode'; }
                field(productGroupCode; Rec."Prod. Group Code") { Caption = 'productGroupCode'; }
                field(abcdCategory; Rec."ABCD Category") { Caption = 'abcdCategory'; }
                field(itemCategoryCode; Rec."Item Category Code") { Caption = 'itemCategoryCode'; }
                field(tariffNo; Rec."Tariff No.") { Caption = 'tariffNo'; }
                field(countryRegionCode; Rec."Country/Region of Origin Code") { Caption = 'countryRegionCode'; }
                field(barcodeStk; BarcodeStk) { Caption = 'barcodeStk'; }
                field(barcodeInner; BarcodeInner) { Caption = 'barcodeInner'; }
                field(barcodeMaster; BarcodeMaster) { Caption = 'barcodeMaster'; }
                field(descriptionDa; DescDA) { Caption = 'descriptionDa'; }
                field(descriptionNo; DescNO) { Caption = 'descriptionNo'; }
                field(descriptionSv; DescSV) { Caption = 'descriptionSv'; }
                field(descriptionFi; DescFI) { Caption = 'descriptionFi'; }
                field(descriptionEn; DescEN) { Caption = 'descriptionEn'; }
                field(descriptionDe; DescDE) { Caption = 'descriptionDe'; }
                field(descriptionFr; DescFR) { Caption = 'descriptionFr'; }
                field(descriptionNl; DescNL) { Caption = 'descriptionNl'; }
                field(descriptionIt; DescIT) { Caption = 'descriptionIt'; }
                field(netWeight; Rec."Net Weight") { Caption = 'netWeight'; }
                field(grossWeight; Rec."Gross Weight") { Caption = 'grossWeight'; }
                field(stkQtyPerUnit; StkQtyPerUnit) { Caption = 'stkQtyPerUnit'; }
                field(stkHeight; StkHeight) { Caption = 'stkHeight'; }
                field(stkWidth; StkWidth) { Caption = 'stkWidth'; }
                field(stkLength; StkLength) { Caption = 'stkLength'; }
                field(stkVolume; StkVolume) { Caption = 'stkVolume'; }
                field(stkWeight; StkWeight) { Caption = 'stkWeight'; }
                field(innerQtyPerUnit; InnerQtyPerUnit) { Caption = 'innerQtyPerUnit'; }
                field(innerHeight; InnerHeight) { Caption = 'innerHeight'; }
                field(innerWidth; InnerWidth) { Caption = 'innerWidth'; }
                field(innerLength; InnerLength) { Caption = 'innerLength'; }
                field(innerVolume; InnerVolume) { Caption = 'innerVolume'; }
                field(innerWeight; InnerWeight) { Caption = 'innerWeight'; }
                field(masterQtyPerUnit; MasterQtyPerUnit) { Caption = 'masterQtyPerUnit'; }
                field(masterHeight; MasterHeight) { Caption = 'masterHeight'; }
                field(masterWidth; MasterWidth) { Caption = 'masterWidth'; }
                field(masterLength; MasterLength) { Caption = 'masterLength'; }
                field(masterVolume; MasterVolume) { Caption = 'masterVolume'; }
                field(masterWeight; MasterWeight) { Caption = 'masterWeight'; }
                field(coating; Rec.Coating) { Caption = 'coating'; }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        ItemTypeInt := Rec.Type.AsInteger();
        ItemTypeText := Format(Rec.Type);

        BarcodeStk := GetBarcodeForUoM(Rec."No.", 'STK');
        BarcodeInner := GetBarcodeForUoM(Rec."No.", 'INNER');
        BarcodeMaster := GetBarcodeForUoM(Rec."No.", 'MASTER');

        DescDA := GetItemTranslationText(Rec."No.", 'DAN');
        DescNO := GetItemTranslationText(Rec."No.", 'NOR');
        DescSV := GetItemTranslationText(Rec."No.", 'SVE');
        DescFI := GetItemTranslationText(Rec."No.", 'FIN');
        DescEN := GetItemTranslationText(Rec."No.", 'ENU');
        DescDE := GetItemTranslationText(Rec."No.", 'DEU');
        DescFR := GetItemTranslationText(Rec."No.", 'FRA');
        DescNL := GetItemTranslationText(Rec."No.", 'NLD');
        DescIT := GetItemTranslationText(Rec."No.", 'ITA');

        if DescDA = '' then
            DescDA := CopyStr(Rec.Description, 1, 250);

        GetUoMValues(Rec."No.", 'STK', StkQtyPerUnit, StkHeight, StkWidth, StkLength, StkVolume, StkWeight);
        GetUoMValues(Rec."No.", 'INNER', InnerQtyPerUnit, InnerHeight, InnerWidth, InnerLength, InnerVolume, InnerWeight);
        GetUoMValues(Rec."No.", 'MASTER', MasterQtyPerUnit, MasterHeight, MasterWidth, MasterLength, MasterVolume, MasterWeight);
    end;

    var
        ItemTypeInt: Integer;
        ItemTypeText: Text[50];
        BarcodeStk: Code[50];
        BarcodeInner: Code[50];
        BarcodeMaster: Code[50];
        DescDA: Text[250];
        DescNO: Text[250];
        DescSV: Text[250];
        DescFI: Text[250];
        DescEN: Text[250];
        DescDE: Text[250];
        DescFR: Text[250];
        DescNL: Text[250];
        DescIT: Text[250];
        StkQtyPerUnit: Decimal;
        StkHeight: Decimal;
        StkWidth: Decimal;
        StkLength: Decimal;
        StkVolume: Decimal;
        StkWeight: Decimal;
        InnerQtyPerUnit: Decimal;
        InnerHeight: Decimal;
        InnerWidth: Decimal;
        InnerLength: Decimal;
        InnerVolume: Decimal;
        InnerWeight: Decimal;
        MasterQtyPerUnit: Decimal;
        MasterHeight: Decimal;
        MasterWidth: Decimal;
        MasterLength: Decimal;
        MasterVolume: Decimal;
        MasterWeight: Decimal;

    local procedure GetBarcodeForUoM(ItemNo: Code[20]; UoMCode: Code[10]): Code[50]
    var
        ItemRef: Record "Item Reference";
    begin
        ItemRef.SetRange("Item No.", ItemNo);
        ItemRef.SetRange("Reference Type", ItemRef."Reference Type"::"Bar Code");
        ItemRef.SetRange("Unit of Measure", UoMCode);

        if ItemRef.FindFirst() then
            exit(ItemRef."Reference No.");

        exit('');
    end;

    local procedure GetItemTranslationText(ItemNo: Code[20]; LanguageCode: Code[10]): Text[250]
    var
        ItemTrans: Record "Item Translation";
        Txt: Text;
    begin
        ItemTrans.SetRange("Item No.", ItemNo);
        ItemTrans.SetRange("Language Code", LanguageCode);

        if ItemTrans.FindFirst() then begin
            Txt := ItemTrans.Description + ItemTrans."Description 2";
            exit(CopyStr(Txt, 1, 250));
        end;

        exit('');
    end;

    local procedure GetUoMValues(
        ItemNo: Code[20];
        UoMCode: Code[10];
        var QtyPer: Decimal;
        var Height: Decimal;
        var Width: Decimal;
        var Length: Decimal;
        var Cubage: Decimal;
        var Weight: Decimal
    )
    var
        IUOM: Record "Item Unit of Measure";
    begin
        Clear(QtyPer);
        Clear(Height);
        Clear(Width);
        Clear(Length);
        Clear(Cubage);
        Clear(Weight);

        IUOM.SetRange("Item No.", ItemNo);
        IUOM.SetRange(Code, UoMCode);

        if IUOM.FindFirst() then begin
            QtyPer := IUOM."Qty. per Unit of Measure";
            Height := IUOM.Height;
            Width := IUOM.Width;
            Length := IUOM.Length;
            Cubage := IUOM.Cubage;
            Weight := IUOM.Weight;
        end;
    end;
}
