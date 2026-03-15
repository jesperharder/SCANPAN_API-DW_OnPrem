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
                field(systemId; Rec.SystemId)                              { Caption = 'SystemId'; }
                field(documentNo; Rec."Document No.")                      { Caption = 'Document No.'; }
                field(lineNo; Rec."Line No.")                              { Caption = 'Line No.'; }

                // --- Status ---
                field(status; Rec.Status)                                  { Caption = 'Status'; }
                field(statusInt; statusInt)                                { Caption = 'Status INT'; }

                // --- Item identity ---
                field(itemNo; Rec."Item No.")                              { Caption = 'Item No.'; }
                field(variantCode; Rec."Variant Code")                     { Caption = 'Variant Code'; }
                field(description; Rec.Description)                        { Caption = 'Description'; }
                field(description2; Rec."Description 2")                   { Caption = 'Description 2'; }
                field(unitOfMeasureCode; Rec."Unit of Measure Code")       { Caption = 'Unit of Measure Code'; }
                field(qtyPerUnitOfMeasure; Rec."Qty. per Unit of Measure") { Caption = 'Qty. per Unit of Measure'; }
                field(itemCategoryCode; Rec."Item Category Code")          { Caption = 'Item Category Code'; }

                // --- From / To location/bin ---
                field(transferFromCode; Rec."Transfer-from Code")          { Caption = 'Transfer-from Code'; }
                field(transferFromBinCode; Rec."Transfer-from Bin Code")   { Caption = 'Transfer-from Bin Code'; }
                field(transferToCode; Rec."Transfer-to Code")              { Caption = 'Transfer-to Code'; }
                field(transferToBinCode; Rec."Transfer-To Bin Code")       { Caption = 'Transfer-To Bin Code'; }
                field(inTransitCode; Rec."In-Transit Code")                { Caption = 'In-Transit Code'; }

                // --- Quantities ---
                field(quantity; Rec.Quantity)                              { Caption = 'Quantity'; }
                field(quantityBase; Rec."Quantity (Base)")                 { Caption = 'Quantity (Base)'; }
                field(qtyToShip; Rec."Qty. to Ship")                       { Caption = 'Qty. to Ship'; }
                field(qtyToShipBase; Rec."Qty. to Ship (Base)")            { Caption = 'Qty. to Ship (Base)'; }
                field(qtyToReceive; Rec."Qty. to Receive")                 { Caption = 'Qty. to Receive'; }
                field(qtyToReceiveBase; Rec."Qty. to Receive (Base)")      { Caption = 'Qty. to Receive (Base)'; }
                field(qtyShipped; Rec."Quantity Shipped")                  { Caption = 'Quantity Shipped'; }
                field(qtyShippedBase; Rec."Qty. Shipped (Base)")           { Caption = 'Qty. Shipped (Base)'; }
                field(qtyReceived; Rec."Quantity Received")                { Caption = 'Quantity Received'; }
                field(qtyReceivedBase; Rec."Qty. Received (Base)")         { Caption = 'Qty. Received (Base)'; }
                field(outstandingQuantity; Rec."Outstanding Quantity")     { Caption = 'Outstanding Quantity'; }
                field(outstandingQtyBase; Rec."Outstanding Qty. (Base)")   { Caption = 'Outstanding Qty. (Base)'; }
                field(qtyInTransit; Rec."Qty. in Transit")                 { Caption = 'Qty. in Transit'; }
                field(qtyInTransitBase; Rec."Qty. in Transit (Base)")      { Caption = 'Qty. in Transit (Base)'; }

                // --- Dates ---
                field(shipmentDate; Rec."Shipment Date")                   { Caption = 'Shipment Date'; }
                field(receiptDate; Rec."Receipt Date")                     { Caption = 'Receipt Date'; }

                // --- Dimensions / relationships ---
                field(shortcutDim1Code; Rec."Shortcut Dimension 1 Code")   { Caption = 'Shortcut Dimension 1 Code'; }
                field(shortcutDim2Code; Rec."Shortcut Dimension 2 Code")   { Caption = 'Shortcut Dimension 2 Code'; }
                field(derivedFromLineNo; Rec."Derived From Line No.")      { Caption = 'Derived From Line No.'; }
                field(directTransfer; Rec."Direct Transfer")               { Caption = 'Direct Transfer'; }

                // --- Shipping agent ---
                field(shippingAgentCode; Rec."Shipping Agent Code")        { Caption = 'Shipping Agent Code'; }
                field(shippingAgentServiceCode; Rec."Shipping Agent Service Code") { Caption = 'Shipping Agent Service Code'; }

                // --- Completion flags ---
                field(completelyShipped; Rec."Completely Shipped")         { Caption = 'Completely Shipped'; }
                field(completelyReceived; Rec."Completely Received")       { Caption = 'Completely Received'; }

                // --- System (audit) ---
                field(systemCreatedAt; Rec.SystemCreatedAt)                { Caption = 'SystemCreatedAt'; }
                field(systemCreatedBy; Rec.SystemCreatedBy)                { Caption = 'SystemCreatedBy'; }
                field(systemModifiedAt; Rec.SystemModifiedAt)              { Caption = 'SystemModifiedAt'; }
                field(systemModifiedBy; Rec.SystemModifiedBy)              { Caption = 'SystemModifiedBy'; }
            }
        }
    }

    var
        statusInt: Integer;

    trigger OnAfterGetRecord()
    begin
        // Status er Option i standard Transfer Line
        statusInt := Rec.Status;
    end;
}