page 50229 "ItemCategoryAPI"
{
    /// <summary>
    /// 2025.12.17  Jesper Harder / DW Suite
    /// API page for Item Category (table 5722) – DW-friendly (system fields + convenience lookups)
    /// </summary>

    Caption = 'ItemCategoryAPI';
    AdditionalSearchTerms = 'SCANPAN, API, datawarehouse, dw, item category';
    UsageCategory = Administration;

    PageType = API;
    APIPublisher = 'scanpan';
    APIGroup = 'datawarehouse';
    APIVersion = 'beta', 'v1.0';

    EntityName = 'itemCategory';
    EntitySetName = 'itemCategories';

    SourceTable = "Item Category";
    SourceTableView = sorting(Code) order(ascending);

    // DW: naturlig nøgle (stabil for joins)
    ODataKeyFields = Code;

    DelayedInsert = true;
    Editable = false;
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
                Caption = 'Item Category';

                // --- Key / identity ---
                field(code; Rec.Code) { Caption = 'Code'; }
                field(description; Rec.Description) { Caption = 'Description'; }

                // --- Hierarchy ---
                field(parentCategory; Rec."Parent Category") { Caption = 'Parent Category'; }

                // Convenience (read-only)
                field(parentCategoryDescription; ParentDescriptionTxt)
                {
                    Caption = 'Parent Category Description';
                }
                field(parentCategorySystemId; ParentSystemId)
                {
                    Caption = 'Parent Category SystemId';
                }
                field(additionalCaption; AdditionalCaptionTxt)
                {
                    Caption = 'Additional Caption';
                }

                // --- System fields (for incremental loads) ---
                field(systemId; Rec.SystemId) { Caption = 'SystemId'; }
                field(systemCreatedAt; Rec.SystemCreatedAt) { Caption = 'SystemCreatedAt'; }
                field(systemCreatedBy; Rec.SystemCreatedBy) { Caption = 'SystemCreatedBy'; }
                field(systemModifiedAt; Rec.SystemModifiedAt) { Caption = 'SystemModifiedAt'; }
                field(systemModifiedBy; Rec.SystemModifiedBy) { Caption = 'SystemModifiedBy'; }
            }
        }
    }

    var
        ParentDescriptionTxt: Text[100];
        ParentSystemId: Guid;
        AdditionalCaptionTxt: Text[150];

    trigger OnAfterGetRecord()
    var
        ParentCat: Record "Item Category";
    begin
        Clear(ParentDescriptionTxt);
        Clear(ParentSystemId);
        Clear(AdditionalCaptionTxt);

        // "CODE - Description" convenience
        if Rec.Description <> '' then
            AdditionalCaptionTxt := CopyStr(Rec.Code + ' - ' + Rec.Description, 1, MaxStrLen(AdditionalCaptionTxt))
        else
            AdditionalCaptionTxt := CopyStr(Rec.Code, 1, MaxStrLen(AdditionalCaptionTxt));

        // Parent lookups
        if (Rec."Parent Category" <> '') and ParentCat.Get(Rec."Parent Category") then begin
            ParentDescriptionTxt := CopyStr(ParentCat.Description, 1, MaxStrLen(ParentDescriptionTxt));
            ParentSystemId := ParentCat.SystemId;
        end;
    end;
}
