page 50262 "SalesLineAPI"
{
    /// <summary>
    /// Date        Name                    Version   Description
    /// 2025.11.20  Business Central AL     001.0     API page for Sales Line (table 37)
    /// </summary>

    Caption = 'SalesLineAPI';
    AdditionalSearchTerms = 'SCANPAN, API, datawarehouse, dw';
    UsageCategory = Administration;

    PageType = API;
    APIPublisher = 'scanpan';
    APIGroup = 'datawarehouse';
    APIVersion = 'beta', 'v1.0';

    EntitySetName = 'salesLines';
    EntityName = 'salesLine';

    DelayedInsert = true;
    Editable = false;

    SourceTable = "Sales Line";
    SourceTableView = sorting(SystemId) order(ascending);
    ODataKeyFields = SystemId;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                Caption = 'Group';

                // --- OData key ---
                field(systemId; Rec.SystemId)                                 { Caption = 'SystemId'; }

                // --- Document identity ---
                field(documentType; Rec."Document Type")                      { Caption = 'Document Type'; }
                field(documentTypeInt; documentTypeInt)                       { Caption = 'Document Type INT'; }
                field(documentNo; Rec."Document No.")                         { Caption = 'Document No.'; }
                field(lineNo; Rec."Line No.")                                 { Caption = 'Line No.'; }

                // --- Line identity ---
                field(type; Rec.Type)                                         { Caption = 'Type'; }
                field(typeInt; typeInt)                                       { Caption = 'Type INT'; }
                field(no; Rec."No.")                                          { Caption = 'No.'; }
                field(variantCode; Rec."Variant Code")                        { Caption = 'Variant Code'; }
                field(description; Rec.Description)                           { Caption = 'Description'; }
                field(description2; Rec."Description 2")                      { Caption = 'Description 2'; }

                // --- Location / bin / UoM ---
                field(locationCode; Rec."Location Code")                      { Caption = 'Location Code'; }
                field(binCode; Rec."Bin Code")                                { Caption = 'Bin Code'; }
                field(unitOfMeasureCode; Rec."Unit of Measure Code")          { Caption = 'Unit of Measure Code'; }

                // --- Quantities & pricing ---
                field(quantity; Rec.Quantity)                                 { Caption = 'Quantity'; }
                field(quantityBase; Rec."Quantity (Base)")                    { Caption = 'Quantity (Base)'; }
                field(unitPrice; Rec."Unit Price")                             { Caption = 'Unit Price'; }
                field(lineDiscountPercent; Rec."Line Discount %")             { Caption = 'Line Discount %'; }
                field(lineDiscountAmount; Rec."Line Discount Amount")         { Caption = 'Line Discount Amount'; }
                field(lineAmount; Rec."Line Amount")                          { Caption = 'Line Amount'; }
                field(amount; Rec.Amount)                                     { Caption = 'Amount'; }
                field(amountIncludingVAT; Rec."Amount Including VAT")         { Caption = 'Amount Including VAT'; }

                // --- Posting groups ---
                field(genProdPostingGroup; Rec."Gen. Prod. Posting Group")    { Caption = 'Gen. Prod. Posting Group'; }
                field(vatProdPostingGroup; Rec."VAT Prod. Posting Group")     { Caption = 'VAT Prod. Posting Group'; }

                // --- VAT ---
                field(vatCalculationType; Rec."VAT Calculation Type")         { Caption = 'VAT Calculation Type'; }
                field(vatCalculationTypeInt; vatCalculationTypeInt)           { Caption = 'VAT Calculation Type INT'; }
                field(vatPercent; Rec."VAT %")                                 { Caption = 'VAT %'; }

                // --- Shipment / application ---
                field(shipmentDate; Rec."Shipment Date")                      { Caption = 'Shipment Date'; }
                field(applToItemEntry; Rec."Appl.-to Item Entry")             { Caption = 'Appl.-to Item Entry'; }

                // --- System (audit) ---
                field(systemCreatedAt; Rec.SystemCreatedAt)                   { Caption = 'SystemCreatedAt'; }
                field(systemCreatedBy; Rec.SystemCreatedBy)                   { Caption = 'SystemCreatedBy'; }
                field(systemModifiedAt; Rec.SystemModifiedAt)                 { Caption = 'SystemModifiedAt'; }
                field(systemModifiedBy; Rec.SystemModifiedBy)                 { Caption = 'SystemModifiedBy'; }
            }
        }
    }

    var
        documentTypeInt: Integer;
        typeInt: Integer;
        vatCalculationTypeInt: Integer;

    trigger OnAfterGetRecord()
    begin
        // Enum/Option -> Integer spejle
        documentTypeInt := Rec."Document Type".AsInteger(); // Option i ældre versioner: documentTypeInt := Rec."Document Type";
        typeInt := Rec.Type.AsInteger();                    // Option i ældre versioner: typeInt := Rec.Type;
        vatCalculationTypeInt := Rec."VAT Calculation Type".AsInteger();
    end;
}
