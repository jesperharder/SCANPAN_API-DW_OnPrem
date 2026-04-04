page 50261 "SalesInvLineAPI"
{
    /// <summary>
    /// Date        Name                    Version   Description
    /// 2025.11.20  Business Central AL     001.0     API page for Sales Invoice Line (table 113)
    /// 2026.04.04  Codex                   001.1     Added fields required for RealisedSale V1 logic
    /// </summary>

    Caption = 'SalesInvLineAPI';
    AdditionalSearchTerms = 'SCANPAN, API, datawarehouse, dw';
    UsageCategory = Administration;

    PageType = API;
    APIPublisher = 'scanpan';
    APIGroup = 'datawarehouse';
    APIVersion = 'beta', 'v1.0';

    EntitySetName = 'salesInvoiceLines';
    EntityName = 'salesInvoiceLine';

    DelayedInsert = true;
    Editable = false;

    SourceTable = "Sales Invoice Line";
    SourceTableView = sorting(SystemId) order(ascending);
    ODataKeyFields = SystemId;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                Caption = 'Group';

                field(systemId; Rec.SystemId) { Caption = 'SystemId'; }

                field(documentNo; Rec."Document No.") { Caption = 'Document No.'; }
                field(lineNo; Rec."Line No.") { Caption = 'Line No.'; }

                field(type; Rec.Type) { Caption = 'Type'; }
                field(typeInt; typeInt) { Caption = 'Type INT'; }

                field(no; Rec."No.") { Caption = 'No.'; }
                field(variantCode; Rec."Variant Code") { Caption = 'Variant Code'; }
                field(description; Rec.Description) { Caption = 'Description'; }
                field(description2; Rec."Description 2") { Caption = 'Description 2'; }

                field(locationCode; Rec."Location Code") { Caption = 'Location Code'; }
                field(binCode; Rec."Bin Code") { Caption = 'Bin Code'; }
                field(unitOfMeasureCode; Rec."Unit of Measure Code") { Caption = 'Unit of Measure Code'; }
                field(yearCodeText; Rec."Yearcode Text") { Caption = 'Yearcode Text'; }

                field(quantity; Rec.Quantity) { Caption = 'Quantity'; }
                field(quantityBase; Rec."Quantity (Base)") { Caption = 'Quantity (Base)'; }
                field(unitPrice; Rec."Unit Price") { Caption = 'Unit Price'; }
                field(unitCost; Rec."Unit Cost") { Caption = 'Unit Cost'; }
                field(unitCostLCY; Rec."Unit Cost (LCY)") { Caption = 'Unit Cost (LCY)'; }
                field(lineDiscountPercent; Rec."Line Discount %") { Caption = 'Line Discount %'; }
                field(lineDiscountAmount; Rec."Line Discount Amount") { Caption = 'Line Discount Amount'; }
                field(lineAmount; Rec."Line Amount") { Caption = 'Line Amount'; }
                field(amount; Rec.Amount) { Caption = 'Amount'; }
                field(amountIncludingVAT; Rec."Amount Including VAT") { Caption = 'Amount Including VAT'; }

                field(shortcutDim1Code; Rec."Shortcut Dimension 1 Code") { Caption = 'Shortcut Dimension 1 Code'; }
                field(genBusPostingGroup; Rec."Gen. Bus. Posting Group") { Caption = 'Gen. Bus. Posting Group'; }
                field(genProdPostingGroup; Rec."Gen. Prod. Posting Group") { Caption = 'Gen. Prod. Posting Group'; }
                field(returnReasonCode; Rec."Return Reason Code") { Caption = 'Return Reason Code'; }
                field(dimensionSetId; Rec."Dimension Set ID") { Caption = 'Dimension Set ID'; }

                field(vatCalculationType; Rec."VAT Calculation Type") { Caption = 'VAT Calculation Type'; }
                field(vatCalculationTypeInt; vatCalculationTypeInt) { Caption = 'VAT Calculation Type INT'; }
                field(vatPercent; Rec."VAT %") { Caption = 'VAT %'; }
                field(vatProdPostingGroup; Rec."VAT Prod. Posting Group") { Caption = 'VAT Prod. Posting Group'; }

                field(shipmentDate; Rec."Shipment Date") { Caption = 'Shipment Date'; }
                field(applToItemEntry; Rec."Appl.-to Item Entry") { Caption = 'Appl.-to Item Entry'; }

                field(systemCreatedAt; Rec.SystemCreatedAt) { Caption = 'SystemCreatedAt'; }
                field(systemCreatedBy; Rec.SystemCreatedBy) { Caption = 'SystemCreatedBy'; }
                field(systemModifiedAt; Rec.SystemModifiedAt) { Caption = 'SystemModifiedAt'; }
                field(systemModifiedBy; Rec.SystemModifiedBy) { Caption = 'SystemModifiedBy'; }
            }
        }
    }

    var
        typeInt: Integer;
        vatCalculationTypeInt: Integer;

    trigger OnAfterGetRecord()
    begin
        typeInt := Rec.Type.AsInteger();
        vatCalculationTypeInt := Rec."VAT Calculation Type".AsInteger();
    end;
}
