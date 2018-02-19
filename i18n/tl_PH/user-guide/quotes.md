# Mga Quote

Ang mga tampok ng quote ay magagamit sa [Paketeng Advanced](https://www.espocrm.com/extensions/advanced-pack/).

Ang mga quote ay tiyak na pangkat ng mga produkto o serbisyo na may kanya-kanyang mga dami at mga presyo na binabanggit mo sa mga tagabili..

Ang mga Quote ay may relasyon kay Opportunity. Maaari kang magdagdag ng mga panel ng Mga Quote sa view ng detalye ng Opportunity sa Administrasyon > Layout Manager > Mga Opportunity > Mga relasyon. Kapag lumilikha ng isang bagong quote na naka-link sa isang Opportunity ay ililipat ng Opportunity ang mga aytem sa quote.

Maaari kang magdagdag ng mga panel ng Mga Quote sa view ng detalye ng Account upang makakakita ng mga kaugnay na quote. Magagawa mo ito sa Administrasyon> Manager na Layout> Mga Account> Mga Relasyon.

## Mga Aytem ng Quote

May isang listahan ng mga aytem ang quote. Ang bawat aytem ay maaaring kumatawan sa isang partikular na produkto o isang serbisyo na may paglalarawan, dami, antas ng buwis, presyo ng listahan at presyo ng yunit na mga patlang. Ito ay posible upang maiayos nang manu-mano ang mga aytem.

May kakayahang magdagdag ng mga pasadyang patlang para sa Entidad ng Aytem ng Quote gamit ang manager ng entidad.

## Mga Template

Bilang default mayroong dalawang magagamit na mga template: Quote at ang Invoice. Pwede kang gumawa ng mga bagong template (mga Quote na list na view > top-right ng dropdown na menu > mga Template) pati na rin ang pag-edit ng mga umiiral sa ngayon.

Para sa mas tumpak na pag-edit inirerekumenda na gamitin ang Code View na mode.

Maaari kang mag-print ng mga patlang na tala ng Quote pati na rin ang mga patlang ng mga kaugnay na mga tala sa pamamagitan ng paggamit ng mga placeholder sa iyong template.

Mga Halimbawa:
`{{NgalanNgAccount}}` – Pangalan ng Account,

`{{{billingAddressStreet}}}` – kalye,

`{{account.tipo}}` – uri ng kaugnay na account,

`{{nakatalagang gumagamit.HulingPangalan}}` – huling pangalan ng nakatalagang gumagamit.

Kung ang iyong aytem na linya ay isang produkto ay maaari mong i-print ang mga patlang ng produkto. 

Mga halimbawa:
`{{Produkto.haba}}`, 

`{{Produkto.kulay}}`.

Ang haba at kulay ay mga pasadyang larangan ng entidad ng Produkto sa mga halimbawa.

Pag-loop sa pamamagitan ng mga quote na aytem:

```
<!-- {{#bawat ListahanNgItem}} -->
  <td>{{{Gusto}}</td>
  <td>{{Pangalan}}</td>
  <td>{{Dami}}</td>
  <td>{{produkto.bigat}}</td>
  <td align="right">{{ListahanNgPresyo}}</td>
  <td align="right">{{YunitNgPresyo}}</td>
  <td align="right">{{halagat}}</td>
<!-- {{/each}} -->
```

Posibleng mag-print ng mga patlang ng imahe: 

```
<img src="{{file ImaheId}}">
```
where `ImaheId` – ang pangalan ng pasadyang imahe ng patlang, na kinonekta sa suffix na`Id`.

Para sa aytem na linya ng produkto:
```
<img src="{{file Produkto.PiktyurId}}">
```

Upang ipakita ang mga numero ng float (like quantity, unitPrice etc.) ng walang parte na fraksyunal (as integer) ay ikaw'y gagamit ng sumusunod na ekspresyon (simula noong bersyon 4.8.3):
```
{{numberFormat quantity_RAW decimals=0}}
```

Pasadyang pagformat para sa mga halaga ng pera (simula noong bersyon na 4.8.3):
```
{{numberFormat unitPrice_RAW decimals=2 decimalPoint=',' thousandsSeparator=' '}}
```
Ang halagang `10000.5` ay magiging `10 000,50` sa pag-print. 

Para ipakita ang mga patlang ng teksto (multiline) ay gumamit ng tatlong tirante : `{{{description}}}`.

## Pag-print bilang PDF

Ang mga Quote ay pwedeng ma-print bilang PDF. Ang aksyon na ito ay magagamit sa dropdown sa tabi ng pindutang edit sa view ng detalye ng quote. Pagkatapos ay sasabihan ka upang piliin ang Template.

## Quote na koreo

Ang Quote na PDF aiy pwedeng ipadala sa koreo bilang karagdagan na file. Buksan ang talaan ng quote, i-klik ang dropdown na sunod sa pindutang Edit at pagkatapos ay i-klik ang Email PDF.

## Awtomatikong Pagnunumero

Maaari kang lumikha ng patlang ng numero sa pamamagitan ng manager ng entidad para sa uri ng Entidad ng Quote. Administrasyon > Manager ng entidad > Quote > Mga patlang > Magdagdag ng patlang > Numero. Pagkatapos ay kailangan mong ilagay ito sa view ng detalye gamit ang Manager ng Layout.

Ang halaga ay idadagdag sa bawat bagong quote. May kakayahan itong tukuyin ang susunod na numero pati na rin ang prefix nito.

## Default na Buwis

Magagamit mula noong 4.8.0 na bersyon ng EspoCrm.

1.Tukuyin ang default na tala ng Buwis sa Administrasyon > Manager ng Entidad > Mga Quote > mga Patlang > Buwis > Default.
2.Tukuyin ang default na rate ng buwis sa Pangangasiwa > Manage ng Entidad > Mga quote > Mga Patlang > presiyo ng buwis > Default.

## Mga Invoice

Ang quote ay pwedeng ituring bilang invoice kung ang estado nito ay naging `Approved`. Pagkatapos ay ang _Date Invoiced_, _Invoice Number_ fields ay magpapakita Maaari mong gamitin ang iba 't ibang template para sa mga invoice para sa pag-print.
