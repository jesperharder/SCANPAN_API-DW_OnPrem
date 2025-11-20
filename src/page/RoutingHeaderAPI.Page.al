page 50255 "RoutingHeaderAPI"
{
    /// <summary>
    /// Date        Name                    Version   Description
    /// 2025.11.20  Business Central AL     001.0     API page for Routing Header (table 99000762)
    /// </summary>

    Caption = 'RoutingHeaderAPI';
    AdditionalSearchTerms = 'SCANPAN, API, datawarehouse, dw';
    UsageCategory = Administration;

    PageType = API;
    APIPublisher = 'scanpan';
    APIGroup = 'datawarehouse';
    APIVersion = 'beta', 'v1.0';

    EntitySetName = 'routingHeaders';
    EntityName = 'routingHeader';

    DelayedInsert = true;
    Editable = false;

    SourceTable = "Routing Header";
    SourceTableView = sorting("No.") order(ascending);
    ODataKeyFields = "No.";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                Caption = 'Group';

                // --- Key ---
                field(no; Rec."No.")                              { Caption = 'No.'; }

                // --- Descriptive ---
                field(description; Rec.Description)               { Caption = 'Description'; }
                //field(searchName; Rec."Search Name")              { Caption = 'Search Name'; }

                // --- Status (Enum/Option) + INT-spejl ---
                field(status; Rec.Status)                         { Caption = 'Status'; }
                field(statusInt; statusInt)                       { Caption = 'Status INT'; }

                // --- Versioning / maintenance ---
                field(versionNos; Rec."Version Nos.")             { Caption = 'Version Nos.'; }
                field(lastDateModified; Rec."Last Date Modified") { Caption = 'Last Date Modified'; }

                // --- System fields ---
                field(systemId; Rec.SystemId)                     { Caption = 'SystemId'; }
                field(systemCreatedAt; Rec.SystemCreatedAt)       { Caption = 'SystemCreatedAt'; }
                field(systemCreatedBy; Rec.SystemCreatedBy)       { Caption = 'SystemCreatedBy'; }
                field(systemModifiedAt; Rec.SystemModifiedAt)     { Caption = 'SystemModifiedAt'; }
                field(systemModifiedBy; Rec.SystemModifiedBy)     { Caption = 'SystemModifiedBy'; }
            }
        }
    }

    var
        statusInt: Integer;

    trigger OnAfterGetRecord()
    begin
        // Enum/Option -> Integer spejl
        statusInt := Rec.Status.AsInteger(); // Hvis Option i jeres version: statusInt := Rec.Status;
    end;
}
