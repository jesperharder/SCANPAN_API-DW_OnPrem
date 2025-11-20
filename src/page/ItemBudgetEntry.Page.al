page 50227 "ItemBudgetEntry"
{
    PageType = API;
    Caption = 'Item Budget Entry API v1';
    APIPublisher = 'spn';
    APIGroup = 'planning';
    APIVersion = 'v1.0';

    EntityName = 'item_budget_entry';
    EntitySetName = 'item_budget_entries';

    SourceTable = "Item Budget Entry"; // table 7134
    ODataKeyFields = SystemId;
    DelayedInsert = true;
    Extensible = false;

    InsertAllowed = true;
    ModifyAllowed = true;
    DeleteAllowed = true;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                // Identity
                field(id; Rec.SystemId) { Caption = 'Id'; Editable = false; }
                field(entryNo; Rec."Entry No.") { Caption = 'Entry No.'; Editable = false; }

                // Core qualifiers
                field(analysisArea; Rec."Analysis Area") { Caption = 'Analysis Area'; }
                field(budgetName; Rec."Budget Name") { Caption = 'Budget Name'; }
                field(date; Rec.Date) { Caption = 'Date'; }
                field(itemNo; Rec."Item No.") { Caption = 'Item No.'; }
                field(sourceType; Rec."Source Type") { Caption = 'Source Type'; }
                field(sourceNo; Rec."Source No.") { Caption = 'Source No.'; }
                field(description; Rec.Description) { Caption = 'Description'; }

                // Values
                field(quantity; Rec.Quantity) { Caption = 'Quantity'; DecimalPlaces = 0 : 5; }
                field(costAmount; Rec."Cost Amount") { Caption = 'Cost Amount'; }
                field(salesAmount; Rec."Sales Amount") { Caption = 'Sales Amount'; }

                // User / Location
                field(userId; Rec."User ID") { Caption = 'User ID'; Editable = false; }
                field(locationCode; Rec."Location Code") { Caption = 'Location Code'; }

                // Dimensions (codes)
                field(globalDimension1Code; Rec."Global Dimension 1 Code") { Caption = 'Global Dimension 1 Code'; }
                field(globalDimension2Code; Rec."Global Dimension 2 Code") { Caption = 'Global Dimension 2 Code'; }
                field(budgetDimension1Code; Rec."Budget Dimension 1 Code") { Caption = 'Budget Dimension 1 Code'; }
                field(budgetDimension2Code; Rec."Budget Dimension 2 Code") { Caption = 'Budget Dimension 2 Code'; }
                field(budgetDimension3Code; Rec."Budget Dimension 3 Code") { Caption = 'Budget Dimension 3 Code'; }

                // Dimension Set
                field(dimensionSetId; Rec."Dimension Set ID") { Caption = 'Dimension Set ID'; Editable = false; }

                // --------- Added: Integer conversions (IDs) ----------
                field(globalDimension1Id; GlobalDim1Id)
                {
                    Caption = 'Global Dimension 1 ID';
                    Editable = false;
                }
                field(globalDimension2Id; GlobalDim2Id)
                {
                    Caption = 'Global Dimension 2 ID';
                    Editable = false;
                }
                field(budgetDimension1Id; BudgetDim1Id)
                {
                    Caption = 'Budget Dimension 1 ID';
                    Editable = false;
                }
                field(budgetDimension2Id; BudgetDim2Id)
                {
                    Caption = 'Budget Dimension 2 ID';
                    Editable = false;
                }
                field(budgetDimension3Id; BudgetDim3Id)
                {
                    Caption = 'Budget Dimension 3 ID';
                    Editable = false;
                }

                // --------- Added: Code subject descriptions ----------
                field(itemDescription; ItemDescTxt)
                {
                    Caption = 'Item Description';
                    Editable = false;
                }
                field(locationName; LocationNameTxt)
                {
                    Caption = 'Location Name';
                    Editable = false;
                }
                field(sourceName; SourceNameTxt)
                {
                    Caption = 'Source Name';
                    Editable = false;
                }
                field(globalDimension1Name; GlobalDim1NameTxt)
                {
                    Caption = 'Global Dimension 1 Name';
                    Editable = false;
                }
                field(globalDimension2Name; GlobalDim2NameTxt)
                {
                    Caption = 'Global Dimension 2 Name';
                    Editable = false;
                }
                field(budgetDimension1Name; BudgetDim1NameTxt)
                {
                    Caption = 'Budget Dimension 1 Name';
                    Editable = false;
                }
                field(budgetDimension2Name; BudgetDim2NameTxt)
                {
                    Caption = 'Budget Dimension 2 Name';
                    Editable = false;
                }
                field(budgetDimension3Name; BudgetDim3NameTxt)
                {
                    Caption = 'Budget Dimension 3 Name';
                    Editable = false;
                }
            }
        }
    }

    actions { }

    var
        // Integer conversions (Dimension Value IDs)
        GlobalDim1Id: Integer;
        GlobalDim2Id: Integer;
        BudgetDim1Id: Integer;
        BudgetDim2Id: Integer;
        BudgetDim3Id: Integer;

        // Descriptions / Names
        ItemDescTxt: Text[100];
        LocationNameTxt: Text[100];
        SourceNameTxt: Text[100];
        GlobalDim1NameTxt: Text[100];
        GlobalDim2NameTxt: Text[100];
        BudgetDim1NameTxt: Text[100];
        BudgetDim2NameTxt: Text[100];
        BudgetDim3NameTxt: Text[100];

        // Refs
        GLSetup: Record "General Ledger Setup";
        ItemBudgetName: Record "Item Budget Name";

    trigger OnAfterGetRecord()
    begin
        // Resolve GL and Budget dimension codes (needed for names/IDs)
        if not GLSetup.Get() then;
        if (ItemBudgetName."Analysis Area" <> Rec."Analysis Area") or (ItemBudgetName.Name <> Rec."Budget Name") then
            ItemBudgetName.Get(Rec."Analysis Area", Rec."Budget Name");

        // Integer conversions (Dimension Value IDs)
        GlobalDim1Id := GetDimValueId(GLSetup."Global Dimension 1 Code", Rec."Global Dimension 1 Code");
        GlobalDim2Id := GetDimValueId(GLSetup."Global Dimension 2 Code", Rec."Global Dimension 2 Code");
        BudgetDim1Id := GetDimValueId(ItemBudgetName."Budget Dimension 1 Code", Rec."Budget Dimension 1 Code");
        BudgetDim2Id := GetDimValueId(ItemBudgetName."Budget Dimension 2 Code", Rec."Budget Dimension 2 Code");
        BudgetDim3Id := GetDimValueId(ItemBudgetName."Budget Dimension 3 Code", Rec."Budget Dimension 3 Code");

        // Code subject descriptions
        ItemDescTxt := GetItemDescription(Rec."Item No.");
        LocationNameTxt := GetLocationName(Rec."Location Code");
        SourceNameTxt := GetSourceName(Rec."Source Type", Rec."Source No.");
        GlobalDim1NameTxt := GetDimValueName(GLSetup."Global Dimension 1 Code", Rec."Global Dimension 1 Code");
        GlobalDim2NameTxt := GetDimValueName(GLSetup."Global Dimension 2 Code", Rec."Global Dimension 2 Code");
        BudgetDim1NameTxt := GetDimValueName(ItemBudgetName."Budget Dimension 1 Code", Rec."Budget Dimension 1 Code");
        BudgetDim2NameTxt := GetDimValueName(ItemBudgetName."Budget Dimension 2 Code", Rec."Budget Dimension 2 Code");
        BudgetDim3NameTxt := GetDimValueName(ItemBudgetName."Budget Dimension 3 Code", Rec."Budget Dimension 3 Code");
    end;

    local procedure GetDimValueId(DimCode: Code[20]; DimValueCode: Code[20]): Integer
    var
        DimValue: Record "Dimension Value";
    begin
        if (DimCode = '') or (DimValueCode = '') then
            exit(0);
        if DimValue.Get(DimCode, DimValueCode) then
            exit(DimValue."Dimension Value ID");
        exit(0);
    end;

    local procedure GetDimValueName(DimCode: Code[20]; DimValueCode: Code[20]): Text[100]
    var
        DimValue: Record "Dimension Value";
    begin
        if (DimCode = '') or (DimValueCode = '') then
            exit('');
        if DimValue.Get(DimCode, DimValueCode) then
            exit(CopyStr(DimValue.Name, 1, 100));
        exit('');
    end;

    local procedure GetItemDescription(ItemNo: Code[20]): Text[100]
    var
        Item: Record Item;
    begin
        if (ItemNo = '') then
            exit('');
        if Item.Get(ItemNo) then
            exit(CopyStr(Item.Description, 1, 100));
        exit('');
    end;

    local procedure GetLocationName(LocationCode: Code[10]): Text[100]
    var
        Location: Record Location;
    begin
        if (LocationCode = '') then
            exit('');
        if Location.Get(LocationCode) then
            exit(CopyStr(Location.Name, 1, 100));
        exit('');
    end;

    local procedure GetSourceName(SourceType: Enum "Analysis Source Type"; SourceNo: Code[20]): Text[100]
    var
        Cust: Record Customer;
        Vend: Record Vendor;
        Item: Record Item;
    begin
        if SourceNo = '' then
            exit('');
        case SourceType of
            SourceType::Customer:
                if Cust.Get(SourceNo) then
                    exit(CopyStr(Cust.Name, 1, 100));
            SourceType::Vendor:
                if Vend.Get(SourceNo) then
                    exit(CopyStr(Vend.Name, 1, 100));
            SourceType::Item:
                if Item.Get(SourceNo) then
                    exit(CopyStr(Item.Description, 1, 100));
        end;
        exit('');
    end;
}
