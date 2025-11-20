page 50276 "TransferHeaderAPI"
{
    /// <summary>
    /// Date        Name                    Version   Description
    /// 2025.11.20  Business Central AL     001.0     API page for Transfer Header (table 5740)
    /// </summary>

    Caption = 'TransferHeaderAPI';
    AdditionalSearchTerms = 'SCANPAN, API, datawarehouse, dw, transfer order';
    UsageCategory = Administration;

    PageType = API;
    APIPublisher = 'scanpan';
    APIGroup = 'datawarehouse';
    APIVersion = 'beta', 'v1.0';

    EntitySetName = 'transferHeaders';
    EntityName = 'transferHeader';

    DelayedInsert = true;
    Editable = false;

    SourceTable = "Transfer Header";
    SourceTableView = sorting("No.") order(ascending);
    ODataKeyFields = "No.";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                Caption = 'Group';

                // --- Key ---
                field(no; Rec."No.")                                      { Caption = 'No.'; }

                // --- Locations / bins ---
                field(transferFromCode; Rec."Transfer-from Code")         { Caption = 'Transfer-from Code'; }
                //field(transferFromBinCode; Rec."Transfer-from Bin Code")  { Caption = 'Transfer-from Bin Code'; }
                field(transferToCode; Rec."Transfer-to Code")             { Caption = 'Transfer-to Code'; }
                //field(transferToBinCode; Rec."Transfer-to Bin Code")      { Caption = 'Transfer-to Bin Code'; }
                field(inTransitCode; Rec."In-Transit Code")               { Caption = 'In-Transit Code'; }
                field(directTransfer; Rec."Direct Transfer")              { Caption = 'Direct Transfer'; }

                // --- Dates ---
                field(postingDate; Rec."Posting Date")                    { Caption = 'Posting Date'; }
                field(shipmentDate; Rec."Shipment Date")                  { Caption = 'Shipment Date'; }
                field(receiptDate; Rec."Receipt Date")                    { Caption = 'Receipt Date'; }

                // --- Shipping setup ---
                field(shipmentMethodCode; Rec."Shipment Method Code")     { Caption = 'Shipment Method Code'; }
                field(shippingAgentCode; Rec."Shipping Agent Code")       { Caption = 'Shipping Agent Code'; }
                field(shippingAgentServiceCode; Rec."Shipping Agent Service Code") { Caption = 'Shipping Agent Service Code'; }

                // --- Responsibility / dimensions ---
                field(assignedUserId; Rec."Assigned User ID")             { Caption = 'Assigned User ID'; }
                field(shortcutDim1Code; Rec."Shortcut Dimension 1 Code")  { Caption = 'Shortcut Dimension 1 Code'; }
                field(shortcutDim2Code; Rec."Shortcut Dimension 2 Code")  { Caption = 'Shortcut Dimension 2 Code'; }

                // --- System fields ---
                field(systemId; Rec.SystemId)                             { Caption = 'SystemId'; }
                field(systemCreatedAt; Rec.SystemCreatedAt)               { Caption = 'SystemCreatedAt'; }
                field(systemCreatedBy; Rec.SystemCreatedBy)               { Caption = 'SystemCreatedBy'; }
                field(systemModifiedAt; Rec.SystemModifiedAt)             { Caption = 'SystemModifiedAt'; }
                field(systemModifiedBy; Rec.SystemModifiedBy)             { Caption = 'SystemModifiedBy'; }
            }
        }
    }

    // Ingen Option/Enum-felter i standard → ingen INT-spejle.
    // Hvis jeres miljø har egne Option/Enum-felter via tableextensions, så tilføj <felt>Int
    // og map i OnAfterGetRecord() med .AsInteger() (eller direkte ved Option).
}
