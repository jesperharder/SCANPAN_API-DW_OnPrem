page 50237 "AuningStockFactBox"
{
    Caption = 'AUNING stock';
    PageType = CardPart;
    SourceTable = Item;
    Editable = false;

    layout
    {
        area(content)
        {
            group(General)
            {
                ShowCaption = false;

                field("AUNING Stock On Hand"; Rec."AUNING Stock On Hand")
                {
                    ApplicationArea = All;
                    Caption = 'AUNING stock on hand';
                    ToolTip = 'Specifies the physical inventory snapshot for the AUNING location.';
                }
                field("AUNING Stock Available"; Rec."AUNING Stock Available")
                {
                    ApplicationArea = All;
                    Caption = 'AUNING stock available';
                    ToolTip = 'Specifies the available inventory snapshot for the AUNING location.';
                }
                field("AUNING Stock Updated At"; Rec."AUNING Stock Updated At")
                {
                    ApplicationArea = All;
                    Caption = 'AUNING updated at';
                    ToolTip = 'Specifies when the AUNING stock snapshot was last updated.';
                }
            }
        }
    }
}
