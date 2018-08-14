# Mga Quote

Ang Quotes nga feature kay makit-an sa [Advanced Pack](https://www.espocrm.com/extensions/advanced-pack/).

Ang mga quote kay espisipiko nga grupo sa mga produkto o mga serbisyo nga naay mga gidaghanon og presyo nga imohang ikutlo sa mga kustomer.

Ang mga quote kay naay relasyon sa Opportunity. Pwede nimong idungag ang Quotes nga panel ngadto sa Opportunity detal view nga naa sa Administration > Layout Manager > Opportunities > Relationships. Kung muhimo ug bag-o nga quote nga naay link ngadto sa usa ka oportunidad, ibalhin niini ang mga oportunidad nga item ngadto sa quote.

Pwede kang mupuno og Quotes nga panel ngadto sa Account detail nga view para makakita sa mga naay kalabutan nga mga quote. Mahimo nimo ni sa Administration > Layout Manager > Accounts > Relationships.

## Mga Quote Item

Ang quote kay naay lista sa mga item. Kada item kay pwede murepresenta og mga produkto sa usa ka serbisyo nga naay deskripsyon, hindaghanon, rate sa buhis, lista sa presyo ug unit price nga field. Posible pud ning manomanohon og han-ay.

Naay abilidad nga mupuno og custom nga field para sa Quote Item nga entity gamit ang Entity Manager.

## Mga Template

Kung walay usbon, naay duha ka pwedeng magamit nga template: Quote og Invoice. Pwede kang mubuhat og mga bag-o nga template (Quotes list view > pinakababaw nga tuong bahin > Templates) ug pag-usab pud sa mga nabuhat na.

Para sa mas tukma nga pag-edit, girekomendar ang paggamit sa Code view nga mode.

Pwede ka muprint og mga field sa Quote nga rekord ug mga fields pud nga naay kalabutan gamit ang mga placeholder sa imohang template.

Pananglitan:
`{{accountName}}` – Pangalan sa account,

`{{{billingAddressStreet}}}` – dalan,

`{{account.type}}` – tipo sa related nga Account,

`{{assignedUser.lastName}}` – apelyedo sa naka-assign nga user.

Kung ang imong line item kay usa ka produkto, pwede kang muprint sa field sa product. 

Mga eksampol:
`{{product.length}}`, 

`{{product.color}}`.

Length and color are custom fields of Product entity in examples.
Ang hitas-on og kolor kay mga custom nga field sa Product nga entity nga naa sa mga eksampol.

Pagsubay sa mga quote item:

```
<!-- {{#each itemList}} -->
  <td>{{order}}</td>
  <td>{{name}}</td>
  <td>{{quantity}}</td>
  <td>{{product.weight}}</td>
  <td align="right">{{listPrice}}</td>
  <td align="right">{{unitPrice}}</td>
  <td align="right">{{amount}}</td>
<!-- {{/each}} -->
```

Posible pud nga muprint sa mga image field:

```
<img src="{{file imageId}}">
```
kung asa ang `imageId` – kay ang pangalan sa custom nga image field nga naa sa Quote entity nga gisumpayan og suffix nga `Id`.

Para sa product line nga item:
```
<img src="{{file product.photoId}}">
```

Para mudisplay og mga float nga numero (parehas sa hidaghanon, unitPrice etc.) nga walay fractional nga parte (isip integer), gamita ang mga musunod nga mga ekspresyon (gikan pa sa bersiyon 4.8.3)
```
{{numberFormat quantity_RAW decimals=0}}
```

Custom nga pagformat para sa mga currency nga balor (gikan pa sa bersiyon 4.8.3):
```
{{numberFormat unitPrice_RAW decimals=2 decimalPoint=',' thousandsSeparator=' '}}
```
Ang balor nga `10000.5` kay iprint nga `10 000,50`. 

Para i-display ang mga text field (daghan nga linya) gamit og tulo ka mga brace: `{{{description}}}`.

## Print ngadto sa PDF

Ang mga quote kay pwede iprint ngadto sa PDF. Ang kani nga aksyon kay mamahimo sa dropdown sunod sa Edit nga pindutanan sa quote's detail view. Dayon ingnon ka nga mupili og Template.

## Email Quote

Ang Quote PDF kay pwede ipadala sa email isip usa ka attachment. Ablihi ang quote rekord, i-click ang dropdown sunod sa Edit nga button ug i-click ang Email PDF.

## Automatic nga pagnumber

Pwede ka muhimo og Number field gamit ang Entity Manager para sa Quote entity nga tipo. Administration > Entity Manager > Quote > Fields > Add Filed > Number. Dayon nanginahanglan nimo ning iplastar sa detail view gamit ang Layout Manager.

Ang balor kay dungagan kada naay bag-o nga quote. Naay abilidad nga mu-specify og sunod nga numero ug prefix pud.

## Default nga buhis

Anaa na gikan sa EspoCRM 4.8.0.

1. Specify default Tax record at Administration > Entity Manager > Quotes > fields > Tax > Default.
2. Ispecifiy ang rate sa buhis sa Administration > Entity Manager > Quotes > fields > Tax Rate > Default.

## Mga Invoice

Ang quote kay pwede itrato isip usa ka invoice kung ang status niini kay nahimong `Approved`. Dayon ang _Date Invoiced_, _Invoice Number_ nga mga field kay manggawas. Pwede kang mugamit og lahi nga mga template para sa mga invoice para sa pagprint.
