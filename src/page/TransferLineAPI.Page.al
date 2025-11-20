page 50277 "TransferLineAPI"
{
    /// <summary>
    /// Date        Name                    Version   Description
    /// 2025.11.20  Business Central AL     001.0     API page for Transfer Line (table 5741)
    /// </summary>

    Caption = 'TransferLineAPI';
    AdditionalSearchTerms = 'SCANPAN, API, datawarehouse, dw, transfer order, line';
    UsageCategory = Administration;

    PageType = API;
    APIPublisher = 'scanpan';
    APIGroup = 'datawarehouse';
    APIVersion = 'beta', 'v1.0';

    EntitySetName = 'transferLines';
    EntityName = 'transferLine';

    DelayedInsert = true;
    Editable = false;

    SourceTable = "Transfer Line";
    SourceTableView = sorting(SystemId) order(ascending);
    ODataKeyFields = SystemId;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                Caption = 'Group';

                // --- OData key / identity ---
                field(systemId; Rec.SystemId)                         { Caption = 'SystemId'; }
                field(documentNo; Rec."Document No.")                 { Caption = 'Document No.'; }
                field(lineNo; Rec."Line No.")                         { Caption = 'Line No.'; }

                // --- Item identity ---
                field(itemNo; Rec."Item No.")                         { Caption = 'Item No.'; }
                field(variantCode; Rec."Variant Code")                { Caption = 'Variant Code'; }
                field(description; Rec.Description)                   { Caption = 'Description'; }
                field(unitOfMeasureCode; Rec."Unit of Measure Code")  { Caption = 'Unit of Measure Code'; }

                // --- From / To location/bin ---
                field(transferFromCode; Rec."Transfer-from Code")     { Caption = 'Transfer-from Code'; }
                field(transferFromBinCode; Rec."Transfer-from Bin Code") { Caption = 'Transfer-from Bin Code'; }
                field(transferToCode; Rec."Transfer-to Code")         { Caption = 'Transfer-to Code'; }
                field(transferToBinCode; Rec."Transfer-to Bin Code")  { Caption = 'Transfer-to Bin Code'; }
                field(inTransitCode; Rec."In-Transit Code")           { Caption = 'In-Transit Code'; }

                // --- Quantities ---
                field(quantity; Rec.Quantity)                         { Caption = 'Quantity'; }
                field(quantityBase; Rec."Quantity (Base)")            { Caption = 'Quantity (Base)'; }
                field(qtyToShip; Rec."Qty. to Ship")                  { Caption = 'Qty. to Ship'; }
                field(qtyToReceive; Rec."Qty. to Receive")            { Caption = 'Qty. to Receive'; }
                //field(qtyShipped; Rec."Qty. Shipped")                 { Caption = 'Qty. Shipped'; }
                //field(qtyReceived; Rec."Qty. Received")               { Caption = 'Qty. Received'; }
                field(outstandingQuantity; Rec."Outstanding Quantity"){ Caption = 'Outstanding Quantity'; }

                // --- Dates ---
                field(shipmentDate; Rec."Shipment Date")              { Caption = 'Shipment Date'; }
                field(receiptDate; Rec."Receipt Date")                { Caption = 'Receipt Date'; }

                // --- Shipping agent (if used on line) ---
                field(shippingAgentCode; Rec."Shipping Agent Code")   { Caption = 'Shipping Agent Code'; }
                field(shippingAgentServiceCode; Rec."Shipping Agent Service Code") { Caption = 'Shipping Agent Service Code'; }

                // --- System (audit) ---
                field(systemCreatedAt; Rec.SystemCreatedAt)           { Caption = 'SystemCreatedAt'; }
                field(systemCreatedBy; Rec.SystemCreatedBy)           { Caption = 'SystemCreatedBy'; }
                field(systemModifiedAt; Rec.SystemModifiedAt)         { Caption = 'SystemModifiedAt'; }
                field(systemModifiedBy; Rec.SystemModifiedBy)         { Caption = 'SystemModifiedBy'; }
            }
        }
    }

    // Ingen Option/Enum-felter i standard → ingen INT-spejle.
    // Hvis jeres extension tilføjer Enum/Option felter, så læg <felt>Int i var-sektion
    // og map i OnAfterGetRecord() med .AsInteger() (eller direkte for Option).
}
