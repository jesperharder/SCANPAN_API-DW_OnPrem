# Perfion og AUNING feltoversigt

Denne oversigt dækker de tre operative webservice-endpoints:

- `AuningStockDW`
- `PerfionItemsDW`
- `PerfionPricesDW`

Kilden er den aktuelle AL-implementering i:

- [AuningStockOData.Page.al](/c:/Users/jespe/OneDrive%20-%20Scanpan/Scanpan%20(7.1.2015)/Development/SCANPAN%20API-DW%20OnPrem/src/page/AuningStockOData.Page.al:1)
- [PerfionItemsOData.Page.al](/c:/Users/jespe/OneDrive%20-%20Scanpan/Scanpan%20(7.1.2015)/Development/SCANPAN%20API-DW%20OnPrem/src/page/PerfionItemsOData.Page.al:1)
- [PerfionPricesOData.Page.al](/c:/Users/jespe/OneDrive%20-%20Scanpan/Scanpan%20(7.1.2015)/Development/SCANPAN%20API-DW%20OnPrem/src/page/PerfionPricesOData.Page.al:1)
- [AuningStockUpdate.Codeunit.al](/c:/Users/jespe/OneDrive%20-%20Scanpan/Scanpan%20(7.1.2015)/Development/SCANPAN%20API-DW%20OnPrem/src/codeunit/AuningStockUpdate.Codeunit.al:1)

## 1. AuningStockDW

Grundscope for endpointet:

- `Item.Type = Inventory`
- `Item."Gen. Prod. Posting Group" = INTERN|EKSTERN|BRUND`

| Endpoint | Felt | Kilde | Særlig logik |
| --- | --- | --- | --- |
| `AuningStockDW` | `itemNo` | `Item."No."` | OData-nøglefelt. |
| `AuningStockDW` | `description` | `Item.Description` | Direkte felt uden ekstra logik. |
| `AuningStockDW` | `auningStockOnHand` | `Item."AUNING Stock On Hand"` | Snapshotfelt opdateret af `codeunit 50042`. Beregnes kun for lokation `AUNING`, summeres for blank variant og alle item-varianter, rundes ned til heltal, negative værdier clamps til `0`. |
| `AuningStockDW` | `auningStockAvailable` | `Item."AUNING Stock Available"` | Snapshotfelt opdateret af `codeunit 50042`. Beregnes via `Warehouse Availability Mgt.` pr. variant og summeres. Kan reduceres med Job Queue-parameteren `AvailableReductionPct`, rundes ned til heltal og clamps til `0`. |
| `AuningStockDW` | `auningStockUpdatedAt` | `Item."AUNING Stock Updated At"` | Samme timestamp sættes for hele kørslen. Viser hvornår snapshot sidst blev opdateret, ikke hvornår lageret sidst ændrede sig. |

## 2. PerfionItemsDW

Grundscope for endpointet:

- `Item."Gen. Prod. Posting Group" = INTERN|EKSTERN|BRUND`
- `Item."ABCD Category" <> E`
- `Item."ABCD Category" <> D`
- `Item."Product Usage" <> PRODUCTION`
- `Item."Product Usage" <> MARKETING`
- `Item."Prod. Group Code" <> RÅVARE`

