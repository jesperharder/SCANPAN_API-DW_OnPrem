page 50204 "CountryRegionAPI"
{
    /// <summary>
    /// Date        Name                    Version   Description
    /// 2025.10.23  Business Central AL     001.0     API page for Country/Region (table 9)
    /// </summary>

    Caption = 'CountryRegionAPI';
    AdditionalSearchTerms = 'SCANPAN, API, datawarehouse, dw';
    UsageCategory = Administration;

    PageType = API;
    APIPublisher = 'scanpan';
    APIGroup = 'datawarehouse';
    APIVersion = 'beta', 'v1.0';

    EntitySetName = 'countryRegions';
    EntityName = 'countryRegion';

    DelayedInsert = true;
    Editable = false;

    SourceTable = 9; // Country/Region
    SourceTableView = sorting(Code) order(ascending);
    ODataKeyFields = Code;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                Caption = 'Group';

                // Key + basics
                field(code; Rec.Code) { Caption = 'Code'; }
                field(name; Rec.Name) { Caption = 'Name'; }

                // Common identifiers
                field(isoCode; Rec."ISO Code") { Caption = 'ISO Code'; }
                //field(euCountryRegion; Rec."EU Country/Region") { Caption = 'EU Country/Region'; } // Boolean

                // System fields
                field(systemId; Rec.SystemId) { Caption = 'SystemId'; }
                field(systemCreatedAt; Rec.SystemCreatedAt) { Caption = 'SystemCreatedAt'; }
                field(systemCreatedBy; Rec.SystemCreatedBy) { Caption = 'SystemCreatedBy'; }
                field(systemModifiedAt; Rec.SystemModifiedAt) { Caption = 'SystemModifiedAt'; }
                field(systemModifiedBy; Rec.SystemModifiedBy) { Caption = 'SystemModifiedBy'; }
            }
        }
    }
}
