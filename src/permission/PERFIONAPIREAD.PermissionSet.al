permissionset 50230 "PERFION API READ"
{
    Caption = 'Perfion API - Read';
    Assignable = true;

    Permissions =
        // --- API pages (så brugeren kan kalde endpoints)
        page "PerfionItemsAPI" = X,
        page "PerfionItemsOData" = X,
        page "PerfionPricesAPI" = X,
        page "PerfionPricesOData" = X,

        // --- Login/auth (kræves for OData-kald i dit miljø)
        codeunit "LogInManagement" = X,

        // --- PerfionItemsAPI dependencies
        tabledata Item = R,
        tabledata "Item Reference" = R,
        tabledata "Item Translation" = R,
        tabledata "Item Unit of Measure" = R,

        // --- PerfionPricesAPI dependencies
        tabledata "Price List Line" = R,
        tabledata Campaign = R;
}
