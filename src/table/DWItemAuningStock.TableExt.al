tableextension 50231 "DW Item Auning Stock" extends Item
{
    fields
    {
        field(50231; "AUNING Stock On Hand"; Decimal)
        {
            Caption = 'AUNING stock on hand';
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 0;
            Editable = false;
        }
        field(50232; "AUNING Stock Available"; Decimal)
        {
            Caption = 'AUNING stock available';
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 0;
            Editable = false;
        }
        field(50233; "AUNING Stock Updated At"; DateTime)
        {
            Caption = 'AUNING updated at';
            DataClassification = ToBeClassified;
            Editable = false;
        }
    }
}
