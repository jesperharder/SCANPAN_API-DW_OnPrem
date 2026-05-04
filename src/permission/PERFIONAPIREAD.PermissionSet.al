permissionset 50230 "PERFION API READ"
{
    Caption = 'Perfion API - Read';
    Assignable = true;

    Permissions =
        // --- OData pages
        page "PerfionItemsOData" = X,
        page "PerfionPricesOData" = X,

        // --- Login/auth (kræves for OData-kald i dit miljø)
        codeunit "LogInManagement" = X,

        // --- PerfionItemsOData dependencies
        tabledata Item = R,
        tabledata "Item Reference" = R,
        tabledata "Item Translation" = R,
        tabledata "Item Unit of Measure" = R,

        // --- PerfionPricesOData dependencies
        tabledata "Price List Line" = R,
        tabledata Campaign = R;
}
