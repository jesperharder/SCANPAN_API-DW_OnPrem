codeunit 50042 "Auning Stock Update"
{
    TableNo = "Job Queue Entry";

    trigger OnRun()
    begin
        UpdateAllItems("Parameter String");
    end;

    var
        AuningLocationCodeLbl: Label 'AUNING', Locked = true;
        DefaultGenProdPostingGroupFilterLbl: Label 'INTERN|EKSTERN|BRUND', Locked = true;
        GenProdPostingGroupFilterTokLbl: Label 'GenProdPostingGroupFilter', Locked = true;
        AvailableReductionPctTokLbl: Label 'AvailableReductionPct', Locked = true;
        InvalidDecimalParameterErr: Label 'Parameter %1 has invalid value %2.', Comment = '%1=parameter name, %2=value';
        ProgressDialog: Dialog;
        ProgressDialogLbl: Label 'Updating AUNING stock\\Total items: #1#########\\Processed:   #2#########\\Current item: #3############################', Locked = true;
        ProgressTotalItemCount: Integer;
        ProgressProcessedItemCount: Integer;
        ProgressCurrentItemNo: Code[20];

    procedure UpdateAllItems(ParameterString: Text)
    var
        Item: Record Item;
        Location: Record Location;
        GenProdPostingGroupFilter: Text;
        AvailableReductionPct: Decimal;
        UpdatedAt: DateTime;
        TotalItemCount: Integer;
        ProcessedItemCount: Integer;
    begin
        if not Location.Get(AuningLocationCodeLbl) then
            Error('Location %1 does not exist.', AuningLocationCodeLbl);

        GenProdPostingGroupFilter := GetGenProdPostingGroupFilter(ParameterString);
        AvailableReductionPct := GetAvailableReductionPct(ParameterString);
        UpdatedAt := CurrentDateTime;

        Item.Reset();
        Item.SetRange(Type, Item.Type::Inventory);
        Item.SetFilter("Gen. Prod. Posting Group", GenProdPostingGroupFilter);

        TotalItemCount := Item.Count;
        if not Item.FindSet() then
            exit;

        OpenProgressDialog(TotalItemCount);
        repeat
            ProcessedItemCount += 1;
            UpdateProgressDialog(TotalItemCount, ProcessedItemCount, Item."No.");
            UpdateItemStock(Item, Location, AvailableReductionPct, UpdatedAt);
        until Item.Next() = 0;
        CloseProgressDialog();
    end;

    local procedure UpdateItemStock(var Item: Record Item; Location: Record Location; AvailableReductionPct: Decimal; UpdatedAt: DateTime)
    var
        OnHandQty: Decimal;
        AvailableQty: Decimal;
    begin
        CalculateItemStock(Item, Location, AvailableReductionPct, OnHandQty, AvailableQty);

        if (Item."AUNING Stock On Hand" = OnHandQty) and
           (Item."AUNING Stock Available" = AvailableQty) and
           (Item."AUNING Stock Updated At" = UpdatedAt)
        then
            exit;

        Item."AUNING Stock On Hand" := OnHandQty;
        Item."AUNING Stock Available" := AvailableQty;
        Item."AUNING Stock Updated At" := UpdatedAt;
        Item.Modify();
    end;

    local procedure CalculateItemStock(Item: Record Item; Location: Record Location; AvailableReductionPct: Decimal; var OnHandQty: Decimal; var AvailableQty: Decimal)
    var
        ItemVariant: Record "Item Variant";
    begin
        OnHandQty := CalculateVariantOnHand(Item, Location.Code, '');
        AvailableQty := CalculateVariantAvailable(Item, Location, '');

        ItemVariant.SetRange("Item No.", Item."No.");
        if not ItemVariant.FindSet() then
            exit;

        repeat
            OnHandQty += CalculateVariantOnHand(Item, Location.Code, ItemVariant.Code);
            AvailableQty += CalculateVariantAvailable(Item, Location, ItemVariant.Code);
        until ItemVariant.Next() = 0;

        OnHandQty := NormalizeQuantity(OnHandQty);
        AvailableQty := NormalizeAvailableQuantity(AvailableQty, AvailableReductionPct);
    end;

    local procedure CalculateVariantOnHand(Item: Record Item; LocationCode: Code[10]; VariantCode: Code[10]): Decimal
    var
        ItemForCalc: Record Item;
    begin
        ItemForCalc.Copy(Item);
        ItemForCalc.SetRange("Location Filter", LocationCode);
        ItemForCalc.SetRange("Variant Filter", VariantCode);
        ItemForCalc.CalcFields(Inventory);

        exit(ItemForCalc.Inventory);
    end;

    local procedure CalculateVariantAvailable(Item: Record Item; Location: Record Location; VariantCode: Code[10]): Decimal
    var
        WarehouseActivityLine: Record "Warehouse Activity Line";
        ItemForCalc: Record Item;
        WarehouseAvailabilityMgt: Codeunit "Warehouse Availability Mgt.";
    begin
        ItemForCalc.Copy(Item);
        exit(WarehouseAvailabilityMgt.CalcInvtAvailQty(ItemForCalc, Location, VariantCode, WarehouseActivityLine));
    end;

    local procedure GetGenProdPostingGroupFilter(ParameterString: Text): Text
    var
        ParameterValue: Text;
    begin
        if ParameterString = '' then
            exit(DefaultGenProdPostingGroupFilterLbl);

        ParameterValue := GetParameterValue(ParameterString, GenProdPostingGroupFilterTokLbl);
        if ParameterValue = '' then
            exit(DefaultGenProdPostingGroupFilterLbl);

        exit(ParameterValue);
    end;

    local procedure GetAvailableReductionPct(ParameterString: Text): Decimal
    var
        ParameterValue: Text;
        ReductionPct: Decimal;
    begin
        if ParameterString = '' then
            exit(0);

        ParameterValue := GetParameterValue(ParameterString, AvailableReductionPctTokLbl);
        if ParameterValue = '' then
            exit(0);

        if not Evaluate(ReductionPct, ParameterValue) then
            Error(InvalidDecimalParameterErr, AvailableReductionPctTokLbl, ParameterValue);

        if ReductionPct < 0 then
            Error(InvalidDecimalParameterErr, AvailableReductionPctTokLbl, ParameterValue);

        exit(ReductionPct);
    end;

    local procedure GetParameterValue(ParameterString: Text; ParameterName: Text): Text
    var
        ParameterToken: Text;
        StartPos: Integer;
        EndPos: Integer;
    begin
        ParameterToken := ParameterName + '=';
        StartPos := StrPos(ParameterString, ParameterToken);
        if StartPos = 0 then
            exit('');

        StartPos += StrLen(ParameterToken);
        EndPos := StrPos(CopyStr(ParameterString, StartPos), ';');
        if EndPos = 0 then
            exit(CopyStr(ParameterString, StartPos));

        exit(CopyStr(ParameterString, StartPos, EndPos - 1));
    end;

    local procedure NormalizeQuantity(Quantity: Decimal): Decimal
    begin
        if Quantity < 0 then
            exit(0);

        exit(Round(Quantity, 1, '<'));
    end;

    local procedure NormalizeAvailableQuantity(AvailableQuantity: Decimal; AvailableReductionPct: Decimal): Decimal
    var
        ReducedAvailableQuantity: Decimal;
    begin
        ReducedAvailableQuantity := AvailableQuantity;
        if AvailableReductionPct > 0 then
            ReducedAvailableQuantity := ReducedAvailableQuantity * (100 - AvailableReductionPct) / 100;

        exit(NormalizeQuantity(ReducedAvailableQuantity));
    end;

    local procedure OpenProgressDialog(TotalItemCount: Integer)
    begin
        if not GuiAllowed then
            exit;

        ProgressTotalItemCount := TotalItemCount;
        ProgressProcessedItemCount := 0;
        Clear(ProgressCurrentItemNo);
        ProgressDialog.Open(ProgressDialogLbl, ProgressTotalItemCount, ProgressProcessedItemCount, ProgressCurrentItemNo);
    end;

    local procedure UpdateProgressDialog(TotalItemCount: Integer; ProcessedItemCount: Integer; ItemNo: Code[20])
    begin
        if not GuiAllowed then
            exit;

        ProgressTotalItemCount := TotalItemCount;
        ProgressProcessedItemCount := ProcessedItemCount;
        ProgressCurrentItemNo := ItemNo;
        ProgressDialog.Update(1, TotalItemCount);
        ProgressDialog.Update(2, ProcessedItemCount);
        ProgressDialog.Update(3, ItemNo);
    end;

    local procedure CloseProgressDialog()
    begin
        if not GuiAllowed then
            exit;

        ProgressDialog.Close();
    end;
}
