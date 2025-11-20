page 50273 "TariffNumberAPI"
{
    /// <summary>
    /// Date        Name                    Version   Description
    /// 2025.11.20  Business Central AL     001.0     API page for Tariff Number (standard table, often id 5711)
    /// NOTE: If your environment uses a different table id/name, adjust SourceTable accordingly.
    /// </summary>

    Caption = 'TariffNumberAPI';
    AdditionalSearchTerms = 'SCANPAN, API, datawarehouse, dw, tariff, customs, intrastat';
    UsageCategory = Administration;

    PageType = API;
    APIPublisher = 'scanpan';
    APIGroup = 'datawarehouse';
    APIVersion = 'beta', 'v1.0';

    EntitySetName = 'tariffNumbers';
    EntityName = 'tariffNumber';

    DelayedInsert = true;
    Editable = false;

    // Standardnavn er normalt "Tariff Number"
    SourceTable = "Tariff Number";
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
                field(code; Rec."No.")                { Caption = 'Code'; }

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
    // Hvis jeres miljø har ekstra felter (fx "Supplementary Unit of Measure", "Customs Duty %"),
    // så sig til — så føjer jeg dem til (og evt. INT-spejle, hvis de er Enums/Options).
}