| Endpoint | Felt | Kilde | Særlig logik |
| --- | --- | --- | --- |
| `PerfionItemsDW` | `itemNo` | `Item."No."` | OData-nøglefelt. |
| `PerfionItemsDW` | `itemType` | `Item.Type` | Enum konverteres til integer med `Rec.Type.AsInteger()`. |
| `PerfionItemsDW` | `itemTypeTextDa` | `Item.Type` | Enum formatteres til tekst med `Format(Rec.Type)`. |
| `PerfionItemsDW` | `baseUnitCode` | `Item."Base Unit of Measure"` | Direkte felt. |
| `PerfionItemsDW` | `genProdPostingGroup` | `Item."Gen. Prod. Posting Group"` | Direkte felt og samtidig del af endpointets basisfilter. |
| `PerfionItemsDW` | `usageGroup` | `Item."Product Usage"` | Direkte felt og samtidig del af endpointets basisfilter. |
| `PerfionItemsDW` | `brandCode` | `Item."Item Brand"` | Direkte felt. |
| `PerfionItemsDW` | `productLineCode` | `Item."Product Line Code"` | Direkte felt. |
| `PerfionItemsDW` | `productGroupCode` | `Item."Prod. Group Code"` | Direkte felt og samtidig del af endpointets basisfilter. |
| `PerfionItemsDW` | `abcdCategory` | `Item."ABCD Category"` | Direkte felt og samtidig del af endpointets basisfilter. |
| `PerfionItemsDW` | `itemCategoryCode` | `Item."Item Category Code"` | Direkte felt. |
| `PerfionItemsDW` | `tariffNo` | `Item."Tariff No."` | Direkte felt. |
| `PerfionItemsDW` | `countryRegionCode` | `Item."Country/Region of Origin Code"` | Direkte felt. |
| `PerfionItemsDW` | `barcodeStk` | `Item Reference."Reference No."` | Finder første `Item Reference` for varen med `Reference Type = Bar Code` og `Unit of Measure = STK`. Returnerer blank hvis ingen findes. |
| `PerfionItemsDW` | `barcodeInner` | `Item Reference."Reference No."` | Finder første `Item Reference` med `Reference Type = Bar Code` og `Unit of Measure = INNER`. Returnerer blank hvis ingen findes. |
| `PerfionItemsDW` | `barcodeMaster` | `Item Reference."Reference No."` | Finder første `Item Reference` med `Reference Type = Bar Code` og `Unit of Measure = MASTER`. Returnerer blank hvis ingen findes. |
| `PerfionItemsDW` | `descriptionDa` | `Item Translation.Description` + `Item Translation."Description 2"` | Henter sprogkode `DAN`. Hvis der ikke findes en oversættelse, falder feltet tilbage til `Item.Description`, trunkeret til 250 tegn. |
| `PerfionItemsDW` | `descriptionNo` | `Item Translation.Description` + `Item Translation."Description 2"` | Henter sprogkode `NOR`. Returnerer blank hvis ingen oversættelse findes. |
| `PerfionItemsDW` | `descriptionSv` | `Item Translation.Description` + `Item Translation."Description 2"` | Henter sprogkode `SVE`. Returnerer blank hvis ingen oversættelse findes. |
| `PerfionItemsDW` | `descriptionFi` | `Item Translation.Description` + `Item Translation."Description 2"` | Henter sprogkode `FIN`. Returnerer blank hvis ingen oversættelse findes. |
| `PerfionItemsDW` | `descriptionEn` | `Item Translation.Description` + `Item Translation."Description 2"` | Henter sprogkode `ENU`. Returnerer blank hvis ingen oversættelse findes. |
| `PerfionItemsDW` | `descriptionDe` | `Item Translation.Description` + `Item Translation."Description 2"` | Henter sprogkode `DEU`. Returnerer blank hvis ingen oversættelse findes. |
| `PerfionItemsDW` | `descriptionFr` | `Item Translation.Description` + `Item Translation."Description 2"` | Henter sprogkode `FRA`. Returnerer blank hvis ingen oversættelse findes. |
| `PerfionItemsDW` | `descriptionNl` | `Item Translation.Description` + `Item Translation."Description 2"` | Henter sprogkode `NLD`. Returnerer blank hvis ingen oversættelse findes. |
| `PerfionItemsDW` | `descriptionIt` | `Item Translation.Description` + `Item Translation."Description 2"` | Henter sprogkode `ITA`. Returnerer blank hvis ingen oversættelse findes. |
| `PerfionItemsDW` | `netWeight` | `Item."Net Weight"` | Direkte felt. |
| `PerfionItemsDW` | `grossWeight` | `Item."Gross Weight"` | Direkte felt. |
| `PerfionItemsDW` | `stkQtyPerUnit` | `Item Unit of Measure."Qty. per Unit of Measure"` | Hentes for UoM-kode `STK`. Returnerer `0` hvis der ikke findes en række. |
| `PerfionItemsDW` | `stkHeight` | `Item Unit of Measure.Height` | Hentes for `STK`. Returnerer `0` hvis der ikke findes en række. |
| `PerfionItemsDW` | `stkWidth` | `Item Unit of Measure.Width` | Hentes for `STK`. Returnerer `0` hvis der ikke findes en række. |
| `PerfionItemsDW` | `stkLength` | `Item Unit of Measure.Length` | Hentes for `STK`. Returnerer `0` hvis der ikke findes en række. |
| `PerfionItemsDW` | `stkVolume` | `Item Unit of Measure.Cubage` | Hentes for `STK`. Returnerer `0` hvis der ikke findes en række. |
| `PerfionItemsDW` | `stkWeight` | `Item Unit of Measure.Weight` | Hentes for `STK`. Returnerer `0` hvis der ikke findes en række. |
| `PerfionItemsDW` | `innerQtyPerUnit` | `Item Unit of Measure."Qty. per Unit of Measure"` | Hentes for UoM-kode `INNER`. Returnerer `0` hvis der ikke findes en række. |
| `PerfionItemsDW` | `innerHeight` | `Item Unit of Measure.Height` | Hentes for `INNER`. Returnerer `0` hvis der ikke findes en række. |
| `PerfionItemsDW` | `innerWidth` | `Item Unit of Measure.Width` | Hentes for `INNER`. Returnerer `0` hvis der ikke findes en række. |
| `PerfionItemsDW` | `innerLength` | `Item Unit of Measure.Length` | Hentes for `INNER`. Returnerer `0` hvis der ikke findes en række. |
| `PerfionItemsDW` | `innerVolume` | `Item Unit of Measure.Cubage` | Hentes for `INNER`. Returnerer `0` hvis der ikke findes en række. |
| `PerfionItemsDW` | `innerWeight` | `Item Unit of Measure.Weight` | Hentes for `INNER`. Returnerer `0` hvis der ikke findes en række. |
| `PerfionItemsDW` | `masterQtyPerUnit` | `Item Unit of Measure."Qty. per Unit of Measure"` | Hentes for UoM-kode `MASTER`. Returnerer `0` hvis der ikke findes en række. |
| `PerfionItemsDW` | `masterHeight` | `Item Unit of Measure.Height` | Hentes for `MASTER`. Returnerer `0` hvis der ikke findes en række. |
| `PerfionItemsDW` | `masterWidth` | `Item Unit of Measure.Width` | Hentes for `MASTER`. Returnerer `0` hvis der ikke findes en række. |
| `PerfionItemsDW` | `masterLength` | `Item Unit of Measure.Length` | Hentes for `MASTER`. Returnerer `0` hvis der ikke findes en række. |
| `PerfionItemsDW` | `masterVolume` | `Item Unit of Measure.Cubage` | Hentes for `MASTER`. Returnerer `0` hvis der ikke findes en række. |
| `PerfionItemsDW` | `masterWeight` | `Item Unit of Measure.Weight` | Hentes for `MASTER`. Returnerer `0` hvis der ikke findes en række. |
| `PerfionItemsDW` | `coating` | `Item.Coating` | Direkte felt. |

