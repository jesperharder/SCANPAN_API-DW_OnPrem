page 50225 "ItemNotoraAPI"
{
    PageType = API;
    Caption = 'ItemNotoraAPI';
    APIPublisher = 'spn';              // your org short name
    APIGroup = 'noto';                  // logical grouping
    APIVersion = 'v1.0';
    EntityName = 'noto_item';
    EntitySetName = 'noto_items';
    SourceTable = Item;
    DelayedInsert = true;
    ODataKeyFields = SystemId;
    Extensible = false;
    InsertAllowed = true;
    ModifyAllowed = true;
    DeleteAllowed = false; // recommend no deletes via API for items

    // ApplicationArea and UsageCategory are irrelevant for API pages

    layout
    {
        area(content)
        {
            repeater(General)
            {
                // Stable identity fields
                field(id; Rec.SystemId)               { Caption = 'Id'; Editable = false; }
                field(number; Rec."No.")              { Caption = 'Number'; }
                field(displayName; Rec.Description)   { Caption = 'Display Name'; }

                // NOTO fields from tableextension 51004 "NOTO Item"
                field(itemBrand; Rec."Item Brand")                { Caption = 'Item Brand'; }
                field(productLineCode; Rec."Product Line Code")   { Caption = 'Product Line Code'; }
                field(productUsage; Rec."Product Usage")          { Caption = 'Product Usage'; }
                field(productGroupCode; Rec."Prod. Group Code")   { Caption = 'Product Group Code'; }
                field(itemSize; Rec."Item Size")                  { Caption = 'Item Size'; }
                field(itemSizeUnit; Rec."Item Size Unit")         { Caption = 'Item Size Unit'; }
                field(itemFeature; Rec."Item Feature")            { Caption = 'Item Feature'; }
                field(packingMethod; Rec."Packing Method")        { Caption = 'Packing Method'; }
                field(abcdCategory; Rec."ABCD Category")          { Caption = 'ABCD Category'; }
                field(coating; Rec.Coating)                       { Caption = 'Coating'; }
                field(quality; Rec.Quality)                       { Caption = 'Quality'; }                     // Enum NOTOQuality
                field(withLid; Rec."With Lid")                    { Caption = 'With Lid'; }
                field(weightClassification; Rec."Weight Classification NOTO")
                { Caption = 'Weight Classification'; }

                // Calculated / read-only values
                field(calculatedAvailable; Rec."Calculated Available NOTO")
                {
                    Caption = 'Calculated Available';
                    Editable = false;
                }
                field(calculatedAvailableExternal; Rec."Calculated Available Ext. NOTO")
                {
                    Caption = 'Calculated Available External';
                    Editable = false;
                }
                field(calculatedAvailableDate; Rec."Calculated Available Date NOTO")
                {
                    Caption = 'Calculated Available Date';
                    Editable = false;
                }

                // Other
                field(customsType; Rec.CustomsType)               { Caption = 'Customs Type'; } // Enum "Customs Type"
            }
        }
    }

    actions { }
}
