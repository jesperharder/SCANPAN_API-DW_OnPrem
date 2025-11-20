table 50200 "Object Range Buffer"
{
    TableType = Temporary;
    
    fields
    {
        field(1; "Entry No."; Integer)
        {
            AutoIncrement = true;
        }
        field(2; "Object Type"; Option)
        {
            Caption = 'Object Type';
            OptionMembers = Table,Page,Report,Codeunit,Query,XMLport;
        }
        field(3; "Range Start"; Integer)
        {
            Caption = 'Range Start';
        }
        field(4; "Range End"; Integer)
        {
            Caption = 'Range End';
        }
        field(5; Status; Option)
        {
            Caption = 'Status';
            OptionMembers = Used,Available;
        }
        field(6; "Object Count"; Integer)
        {
            Caption = 'Object Count';
        }
    }
    
    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
        key(TypeRange; "Object Type", "Range Start")
        {
        }
    }
}