## 3. PerfionPricesDW

Grundscope for basispris-datasættet:

- `Price List Line."Asset Type" = Item`
- `Price List Line."Source Type" = Customer Price Group`
- `Price List Line.Status = Active`
- `Price List Line."Starting Date" <= Today`
- `Price List Line."Ending Date" >= Today` eller blank dato

Yderligere runtime-logik:

- datasættet bygges i et midlertidigt recordset ved hvert kald
- OData-filtre på `itemNo`, `salesCode`, `currencyCode`, `unitOfMeasureCode`, `priceListCode` og `minimumQuantity` respekteres
- der beholdes kun én basispris pr. kombination af `itemNo + salesCode + currencyCode + unitOfMeasureCode`
- `minimumQuantity` indgår ikke i deduplikeringsnøglen

| Endpoint | Felt | Kilde | Særlig logik |
| --- | --- | --- | --- |
| `PerfionPricesDW` | `systemId` | `Price List Line.SystemId` | OData-nøgle for den kuraterede temporære række. |
| `PerfionPricesDW` | `priceListCode` | `Price List Line."Price List Code"` | Direkte felt fra den valgte basisprislinje. OData-filter understøttes. |
| `PerfionPricesDW` | `lineNo` | `Price List Line."Line No."` | Direkte felt fra den valgte basisprislinje. |
| `PerfionPricesDW` | `itemNo` | `Price List Line."Asset No."` | Direkte felt fra den valgte basisprislinje. OData-filter understøttes. |
| `PerfionPricesDW` | `salesCode` | `Price List Line."Source No."` | Direkte felt fra den valgte basisprislinje. Repræsenterer `Customer Price Group`. OData-filter understøttes. |
| `PerfionPricesDW` | `currencyCode` | `Price List Line."Currency Code"` | Direkte felt fra den valgte basisprislinje. OData-filter understøttes. |
| `PerfionPricesDW` | `unitListPrice` | `Price List Line."Unit List Price"` | Direkte felt fra den valgte basisprislinje. |
| `PerfionPricesDW` | `unitPrice` | `Price List Line."Unit Price"` | Direkte felt fra den valgte basisprislinje. Ved dubletter vinder seneste `Starting Date`, og ved samme dato vinder laveste `Unit Price`. |
| `PerfionPricesDW` | `startingDate` | `Price List Line."Starting Date"` | Viser startdatoen på den valgte basisprislinje. Kun linjer gyldige pr. `Today` kan komme med. |
| `PerfionPricesDW` | `endingDate` | `Price List Line."Ending Date"` | Viser slutdatoen på den valgte basisprislinje. Blank dato behandles som åben gyldighed. |
| `PerfionPricesDW` | `unitOfMeasureCode` | `Price List Line."Unit of Measure Code"` | Direkte felt fra den valgte basisprislinje. OData-filter understøttes. |
| `PerfionPricesDW` | `minimumQuantity` | `Price List Line."Minimum Quantity"` | Direkte felt fra den valgte basisprislinje. OData-filter understøttes, men feltet indgår ikke i deduplikeringsnøglen. Derfor kan quantity-breaks blive undertrykt. |
| `PerfionPricesDW` | `status` | `Price List Line.Status` | Enum konverteres til integer med `Rec.Status.AsInteger()`. Basisdatasættet indeholder kun `Active`. |
| `PerfionPricesDW` | `statusText` | `Price List Line.Status` | Enum formatteres til tekst med `Format(Rec.Status)`. Vil i praksis være `Active` for eksporterede basisprislinjer. |
| `PerfionPricesDW` | `campaignPrice` | Afledt fra kampagnelinjer i `Price List Line` | Beregnes i `OnAfterGetRecord()`. Søger aktive kampagnelinjer med `Source Type = Campaign`, gyldige pr. `Today`, samme `itemNo` og samme valuta/UoM hvis de er sat. Matcher kampagnen til `salesCode` via `Campaign."Customer Price Group NOTO"`. Laveste kampagnepris vinder. Ved samme pris vinder seneste `Starting Date`. |
| `PerfionPricesDW` | `campaignId` | `Price List Line."Source No."` fra kampagnelinje | Returnerer kampagnenummeret for den valgte kampagnepris. Blank hvis ingen gyldig kampagne matcher `salesCode`. |
