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
- OData-filter på `itemNo` respekteres
- der beholdes én midlertidig række pr. vare
- de 19 konfigurerede prislistekombinationer udstilles som tre pivoterede felter:
  - `price*`
  - `recommendedPrice*`
  - `campaignPrice*`
- normalpris, anbefalet pris og kampagnepris bruger laveste `Minimum Quantity`
- ved samme minimumantal vinder seneste `Starting Date`
- ved samme minimumantal og startdato vinder laveste nonzero `Unit Price`

| Endpoint | Felt | Kilde | Særlig logik |
| --- | --- | --- | --- |
| `PerfionPricesDW` | `systemId` | `Price List Line.SystemId` | OData-nøgle for den kuraterede temporære række. |
| `PerfionPricesDW` | `itemNo` | `Price List Line."Asset No."` | Varenummer for den midlertidige vare-række. |
| `PerfionPricesDW` | `priceAmazonDeEurStk` | `Price List Line."Unit Price"` | `Source No. = AMAZON.DE`, `Currency Code = EUR`, `UoM = STK`. |
| `PerfionPricesDW` | `recommendedPriceAmazonDeEurStk` | `Price List Line."Unit List Price"` | Samme kombination som ovenfor. |
| `PerfionPricesDW` | `campaignPriceAmazonDeEurStk` | Campaign `Price List Line."Unit Price"` | Campaign matcher `Campaign."Customer Price Group NOTO" = AMAZON.DE`. |
| `PerfionPricesDW` | `priceAmazonEsEurStk` | `Price List Line."Unit Price"` | `Source No. = AMAZON.ES`, `Currency Code = EUR`, `UoM = STK`. |
| `PerfionPricesDW` | `recommendedPriceAmazonEsEurStk` | `Price List Line."Unit List Price"` | Samme kombination som ovenfor. |
| `PerfionPricesDW` | `campaignPriceAmazonEsEurStk` | Campaign `Price List Line."Unit Price"` | Campaign matcher `Campaign."Customer Price Group NOTO" = AMAZON.ES`. |
| `PerfionPricesDW` | `priceAuUsdBase` | `Price List Line."Unit Price"` | `Source No. = AU`, `Currency Code = USD`, `UoM = BASE`. |
| `PerfionPricesDW` | `recommendedPriceAuUsdBase` | `Price List Line."Unit List Price"` | Samme kombination som ovenfor. |
| `PerfionPricesDW` | `campaignPriceAuUsdBase` | Campaign `Price List Line."Unit Price"` | Campaign matcher `Campaign."Customer Price Group NOTO" = AU`. |
| `PerfionPricesDW` | `priceAuUsdCdu` | `Price List Line."Unit Price"` | `Source No. = AU`, `Currency Code = USD`, `UoM = CDU`. |
| `PerfionPricesDW` | `recommendedPriceAuUsdCdu` | `Price List Line."Unit List Price"` | Samme kombination som ovenfor. |
| `PerfionPricesDW` | `campaignPriceAuUsdCdu` | Campaign `Price List Line."Unit Price"` | Campaign matcher `Campaign."Customer Price Group NOTO" = AU`. |
| `PerfionPricesDW` | `priceAuUsdStk` | `Price List Line."Unit Price"` | `Source No. = AU`, `Currency Code = USD`, `UoM = STK`. |
| `PerfionPricesDW` | `recommendedPriceAuUsdStk` | `Price List Line."Unit List Price"` | Samme kombination som ovenfor. |
| `PerfionPricesDW` | `campaignPriceAuUsdStk` | Campaign `Price List Line."Unit Price"` | Campaign matcher `Campaign."Customer Price Group NOTO" = AU`. |
| `PerfionPricesDW` | `priceAusLcyStk` | `Price List Line."Unit Price"` | `Source No. = AUS`, blank BC currency eksponeres som `LCY`, `UoM = STK`. |
| `PerfionPricesDW` | `recommendedPriceAusLcyStk` | `Price List Line."Unit List Price"` | Samme kombination som ovenfor. |
| `PerfionPricesDW` | `campaignPriceAusLcyStk` | Campaign `Price List Line."Unit Price"` | Campaign matcher `Campaign."Customer Price Group NOTO" = AUS`. |
| `PerfionPricesDW` | `priceDkLcyStk` | `Price List Line."Unit Price"` | `Source No. = DK`, blank BC currency eksponeres som `LCY`, `UoM = STK`. |
| `PerfionPricesDW` | `recommendedPriceDkLcyStk` | `Price List Line."Unit List Price"` | Samme kombination som ovenfor. |
| `PerfionPricesDW` | `campaignPriceDkLcyStk` | Campaign `Price List Line."Unit Price"` | Campaign matcher `Campaign."Customer Price Group NOTO" = DK`. |
| `PerfionPricesDW` | `priceExpEurBase` | `Price List Line."Unit Price"` | `Source No. = EXP`, `Currency Code = EUR`, `UoM = BASE`. |
| `PerfionPricesDW` | `recommendedPriceExpEurBase` | `Price List Line."Unit List Price"` | Samme kombination som ovenfor. |
| `PerfionPricesDW` | `campaignPriceExpEurBase` | Campaign `Price List Line."Unit Price"` | Campaign matcher `Campaign."Customer Price Group NOTO" = EXP`. |
| `PerfionPricesDW` | `priceExpEurStk` | `Price List Line."Unit Price"` | `Source No. = EXP`, `Currency Code = EUR`, `UoM = STK`. |
| `PerfionPricesDW` | `recommendedPriceExpEurStk` | `Price List Line."Unit List Price"` | Samme kombination som ovenfor. |
| `PerfionPricesDW` | `campaignPriceExpEurStk` | Campaign `Price List Line."Unit Price"` | Campaign matcher `Campaign."Customer Price Group NOTO" = EXP`. |
| `PerfionPricesDW` | `priceFobUsdStk` | `Price List Line."Unit Price"` | `Source No. = FOB`, `Currency Code = USD`, `UoM = STK`. |
| `PerfionPricesDW` | `recommendedPriceFobUsdStk` | `Price List Line."Unit List Price"` | Samme kombination som ovenfor. |
| `PerfionPricesDW` | `campaignPriceFobUsdStk` | Campaign `Price List Line."Unit Price"` | Campaign matcher `Campaign."Customer Price Group NOTO" = FOB`. |
| `PerfionPricesDW` | `priceIncLcyStk` | `Price List Line."Unit Price"` | `Source No. = INC`, blank BC currency eksponeres som `LCY`, `UoM = STK`. |
| `PerfionPricesDW` | `recommendedPriceIncLcyStk` | `Price List Line."Unit List Price"` | Samme kombination som ovenfor. |
| `PerfionPricesDW` | `campaignPriceIncLcyStk` | Campaign `Price List Line."Unit Price"` | Campaign matcher `Campaign."Customer Price Group NOTO" = INC`. |
| `PerfionPricesDW` | `priceRrpEurBase` | `Price List Line."Unit Price"` | `Source No. = RRP`, `Currency Code = EUR`, `UoM = BASE`. |
| `PerfionPricesDW` | `recommendedPriceRrpEurBase` | `Price List Line."Unit List Price"` | Samme kombination som ovenfor. |
| `PerfionPricesDW` | `campaignPriceRrpEurBase` | Campaign `Price List Line."Unit Price"` | Campaign matcher `Campaign."Customer Price Group NOTO" = RRP`. |
| `PerfionPricesDW` | `priceRrpEurStk` | `Price List Line."Unit Price"` | `Source No. = RRP`, `Currency Code = EUR`, `UoM = STK`. |
| `PerfionPricesDW` | `recommendedPriceRrpEurStk` | `Price List Line."Unit List Price"` | Samme kombination som ovenfor. |
| `PerfionPricesDW` | `campaignPriceRrpEurStk` | Campaign `Price List Line."Unit Price"` | Campaign matcher `Campaign."Customer Price Group NOTO" = RRP`. |
| `PerfionPricesDW` | `priceSaUsdStk` | `Price List Line."Unit Price"` | `Source No. = SA`, `Currency Code = USD`, `UoM = STK`. |
| `PerfionPricesDW` | `recommendedPriceSaUsdStk` | `Price List Line."Unit List Price"` | Samme kombination som ovenfor. |
| `PerfionPricesDW` | `campaignPriceSaUsdStk` | Campaign `Price List Line."Unit Price"` | Campaign matcher `Campaign."Customer Price Group NOTO" = SA`. |
| `PerfionPricesDW` | `priceSapEurStk` | `Price List Line."Unit Price"` | `Source No. = SAP`, `Currency Code = EUR`, `UoM = STK`. |
| `PerfionPricesDW` | `recommendedPriceSapEurStk` | `Price List Line."Unit List Price"` | Samme kombination som ovenfor. |
| `PerfionPricesDW` | `campaignPriceSapEurStk` | Campaign `Price List Line."Unit Price"` | Campaign matcher `Campaign."Customer Price Group NOTO" = SAP`. |
| `PerfionPricesDW` | `priceVgrowUsdStk` | `Price List Line."Unit Price"` | `Source No. = VGROW`, `Currency Code = USD`, `UoM = STK`. |
| `PerfionPricesDW` | `recommendedPriceVgrowUsdStk` | `Price List Line."Unit List Price"` | Samme kombination som ovenfor. |
| `PerfionPricesDW` | `campaignPriceVgrowUsdStk` | Campaign `Price List Line."Unit Price"` | Campaign matcher `Campaign."Customer Price Group NOTO" = VGROW`. |
| `PerfionPricesDW` | `priceWebDeEurStk` | `Price List Line."Unit Price"` | `Source No. = WEB-DE`, `Currency Code = EUR`, `UoM = STK`. |
| `PerfionPricesDW` | `recommendedPriceWebDeEurStk` | `Price List Line."Unit List Price"` | Samme kombination som ovenfor. |
| `PerfionPricesDW` | `campaignPriceWebDeEurStk` | Campaign `Price List Line."Unit Price"` | Campaign matcher `Campaign."Customer Price Group NOTO" = WEB-DE`. |
| `PerfionPricesDW` | `priceWebDkLcyStk` | `Price List Line."Unit Price"` | `Source No. = WEB-DK`, blank BC currency eksponeres som `LCY`, `UoM = STK`. |
| `PerfionPricesDW` | `recommendedPriceWebDkLcyStk` | `Price List Line."Unit List Price"` | Samme kombination som ovenfor. |
| `PerfionPricesDW` | `campaignPriceWebDkLcyStk` | Campaign `Price List Line."Unit Price"` | Campaign matcher `Campaign."Customer Price Group NOTO" = WEB-DK`. |
| `PerfionPricesDW` | `priceWebNlEurStk` | `Price List Line."Unit Price"` | `Source No. = WEB-NL`, `Currency Code = EUR`, `UoM = STK`. |
| `PerfionPricesDW` | `recommendedPriceWebNlEurStk` | `Price List Line."Unit List Price"` | Samme kombination som ovenfor. |
| `PerfionPricesDW` | `campaignPriceWebNlEurStk` | Campaign `Price List Line."Unit Price"` | Campaign matcher `Campaign."Customer Price Group NOTO" = WEB-NL`. |
