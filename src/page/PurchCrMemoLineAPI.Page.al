page 50248 "PurchCrMemoLineAPI"
{
    /// <summary>
    /// Date        Name                    Version   Description
    /// 2025.11.20  Business Central AL     001.0     API page for Purch. Cr. Memo Line (table 125)
    /// </summary>

    Caption = 'PurchCrMemoLineAPI';
    AdditionalSearchTerms = 'SCANPAN, API, datawarehouse, dw';
    UsageCategory = Administration;

    PageType = API;
    APIPublisher = 'scanpan';
    APIGroup = 'datawarehouse';
    APIVersion = 'beta', 'v1.0';

    EntitySetName = 'purchaseCreditMemoLines';
    EntityName = 'purchaseCreditMemoLine';

    DelayedInsert = true;
    Editable = false;

    SourceTable = "Purch. Cr. Memo Line";
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

                // --- Natural keys / relations ---
                field(documentNo; Rec."Document No.")                         { Caption = 'Document No.'; }
                field(lineNo; Rec."Line No.")                                 { Caption = 'Line No.'; }

                // --- Type (Enum/Option) + INT spejl ---
                field(type; Rec.Type)                                         { Caption = 'Type'; }
                field(typeInt; typeInt)                                       { Caption = 'Type INT'; }

                // --- Identity / item/G/L/charge ---
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
                field(directUnitCost; Rec."Direct Unit Cost")                 { Caption = 'Direct Unit Cost'; }
                field(lineDiscountPercent; Rec."Line Discount %")             { Caption = 'Line Discount %'; }
                field(lineDiscountAmount; Rec."Line Discount Amount")         { Caption = 'Line Discount Amount'; }
                field(lineAmount; Rec."Line Amount")                          { Caption = 'Line Amount'; }
                field(amountIncludingVAT; Rec."Amount Including VAT")         { Caption = 'Amount Including VAT'; }

                // --- VAT / posting groups ---
                field(vatProdPostingGroup; Rec."VAT Prod. Posting Group")     { Caption = 'VAT Prod. Posting Group'; }
                field(genBusPostingGroup; Rec."Gen. Bus. Posting Group")      { Caption = 'Gen. Bus. Posting Group'; }
                field(genProdPostingGroup; Rec."Gen. Prod. Posting Group")    { Caption = 'Gen. Prod. Posting Group'; }

                field(vatCalculationType; Rec."VAT Calculation Type")         { Caption = 'VAT Calculation Type'; }
                field(vatCalculationTypeInt; vatCalculationTypeInt)           { Caption = 'VAT Calculation Type INT'; }
                field(vatPercent; Rec."VAT %")                                 { Caption = 'VAT %'; }

                // --- Returns / application ---
                field(returnReasonCode; Rec."Return Reason Code")             { Caption = 'Return Reason Code'; }
                field(applToItemEntry; Rec."Appl.-to Item Entry")             { Caption = 'Appl.-to Item Entry'; }

                // --- Intercompany (hvis tilgængeligt i jeres base) ---
                field(icPartnerCode; Rec."IC Partner Code")                   { Caption = 'IC Partner Code'; }
                field(icPartnerRefType; Rec."IC Partner Ref. Type")           { Caption = 'IC Partner Ref. Type'; }
                field(icPartnerRefTypeInt; icPartnerRefTypeInt)               { Caption = 'IC Partner Ref. Type INT'; }
                //field(icPartnerRefNo; Rec."IC Partner Ref. No.")              { Caption = 'IC Partner Ref. No.'; }

                // --- System (audit) ---
                field(systemCreatedAt; Rec.SystemCreatedAt)                   { Caption = 'SystemCreatedAt'; }
                field(systemCreatedBy; Rec.SystemCreatedBy)                   { Caption = 'SystemCreatedBy'; }
                field(systemModifiedAt; Rec.SystemModifiedAt)                 { Caption = 'SystemModifiedAt'; }
                field(systemModifiedBy; Rec.SystemModifiedBy)                 { Caption = 'SystemModifiedBy'; }
            }
        }
    }

    var
        typeInt: Integer;
        vatCalculationTypeInt: Integer;
        icPartnerRefTypeInt: Integer;

    trigger OnAfterGetRecord()
    begin
        // Enum/Option -> Integer spejle
        typeInt := Rec.Type.AsInteger(); // Option i ældre versioner: typeInt := Rec.Type;

        vatCalculationTypeInt := Rec."VAT Calculation Type".AsInteger();

        // Nogle W1-miljøer har ikke IC-felterne på denne tabel. Hvis feltet findes, spejles enum-værdien:
        // (Hvis ikke, kan linjen kommenteres ud.)
        icPartnerRefTypeInt := Rec."IC Partner Ref. Type".AsInteger();
    end;
}
