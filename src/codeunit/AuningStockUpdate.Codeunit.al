codeunit 50042 "Auning Stock Update"
{
    TableNo = "Job Queue Entry";

    trigger OnRun()
    var
        ScheduledMinute: Integer;
    begin
        if TryGetScheduledMinute("Parameter String", ScheduledMinute) then begin
            EnsureRecurringSchedule(Rec, ScheduledMinute);
            if not IsScheduledExecutionMinute(CurrentDateTime, ScheduledMinute) then
                exit;
        end;

        UpdateAllItems("Parameter String");
    end;

    var
        AuningLocationCodeLbl: Label 'AUNING', Locked = true;
        DefaultGenProdPostingGroupFilterLbl: Label 'INTERN|EKSTERN|BRUND', Locked = true;
        GenProdPostingGroupFilterTokLbl: Label 'GenProdPostingGroupFilter', Locked = true;
        AvailableReductionPctTokLbl: Label 'AvailableReductionPct', Locked = true;
        ScheduledMinuteTokLbl: Label 'ScheduledMinute', Locked = true;
        InvalidDecimalParameterErr: Label 'Parameter %1 has invalid value %2.', Comment = '%1=parameter name, %2=value';
        InvalidIntegerParameterErr: Label 'Parameter %1 has invalid value %2.', Comment = '%1=parameter name, %2=value';
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
        SalesDemandWindowStartDate: Date;
        SalesDemandWindowEndDate: Date;
    begin
        SalesDemandWindowStartDate := WorkDate();
        SalesDemandWindowEndDate := CalcDate('<+30D>', SalesDemandWindowStartDate);

        OnHandQty := CalculateVariantOnHand(Item, Location.Code, '');
        AvailableQty := CalculateVariantAvailable(Item, Location.Code, '', SalesDemandWindowStartDate, SalesDemandWindowEndDate);

        ItemVariant.SetRange("Item No.", Item."No.");
        if ItemVariant.FindSet() then
            repeat
                OnHandQty += CalculateVariantOnHand(Item, Location.Code, ItemVariant.Code);
                AvailableQty += CalculateVariantAvailable(Item, Location.Code, ItemVariant.Code, SalesDemandWindowStartDate, SalesDemandWindowEndDate);
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

    local procedure CalculateVariantAvailable(Item: Record Item; LocationCode: Code[10]; VariantCode: Code[10]; SalesDemandWindowStartDate: Date; SalesDemandWindowEndDate: Date): Decimal
    var
        SalesDemandQty: Decimal;
    begin
        SalesDemandQty := CalculateVariantSalesDemand(Item."No.", LocationCode, VariantCode, SalesDemandWindowStartDate, SalesDemandWindowEndDate);
        exit(CalculateVariantOnHand(Item, LocationCode, VariantCode) - SalesDemandQty);
    end;

    local procedure CalculateVariantSalesDemand(ItemNo: Code[20]; LocationCode: Code[10]; VariantCode: Code[10]; SalesDemandWindowStartDate: Date; SalesDemandWindowEndDate: Date): Decimal
    var
        SalesHeader: Record "Sales Header";
        SalesLine: Record "Sales Line";
        LastSalesDocumentNo: Code[20];
        SalesDemandQty: Decimal;
        IncludeSalesDocument: Boolean;
    begin
        SalesLine.SetRange("Document Type", SalesLine."Document Type"::Order);
        SalesLine.SetRange(Type, SalesLine.Type::Item);
        SalesLine.SetRange("No.", ItemNo);
        SalesLine.SetRange("Location Code", LocationCode);
        SalesLine.SetRange("Variant Code", VariantCode);
        SalesLine.SetFilter("Outstanding Qty. (Base)", '>0');
        SalesLine.SetRange("Shipment Date", SalesDemandWindowStartDate, SalesDemandWindowEndDate);

        if not SalesLine.FindSet() then
            exit(0);

        repeat
            if SalesLine."Document No." <> LastSalesDocumentNo then begin
                if not SalesHeader.Get(SalesHeader."Document Type"::Order, SalesLine."Document No.") then
                    Error('Sales header %1 %2 does not exist.', SalesHeader."Document Type"::Order, SalesLine."Document No.");

                LastSalesDocumentNo := SalesLine."Document No.";
                IncludeSalesDocument :=
                  (SalesHeader.Status = SalesHeader.Status::Open) or
                  (SalesHeader.Status = SalesHeader.Status::Released);
            end;

            if IncludeSalesDocument then
                SalesDemandQty += SalesLine."Outstanding Qty. (Base)";
        until SalesLine.Next() = 0;

        exit(SalesDemandQty);
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

    local procedure TryGetScheduledMinute(ParameterString: Text; var ScheduledMinute: Integer): Boolean
    var
        ParameterValue: Text;
    begin
        if ParameterString = '' then
            exit(false);

        ParameterValue := GetParameterValue(ParameterString, ScheduledMinuteTokLbl);
        if ParameterValue = '' then
            exit(false);

        if not Evaluate(ScheduledMinute, ParameterValue) then
            Error(InvalidIntegerParameterErr, ScheduledMinuteTokLbl, ParameterValue);

        if (ScheduledMinute < 0) or (ScheduledMinute > 59) then
            Error(InvalidIntegerParameterErr, ScheduledMinuteTokLbl, ParameterValue);

        exit(true);
    end;

    local procedure EnsureRecurringSchedule(var JobQueueEntry: Record "Job Queue Entry"; ScheduledMinute: Integer)
    var
        ExpectedStartingTime: Time;
        IsModified: Boolean;
    begin
        JobQueueEntry.RefreshLocked();
        ExpectedStartingTime := CreateHourMinuteTime(0, ScheduledMinute);

        if not JobQueueEntry."Run on Mondays" then begin
            JobQueueEntry.Validate("Run on Mondays", true);
            IsModified := true;
        end;

        if not JobQueueEntry."Run on Tuesdays" then begin
            JobQueueEntry.Validate("Run on Tuesdays", true);
            IsModified := true;
        end;

        if not JobQueueEntry."Run on Wednesdays" then begin
            JobQueueEntry.Validate("Run on Wednesdays", true);
            IsModified := true;
        end;

        if not JobQueueEntry."Run on Thursdays" then begin
            JobQueueEntry.Validate("Run on Thursdays", true);
            IsModified := true;
        end;

        if not JobQueueEntry."Run on Fridays" then begin
            JobQueueEntry.Validate("Run on Fridays", true);
            IsModified := true;
        end;

        if not JobQueueEntry."Run on Saturdays" then begin
            JobQueueEntry.Validate("Run on Saturdays", true);
            IsModified := true;
        end;

        if not JobQueueEntry."Run on Sundays" then begin
            JobQueueEntry.Validate("Run on Sundays", true);
            IsModified := true;
        end;

        if JobQueueEntry."No. of Minutes between Runs" <> 60 then begin
            JobQueueEntry.Validate("No. of Minutes between Runs", 60);
            IsModified := true;
        end;

        if JobQueueEntry."Starting Time" <> ExpectedStartingTime then begin
            JobQueueEntry.Validate("Starting Time", ExpectedStartingTime);
            IsModified := true;
        end;

        if JobQueueEntry."Ending Time" <> 0T then begin
            JobQueueEntry.Validate("Ending Time", 0T);
            IsModified := true;
        end;

        if JobQueueEntry."Manual Recurrence" then begin
            JobQueueEntry."Manual Recurrence" := false;
            IsModified := true;
        end;

        if IsModified then
            JobQueueEntry.Modify(true);
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

    local procedure IsScheduledExecutionMinute(RunAt: DateTime; ScheduledMinute: Integer): Boolean
    begin
        exit(GetTimeMinute(DT2Time(RunAt)) = ScheduledMinute);
    end;

    local procedure GetAlignedRunTimeAtOrAfter(BaseMoment: DateTime; ScheduledMinute: Integer): DateTime
    begin
        if GetTimeMinute(DT2Time(BaseMoment)) = ScheduledMinute then
            exit(BaseMoment);

        exit(GetNextAlignedRunTimeAfter(BaseMoment, ScheduledMinute));
    end;

    local procedure GetNextAlignedRunTimeAfter(BaseMoment: DateTime; ScheduledMinute: Integer): DateTime
    var
        JobQueueDispatcher: Codeunit "Job Queue Dispatcher";
        CurrentTime: Time;
        Candidate: DateTime;
    begin
        CurrentTime := DT2Time(BaseMoment);
        Candidate := CreateDateTime(DT2Date(BaseMoment), CreateHourMinuteTime(GetTimeHour(CurrentTime), ScheduledMinute));

        if GetTimeMinute(CurrentTime) >= ScheduledMinute then
            exit(JobQueueDispatcher.AddMinutesToDateTime(Candidate, 60));

        exit(Candidate);
    end;

    local procedure CreateHourMinuteTime(HourValue: Integer; MinuteValue: Integer): Time
    var
        TimeValue: Time;
        TimeText: Text;
    begin
        TimeText := StrSubstNo('%1:%2:00', GetTwoDigitIntegerText(HourValue), GetTwoDigitIntegerText(MinuteValue));
        if not Evaluate(TimeValue, TimeText) then
            Error('Time value %1 is invalid.', TimeText);

        exit(TimeValue);
    end;

    local procedure GetTwoDigitIntegerText(Value: Integer): Text
    begin
        if Value < 10 then
            exit('0' + Format(Value));

        exit(Format(Value));
    end;

    local procedure GetTimeHour(TimeValue: Time): Integer
    var
        HourValue: Integer;
    begin
        if not Evaluate(HourValue, Format(TimeValue, 0, '<Hours24,2>')) then
            Error('Time value %1 has an invalid hour component.', TimeValue);

        exit(HourValue);
    end;

    local procedure GetTimeMinute(TimeValue: Time): Integer
    var
        MinuteValue: Integer;
    begin
        if not Evaluate(MinuteValue, Format(TimeValue, 0, '<Minutes,2>')) then
            Error('Time value %1 has an invalid minute component.', TimeValue);

        exit(MinuteValue);
    end;

    local procedure TryGetScheduledMinuteFromJobQueueEntry(JobQueueEntry: Record "Job Queue Entry"; var ScheduledMinute: Integer): Boolean
    begin
        if JobQueueEntry."Object Type to Run" <> JobQueueEntry."Object Type to Run"::Codeunit then
            exit(false);

        if JobQueueEntry."Object ID to Run" <> CODEUNIT::"Auning Stock Update" then
            exit(false);

        exit(TryGetScheduledMinute(JobQueueEntry."Parameter String", ScheduledMinute));
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Job Queue Dispatcher", 'OnBeforeCalcNextRunTimeForRecurringJob', '', false, false)]
    local procedure OnBeforeCalcNextRunTimeForRecurringJob(JobQueueEntry: Record "Job Queue Entry"; StartingDateTime: DateTime; var NewRunDateTime: DateTime; var IsHandled: Boolean)
    var
        ScheduledMinute: Integer;
    begin
        if not TryGetScheduledMinuteFromJobQueueEntry(JobQueueEntry, ScheduledMinute) then
            exit;

        NewRunDateTime := GetNextAlignedRunTimeAfter(StartingDateTime, ScheduledMinute);
        IsHandled := true;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Job Queue Dispatcher", 'OnCalcInitialRunTimeOnAfterCalcEarliestPossibleRunTime', '', false, false)]
    local procedure OnCalcInitialRunTimeOnAfterCalcEarliestPossibleRunTime(var JobQueueEntry: Record "Job Queue Entry"; var EarliestPossibleRunTime: DateTime; var IsHandled: Boolean)
    var
        ScheduledMinute: Integer;
    begin
        if not TryGetScheduledMinuteFromJobQueueEntry(JobQueueEntry, ScheduledMinute) then
            exit;

        EarliestPossibleRunTime := GetAlignedRunTimeAtOrAfter(EarliestPossibleRunTime, ScheduledMinute);
        IsHandled := true;
    end;
}
