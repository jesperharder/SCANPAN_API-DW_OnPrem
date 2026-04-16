page 50233 "AuningStockOData"
{
    Caption = 'AUNING Stock OData';
    AdditionalSearchTerms = 'SCANPAN, OData, AUNING, stock, inventory, available, dw';
    UsageCategory = Administration;

    PageType = List;
    SourceTable = Item;
    SourceTableView = sorting("No.") order(ascending) where(
        Type = const(Inventory),
        "Gen. Prod. Posting Group" = filter('INTERN|EKSTERN|BRUND'));
    ODataKeyFields = "No.";

    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    DeleteAllowed = false;

    Permissions =
        tabledata Item = R;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(itemNo; Rec."No.") { Caption = 'itemNo'; }
                field(description; Rec.Description) { Caption = 'description'; }
                field(auningStockOnHand; Rec."AUNING Stock On Hand")
                {
                    Caption = 'auningStockOnHand';
                    DecimalPlaces = 0 : 0;
                }
                field(auningStockAvailable; Rec."AUNING Stock Available")
                {
                    Caption = 'auningStockAvailable';
                    DecimalPlaces = 0 : 0;
                }
                field(auningStockUpdatedAt; Rec."AUNING Stock Updated At")
                {
                    Caption = 'auningStockUpdatedAt';
                }
            }
        }
    }
}
