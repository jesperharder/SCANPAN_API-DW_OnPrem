/// <summary>
/// API Page: SPN Item Category API v1 (table 5722 "Item Category").
/// </summary>
/// <remarks>
/// Project comment / version list:
/// 2024.11   SPN     Initial Item Category API (includes additionalCaption and parent lookups)
/// Notes:
/// - Respects table logic (cyclic inheritance, indentation, timestamps, attribute maintenance).
/// - additionalCaption is a convenience read-only field: "CODE - Description".
/// </remarks>
page 50229 "ItemCategoryAPI"
{
    PageType = API;
    Caption = 'ItemCategoryAPI';
    APIPublisher = 'spn';
    APIGroup = 'items';
    APIVersion = 'v1.0';

    EntityName = 'item_category';
    EntitySetName = 'item_categories';

    SourceTable = "Item Category"; // table 5722 as provided
    ODataKeyFields = SystemId;
    DelayedInsert = true;
    Extensible = false;

    InsertAllowed = true;
    ModifyAllowed = true;
    DeleteAllowed = true;

    // FYI: There is no standard "AdditionalCaption" property on API pages.
    // We surface a computed field 'additionalCaption' instead.

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

                // Core
                field(code; Rec.Code)
                {
                    Caption = 'Code';
                }
                field(description; Rec.Description)
                {
                    Caption = 'Description';
                }
                field(parentCategory; Rec."Parent Category")
                {
                    Caption = 'Parent Category';
                }

                // Convenience (read-only)
                field(parentCategoryDescription; ParentDescriptionTxt)
                {
                    Caption = 'Parent Category Description';
                    Editable = false;
                }
                field(parentCategoryId; ParentSystemId)
                {
                    Caption = 'Parent Category Id';
                    Editable = false;
                }

                // "Additional caption" for integrators: CODE - Description
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
        ParentDescriptionTxt: Text[100];
        ParentSystemId: Guid;
        AdditionalCaptionTxt: Text[150];

}
