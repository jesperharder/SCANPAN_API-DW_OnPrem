codeunit 50291 "DW WS Install"
{
    Subtype = Install;

    trigger OnInstallAppPerCompany()
    var
        Registrar: Codeunit "DW WS Registrar";
    begin
        Registrar.PublishApiPages();
    end;

    // If you also want per-database behavior once per tenant:
    // trigger OnInstallAppPerDatabase()
    // begin
    //     // Optional: cross-company actions (not needed here)
    // end;
}
