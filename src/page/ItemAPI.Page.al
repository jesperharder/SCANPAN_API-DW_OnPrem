page 50224 "ItemAPI"
{
    PageType = API;
    SourceTable = Item;

    // API signature (tilpas gerne til jeres standard)
    APIPublisher = 'scanpan';
    APIGroup = 'datawarehouse';
    APIVersion = 'beta', 'v1.0';
    EntityName = 'item';
    EntitySetName = 'items';

    // Stable OData key
    ODataKeyFields = SystemId;

    Caption = 'Item API (DW)';
    UsageCategory = Administration;
    AdditionalSearchTerms = 'SCANPAN, API, datawarehouse, dw, item';

    Editable = false;
    DelayedInsert = true;
    Extensible = false;

    InsertAllowed = false;
    ModifyAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                // Identity
                field(id; Rec.SystemId) { ApplicationArea = All; Caption = 'id'; }
                field(number; Rec."No.") { ApplicationArea = All; Caption = 'number'; }
                field(number2; Rec."No. 2") { ApplicationArea = All; Caption = 'number2'; }

                // Descriptions
                field(description; Rec.Description) { ApplicationArea = All; Caption = 'description'; }
                field(description2; Rec."Description 2") { ApplicationArea = All; Caption = 'description2'; }
                field(searchDescription; Rec."Search Description") { ApplicationArea = All; Caption = 'searchDescription'; }

                // Classification
                field(type; Rec.Type) { ApplicationArea = All; Caption = 'type'; }
                field(typeInt; TypeInt) { ApplicationArea = All; Caption = 'typeInt'; }

                field(itemCategoryCode; Rec."Item Category Code") { ApplicationArea = All; Caption = 'itemCategoryCode'; }
                field(itemCategoryId; Rec."Item Category Id") { ApplicationArea = All; Caption = 'itemCategoryId'; }

                // Posting & tax
                field(inventoryPostingGroup; Rec."Inventory Posting Group") { ApplicationArea = All; Caption = 'inventoryPostingGroup'; }
                field(genProdPostingGroup; Rec."Gen. Prod. Posting Group") { ApplicationArea = All; Caption = 'genProdPostingGroup'; }
                field(vatProdPostingGroup; Rec."VAT Prod. Posting Group") { ApplicationArea = All; Caption = 'vatProdPostingGroup'; }
                field(taxGroupCode; Rec."Tax Group Code") { ApplicationArea = All; Caption = 'taxGroupCode'; }
                field(taxGroupId; Rec."Tax Group Id") { ApplicationArea = All; Caption = 'taxGroupId'; }

                // Units of measure
                field(baseUnitOfMeasure; Rec."Base Unit of Measure") { ApplicationArea = All; Caption = 'baseUnitOfMeasure'; }
                field(unitOfMeasureId; Rec."Unit of Measure Id") { ApplicationArea = All; Caption = 'unitOfMeasureId'; }

                // Prices / costs
                field(unitPrice; Rec."Unit Price") { ApplicationArea = All; Caption = 'unitPrice'; }
                field(unitCost; Rec."Unit Cost") { ApplicationArea = All; Caption = 'unitCost'; }
                field(priceIncludesVAT; Rec."Price Includes VAT") { ApplicationArea = All; Caption = 'priceIncludesVAT'; }

                // Operational flags
                field(blocked; Rec.Blocked) { ApplicationArea = All; Caption = 'blocked'; }
                field(salesBlocked; Rec."Sales Blocked") { ApplicationArea = All; Caption = 'salesBlocked'; }
                field(purchasingBlocked; Rec."Purchasing Blocked") { ApplicationArea = All; Caption = 'purchasingBlocked'; }

                // Vendor & identifiers
                field(vendorNo; Rec."Vendor No.") { ApplicationArea = All; Caption = 'vendorNo'; }
                field(gtin; Rec.GTIN) { ApplicationArea = All; Caption = 'gtin'; }

                // Flowfields / calculated (keep read-only)
                field(inventory; Rec.Inventory)
                {
                    ApplicationArea = All;
                    Caption = 'inventory';
                    Editable = false;
                }

                // Custom fields (fra jeres udvidelser – behold kun dem der faktisk findes i jeres build)
                // NOTO fields (som du tidligere viste i page-udsnittet)
                field(itemBrand; Rec."Item Brand") { Caption = 'Item Brand'; }
                field(productLineCode; Rec."Product Line Code") { Caption = 'Product Line Code'; }
                field(productUsage; Rec."Product Usage") { Caption = 'Product Usage'; }
                field(productGroupCode; Rec."Prod. Group Code") { Caption = 'Product Group Code'; }
                field(itemSize; Rec."Item Size") { Caption = 'Item Size'; }
                field(itemSizeUnit; Rec."Item Size Unit") { Caption = 'Item Size Unit'; }
                field(itemFeature; Rec."Item Feature") { Caption = 'Item Feature'; }
                field(packingMethod; Rec."Packing Method") { Caption = 'Packing Method'; }
                field(abcdCategory; Rec."ABCD Category") { Caption = 'ABCD Category'; }
                field(coating; Rec.Coating) { Caption = 'Coating'; }
                field(quality; Rec.Quality) { Caption = 'Quality'; }
                field(withLid; Rec."With Lid") { Caption = 'With Lid'; }
                field(weightClassification; Rec."Weight Classification NOTO") { Caption = 'Weight Classification'; }

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

                // 50000 ItemExt
                field(itemBodyType; Rec."ItemBodyType")
                {
                    Caption = 'Item Body Type';
                }
                field(itemBodyTypeInt; ItemBodyTypeInt)
                {
                    Caption = 'Item Body Type INT';
                }

                // System fields (✅ nødvendige for incremental load)
                field(systemCreatedAt; Rec.SystemCreatedAt) { Caption = 'systemCreatedAt'; }
                field(systemCreatedBy; Rec.SystemCreatedBy) { Caption = 'systemCreatedBy'; }
                field(systemModifiedAt; Rec.SystemModifiedAt) { Caption = 'systemModifiedAt'; }
                field(systemModifiedBy; Rec.SystemModifiedBy) { Caption = 'systemModifiedBy'; }
            }
        }
    }

    var
        TypeInt: Integer;
        ItemBodyTypeInt: Integer;

    trigger OnAfterGetRecord()
    begin
        // Enum/Option → INT mirrors (DW stability)
        TypeInt := Rec.Type.AsInteger();
        ItemBodyTypeInt := Rec."ItemBodyType".AsInteger();
    end;
}
