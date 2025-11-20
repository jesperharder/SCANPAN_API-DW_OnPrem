page 50201 "CampaignAPI"
{
    /// <summary>
    /// Date        Name                    Version   Description
    /// 2025.10.23  Business Central AL     001.0     API page for Campaign (5071) - DW friendly
    /// </summary>

    Caption = 'CampaignAPI';
    AdditionalSearchTerms = 'SCANPAN, API, datawarehouse, dw';
    UsageCategory = Administration;

    PageType = API;
    APIPublisher = 'scanpan';
    APIGroup = 'datawarehouse';
    APIVersion = 'beta', 'v1.0';

    EntitySetName = 'campaigns';
    EntityName = 'campaign';

    DelayedInsert = true;
    Editable = false;

    // Use table id to avoid namespace qualification issues
    SourceTable = 5071; // Campaign
    SourceTableView = sorting("No.") order(ascending);
    ODataKeyFields = "No.";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                Caption = 'Group';

                // Identifiers / basics
                field(no; Rec."No.") { Caption = 'No.'; }
                field(description; Rec.Description) { Caption = 'Description'; }

                // Dates
                field(startingDate; Rec."Starting Date") { Caption = 'Starting Date'; } // DATE
                field(endingDate; Rec."Ending Date") { Caption = 'Ending Date'; }   // DATE
                field(lastDateModified; Rec."Last Date Modified") { Caption = 'Last Date Modified'; } // DATE

                // Responsibility / numbering
                field(salespersonCode; Rec."Salesperson Code") { Caption = 'Salesperson Code'; }
                field(noSeries; Rec."No. Series") { Caption = 'No. Series'; }

                // Dimensions
                field(globalDimension1Code; Rec."Global Dimension 1 Code") { Caption = 'Global Dimension 1 Code'; }
                field(globalDimension2Code; Rec."Global Dimension 2 Code") { Caption = 'Global Dimension 2 Code'; }

                // Status (code field in table)
                field(statusCode; Rec."Status Code") { Caption = 'Status Code'; }

                // KPIs / FlowFields (unfiltered totals based on platform CalcFormula)
                field(hasComment; Rec.Comment) { Caption = 'Comment'; } // Boolean FlowField
                field(targetContactsContacted; Rec."Target Contacts Contacted") { Caption = 'Target Contacts Contacted'; }
                field(contactsResponded; Rec."Contacts Responded") { Caption = 'Contacts Responded'; }
                field(durationMin; Rec."Duration (Min.)") { Caption = 'Duration (Min.)'; }
                field(costLCY; Rec."Cost (LCY)") { Caption = 'Cost (LCY)'; }
                field(noOfOpportunities; Rec."No. of Opportunities") { Caption = 'No. of Opportunities'; }
                field(estimatedValueLCY; Rec."Estimated Value (LCY)") { Caption = 'Estimated Value (LCY)'; }
                field(calcdCurrentValueLCY; Rec."Calcd. Current Value (LCY)") { Caption = 'Calcd. Current Value (LCY)'; }
                field(activated; Rec.Activated) { Caption = 'Activated'; }

                // System fields (SaaS)
                field(systemId; Rec.SystemId) { Caption = 'SystemId'; }
                field(systemCreatedAt; Rec.SystemCreatedAt) { Caption = 'SystemCreatedAt'; }
                field(systemCreatedBy; Rec.SystemCreatedBy) { Caption = 'SystemCreatedBy'; }
                field(systemModifiedAt; Rec.SystemModifiedAt) { Caption = 'SystemModifiedAt'; }
                field(systemModifiedBy; Rec.SystemModifiedBy) { Caption = 'SystemModifiedBy'; }
            }
        }
    }

    // No variables/triggers required; platform computes FlowFields for API reads
}
