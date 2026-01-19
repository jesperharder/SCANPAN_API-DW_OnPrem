codeunit 50200 "DW WS Registrar"
{
    /// <summary>
    /// Date        Name                    Version   Description
    /// 2025.10.23  Business Central AL     001.0     API page for Campaign (5071) - DW friendly
    ///
    /// Publishes/refreshes Tenant Web Services rows for all DW API pages.
    /// Ensures exactly ONE canonical row per PageId, with consistent Service Name casing.
    /// </summary>
    Subtype = Normal;

    procedure PublishApiPages()
    begin
        // ---------------------------------------------------------------------
        // Master data / setup / dimensions / common lookups
        // ---------------------------------------------------------------------
        AddApiPage(50203, 'CompanyInformationAPI');
        AddApiPage(50204, 'CountryRegionAPI');
        AddApiPage(50205, 'CurrencyAPI');
        AddApiPage(50212, 'CurrencyExchangeRateAPI');
        AddApiPage(50214, 'DefaultDimensionAPI');
        AddApiPage(50207, 'DimensionSetEntryAPI');
        AddApiPage(50208, 'DimensionValueAPI');
        AddApiPage(50218, 'GenBusinessPostingGroupAPI');
        AddApiPage(50221, 'GenProductPostingGroupAPI');
        AddApiPage(50219, 'GeneralLedgerSetupAPI');
        AddApiPage(50220, 'GeneralPostingSetupAPI');
        AddApiPage(50278, 'UnitOfMeasureAPI');
        AddApiPage(50254, 'ReturnReasonAPI');
        AddApiPage(50266, 'ShipmentMethodAPI');

        // ---------------------------------------------------------------------
        // CRM / Sales / Marketing / People
        // ---------------------------------------------------------------------
        AddApiPage(50201, 'CampaignAPI');
        AddApiPage(50213, 'CustomerAPI');
        AddApiPage(50206, 'CustomerIndustryGroupsAPI');
        AddApiPage(50263, 'SalespersonPurchaserAPI');
        AddApiPage(50215, 'EmployeeAPI');

        // ---------------------------------------------------------------------
        // Finance / G/L
        // ---------------------------------------------------------------------
        AddApiPage(50209, 'GlAccountAPI');
        AddApiPage(50210, 'GLEntryAPI');
        AddApiPage(50223, 'GLBudgetEntryAPI');
        AddApiPage(50222, 'GLItemLedgerRelationAPI');

        // ---------------------------------------------------------------------
        // Fixed Assets
        // ---------------------------------------------------------------------
        AddApiPage(50217, 'FixedAssetAPI');
        AddApiPage(50216, 'FALedgerEntryAPI');

        // ---------------------------------------------------------------------
        // Inventory / Items / Pricing
        // ---------------------------------------------------------------------
        AddApiPage(50224, 'ItemAPI');
        AddApiPage(50227, 'ItemBudgetEntryAPI'); // planning/budget but item-centric in DW
        AddApiPage(50229, 'ItemCategoryAPI');
        AddApiPage(50234, 'ItemLedgerEntryAPI');
        AddApiPage(50235, 'ItemUnitofMeasureAPI');
        AddApiPage(50236, 'ItemReferenceAPI');
        AddApiPage(50267, 'StockkeepingUnitAPI');
        AddApiPage(50240, 'PriceListLineAPI');
        AddApiPage(50279, 'ValueEntryAPI');
        AddApiPage(50280, 'ValueEntryRelationAPI');

        // ---------------------------------------------------------------------
        // Production / Capacity / Routing / BOM
        // ---------------------------------------------------------------------
        AddApiPage(50202, 'CapacityLedgerEntryAPI');
        AddApiPage(50239, 'MachineCenterAPI');
        AddApiPage(50282, 'WorkCenterAPI');

        AddApiPage(50290, 'ProductionBOMHeaderAPI');
        AddApiPage(50245, 'ProductionBOMLineAPI');
        AddApiPage(50264, 'ProdBOMLineScrapAPI');

        AddApiPage(50255, 'RoutingHeaderAPI');
        AddApiPage(50256, 'RoutingLineAPI');
        AddApiPage(50243, 'ProdOrderRoutingLineAPI');

        AddApiPage(50246, 'ProductionOrderAPI');
        AddApiPage(50241, 'ProdOrderComponentAPI');
        AddApiPage(50242, 'ProdOrderLineAPI');

        // ---------------------------------------------------------------------
        // Purchasing
        // ---------------------------------------------------------------------
        AddApiPage(50247, 'PurchaseHeaderAPI');
        AddApiPage(50251, 'PurchaseLineAPI');
        AddApiPage(50253, 'PurchInvHeaderAPI');
        AddApiPage(50249, 'PurchInvLineAPI');
        AddApiPage(50252, 'PurchCrMemoHdrAPI');
        AddApiPage(50248, 'PurchCrMemoLineAPI');
        AddApiPage(50281, 'VendorAPI');

        // ---------------------------------------------------------------------
        // Sales (headers/lines + posted docs + credit memos)
        // ---------------------------------------------------------------------
        AddApiPage(50259, 'SalesHeaderAPI');
        AddApiPage(50262, 'SalesLineAPI');
        AddApiPage(50260, 'SalesInvHeaderAPI');
        AddApiPage(50261, 'SalesInvLineAPI');
        AddApiPage(50257, 'SalesCrMemoHeaderAPI');
        AddApiPage(50258, 'SalesCrMemoLineAPI');

        // ---------------------------------------------------------------------
        // Logistics / Warehouse / Transfers / Locations
        // ---------------------------------------------------------------------
        AddApiPage(50238, 'LocationAPI');
        AddApiPage(50276, 'TransferHeaderAPI');
        AddApiPage(50277, 'TransferLineAPI');

        // ---------------------------------------------------------------------
        // Teams / Misc / Reference tables
        // ---------------------------------------------------------------------
        AddApiPage(50268, 'StopAPI');
        AddApiPage(50273, 'TariffNumberAPI');
        AddApiPage(50274, 'TeamAPI');
        AddApiPage(50275, 'TeamSalesPersonAPI');

        // ---------------------------------------------------------------------
        // Calendar / scheduling / time
        // ---------------------------------------------------------------------
        AddApiPage(50200, 'CalendarEntryAPI');
    end;

    /// <summary>
    /// Ensures a single, canonical Tenant Web Service row exists for this PageId:
    /// 1) Deletes any existing rows for PageId (any casing / any Service Name)
    /// 2) Inserts one row with the desired ServiceName (camelCase + DW suffix)
    /// </summary>
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

    /// <summary>
    /// Inserts the canonical row and publishes it.
    /// Sets "All Tenants" = TRUE if the field exists in this environment.
    /// </summary>
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

    /// <summary>
    /// Some versions/environments expose an "All Tenants" field on Tenant Web Service.
    /// This tries to set it without hard dependency, using RecordRef reflection.
    /// </summary>
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

    /// <summary>
    /// Converts PageName -> ServiceName used in Tenant Web Service.
    /// Convention:
    /// - If name ends with "API" => replace suffix with "DW"
    /// - Else => append "DW"
    /// </summary>
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
