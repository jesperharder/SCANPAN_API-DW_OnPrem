page 50226 "ItemScanpanAPI"
{
    PageType = API;
    Caption = 'ItemScanpanAPI';
    APIPublisher = 'spn';
    APIGroup = 'scanpan';
    APIVersion = 'v1.0';
    EntityName = 'item_scanpan';
    EntitySetName = 'item_scanpans';
    SourceTable = Item;
    ODataKeyFields = SystemId;
    DelayedInsert = true;
    Extensible = false;

    InsertAllowed = true;
    ModifyAllowed = true;
    DeleteAllowed = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                // Identity
                field(id; Rec.SystemId)
                {
                    Caption = 'Id';
                    Editable = false;
                }
                field(number; Rec."No.")
                {
                    Caption = 'Number';
                }
                field(displayName; Rec.Description)
                {
                    Caption = 'Display Name';
                }

                // From tableextension 50000 "ItemExt"
                field(itemVendorName; Rec."Item Vendor Name")
                {
                    Caption = 'Item Vendor Name';
                    Editable = false; // FlowField
                }
                field(transRyomAuningQty; Rec."Trans. RYOM-AUNING (Qty.)")
                {
                    Caption = 'Trans. Outstanding RYOM-AUNING (Qty.)';
                    Editable = false; // FlowField
                    DecimalPlaces = 0 : 5;
                }
                field(itemBodyType; Rec."ItemBodyType")
                {
                    Caption = 'Item Body Type'; // Enum "EnumItemBodyType"
                }
            }
        }
    }

    actions { }
}
