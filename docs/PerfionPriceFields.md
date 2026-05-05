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
- kun de 19 konfigurerede `Source No.`/currency/UoM-kombinationer nedenfor
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
| `AMAZON.DE` | `EUR` | `STK` | `priceAmazonDeEurStk` | `recommendedPriceAmazonDeEurStk` | `campaignPriceAmazonDeEurStk` |
| `AMAZON.ES` | `EUR` | `STK` | `priceAmazonEsEurStk` | `recommendedPriceAmazonEsEurStk` | `campaignPriceAmazonEsEurStk` |
| `AU` | `USD` | `BASE` | `priceAuUsdBase` | `recommendedPriceAuUsdBase` | `campaignPriceAuUsdBase` |
| `AU` | `USD` | `CDU` | `priceAuUsdCdu` | `recommendedPriceAuUsdCdu` | `campaignPriceAuUsdCdu` |
| `AU` | `USD` | `STK` | `priceAuUsdStk` | `recommendedPriceAuUsdStk` | `campaignPriceAuUsdStk` |
| `AUS` | `LCY` | `STK` | `priceAusLcyStk` | `recommendedPriceAusLcyStk` | `campaignPriceAusLcyStk` |
| `DK` | `LCY` | `STK` | `priceDkLcyStk` | `recommendedPriceDkLcyStk` | `campaignPriceDkLcyStk` |
| `EXP` | `EUR` | `BASE` | `priceExpEurBase` | `recommendedPriceExpEurBase` | `campaignPriceExpEurBase` |
| `EXP` | `EUR` | `STK` | `priceExpEurStk` | `recommendedPriceExpEurStk` | `campaignPriceExpEurStk` |
| `FOB` | `USD` | `STK` | `priceFobUsdStk` | `recommendedPriceFobUsdStk` | `campaignPriceFobUsdStk` |
| `INC` | `LCY` | `STK` | `priceIncLcyStk` | `recommendedPriceIncLcyStk` | `campaignPriceIncLcyStk` |
| `RRP` | `EUR` | `BASE` | `priceRrpEurBase` | `recommendedPriceRrpEurBase` | `campaignPriceRrpEurBase` |
| `RRP` | `EUR` | `STK` | `priceRrpEurStk` | `recommendedPriceRrpEurStk` | `campaignPriceRrpEurStk` |
| `SA` | `USD` | `STK` | `priceSaUsdStk` | `recommendedPriceSaUsdStk` | `campaignPriceSaUsdStk` |
| `SAP` | `EUR` | `STK` | `priceSapEurStk` | `recommendedPriceSapEurStk` | `campaignPriceSapEurStk` |
| `VGROW` | `USD` | `STK` | `priceVgrowUsdStk` | `recommendedPriceVgrowUsdStk` | `campaignPriceVgrowUsdStk` |
| `WEB-DE` | `EUR` | `STK` | `priceWebDeEurStk` | `recommendedPriceWebDeEurStk` | `campaignPriceWebDeEurStk` |
| `WEB-DK` | `LCY` | `STK` | `priceWebDkLcyStk` | `recommendedPriceWebDkLcyStk` | `campaignPriceWebDkLcyStk` |
| `WEB-NL` | `EUR` | `STK` | `priceWebNlEurStk` | `recommendedPriceWebNlEurStk` | `campaignPriceWebNlEurStk` |
