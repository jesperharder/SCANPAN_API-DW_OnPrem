page 50203 "CompanyInformationAPI"
{
    /// <summary>
    /// Date        Name                    Version   Description
    /// 2025.10.23  Business Central AL     001.2     API page for Company Information (79) – fields aligned to posted table
    /// </summary>

    Caption = 'CompanyInformationAPI';
    AdditionalSearchTerms = 'SCANPAN, API, datawarehouse, dw';
    UsageCategory = Administration;

    PageType = API;
    APIPublisher = 'scanpan';
    APIGroup = 'datawarehouse';
    APIVersion = 'beta', 'v1.0';

    EntitySetName = 'companyInformation';
    EntityName = 'companyInfo';

    DelayedInsert = true;
    Editable = false;

    SourceTable = 79; // Company Information
    SourceTableView = sorting("Primary Key") order(ascending);
    ODataKeyFields = "Primary Key";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                Caption = 'Group';

                // Key
                field(primaryKey; Rec."Primary Key") { Caption = 'Primary Key'; }

                // Name / contact
                field(name; Rec.Name) { Caption = 'Name'; }
                field(name2; Rec."Name 2") { Caption = 'Name 2'; }
                field(contactPerson; Rec."Contact Person") { Caption = 'Contact Person'; }
                field(phoneNo; Rec."Phone No.") { Caption = 'Phone No.'; }
                field(phoneNo2; Rec."Phone No. 2") { Caption = 'Phone No. 2'; }
                field(faxNo; Rec."Fax No.") { Caption = 'Fax No.'; }
                field(email; Rec."E-Mail") { Caption = 'E-Mail'; }
                field(homePage; Rec."Home Page") { Caption = 'Home Page'; }

                // Address
                field(address; Rec.Address) { Caption = 'Address'; }
                field(address2; Rec."Address 2") { Caption = 'Address 2'; }
                field(city; Rec.City) { Caption = 'City'; }
                field(postCode; Rec."Post Code") { Caption = 'Post Code'; }
                field(county; Rec.County) { Caption = 'County'; }
                field(countryRegionCode; Rec."Country/Region Code") { Caption = 'Country/Region Code'; }

                // Ship-to
                field(shipToName; Rec."Ship-to Name") { Caption = 'Ship-to Name'; }
                field(shipToName2; Rec."Ship-to Name 2") { Caption = 'Ship-to Name 2'; }
                field(shipToAddress; Rec."Ship-to Address") { Caption = 'Ship-to Address'; }
                field(shipToAddress2; Rec."Ship-to Address 2") { Caption = 'Ship-to Address 2'; }
                field(shipToCity; Rec."Ship-to City") { Caption = 'Ship-to City'; }
                field(shipToPostCode; Rec."Ship-to Post Code") { Caption = 'Ship-to Post Code'; }
                field(shipToCounty; Rec."Ship-to County") { Caption = 'Ship-to County'; }
                field(shipToCountryRegionCode; Rec."Ship-to Country/Region Code") { Caption = 'Ship-to Country/Region Code'; }
                //field(shipToPhoneNo; Rec."Ship-to Phone No.") { Caption = 'Ship-to Phone No.'; }

                // Banking / registrations
                field(bankName; Rec."Bank Name") { Caption = 'Bank Name'; }
                field(bankBranchNo; Rec."Bank Branch No.") { Caption = 'Bank Branch No.'; }
                field(bankAccountNo; Rec."Bank Account No.") { Caption = 'Bank Account No.'; }
                field(paymentRoutingNo; Rec."Payment Routing No.") { Caption = 'Payment Routing No.'; }
                field(giroNo; Rec."Giro No.") { Caption = 'Giro No.'; }
                field(iban; Rec.IBAN) { Caption = 'IBAN'; }
                field(swiftCode; Rec."SWIFT Code") { Caption = 'SWIFT Code'; }
                field(vatRegistrationNo; Rec."VAT Registration No.") { Caption = 'VAT Registration No.'; }
                field(registrationNo; Rec."Registration No.") { Caption = 'Registration No.'; }
                field(eoriNumber; Rec."EORI Number") { Caption = 'EORI Number'; }
                field(gln; Rec.GLN) { Caption = 'GLN'; }
                field(useGLNInElectronicDocument; Rec."Use GLN in Electronic Document") { Caption = 'Use GLN in Electronic Documents'; }
                field(allowBlankPaymentInfo; Rec."Allow Blank Payment Info.") { Caption = 'Allow Blank Payment Info.'; }

                // Misc/company settings
                field(telexNo; Rec."Telex No.") { Caption = 'Telex No.'; }
                field(telexAnswerBack; Rec."Telex Answer Back") { Caption = 'Telex Answer Back'; }
                field(customsPermitNo; Rec."Customs Permit No.") { Caption = 'Customs Permit No.'; }
                field(customsPermitDate; Rec."Customs Permit Date") { Caption = 'Customs Permit Date'; } // DATE
                field(industrialClassification; Rec."Industrial Classification") { Caption = 'Industrial Classification'; }
                field(alternativeLanguageCode; Rec."Alternative Language Code") { Caption = 'Alternative Language Code'; }
                field(responsibilityCenter; Rec."Responsibility Center") { Caption = 'Responsibility Center'; }
                field(checkAvailPeriodCalc; Rec."Check-Avail. Period Calc.") { Caption = 'Check-Avail. Period Calc.'; } // DateFormula
                field(checkAvailTimeBucket; Rec."Check-Avail. Time Bucket") { Caption = 'Check-Avail. Time Bucket'; } // Enum Analysis Period Type
                field(baseCalendarCode; Rec."Base Calendar Code") { Caption = 'Base Calendar Code'; }
                field(calConvergenceTimeFrame; Rec."Cal. Convergence Time Frame") { Caption = 'Cal. Convergence Time Frame'; } // DateFormula

                // System indicator (Option fields – exposed as text)
                field(systemIndicator; Rec."System Indicator") { Caption = 'System Indicator'; }
                field(customSystemIndicatorText; Rec."Custom System Indicator Text") { Caption = 'Custom System Indicator Text'; }
                field(systemIndicatorStyle; Rec."System Indicator Style") { Caption = 'System Indicator Style'; }

                // Timestamps/flags on the table
                field(pictureLastModifiedDateTime; Rec."Picture - Last Mod. Date Time") { Caption = 'Picture - Last Mod. Date Time'; }
                field(lastModifiedDateTimeTbl; Rec."Last Modified Date Time") { Caption = 'Last Modified Date Time'; }
                field(createdDateTime; Rec."Created DateTime") { Caption = 'Created DateTime'; }
                field(demoCompany; Rec."Demo Company") { Caption = 'Demo Company'; }

                // Location default
                field(locationCode; Rec."Location Code") { Caption = 'Location Code'; }

                // System fields (SaaS)
                field(systemId; Rec.SystemId) { Caption = 'SystemId'; }
                field(systemCreatedAt; Rec.SystemCreatedAt) { Caption = 'SystemCreatedAt'; }
                field(systemCreatedBy; Rec.SystemCreatedBy) { Caption = 'SystemCreatedBy'; }
                field(systemModifiedAt; Rec.SystemModifiedAt) { Caption = 'SystemModifiedAt'; }
                field(systemModifiedBy; Rec.SystemModifiedBy) { Caption = 'SystemModifiedBy'; }
            }
        }
    }

    // NOTE:
    // - Picture (BLOB) intentionally omitted to keep API simple.
    // - Removed/obsolete IC* fields (41–44) are not exposed.
}
