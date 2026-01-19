page 50236 "ItemReferenceAPI"
{
    /// <summary>
    /// 2025.12.17  Jesper Harder / DW Suite
    /// API page for Item Reference (table 5777) – DW-friendly (system fields + enum INT mirrors + convenience fields)
    /// </summary>

    Caption = 'ItemReferenceAPI';
    AdditionalSearchTerms = 'SCANPAN, API, datawarehouse, dw, Item Reference, Barcode, EAN, UPC, Customer Item, Vendor Item, Alt Item No';
    UsageCategory = Administration;

    PageType = API;
    APIPublisher = 'scanpan';
    APIGroup = 'datawarehouse';
    APIVersion = 'beta', 'v1.0';

    EntityName = 'itemReference';
    EntitySetName = 'itemReferences';

    SourceTable = "Item Reference";
    SourceTableView = sorting("Item No.", "Variant Code", "Unit of Measure", "Reference Type", "Reference Type No.", "Reference No.")
                      order(ascending);

    // DW: naturlig, sammensat nøgle (bedst til Synapse upsert)
    ODataKeyFields = "Item No.", "Variant Code", "Unit of Measure", "Reference Type", "Reference Type No.", "Reference No.";

    DelayedInsert = true;
    Editable = false;
    Extensible = false;

    InsertAllowed = false;
    ModifyAllowed = false;
    DeleteAllowed = false;

    Permissions =
        tabledata "Item Reference" = R,
        tabledata Customer = R,
        tabledata Vendor = R;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                Caption = 'Item Reference';

                // --- Key / context ---
                field(itemNo; Rec."Item No.") { Caption = 'Item No.'; }
                field(variantCode; Rec."Variant Code") { Caption = 'Variant Code'; }
                field(unitOfMeasure; Rec."Unit of Measure") { Caption = 'Unit of Measure'; }

                // --- Reference core ---
                field(referenceType; Rec."Reference Type") { Caption = 'Reference Type'; }
                field(referenceTypeInt; ReferenceTypeInt) { Caption = 'Reference Type INT'; }

                field(referenceTypeNo; Rec."Reference Type No.") { Caption = 'Reference Type No.'; }
                field(referenceNo; Rec."Reference No.") { Caption = 'Reference No.'; }

                field(description; Rec.Description) { Caption = 'Description'; }
                field(description2; Rec."Description 2") { Caption = 'Description 2'; }

                // --- Convenience fields ---
                field(subjectName; SubjectNameTxt) { Caption = 'Subject Name'; }
                field(additionalCaption; AdditionalCaptionTxt) { Caption = 'Additional Caption'; }

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
        ReferenceTypeInt: Integer;
        SubjectNameTxt: Text[100];
        AdditionalCaptionTxt: Text[150];

    trigger OnAfterGetRecord()
    begin
        // Enum -> INT mirror (stabil DW mapping)
        ReferenceTypeInt := Rec."Reference Type".AsInteger();

        // Convenience: subject name (Customer/Vendor)
        SubjectNameTxt := GetSubjectName(Rec."Reference Type", Rec."Reference Type No.");

        // Convenience: "REFNO - Description"
        if Rec.Description <> '' then
            AdditionalCaptionTxt := CopyStr(StrSubstNo('%1 - %2', Rec."Reference No.", Rec.Description), 1, 150)
        else
            AdditionalCaptionTxt := CopyStr(Format(Rec."Reference No."), 1, 150);
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
