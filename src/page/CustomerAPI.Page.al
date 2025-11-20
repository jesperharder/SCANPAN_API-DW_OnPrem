page 50213 "CustomerAPI"
{
    /// <summary>
    /// Date        Name                    Version   Description
    /// 2025.10.24  Business Central AL     001.0     API page for Customer (table 18)
    /// </summary>

    Caption = 'CustomerAPI';
    AdditionalSearchTerms = 'SCANPAN, API, datawarehouse, dw';
    UsageCategory = Administration;

    PageType = API;
    APIPublisher = 'scanpan';
    APIGroup = 'datawarehouse';
    APIVersion = 'beta', 'v1.0';

    EntitySetName = 'customers';
    EntityName = 'customer';

    DelayedInsert = true;
    Editable = false;

    SourceTable = Customer;
    SourceTableView = sorting("No.") order(ascending);
    ODataKeyFields = "No.";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                Caption = 'Customer Fields';

                // --- Key & core identity ---
                field(no; Rec."No.")                         { Caption = 'Customer No.'; }
                field(name; Rec.Name)                        { Caption = 'Name'; }
                field(name2; Rec."Name 2")                   { Caption = 'Name 2'; }
                field(searchName; Rec."Search Name")         { Caption = 'Search Name'; }

                // --- Address ---
                field(address; Rec.Address)                  { Caption = 'Address'; }
                field(address2; Rec."Address 2")             { Caption = 'Address 2'; }
                field(city; Rec.City)                        { Caption = 'City'; }
                field(postCode; Rec."Post Code")             { Caption = 'Post Code'; }
                field(county; Rec.County)                    { Caption = 'County'; }
                field(countryRegionCode; Rec."Country/Region Code") { Caption = 'Country/Region Code'; }

                // --- Communication ---
                field(phoneNo; Rec."Phone No.")              { Caption = 'Phone No.'; }
                field(eMail; Rec."E-Mail")                   { Caption = 'E-Mail'; }
                field(homePage; Rec."Home Page")             { Caption = 'Home Page'; }
                field(contact; Rec.Contact)                  { Caption = 'Contact'; }

                // --- Finance / posting ---
                field(customerPostingGroup; Rec."Customer Posting Group") { Caption = 'Customer Posting Group'; }
                field(genBusPostingGroup; Rec."Gen. Bus. Posting Group")  { Caption = 'Gen. Bus. Posting Group'; }
                field(vatBusPostingGroup; Rec."VAT Bus. Posting Group")   { Caption = 'VAT Bus. Posting Group'; }
                field(currencyCode; Rec."Currency Code")     { Caption = 'Currency Code'; }
                field(paymentTermsCode; Rec."Payment Terms Code") { Caption = 'Payment Terms Code'; }
                field(paymentMethodCode; Rec."Payment Method Code") { Caption = 'Payment Method Code'; }
                field(locationCode; Rec."Location Code")     { Caption = 'Location Code'; }

                // --- Dimensions ---
                field(globalDimension1Code; Rec."Global Dimension 1 Code") { Caption = 'Global Dimension 1 Code'; }
                field(globalDimension2Code; Rec."Global Dimension 2 Code") { Caption = 'Global Dimension 2 Code'; }
                field(responsibilityCenter; Rec."Responsibility Center")   { Caption = 'Responsibility Center'; }

                // --- Credit & block status ---
                field(blocked; Rec.Blocked)                  { Caption = 'Blocked'; }
                field(blockedInt; blockedInt)                { Caption = 'Blocked INT'; }

                // --- Statistics fields ---
                field(balanceLCY; Rec."Balance (LCY)")       { Caption = 'Balance (LCY)'; }
                field(salesLCY; Rec."Sales (LCY)")           { Caption = 'Sales (LCY)'; }
                field(paymentsLCY; Rec."Payments (LCY)")     { Caption = 'Payments (LCY)'; }

                // --- Audit timestamps ---
                field(lastModifiedDateTime; Rec."Last Modified Date Time") { Caption = 'Last Modified Date Time'; }

                // --- System fields ---
                field(systemId; Rec.SystemId)                 { Caption = 'SystemId'; }
                field(systemCreatedAt; Rec.SystemCreatedAt)   { Caption = 'SystemCreatedAt'; }
                field(systemCreatedBy; Rec.SystemCreatedBy)   { Caption = 'SystemCreatedBy'; }
                field(systemModifiedAt; Rec.SystemModifiedAt) { Caption = 'SystemModifiedAt'; }
                field(systemModifiedBy; Rec.SystemModifiedBy) { Caption = 'SystemModifiedBy'; }
            }
        }
    }

    var
        blockedInt: Integer;

    trigger OnAfterGetRecord()
    begin
        // Option -> integer mapping for Blocked status
        case Rec.Blocked of
            Rec.Blocked::" ":
                blockedInt := 0;
            Rec.Blocked::Ship:
                blockedInt := 1;
            Rec.Blocked::Invoice:
                blockedInt := 2;
            Rec.Blocked::All:
                blockedInt := 3;
            else
                blockedInt := -1;
        end;
    end;
}
