page 50215 "EmployeeAPI"
{
    /// <summary>
    /// 2025.10.24 - Jesper Harder - v001.0
    /// API page for Employee (DW export with enum INT mapping)
    /// </summary>

    Caption = 'EmployeeAPI';
    AdditionalSearchTerms = 'SCANPAN, API, datawarehouse, dw, employee';
    UsageCategory = Administration;

    PageType = API;
    APIPublisher = 'scanpan';
    APIGroup = 'datawarehouse';
    APIVersion = 'beta', 'v1.0';

    EntitySetName = 'employees';
    EntityName = 'employee';

    DelayedInsert = true;
    Editable = false;

    SourceTable = Employee;
    SourceTableView = sorting("No.") order(ascending);
    ODataKeyFields = "No.";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                Caption = 'Employee Fields';

                // --- Identification ---
                field(no; Rec."No.") { Caption = 'Employee No.'; }
                field(firstName; Rec."First Name") { Caption = 'First Name'; }
                field(middleName; Rec."Middle Name") { Caption = 'Middle Name'; }
                field(lastName; Rec."Last Name") { Caption = 'Last Name'; }
                field(initials; Rec.Initials) { Caption = 'Initials'; }
                field(jobTitle; Rec."Job Title") { Caption = 'Job Title'; }
                field(searchName; Rec."Search Name") { Caption = 'Search Name'; }
                field(title; Rec.Title) { Caption = 'Title'; }

                // --- Contact info ---
                field(address; Rec.Address) { Caption = 'Address'; }
                field(address2; Rec."Address 2") { Caption = 'Address 2'; }
                field(city; Rec.City) { Caption = 'City'; }
                field(postCode; Rec."Post Code") { Caption = 'Post Code'; }
                field(county; Rec.County) { Caption = 'County'; }
                field(countryRegionCode; Rec."Country/Region Code") { Caption = 'Country/Region Code'; }
                field(phoneNo; Rec."Phone No.") { Caption = 'Phone No.'; }
                field(mobilePhoneNo; Rec."Mobile Phone No.") { Caption = 'Mobile Phone No.'; }
                field(faxNo; Rec."Fax No.") { Caption = 'Fax No.'; }
                field(eMail; Rec."E-Mail") { Caption = 'Email'; }
                field(companyEmail; Rec."Company E-Mail") { Caption = 'Company Email'; }
                field(extension; Rec.Extension) { Caption = 'Extension'; }
                field(pager; Rec.Pager) { Caption = 'Pager'; }

                // --- Employment details ---
                field(jobStatus; Rec.Status) { Caption = 'Status'; }
                field(statusInt; statusInt) { Caption = 'Status INT'; }
                field(managerNo; Rec."Manager No.") { Caption = 'Manager No.'; }
                field(emplymtContractCode; Rec."Emplymt. Contract Code") { Caption = 'Emplymt. Contract Code'; }
                field(employmentDate; Rec."Employment Date") { Caption = 'Employment Date'; }
                field(inactiveDate; Rec."Inactive Date") { Caption = 'Inactive Date'; }
                field(causeOfInactivityCode; Rec."Cause of Inactivity Code") { Caption = 'Cause of Inactivity Code'; }
                field(terminationDate; Rec."Termination Date") { Caption = 'Termination Date'; }
                field(groundsForTermCode; Rec."Grounds for Term. Code") { Caption = 'Grounds for Term. Code'; }

                // --- Personal info ---
                field(birthDate; Rec."Birth Date") { Caption = 'Birth Date'; }
                field(socialSecurityNo; Rec."Social Security No.") { Caption = 'Social Security No.'; }
                field(gender; Rec.Gender) { Caption = 'Gender'; }
                field(genderInt; genderInt) { Caption = 'Gender INT'; }
                field(unionCode; Rec."Union Code") { Caption = 'Union Code'; }
                field(unionMembershipNo; Rec."Union Membership No.") { Caption = 'Union Membership No.'; }
                field(statisticsGroupCode; Rec."Statistics Group Code") { Caption = 'Statistics Group Code'; }
                field(privayBlocked; Rec."Privacy Blocked") { Caption = 'Privacy Blocked'; }

                // --- Financial / Posting ---
                field(employeePostingGroup; Rec."Employee Posting Group") { Caption = 'Employee Posting Group'; }
                field(applicationMethod; Rec."Application Method") { Caption = 'Application Method'; }
                field(bankBranchNo; Rec."Bank Branch No.") { Caption = 'Bank Branch No.'; }
                field(bankAccountNo; Rec."Bank Account No.") { Caption = 'Bank Account No.'; }
                field(iban; Rec.IBAN) { Caption = 'IBAN'; }
                field(swiftCode; Rec."SWIFT Code") { Caption = 'SWIFT Code'; }
                field(balance; Rec.Balance) { Caption = 'Balance'; }

                // --- Dimensions ---
                field(globalDimension1Code; Rec."Global Dimension 1 Code") { Caption = 'Global Dimension 1 Code'; }
                field(globalDimension2Code; Rec."Global Dimension 2 Code") { Caption = 'Global Dimension 2 Code'; }
                field(costCenterCode; Rec."Cost Center Code") { Caption = 'Cost Center Code'; }
                field(costObjectCode; Rec."Cost Object Code") { Caption = 'Cost Object Code'; }
                field(resourceNo; Rec."Resource No.") { Caption = 'Resource No.'; }
                field(salesPurchCode; Rec."Salespers./Purch. Code") { Caption = 'Salespers./Purch. Code'; }

                // --- Dates and audit ---
                field(lastDateModified; Rec."Last Date Modified") { Caption = 'Last Date Modified'; }
                field(lastModifiedDateTime; Rec."Last Modified Date Time") { Caption = 'Last Modified Date Time'; }

                // --- System fields ---
                field(systemId; Rec.SystemId) { Caption = 'SystemId'; }
                field(systemCreatedAt; Rec.SystemCreatedAt) { Caption = 'SystemCreatedAt'; }
                field(systemCreatedBy; Rec.SystemCreatedBy) { Caption = 'SystemCreatedBy'; }
                field(systemModifiedAt; Rec.SystemModifiedAt) { Caption = 'SystemModifiedAt'; }
                field(systemModifiedBy; Rec.SystemModifiedBy) { Caption = 'SystemModifiedBy'; }
            }
        }
    }

    var
        genderInt: Integer;
        statusInt: Integer;

    trigger OnAfterGetRecord()
    begin
        // --- Enum/Option → integer mappings for DW stability ---

        // Gender (Enum "Employee Gender")
        case Rec.Gender of
            Rec.Gender::" ":
                genderInt := 0;
            Rec.Gender::Male:
                genderInt := 1;
            Rec.Gender::Female:
                genderInt := 2;
            else
                genderInt := -1;
        end;

        // Status (Enum "Employee Status")
        case Rec.Status of
            Rec.Status::Active:
                statusInt := 0;
            Rec.Status::Inactive:
                statusInt := 1;
            Rec.Status::Terminated:
                statusInt := 2;
            else
                statusInt := -1;
        end;
    end;
}
