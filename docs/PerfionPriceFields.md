# Perfion Price Fields

Endpoint: `PerfionPricesDW`

AL page: `page 50228 "PerfionPricesOData"`

Model:

- én OData-række pr. vare
- alle prisfelter er tekstfelter, så nulpriser kan leveres blankt i OData JSON
- manglende pris eller prisværdi `0` leveres som tom tekst i endpointet
- `LCY` betyder blank `Currency Code` i Business Central
- hver prislistekombination har tre felter:
  - `price*` = normalpris fra `Price List Line."Unit Price"`
  - `recommendedPrice*` = anbefalet pris fra KOLLAB/NOTO `Price List Line."Unit List Price"`
  - `campaignPrice*` = kampagnepris fra campaign `Price List Line."Unit Price"`

Udvælgelse:

- kun aktive prislinjer gyldige pr. dags dato
- kun de 4 konfigurerede web `Source No.`/currency/UoM-kombinationer nedenfor
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
| `WEB-DE` | `EUR` | `STK` | `price_DE` | `recommendedPrice_DE` | `campaignPrice_DE` |
| `WEB-DK` | `LCY` | `STK` | `price_DAN` | `recommendedPrice_DAN` | `campaignPrice_DAN` |
| `WEB-NL` | `EUR` | `STK` | `price_NLD` | `recommendedPrice_NLD` | `campaignPrice_NLD` |
| `WEB-NO` | `LCY` | `STK` | `price_NOR` | `recommendedPrice_NOR` | `campaignPrice_NOR` |
