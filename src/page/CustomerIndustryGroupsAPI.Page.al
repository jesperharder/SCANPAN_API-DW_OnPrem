page 50206 "CustomerIndustryGroupsAPI"
{
    /// <summary>
    /// 2025.10.17  Jesper Harder       001.4
    /// API page for Customer Industry Groups based on Contact Industry Group.
    /// Exposes customer-related industry group classification for DW/integration usage.
    /// </summary>

    Caption = 'Customer Industry Groups';
    AdditionalSearchTerms = 'SCANPAN, Customer Industry Group, API, Contact Industry Group, Industry Group, Customer, Contact Business Relation';
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
        tabledata Customer = R,
        tabledata "Marketing Setup" = R;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(contactNo; Rec."Contact No.")
                {
                    Caption = 'Contact No.';
                }
                field(customerNo; CustomerNo)
                {
                    Caption = 'Customer No.';
                }
                field(customerName; CustomerName)
                {
                    Caption = 'Customer Name';
                }
                field(industryGroupCode; Rec."Industry Group Code")
                {
                    Caption = 'Industry Group Code';
                }
                field(industryGroupName; IndustryGroupName)
                {
                    Caption = 'Industry Group Name';
                }
                field(relationCode; RelationCode)
                {
                    Caption = 'Relation Code';
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    var
        ContactBusRel: Record "Contact Business Relation";
        Customer: Record Customer;
        IndustryGroup: Record "Industry Group";
        RMSetup: Record "Marketing Setup";
    begin
        Clear(CustomerNo);
        Clear(CustomerName);
        Clear(IndustryGroupName);
        Clear(RelationCode);

        // Resolve industry group name
        if IndustryGroup.Get(Rec."Industry Group Code") then
            IndustryGroupName := IndustryGroup.Description;

        // Resolve relation code and related customer defensively
        if RMSetup.Get() then begin
            RelationCode := RMSetup."Bus. Rel. Code for Customers";

            if RelationCode <> '' then begin
                ContactBusRel.Reset();
                ContactBusRel.SetRange("Contact No.", Rec."Contact No.");
                ContactBusRel.SetRange("Business Relation Code", RelationCode);

                if ContactBusRel.FindFirst() then
                    if Customer.Get(ContactBusRel."No.") then begin
                        CustomerNo := Customer."No.";
                        CustomerName := Customer.Name;
                    end;
            end;
        end;
    end;

    var
        CustomerNo: Code[20];
        CustomerName: Text[100];
        IndustryGroupName: Text[100];
        RelationCode: Code[20];
}