page 50224 "ItemAPI"
{
    PageType = API;
    SourceTable = Item;

    // API signature
    APIPublisher = 'yourorg';
    APIGroup = 'inventory';
    APIVersion = 'v1.0';
    EntityName = 'item';
    EntitySetName = 'items';

    // Use SystemId as the stable OData key
    ODataKeyFields = SystemId;

    Caption = 'Item API';
    DelayedInsert = true;
    Extensible = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                // Identity
                field(id; Rec.SystemId)                 { ApplicationArea = All; Caption = 'id'; }
                field(number; Rec."No.")               { ApplicationArea = All; Caption = 'number'; }
                field(number2; Rec."No. 2")            { ApplicationArea = All; Caption = 'number2'; }

                // Descriptions
                field(description; Rec.Description)     { ApplicationArea = All; Caption = 'description'; }
                field(description2; Rec."Description 2"){ ApplicationArea = All; Caption = 'description2'; }
                field(searchDescription; Rec."Search Description") { ApplicationArea = All; Caption = 'searchDescription'; }

                // Classification
                field(type; Rec.Type)                               { ApplicationArea = All; Caption = 'type'; }
                field(itemCategoryCode; Rec."Item Category Code")   { ApplicationArea = All; Caption = 'itemCategoryCode'; }
                field(itemCategoryId; Rec."Item Category Id")       { ApplicationArea = All; Caption = 'itemCategoryId'; }

                // Posting & tax
                field(inventoryPostingGroup; Rec."Inventory Posting Group") { ApplicationArea = All; Caption = 'inventoryPostingGroup'; }
                field(genProdPostingGroup; Rec."Gen. Prod. Posting Group")  { ApplicationArea = All; Caption = 'genProdPostingGroup'; }
                field(vatProdPostingGroup; Rec."VAT Prod. Posting Group")   { ApplicationArea = All; Caption = 'vatProdPostingGroup'; }
                field(taxGroupCode; Rec."Tax Group Code")                   { ApplicationArea = All; Caption = 'taxGroupCode'; }
                field(taxGroupId; Rec."Tax Group Id")                       { ApplicationArea = All; Caption = 'taxGroupId'; }

                // Units of measure
                field(baseUnitOfMeasure; Rec."Base Unit of Measure") { ApplicationArea = All; Caption = 'baseUnitOfMeasure'; }
                field(unitOfMeasureId; Rec."Unit of Measure Id")     { ApplicationArea = All; Caption = 'unitOfMeasureId'; }

                // Prices / costs
                field(unitPrice; Rec."Unit Price")                   { ApplicationArea = All; Caption = 'unitPrice'; }
                field(unitCost; Rec."Unit Cost")                     { ApplicationArea = All; Caption = 'unitCost'; }
                field(priceIncludesVAT; Rec."Price Includes VAT")    { ApplicationArea = All; Caption = 'priceIncludesVAT'; }

                // Operational flags
                field(blocked; Rec.Blocked)                          { ApplicationArea = All; Caption = 'blocked'; }
                field(salesBlocked; Rec."Sales Blocked")             { ApplicationArea = All; Caption = 'salesBlocked'; }
                field(purchasingBlocked; Rec."Purchasing Blocked")   { ApplicationArea = All; Caption = 'purchasingBlocked'; }

                // Vendor & identifiers
                field(vendorNo; Rec."Vendor No.")                    { ApplicationArea = All; Caption = 'vendorNo'; }
                field(gtin; Rec.GTIN)                                { ApplicationArea = All; Caption = 'gtin'; }

                // Read-only flowfield (safe)
                field(inventory; Rec.Inventory)
                {
                    ApplicationArea = All;
                    Caption = 'inventory';
                    Editable = false;
                }
            }
        }
    }
}
