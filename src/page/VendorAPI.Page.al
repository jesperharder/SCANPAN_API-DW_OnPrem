page 50281 "VendorAPI"
{
    /// <summary>
    /// Date        Name                    Version   Description
    /// 2025.11.20  Business Central AL     001.0     API page for Vendor (table 23)
    /// </summary>

    Caption = 'VendorAPI';
    AdditionalSearchTerms = 'SCANPAN, API, datawarehouse, dw, vendor, supplier';
    UsageCategory = Administration;

    PageType = API;
    APIPublisher = 'scanpan';
    APIGroup = 'datawarehouse';
    APIVersion = 'beta', 'v1.0';

    EntitySetName = 'vendors';
    EntityName = 'vendor';

    DelayedInsert = true;
    Editable = false;

    SourceTable = Vendor;
    SourceTableView = sorting("No.") order(ascending);
    ODataKeyFields = "No.";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                Caption = 'Group';

                // --- Key & identity ---
                field(no; Rec."No.")                          { Caption = 'No.'; }
                field(name; Rec.Name)                         { Caption = 'Name'; }
                field(name2; Rec."Name 2")                    { Caption = 'Name 2'; }
                field(searchName; Rec."Search Name")          { Caption = 'Search Name'; }

                // --- Address / contact ---
                field(address; Rec.Address)                   { Caption = 'Address'; }
                field(address2; Rec."Address 2")              { Caption = 'Address 2'; }
                field(city; Rec.City)                         { Caption = 'City'; }
                field(postCode; Rec."Post Code")              { Caption = 'Post Code'; }
                field(countryRegionCode; Rec."Country/Region Code") { Caption = 'Country/Region Code'; }
                field(contact; Rec.Contact)                   { Caption = 'Contact'; }
                field(phoneNo; Rec."Phone No.")               { Caption = 'Phone No.'; }
                field(email; Rec."E-Mail")                    { Caption = 'E-Mail'; }
                field(homePage; Rec."Home Page")              { Caption = 'Home Page'; }

                // --- Posting groups / VAT ---
                field(vendorPostingGroup; Rec."Vendor Posting Group") { Caption = 'Vendor Posting Group'; }
                field(vatBusPostingGroup; Rec."VAT Bus. Posting Group") { Caption = 'VAT Bus. Posting Group'; }
                field(genBusPostingGroup; Rec."Gen. Bus. Posting Group") { Caption = 'Gen. Bus. Posting Group'; }

                // --- Currency & payment setup ---
                field(currencyCode; Rec."Currency Code")      { Caption = 'Currency Code'; }
                field(paymentTermsCode; Rec."Payment Terms Code") { Caption = 'Payment Terms Code'; }
                field(paymentMethodCode; Rec."Payment Method Code") { Caption = 'Payment Method Code'; }
                field(locationCode; Rec."Location Code")      { Caption = 'Location Code'; }
                field(prepaymentPct; Rec."Prepayment %")      { Caption = 'Prepayment %'; }
                field(balanceLCY; Rec."Balance (LCY)")        { Caption = 'Balance (LCY)'; } // FlowField, men letvægt i udtræk

                // --- Application / control (Enums/Options) + INT-spejle ---
                field(applicationMethod; Rec."Application Method") { Caption = 'Application Method'; }
                field(applicationMethodInt; applicationMethodInt)  { Caption = 'Application Method INT'; }

                field(blocked; Rec.Blocked)                   { Caption = 'Blocked'; }
                field(blockedInt; blockedInt)                 { Caption = 'Blocked INT'; }

                // --- Responsibility / dimensions ---
                //field(assignedUserId; Rec."Assigned User ID") { Caption = 'Assigned User ID'; }
                field(respCenter; Rec."Responsibility Center"){ Caption = 'Responsibility Center'; }
                field(globalDim1Code; Rec."Global Dimension 1 Code") { Caption = 'Global Dimension 1 Code'; }
                field(globalDim2Code; Rec."Global Dimension 2 Code") { Caption = 'Global Dimension 2 Code'; }

                // --- Banking (light) ---
                field(preferredBankAccountCode; Rec."Preferred Bank Account Code") { Caption = 'Preferred Bank Account Code'; }
                //field(vendorBankComm; Rec."Bank Communication") { Caption = 'Bank Communication'; } // hvis feltet findes i din version

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
        applicationMethodInt: Integer;

    trigger OnAfterGetRecord()
    begin
        // Enum/Option -> Integer spejle (Enums i nyere BC; Option i ældre)
        applicationMethodInt := Rec."Application Method".AsInteger();
        blockedInt := Rec.Blocked.AsInteger();

        // Hvis felterne er Option i jeres version, brug:
        // applicationMethodInt := Rec."Application Method";
        // blockedInt := Rec.Blocked;
    end;
}
