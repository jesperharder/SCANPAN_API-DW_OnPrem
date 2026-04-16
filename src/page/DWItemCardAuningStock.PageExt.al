pageextension 50232 "DW Item Card Auning Stock" extends "Item Card"
{
    layout
    {
        addlast(FactBoxes)
        {
            part(AuningStockFactBox; "AuningStockFactBox")
            {
                ApplicationArea = All;
                SubPageLink = "No." = field("No.");
            }
        }
    }
}
