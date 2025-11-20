page 50206 "CustomerIndustryGroupsAPI"
{
    // API Page: CustomerIndustryGroups
    /// <summary>
    /// 2025.10.17  Jesper Harder       001.3                   API page for Customer Industry Category
    /// </summary>
    /// <remarks>
    /// This API page exposes Customer Industry Groups based on the "Contact Industry Group" table.
    /// It retrieves related customer information through the contact's business relations.
    /// The page includes fields for Customer No., Customer Name, Industry Group Code, and Industry Group Name.
    /// Permissions are set to allow read access to necessary tables.
    /// The OnAfterGetRecord trigger populates additional fields by looking up related records.
    /// This page is intended for integration scenarios where customer industry categorization is required.
    /// It ensures that the industry group name is fetched from the "Industry Group" table and links customers via contacts.
    /// </remarks>
    /// 

    Caption = 'Customer Industry Groups';
    AdditionalSearchTerms = 'SCANPAN, Customer Industry Category, API, Contact Industry Group, Industry Group, Customer, Contact Business Relation';
    PageType = API;
    APIPublisher = 'spn';
    APIGroup = 'dimension';
    APIVersion = 'v1.0';
    EntityName = 'customerIndustryGroup';
    EntitySetName = 'customerIndustryGroups';
    SourceTable = "Contact Industry Group";
    DelayedInsert = true;
    Permissions =
        tabledata "Industry Group" = R,
        tabledata "Contact Industry Group" = R,
        tabledata Contact = R,
        tabledata "Contact Business Relation" = R,
        tabledata Customer = R;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("customer_no"; CustomerNo)
                {
                    Caption = 'Customer No.';
                }
                field("customer_name"; CustomerName)
                {
                    Caption = 'Customer Name';
                }
                field("industry_group_code"; Rec."Industry Group Code")
                {
                    Caption = 'Industry Group Code';
                }
                field("industry_group_name"; IndustryGroupName)
                {
                    Caption = 'Industry Group Name';
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    var
        Contact: Record Contact;
        ContactBusRel: Record "Contact Business Relation";
        Customer: Record Customer;
        IndustryGroup: Record "Industry Group";
        RMSetup: Record "Marketing Setup";
    begin
        // Clear temporary fields before processing
        Clear(CustomerNo);
        Clear(CustomerName);
        Clear(IndustryGroupName);

        // Get the industry group name from the Industry Group table
        if IndustryGroup.Get(Rec."Industry Group Code") then
            IndustryGroupName := IndustryGroup.Description
        else
            IndustryGroupName := Rec."Industry Group Code"; // Fallback to code if description not found

        // Lookup related customer based on the contact
        if Contact.Get(Rec."Contact No.") then begin

            // Retrieve Marketing Setup to get correct Business Relation Code for customers
            if not RMSetup.Get() then
                Error('Marketing Setup not found');

            // Filter Contact Business Relation for customer-related link
            ContactBusRel.Reset();
            ContactBusRel.SetRange("Contact No.", Contact."No.");
            ContactBusRel.SetRange("Business Relation Code", RMSetup."Bus. Rel. Code for Customers");

            // Find first valid customer match
            if ContactBusRel.FindFirst() then
                if Customer.Get(ContactBusRel."No.") then begin
                    CustomerNo := Customer."No.";
                    CustomerName := Customer.Name;
                end;
        end;
    end;

    var
        CustomerNo: Code[20];
        CustomerName: Text[100];
        IndustryGroupName: Text[100];
}