page 50217 "FixedAssetAPI"
{
    /// <summary>
    /// 2025.10.24 - Jesper Harder - v001.0
    /// API page for Fixed Asset (DW export with enum/option INT mapping)
    /// </summary>

    Caption = 'FixedAssetAPI';
    AdditionalSearchTerms = 'SCANPAN, API, datawarehouse, fixed assets';
    UsageCategory = Administration;

    PageType = API;
    APIPublisher = 'scanpan';
    APIGroup = 'datawarehouse';
    APIVersion = 'beta', 'v1.0';

    EntitySetName = 'fixedAssets';
    EntityName = 'fixedAsset';

    DelayedInsert = true;
    Editable = false;

    SourceTable = "Fixed Asset";
    SourceTableView = sorting("No.") order(ascending);
    ODataKeyFields = "No.";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                Caption = 'Fixed Asset Fields';

                // --- Identification ---
                field(no; Rec."No.") { Caption = 'FA No.'; }
                field(description; Rec.Description) { Caption = 'Description'; }
                field(description2; Rec."Description 2") { Caption = 'Description 2'; }
                field(searchDescription; Rec."Search Description") { Caption = 'Search Description'; }

                // --- Classification ---
                field(faClassCode; Rec."FA Class Code") { Caption = 'FA Class Code'; }
                field(faSubclassCode; Rec."FA Subclass Code") { Caption = 'FA Subclass Code'; }
                field(locationCode; Rec."Location Code") { Caption = 'Location Code'; }
                field(faLocationCode; Rec."FA Location Code") { Caption = 'FA Location Code'; }

                // --- Posting setup ---
                field(faPostingGroup; Rec."FA Posting Group") { Caption = 'FA Posting Group'; }
                field(vendorNo; Rec."Vendor No.") { Caption = 'Vendor No.'; }
                field(mainAssetComponent; Rec."Main Asset/Component") { Caption = 'Main Asset/Component'; }
                field(mainAssetComponentInt; mainAssetComponentInt) { Caption = 'Main Asset/Component INT'; }
                field(componentOfMainAsset; Rec."Component of Main Asset") { Caption = 'Component of Main Asset'; }

                // --- General info ---
                field(budgetedAsset; Rec."Budgeted Asset") { Caption = 'Budgeted Asset'; }
                field(warrantyDate; Rec."Warranty Date") { Caption = 'Warranty Date'; }
                field(responsibleEmployee; Rec."Responsible Employee") { Caption = 'Responsible Employee'; }
                field(serialNo; Rec."Serial No.") { Caption = 'Serial No.'; }

                // --- Maintenance ---
                field(maintenanceVendorNo; Rec."Maintenance Vendor No.") { Caption = 'Maintenance Vendor No.'; }
                field(underMaintenance; Rec."Under Maintenance") { Caption = 'Under Maintenance'; }
                field(nextServiceDate; Rec."Next Service Date") { Caption = 'Next Service Date'; }

                // --- Status ---
                field(inactive; Rec.Inactive) { Caption = 'Inactive'; }
                field(blocked; Rec.Blocked) { Caption = 'Blocked'; }
                field(acquired; Rec.Acquired) { Caption = 'Acquired'; }
                field(insured; Rec.Insured) { Caption = 'Insured'; }
                field(comment; Rec.Comment) { Caption = 'Comment'; }

                // --- Dimensions ---
                field(globalDimension1Code; Rec."Global Dimension 1 Code") { Caption = 'Global Dimension 1 Code'; }
                field(globalDimension2Code; Rec."Global Dimension 2 Code") { Caption = 'Global Dimension 2 Code'; }

                // --- Audit & metadata ---
                field(lastDateModified; Rec."Last Date Modified") { Caption = 'Last Date Modified'; }
                field(noSeries; Rec."No. Series") { Caption = 'No. Series'; }

                // --- System fields ---
                field(systemId; Rec.SystemId) { Caption = 'SystemId'; }
                field(systemCreatedAt; Rec.SystemCreatedAt) { Caption = 'SystemCreatedAt'; }
                field(systemCreatedBy; Rec.SystemCreatedBy) { Caption = 'SystemCreatedBy'; }
                field(systemModifiedAt; Rec.SystemModifiedAt) { Caption = 'SystemModifiedAt'; }
                field(systemModifiedBy; Rec.SystemModifiedBy) { Caption = 'SystemModifiedBy'; }
            }
        }
    }

    var
        mainAssetComponentInt: Integer;

    trigger OnAfterGetRecord()
    begin
        // Enum/Option → integer mapping for DW stability
        case Rec."Main Asset/Component" of
            Rec."Main Asset/Component"::" ":
                mainAssetComponentInt := 0;
            Rec."Main Asset/Component"::"Main Asset":
                mainAssetComponentInt := 1;
            Rec."Main Asset/Component"::Component:
                mainAssetComponentInt := 2;
            else
                mainAssetComponentInt := -1;
        end;
    end;
}
