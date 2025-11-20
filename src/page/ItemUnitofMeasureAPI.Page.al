/// <summary>
/// API Page: Item Unit of Measure API v1 (table 5404 "Item Unit of Measure").
/// </summary>
/// <remarks>
/// 2024.11  Initial version (no prefix). Includes convenience fields and AdditionalSearchTerms.
/// Note: Standard table has no enum/option fields, so no integer mirrors are added.
/// </remarks>
page 50235 "ItemUnitofMeasureAPI"
{
    PageType = API;
    Caption = 'ItemUnitofMeasureAPI';
    APIPublisher = 'custom';
    APIGroup = 'items';
    APIVersion = 'v1.0';

    EntityName = 'item_unit_of_measure';
    EntitySetName = 'item_unit_of_measures';

    SourceTable = "Item Unit of Measure";
    ODataKeyFields = SystemId;
    DelayedInsert = true;
    Extensible = false;

    InsertAllowed = true;
    ModifyAllowed = true;
    DeleteAllowed = true;

    AdditionalSearchTerms = 'Item UOM, Unit, Pack size, Packaging, Qty per UOM, Weight, Dimensions';

    layout
    {
        area(content)
        {
            repeater(General)
            {
                // Identity
                field(id; Rec.SystemId) { Caption = 'Id'; Editable = false; }

                // Core
                field(itemNo; Rec."Item No.") { Caption = 'Item No.'; }
                field(code; Rec.Code) { Caption = 'Code'; }
                field(qtyPerUnitOfMeasure; Rec."Qty. per Unit of Measure")
                {
                    Caption = 'Qty. per Unit of Measure';
                    DecimalPlaces = 0 : 5;
                }

                // Dimensions & weight (present on standard table)
                field(length; Rec.Length) { Caption = 'Length'; DecimalPlaces = 0 : 5; }
                field(width; Rec.Width) { Caption = 'Width'; DecimalPlaces = 0 : 5; }
                field(height; Rec.Height) { Caption = 'Height'; DecimalPlaces = 0 : 5; }
                field(cubage; Rec.Cubage) { Caption = 'Cubage'; DecimalPlaces = 0 : 5; }
                field(weight; Rec.Weight) { Caption = 'Weight'; DecimalPlaces = 0 : 5; }

                // Convenience (read-only)
                field(itemDescription; ItemDescriptionTxt)
                {
                    Caption = 'Item Description';
                    Editable = false;
                }
                field(uomDescription; UomDescriptionTxt)
                {
                    Caption = 'UoM Description';
                    Editable = false;
                }
                field(additionalCaption; AdditionalCaptionTxt)
                {
                    Caption = 'Additional Caption';
                    Editable = false;
                }
            }
        }
    }

    actions { }

    var
        ItemDescriptionTxt: Text[100];
        UomDescriptionTxt: Text[100];
        AdditionalCaptionTxt: Text[150];

    trigger OnAfterGetRecord()
    begin
        ItemDescriptionTxt := GetItemDescription(Rec."Item No.");
        UomDescriptionTxt := GetUomDescription(Rec.Code);

        // e.g. "1000 / PCS — 1.00000"
        AdditionalCaptionTxt :=
            CopyStr(
                StrSubstNo('%1 / %2 — %3',
                    Rec."Item No.",
                    Rec.Code,
                    Format(Rec."Qty. per Unit of Measure")),
                1, MaxStrLen(AdditionalCaptionTxt));
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
