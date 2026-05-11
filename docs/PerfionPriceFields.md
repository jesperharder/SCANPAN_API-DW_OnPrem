# Perfion Price Fields

Endpoint: `PerfionPricesDW`

AL page: `page 50228 "PerfionPricesOData"`

Model:

- én OData-række pr. vare
- alle prisfelter er `Decimal`
- manglende pris returneres som `0`
- `LCY` betyder blank `Currency Code` i Business Central
- hver prislistekombination har tre felter:
  - `price*` = normalpris fra `Price List Line."Unit Price"`
  - `recommendedPrice*` = anbefalet pris fra KOLLAB/NOTO `Price List Line."Unit List Price"`
  - `campaignPrice*` = kampagnepris fra campaign `Price List Line."Unit Price"`

Udvælgelse:

- kun aktive prislinjer gyldige pr. dags dato
- kun de 20 konfigurerede `Source No.`/currency/UoM-kombinationer nedenfor
- `WEB-NO` læses fra company `SCANPAN Norge`; øvrige prislister læses fra det aktuelle company
- laveste `Minimum Quantity` vinder
- ved samme minimumantal vinder seneste `Starting Date`
- ved samme minimumantal og startdato vinder laveste nonzero `Unit Price`
- kampagnepris matcher campaign til debitorgruppen via KOLLAB/NOTO campaign customer price group-feltet

## Basisfelter

| Felt | Type | Kilde | Note |
| --- | --- | --- | --- |
| `systemId` | Guid | `Price List Line.SystemId` | OData key for den midlertidige vare-række. |
| `itemNo` | Code[20] | `Price List Line."Asset No."` | Varenummer. |

## Priskombinationer

| Source No. | Currency | UoM | Pris | Anbefalet pris | Kampagnepris |
| --- | --- | --- | --- | --- | --- |
| `AMAZON.DE` | `EUR` | `STK` | `priceAmazonEurStkDe` | `recommendedPriceAmazonEurStkDe` | `campaignPriceAmazonEurStkDe` |
| `AMAZON.ES` | `EUR` | `STK` | `priceAmazonEurStkEs` | `recommendedPriceAmazonEurStkEs` | `campaignPriceAmazonEurStkEs` |
| `AU` | `USD` | `BASE` | `priceAuUsdBaseAu` | `recommendedPriceAuUsdBaseAu` | `campaignPriceAuUsdBaseAu` |
| `AU` | `USD` | `CDU` | `priceAuUsdCduAu` | `recommendedPriceAuUsdCduAu` | `campaignPriceAuUsdCduAu` |
| `AU` | `USD` | `STK` | `priceAuUsdStkAu` | `recommendedPriceAuUsdStkAu` | `campaignPriceAuUsdStkAu` |
| `AUS` | `LCY` | `STK` | `priceAusLcyStkAus` | `recommendedPriceAusLcyStkAus` | `campaignPriceAusLcyStkAus` |
| `DK` | `LCY` | `STK` | `priceDkLcyStkDk` | `recommendedPriceDkLcyStkDk` | `campaignPriceDkLcyStkDk` |
| `EXP` | `EUR` | `BASE` | `priceExpEurBaseExp` | `recommendedPriceExpEurBaseExp` | `campaignPriceExpEurBaseExp` |
| `EXP` | `EUR` | `STK` | `priceExpEurStkExp` | `recommendedPriceExpEurStkExp` | `campaignPriceExpEurStkExp` |
| `FOB` | `USD` | `STK` | `priceFobUsdStkFob` | `recommendedPriceFobUsdStkFob` | `campaignPriceFobUsdStkFob` |
| `INC` | `LCY` | `STK` | `priceIncLcyStkInc` | `recommendedPriceIncLcyStkInc` | `campaignPriceIncLcyStkInc` |
| `RRP` | `EUR` | `BASE` | `priceRrpEurBaseRrp` | `recommendedPriceRrpEurBaseRrp` | `campaignPriceRrpEurBaseRrp` |
| `RRP` | `EUR` | `STK` | `priceRrpEurStkRrp` | `recommendedPriceRrpEurStkRrp` | `campaignPriceRrpEurStkRrp` |
| `SA` | `USD` | `STK` | `priceSaUsdStkSa` | `recommendedPriceSaUsdStkSa` | `campaignPriceSaUsdStkSa` |
| `SAP` | `EUR` | `STK` | `priceSapEurStkSap` | `recommendedPriceSapEurStkSap` | `campaignPriceSapEurStkSap` |
| `VGROW` | `USD` | `STK` | `priceVgrowUsdStkVgrow` | `recommendedPriceVgrowUsdStkVgrow` | `campaignPriceVgrowUsdStkVgrow` |
| `WEB-DE` | `EUR` | `STK` | `price_DE` | `recommendedPrice_DE` | `campaignPrice_DE` |
| `WEB-DK` | `LCY` | `STK` | `price_DAN` | `recommendedPrice_DAN` | `campaignPrice_DAN` |
| `WEB-NL` | `EUR` | `STK` | `price_NLD` | `recommendedPrice_NLD` | `campaignPrice_NLD` |
| `WEB-NO` | `LCY` | `STK` | `price_NOR` | `recommendedPrice_NOR` | `campaignPrice_NOR` |
