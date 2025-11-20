page 50266 "ShipmentMethodAPI"
{
    /// <summary>
    /// Date        Name                    Version   Description
    /// 2025.11.20  Business Central AL     001.0     API page for Shipment Method (table 10)
    /// </summary>

    Caption = 'ShipmentMethodAPI';
    AdditionalSearchTerms = 'SCANPAN, API, datawarehouse, dw';
    UsageCategory = Administration;

    PageType = API;
    APIPublisher = 'scanpan';
    APIGroup = 'datawarehouse';
    APIVersion = 'beta', 'v1.0';

    EntitySetName = 'shipmentMethods';
    EntityName = 'shipmentMethod';

    DelayedInsert = true;
    Editable = false;

    SourceTable = "Shipment Method";
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
                field(code; Rec.Code)                { Caption = 'Code'; }

                // --- Descriptive ---
                field(description; Rec.Description)  { Caption = 'Description'; }

                // --- System fields ---
                field(systemId; Rec.SystemId)                 { Caption = 'SystemId'; }
                field(systemCreatedAt; Rec.SystemCreatedAt)   { Caption = 'SystemCreatedAt'; }
                field(systemCreatedBy; Rec.SystemCreatedBy)   { Caption = 'SystemCreatedBy'; }
                field(systemModifiedAt; Rec.SystemModifiedAt) { Caption = 'SystemModifiedAt'; }
                field(systemModifiedBy; Rec.SystemModifiedBy) { Caption = 'SystemModifiedBy'; }
            }
        }
    }

    // Ingen Option/Enum-felter i standard → ingen INT-spejle.
    // Hvis I har egne Option/Enum felter via tableextensions, kan de spejles her i OnAfterGetRecord().
}
