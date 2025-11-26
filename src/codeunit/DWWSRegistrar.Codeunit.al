codeunit 50200 "DW WS Registrar"
{
    Subtype = Normal;


    procedure PublishApiPages()
    begin
        AddApiPage(50200, 'CalendarEntryAPI');
        AddApiPage(50201, 'CampaignAPI');
        AddApiPage(50202, 'CapacityLedgerEntryAPI');
        AddApiPage(50203, 'CompanyInformationAPI');
        AddApiPage(50204, 'CountryRegionAPI');
        AddApiPage(50205, 'CurrencyAPI');
        AddApiPage(50206, 'CustomerIndustryGroupsAPI');
        AddApiPage(50207, 'DimensionSetEntryAPI');
        AddApiPage(50208, 'DimnsionValueAPI');
        AddApiPage(50209, 'GlAccountAPI');
        AddApiPage(50210, 'GLEntryAPI');
        AddApiPage(50212, 'CurrencyExchangeRateAPI');
        AddApiPage(50213, 'CustomerAPI');
        AddApiPage(50214, 'DefaultDimensionAPI');
        AddApiPage(50215, 'EmployeeAPI');
        AddApiPage(50216, 'FALedgerEntryAPI');
        AddApiPage(50217, 'FixedAssetAPI');
        AddApiPage(50218, 'GenBusinessPostingGroupAPI');
        AddApiPage(50219, 'GeneralLedgerSetupAPI');
        AddApiPage(50220, 'GeneralPostingSetupAPI');
        AddApiPage(50221, 'GenProductPostingGroupAPI');
        AddApiPage(50222, 'GLItemLedgerRelationAPI');
        AddApiPage(50223, 'GLBudgetEntryAPI');
        AddApiPage(50224, 'ItemAPI');
        AddApiPage(50225, 'ItemNotoraAPI');
        AddApiPage(50226, 'ItemScanpanAPI');
        AddApiPage(50229, 'ItemCategoryAPI');
        AddApiPage(50234, 'ItemLedgerEntryAPI');
        AddApiPage(50235, 'ItemUnitofMeasureAPI');
        AddApiPage(50236, 'ItemReferenceAPI');
        AddApiPage(50238, 'LocationAPI');
        AddApiPage(50239, 'MachineCenterAPI');
        AddApiPage(50240, 'PriceListLineAPI');
        AddApiPage(50241, 'ProdOrderComponentAPI');
        AddApiPage(50242, 'ProdOrderLineAPI');
        AddApiPage(50243, 'ProdOrderRoutingLineAPI');
        AddApiPage(50244, 'ProductionBOMHeaderAPI');
        AddApiPage(50245, 'ProductionBOMLineAPI');
        AddApiPage(50246, 'ProductionOrderAPI');
        AddApiPage(50247, 'PurchaseHeaderAPI');
        AddApiPage(50248, 'PurchCrMemoLineAPI');
        AddApiPage(50249, 'PurchInvLineAPI');
        AddApiPage(50251, 'PurchaseLineAPI');
        AddApiPage(50252, 'PurchCrMemoHdrAPI');
        AddApiPage(50253, 'PurchInvHeaderAPI');
        AddApiPage(50254, 'ReturnReasonAPI');
        AddApiPage(50255, 'RoutingHeaderAPI');
        AddApiPage(50256, 'RoutingLineAPI');
        AddApiPage(50257, 'SalesCrMemoHeaderAPI');
        AddApiPage(50258, 'SalesCrMemoLineAPI');
        AddApiPage(50259, 'SalesHeaderAPI');
        AddApiPage(50260, 'SalesInvHeaderAPI');
        AddApiPage(50261, 'SalesInvLineAPI');
        AddApiPage(50262, 'SalesLineAPI');
        AddApiPage(50263, 'SalespersonPurchaserAPI');
        AddApiPage(50264, 'ProdBOMLineScrapAPI');
        AddApiPage(50266, 'ShipmentMethodAPI');
        AddApiPage(50267, 'StockkeepingUnitAPI');
        AddApiPage(50268, 'StopAPI');
        AddApiPage(50273, 'TariffNumberAPI');
        AddApiPage(50274, 'TeamAPI');
        AddApiPage(50275, 'TeamSalesPersonAPI');
        AddApiPage(50276, 'TransferHeaderAPI');
        AddApiPage(50277, 'TransferLineAPI');
        AddApiPage(50278, 'UnitOfMeasureAPI');
        AddApiPage(50279, 'ValueEntryAPI');
        AddApiPage(50280, 'ValueEntryRelationAPI');
        AddApiPage(50281, 'VendorAPI');
        AddApiPage(50282, 'WorkCenterAPI');
    end;

local procedure AddApiPage(PageId: Integer; PageName: Text[250])
var
    WS: Record "Tenant Web Service";
    ServiceName: Text[250];
begin
    ServiceName := GetDwServiceName(PageName); // camelCase + 'DW'

    // 1) Remove ALL existing rows for this PageId (any casing / names)
    WS.Reset();
    WS.SetRange("Object Type", WS."Object Type"::Page);
    WS.SetRange("Object ID", PageId);
    if WS.FindSet(true) then
        repeat
            WS.Delete(true);
        until WS.Next() = 0;

    // 2) Insert the single canonical row with exact casing
    InsertDesiredRow(PageId, ServiceName);
end;

local procedure InsertDesiredRow(PageId: Integer; ServiceName: Text[250])
var
    NewWS: Record "Tenant Web Service";
    RecRef: RecordRef;
begin
    NewWS.Init();
    NewWS."Object Type" := NewWS."Object Type"::Page;
    NewWS."Object ID" := PageId;
    NewWS.Validate("Service Name", ServiceName); // preserves camelCase
    NewWS.Published := true;

    RecRef.GetTable(NewWS);
    if TrySetAllTenantsTrue(RecRef) then
        RecRef.SetTable(NewWS);

    NewWS.Insert(true);
end;

local procedure TrySetAllTenantsTrue(var RecRef: RecordRef): Boolean
var
    i: Integer;
    FRef: FieldRef;
begin
    for i := 1 to RecRef.FieldCount do begin
        FRef := RecRef.FieldIndex(i);
        if FRef.Name = 'All Tenants' then begin
            FRef.Value := true;
            exit(true);
        end;
    end;
    exit(false);
end;

local procedure GetDwServiceName(PageName: Text[250]) ServiceName: Text[250]
var
    tail: Text[3];
begin
    if StrLen(PageName) > 3 then begin
        tail := UpperCase(CopyStr(PageName, StrLen(PageName) - 2, 3));
        if tail = 'API' then
            exit(CopyStr(PageName, 1, StrLen(PageName) - 3) + 'DW');
    end;
    exit(PageName + 'DW');
end;

}