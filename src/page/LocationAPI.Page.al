page 50238 "LocationAPI"
{
    /// <summary>
    /// Date        Name                        Version   Description
    /// 2025.11.20  Business Central AL Asst.   001.0     API page for Location (table 14)
    /// </summary>

    Caption = 'LocationAPI';
    AdditionalSearchTerms = 'SCANPAN, API, datawarehouse, dw';
    UsageCategory = Administration;

    PageType = API;
    APIPublisher = 'scanpan';
    APIGroup = 'datawarehouse';
    APIVersion = 'beta', 'v1.0';

    EntitySetName = 'locations';
    EntityName = 'location';

    DelayedInsert = true;
    Editable = false;

    SourceTable = Location;
    SourceTableView = sorting(Code) order(ascending);
    ODataKeyFields = Code;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                Caption = 'Group';

                // --- Key ---
                field(code; Rec.Code) { Caption = 'Code'; }

                // --- Descriptive / address ---
                field(name; Rec.Name) { Caption = 'Name'; }
                field(address; Rec.Address) { Caption = 'Address'; }
                field(address2; Rec."Address 2") { Caption = 'Address 2'; }
                field(city; Rec.City) { Caption = 'City'; }
                field(postCode; Rec."Post Code") { Caption = 'Post Code'; }
                field(county; Rec.County) { Caption = 'County'; }
                field(countryRegionCode; Rec."Country/Region Code") { Caption = 'Country/Region Code'; }
                field(contact; Rec.Contact) { Caption = 'Contact'; }
                field(phoneNo; Rec."Phone No.") { Caption = 'Phone No.'; }
                field(email; Rec."E-Mail") { Caption = 'E-Mail'; }

                // --- Warehouse controls (booleans & parameters) ---
                field(useAsInTransit; Rec."Use As In-Transit") { Caption = 'Use As In-Transit'; }
                field(requireReceive; Rec."Require Receive") { Caption = 'Require Receive'; }
                field(requireShipment; Rec."Require Shipment") { Caption = 'Require Shipment'; }
                field(requirePutAway; Rec."Require Put-away") { Caption = 'Require Put-away'; }
                field(requirePick; Rec."Require Pick") { Caption = 'Require Pick'; }
                field(binMandatory; Rec."Bin Mandatory") { Caption = 'Bin Mandatory'; }
                field(directedPutAwayPick; Rec."Directed Put-away and Pick") { Caption = 'Directed Put-away and Pick'; }
                field(useCrossDocking; Rec."Use Cross-Docking") { Caption = 'Use Cross-Docking'; }
                field(inboundWhseHandlingTime; Rec."Inbound Whse. Handling Time") { Caption = 'Inbound Whse. Handling Time'; }
                field(outboundWhseHandlingTime; Rec."Outbound Whse. Handling Time") { Caption = 'Outbound Whse. Handling Time'; }
                field(crossDockDueDateCalc; Rec."Cross-Dock Due Date Calc.") { Caption = 'Cross-Dock Due Date Calc.'; }

                // --- Default bins and posting ---
                field(receiptBinCode; Rec."Receipt Bin Code") { Caption = 'Receipt Bin Code'; }
                field(shipmentBinCode; Rec."Shipment Bin Code") { Caption = 'Shipment Bin Code'; }
                //field(pickBinCode; Rec."Pick Bin Code")             { Caption = 'Pick Bin Code'; }
                //field(putAwayBinCode; Rec."Put-away Bin Code")      { Caption = 'Put-away Bin Code'; }
                field(adjustmentBinCode; Rec."Adjustment Bin Code") { Caption = 'Adjustment Bin Code'; }
                field(toProdBinCode; Rec."To-Production Bin Code") { Caption = 'To-Production Bin Code'; }
                field(fromProdBinCode; Rec."From-Production Bin Code") { Caption = 'From-Production Bin Code'; }
                //field(assemblyBinCode; Rec."Assembly Bin Code")     { Caption = 'Assembly Bin Code'; }

                // --- System fields ---
                field(systemId; Rec.SystemId) { Caption = 'SystemId'; }
                field(systemCreatedAt; Rec.SystemCreatedAt) { Caption = 'SystemCreatedAt'; }
                field(systemCreatedBy; Rec.SystemCreatedBy) { Caption = 'SystemCreatedBy'; }
                field(systemModifiedAt; Rec.SystemModifiedAt) { Caption = 'SystemModifiedAt'; }
                field(systemModifiedBy; Rec.SystemModifiedBy) { Caption = 'SystemModifiedBy'; }
            }
        }
    }

    // --- Option/Enum spejle ---
    // Standard Location (table 14) indeholder typisk ikke Option/Enum-felter.
    // Hvis du har egne Option/Enum felter via tableextension, kan du spejle dem sådan her:
    //
    // var
    //     myEnumInt: Integer;
    //
    // trigger OnAfterGetRecord()
    // begin
    //     // For Enum:
    //     // myEnumInt := Rec."My Enum Field".AsInteger();
    //     // For Option:
    //     // myEnumInt := Rec."My Option Field";
    // end;
}
