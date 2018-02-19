# Pag-print bilang PDF

Paalala: Ang tampok na ito ay magagamit hanggang sa EspoCRM 5.0.5 na bersyon.

Ang pag-print bilang PDF ay nagbibigay ng abilidad na makabuo ng mga dokumentong PDF na may talaan na datos. Ang nilalaman ng dokumento ay tinukoy ng Template.


1. Kailangan ay mayroon ka na hindi bababa sa isang Template para sa uri ng entidad ng rekord na gusto mong i-print.
2. 'Pag-print bilang PDF' ay magagamit sa view ng detalye sa ilalim ng dropdown sa tabi ng pindutang 'I-edit'.

## Mga Template

Ang tab ng mga template ay nakatago bilang default. Maaaring idagdag ito ng Administrador sa Administrasyon> Interface ng gumagamit.

Para sa mas tumpak na pag-eedit ay inirerekumenda na gamitin ang Code View na mode.

Maaari kang mag-print ng mga patlang ng rekord pati na rin ang mga patlang ng mga kaugnay na mga tala sa pamamagitan ng paggamit ng mga placeholder sa iyong template.

Mga Halimbawa: 

* `{{name}}` – Pangalan ng Rekord;
* `{{assignedUserName}}` – Naka-assign na gumagamit;
* `{{account.name}}` – Pangalan ng account na may kaugnayan.

Posibleng mag-print ng mga patlang ng larawan:
```
<img src="{{file imageId}}">
```

kung saan `imageId` – ang pangalan ng pasadyang imahe na patlang, na konektado sa suffix na `Id`.

Upang maipakita ang mga numero ng float ng walang parte na praksyonal (as integer)  ay gamitin ang mga sumusunod na ekspresyon:
```
{{numberFormat quantity_RAW decimals=0}}
```

Pasadyang pag-format para sa mga halaga ng pera:
```
{{numberFormat unitPrice_RAW decimals=2 decimalPoint=',' thousandsSeparator=' '}}
```

Ang halagang `10000.5` ay i-print bilang `10 000,50`.

Upang mapakita ang mga patlang ng teksto (multiline) ay gumamit ng tatlong tirante: ```{{{description}}}```.
