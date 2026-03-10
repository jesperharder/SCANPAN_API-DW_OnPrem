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

                // Standard fields
                field(isoCode; Rec."ISO Code") { Caption = 'ISO Code'; }
                field(isoNumericCode; Rec."ISO Numeric Code") { Caption = 'ISO Numeric Code'; }
                field(euCountryRegionCode; Rec."EU Country/Region Code") { Caption = 'EU Country/Region Code'; }
                field(intrastatCode; Rec."Intrastat Code") { Caption = 'Intrastat Code'; }
                field(addressFormat; Rec."Address Format") { Caption = 'Address Format'; }
                field(addressFormatInt; addressFormatInt) { Caption = 'Address Format INT'; }
                field(contactAddressFormat; Rec."Contact Address Format") { Caption = 'Contact Address Format'; }
                field(contactAddressFormatInt; contactAddressFormatInt) { Caption = 'Contact Address Format INT'; }
                field(vatScheme; Rec."VAT Scheme") { Caption = 'VAT Scheme'; }
                field(lastModifiedDateTime; Rec."Last Modified Date Time") { Caption = 'Last Modified Date Time'; }
                field(countyName; Rec."County Name") { Caption = 'County Name'; }

                // Extension fields
                field(freightCurrencyCode; Rec."Freight Currency Code") { Caption = 'Freight Currency Code'; }
                field(freightAmount; Rec."Freight Amount") { Caption = 'Freight Amount'; }
                field(freightOrderMinAmount; Rec."Freight - Order min. Amount") { Caption = 'Freight - Order min. Amount'; }
                field(freightGLAccountNo; Rec."Freight - G/L Account No.") { Caption = 'Freight - G/L Account No.'; }
                field(freightDescription; Rec."Freight - Description") { Caption = 'Freight - Description'; }
                field(salesMarket; Rec."SalesMarket") { Caption = 'Sales Market'; }
                field(marketTypes; Rec."Market Types") { Caption = 'Market Types'; }
                field(marketTypesInt; marketTypesInt) { Caption = 'Market Types INT'; }
                field(channelTypes; Rec."Channel Types") { Caption = 'Channel Types'; }
                field(channelTypesInt; channelTypesInt) { Caption = 'Channel Types INT'; }

                // System fields
                field(systemId; Rec.SystemId) { Caption = 'SystemId'; }
                field(systemCreatedAt; Rec.SystemCreatedAt) { Caption = 'SystemCreatedAt'; }
                field(systemCreatedBy; Rec.SystemCreatedBy) { Caption = 'SystemCreatedBy'; }
                field(systemModifiedAt; Rec.SystemModifiedAt) { Caption = 'SystemModifiedAt'; }
                field(systemModifiedBy; Rec.SystemModifiedBy) { Caption = 'SystemModifiedBy'; }
            }
        }
    }

    var
        addressFormatInt: Integer;
        contactAddressFormatInt: Integer;
        marketTypesInt: Integer;
        channelTypesInt: Integer;

    trigger OnAfterGetRecord()
    begin
        // Option -> integer mirrors for DW mapping stability
        case Rec."Address Format" of
            Rec."Address Format"::"Post Code+City":
                addressFormatInt := 0;
            Rec."Address Format"::"City+Post Code":
                addressFormatInt := 1;
            Rec."Address Format"::"City+County+Post Code":
                addressFormatInt := 2;
            Rec."Address Format"::"Blank Line+Post Code+City":
                addressFormatInt := 3;
            Rec."Address Format"::Custom:
                addressFormatInt := 13;
            else
                addressFormatInt := -1;
        end;

        case Rec."Contact Address Format" of
            Rec."Contact Address Format"::First:
                contactAddressFormatInt := 0;
            Rec."Contact Address Format"::"After Company Name":
                contactAddressFormatInt := 1;
            Rec."Contact Address Format"::Last:
                contactAddressFormatInt := 2;
            else
                contactAddressFormatInt := -1;
        end;

        // Enums -> integer mirrors
        marketTypesInt := Rec."Market Types".AsInteger();
        channelTypesInt := Rec."Channel Types".AsInteger();
    end;
}
