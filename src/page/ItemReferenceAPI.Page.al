/// <summary>
/// API Page: Item Reference API v1 (table 5777 "Item Reference").
/// </summary>
/// <remarks>
/// 2024.11  Initial version. Includes integer mirror for Reference Type, AdditionalSearchTerms,
/// subjectName and additionalCaption convenience fields. No prefix per customer request.
/// </remarks>
page 50236 "ItemReferenceAPI"
{
    PageType = API;
    Caption = 'Item Reference API v1';
    APIPublisher = 'custom';
    APIGroup = 'items';
    APIVersion = 'v1.0';

    EntityName = 'item_reference';
    EntitySetName = 'item_references';

    SourceTable = "Item Reference"; // table 5777
    ODataKeyFields = SystemId;
    DelayedInsert = true;
    Extensible = false;

    InsertAllowed = true;
    ModifyAllowed = true;
    DeleteAllowed = true;

    // Discoverability in clients and search
    AdditionalSearchTerms = 'Item Reference, Barcode, EAN, UPC, Customer Item, Vendor Item, Alt Item No';

    layout
    {
        area(content)
        {
            repeater(General)
            {
                // Identity
                field(id; Rec.SystemId) { Caption = 'Id'; Editable = false; }

                // Item context
                field(itemNo; Rec."Item No.") { Caption = 'Item No.'; }
                field(variantCode; Rec."Variant Code") { Caption = 'Variant Code'; }
                field(unitOfMeasure; Rec."Unit of Measure")
                {
                    Caption = 'Unit of Measure';
                }

                // Reference core
                field(referenceType; Rec."Reference Type")
                {
                    Caption = 'Reference Type'; // Enum "Item Reference Type"
                }
                // Integer mirror of enum/option (read-only)
                field(referenceTypeInt; ReferenceTypeInt)
                {
                    Caption = 'Reference Type (Int)';
                    Editable = false;
                }
                field(referenceTypeNo; Rec."Reference Type No.")
                {
                    Caption = 'Reference Type No.';
                }
                field(referenceNo; Rec."Reference No.")
                {
                    Caption = 'Reference No.';
                }
                field(description; Rec.Description) { Caption = 'Description'; }
                field(description2; Rec."Description 2") { Caption = 'Description 2'; }

                // Convenience (read-only)
                field(subjectName; SubjectNameTxt)
                {
                    Caption = 'Subject Name';
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
        // Computed mirrors / text
        ReferenceTypeInt: Integer;
        SubjectNameTxt: Text[100];
        AdditionalCaptionTxt: Text[150];

    trigger OnAfterGetRecord()
    begin
        ReferenceTypeInt := GetReferenceTypeInt(Rec."Reference Type");
        SubjectNameTxt := GetSubjectName(Rec."Reference Type", Rec."Reference Type No.");

        if Rec.Description <> '' then
            AdditionalCaptionTxt := StrSubstNo('%1 - %2', Rec."Reference No.", Rec.Description)
        else
            AdditionalCaptionTxt := Format(Rec."Reference No.");
        AdditionalCaptionTxt := CopyStr(AdditionalCaptionTxt, 1, MaxStrLen(AdditionalCaptionTxt));
    end;

    local procedure GetReferenceTypeInt(RefType: Enum "Item Reference Type"): Integer
    begin
        // Provide stable integers for integrations (do NOT rely on enum ordinals).
        // Adjust only when adding new enum values (then publish a v2 API).
        case RefType of
            RefType::" ":
                exit(0);
            RefType::Customer:
                exit(1);
            RefType::Vendor:
                exit(2);
            // Some versions may include more values; map them explicitly here:
            // RefType::"Bar Code": exit(3);
            else
                exit(-1);
        end;
    end;

    local procedure GetSubjectName(RefType: Enum "Item Reference Type"; RefNo: Code[20]): Text[100]
    var
        Cust: Record Customer;
        Vend: Record Vendor;
    begin
        if RefNo = '' then
            exit('');
        case RefType of
            RefType::Customer:
                if Cust.Get(RefNo) then
                    exit(CopyStr(Cust.Name, 1, 100));
            RefType::Vendor:
                if Vend.Get(RefNo) then
                    exit(CopyStr(Vend.Name, 1, 100));
        end;
        exit('');
    end;
}
