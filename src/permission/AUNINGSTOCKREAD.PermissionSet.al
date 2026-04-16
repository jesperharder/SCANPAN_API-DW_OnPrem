permissionset 50231 "AUNING STOCK READ"
{
    Caption = 'AUNING stock - Read';
    Assignable = true;

    Permissions =
        page "AuningStockOData" = X,
        tabledata Item = R;
}
