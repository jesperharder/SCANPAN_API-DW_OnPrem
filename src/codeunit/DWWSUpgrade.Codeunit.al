codeunit 50292 "DW WS Upgrade"
{
    Subtype = Upgrade;

    trigger OnUpgradePerCompany()
    var
        Registrar: Codeunit "DW WS Registrar";
    begin
        Registrar.PublishApiPages();
    end;

    // Consider adding version guards in real upgrades if needed.
}
