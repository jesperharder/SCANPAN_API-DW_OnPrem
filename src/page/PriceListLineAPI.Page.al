page 50240 "PriceListLineAPI"
{
    /// <summary>
    /// Date        Name                        Version   Description
    /// 2025.11.20  Business Central AL Asst.   001.0     API page for Price List Line (table "Price List Line")
    /// </summary>

    Caption = 'PriceListLineAPI';
    AdditionalSearchTerms = 'SCANPAN, API, datawarehouse, dw';
    UsageCategory = Administration;

    PageType = API;
    APIPublisher = 'scanpan';
    APIGroup = 'datawarehouse';
    APIVersion = 'beta', 'v1.0';

    EntitySetName = 'priceListLines';
    EntityName = 'priceListLine';

    DelayedInsert = true;
    Editable = false;

    SourceTable = "Price List Line";
    SourceTableView = sorting(SystemId) order(ascending);
    ODataKeyFields = SystemId;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                Caption = 'Group';

                // --- Key (OData) ---
                field(systemId; Rec.SystemId) { Caption = 'SystemId'; }

                // --- Header/Relation ---
                field(priceListCode; Rec."Price List Code") { Caption = 'Price List Code'; }
                field(lineNo; Rec."Line No.") { Caption = 'Line No.'; }

                // --- Enums/Options + INT spejle ---
                field(status; Rec.Status) { Caption = 'Status'; }
                field(statusInt; statusInt) { Caption = 'Status INT'; }

                field(sourceType; Rec."Source Type") { Caption = 'Source Type'; }
                field(sourceTypeInt; sourceTypeInt) { Caption = 'Source Type INT'; }

                field(assetType; Rec."Asset Type") { Caption = 'Asset Type'; }
                field(assetTypeInt; assetTypeInt) { Caption = 'Asset Type INT'; }

                // --- Applies-to/Source ---
                field(sourceNo; Rec."Source No.") { Caption = 'Source No.'; }
                //field(sourceSubtype; Rec."Source Subtype")    { Caption = 'Source Subtype'; } // hvis findes

                // --- Asset (hvad prisen gælder) ---
                field(assetNo; Rec."Asset No.") { Caption = 'Asset No.'; }
                field(unitOfMeasureCode; Rec."Unit of Measure Code") { Caption = 'Unit of Measure Code'; }

                // --- Dates/filters ---
                field(startingDate; Rec."Starting Date") { Caption = 'Starting Date'; }
                field(endingDate; Rec."Ending Date") { Caption = 'Ending Date'; }
                field(minimumQuantity; Rec."Minimum Quantity") { Caption = 'Minimum Quantity'; }
                field(currencyCode; Rec."Currency Code") { Caption = 'Currency Code'; }

                // --- Price/amounts ---
                field(unitPrice; Rec."Unit Price") { Caption = 'Unit Price'; }           // hvis findes i din version
                field(lineAmount; Rec."Line Amount") { Caption = 'Line Amount'; }           // ofte brugt i nye prislinjer
                field(lineDiscountPct; Rec."Line Discount %") { Caption = 'Line Discount %'; }       // hvis findes
                field(priceIncludesVAT; Rec."Price Includes VAT") { Caption = 'Price Includes VAT'; }

                // --- System (audit) ---
                field(systemCreatedAt; Rec.SystemCreatedAt) { Caption = 'SystemCreatedAt'; }
                field(systemCreatedBy; Rec.SystemCreatedBy) { Caption = 'SystemCreatedBy'; }
                field(systemModifiedAt; Rec.SystemModifiedAt) { Caption = 'SystemModifiedAt'; }
                field(systemModifiedBy; Rec.SystemModifiedBy) { Caption = 'SystemModifiedBy'; }
            }
        }
    }

    var
        statusInt: Integer;
        sourceTypeInt: Integer;
        assetTypeInt: Integer;

    trigger OnAfterGetRecord()
    begin
        // Enum/Option -> Int spejle
        // I nyere BC er felterne Enums: brug AsInteger(). Hvis Option i jeres version, kan direkte tildeling bruges.
        statusInt := Rec.Status.AsInteger();
        sourceTypeInt := Rec."Source Type".AsInteger();
        assetTypeInt := Rec."Asset Type".AsInteger();
    end;
}
