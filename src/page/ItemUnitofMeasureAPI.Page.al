page 50235 "ItemUnitofMeasureAPI"
{
    /// <summary>
    /// 2025.12.17  Jesper Harder / DW Suite
    /// API page for Item Unit of Measure (table 5404) – DW-friendly
    /// - Natural key: Item No. + Code
    /// - Read-only extract
    /// - Includes system fields for incremental loads
    /// - Convenience fields: itemDescription, uomDescription, additionalCaption
    /// </summary>

    Caption = 'ItemUnitofMeasureAPI';
    AdditionalSearchTerms = 'SCANPAN, API, datawarehouse, dw, item uom, unit of measure, pack size, qty per uom';

    UsageCategory = Administration;

    PageType = API;
    APIPublisher = 'scanpan';
    APIGroup = 'datawarehouse';
    APIVersion = 'beta', 'v1.0';

    EntityName = 'itemUnitOfMeasure';
    EntitySetName = 'itemUnitOfMeasures';

    SourceTable = "Item Unit of Measure";
    SourceTableView = sorting("Item No.", Code) order(ascending);

    // DW: stabil sammensat nøgle
    ODataKeyFields = "Item No.", Code;

    DelayedInsert = true;
    Extensible = false;

    // DW extract = read-only
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    DeleteAllowed = false;

    Permissions =
        tabledata "Item Unit of Measure" = R,
        tabledata Item = R,
        tabledata "Unit of Measure" = R;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                // --- Key ---
                field(itemNo; Rec."Item No.") { Caption = 'Item No.'; }
                field(code; Rec.Code) { Caption = 'Code'; }

                // --- Core ---
                field(qtyPerUnitOfMeasure; Rec."Qty. per Unit of Measure")
                {
                    Caption = 'Qty. per Unit of Measure';
                    DecimalPlaces = 0 : 5;
                }

                // --- Dimensions & weight ---
                field(length; Rec.Length) { Caption = 'Length'; DecimalPlaces = 0 : 5; }
                field(width; Rec.Width) { Caption = 'Width'; DecimalPlaces = 0 : 5; }
                field(height; Rec.Height) { Caption = 'Height'; DecimalPlaces = 0 : 5; }
                field(cubage; Rec.Cubage) { Caption = 'Cubage'; DecimalPlaces = 0 : 5; }
                field(weight; Rec.Weight) { Caption = 'Weight'; DecimalPlaces = 0 : 5; }

                // --- Convenience (read-only) ---
                field(itemDescription; ItemDescriptionTxt) { Caption = 'Item Description'; }
                field(uomDescription; UomDescriptionTxt) { Caption = 'UoM Description'; }
                field(additionalCaption; AdditionalCaptionTxt) { Caption = 'Additional Caption'; }

                // --- System fields (incremental load) ---
                field(systemId; Rec.SystemId) { Caption = 'SystemId'; }
                field(systemCreatedAt; Rec.SystemCreatedAt) { Caption = 'SystemCreatedAt'; }
                field(systemCreatedBy; Rec.SystemCreatedBy) { Caption = 'SystemCreatedBy'; }
                field(systemModifiedAt; Rec.SystemModifiedAt) { Caption = 'SystemModifiedAt'; }
                field(systemModifiedBy; Rec.SystemModifiedBy) { Caption = 'SystemModifiedBy'; }
            }
        }
    }

    var
        ItemDescriptionTxt: Text[100];
        UomDescriptionTxt: Text[100];
        AdditionalCaptionTxt: Text[150];

    trigger OnAfterGetRecord()
    begin
        ItemDescriptionTxt := GetItemDescription(Rec."Item No.");
        UomDescriptionTxt := GetUomDescription(Rec.Code);

        // "1000 / PCS — 1.00000"
        AdditionalCaptionTxt :=
            CopyStr(
                StrSubstNo('%1 / %2 — %3',
                    Rec."Item No.",
                    Rec.Code,
                    Format(Rec."Qty. per Unit of Measure")),
                1,
                MaxStrLen(AdditionalCaptionTxt));
    end;

    local procedure GetItemDescription(ItemNo: Code[20]): Text[100]
    var
        Item: Record Item;
    begin
        if (ItemNo <> '') and Item.Get(ItemNo) then
            exit(CopyStr(Item.Description, 1, 100));
        exit('');
    end;

    local procedure GetUomDescription(UomCode: Code[10]): Text[100]
    var
        Uom: Record "Unit of Measure";
    begin
        if (UomCode <> '') and Uom.Get(UomCode) then
            exit(CopyStr(Uom.Description, 1, 100));
        exit('');
    end;
}
