# Oferte

Caracteristica de Oferte este disponibilă în [Pachetul Avansat](https://www.espocrm.com/extensions/advanced-pack/).

Ofertele sunt grupuri specifice de produse sau servicii cu cantitățile și prețurile pe care le cereți clienților.

Ofertele au o relație cu Oportunitatea. Puteți adăuga panoul de Oferte din vizualizarea detaliată a Oportunității din Administrare > Manager Aspect > Oportunități > Relații. Atunci când creați o nouă ofertă legată de o oportunitate, elementele oportunității sunt transeferate ofertei.

Pentru a putea vedea Oferte asemănătoare, puteți adăuga panoul Oferte în vizualizarea detaliată a Contului. Puteți face asta din Oportunității din Administrare > Manager Aspect > Conturi > Relații.

## Elemente Ofertă

Oferta are o listă de elemente has a list of items. Fiecare element poate reprezenta un anumit produs sau un serviciu care conține descriere, cantitate, cota de impozitare, prețul listei și câmpul prețului unitar. Este posibil să sortați elementele manual.
Există posibilitatea de a adăuga câmpuri personalizate pentru Entitatea Elementului Ofertei utilizând Managerul de Entități.

## Șabloane

În mod implicit, există două șabloane: Ofertă și Factură. Puteți creea noi șabloane (Vizualizare Listă Oferte > Meniu sus-dreapta dropdown > Șabloane), dar puteți edita și unele existente.

Pentru o editare mai precisă, este recomandat să utilizați modul Vizualizare Cod.

Puteți imprima câmpurile din înregistrarea Ofertei, precum și de asemenea înregistrărilor asemănătoare prin folosirea subsituențiilor în șablon.

Exemple:
`{{accountName}}` – Nume cont,

`{{{billingAddressStreet}}}` – strada,

`{{account.type}}` – tipul contului asemănător,

`{{assignedUser.lastName}}` – numele utilizatorului atribuit.

Dacă linia elementului este un produs pe care pot fi imprimate câmpurile produsului.

Exemple:
`{{product.length}}`, 

`{{product.color}}`.

Lungimea și culoarea sunt câmpuri personalizate ale entității Produs în exemple.

Looping prin elementele ofertei:

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

Este posibilă imprimarea câmpurilor imaginii: 

```
<img src="{{file imageId}}">
```
where `imageId` – the name of custom image field in Quote entity concatenated with the suffix `Id`.

Pentru elementul linie al produsului:
```
<img src="{{file product.photoId}}">
```

Pentru a afișa numerele float (precum cantitate, unitatePreț etc.) fără o parte fracțională (ca integer) folosiți următoarele epresii (începând cu versiunea 4.8.3):
```
{{numberFormat quantity_RAW decimals=0}}
```

Formatare personalizată pentru valorile monedelor (începând cu versiunea 4.8.3):
```
{{numberFormat unitPrice_RAW decimals=2 decimalPoint=',' thousandsSeparator=' '}}
```
Valoarea`10000.5` o să fie imprimată ca `10 000,50`. 

Pentru afișarea câmpurilor text (multilinie) folosiți trei acolade: `{{{description}}}`.

## Imprimați PDF

Ofertele por fi imprimate în format PDF. Această acțiune este disponibilă lângă butonul de Editare din vizualizarea detaliată a ofertei. Apoi va trebui să selectezi Șablonul.

## Email Ofertă

Oferta în foramt PDF poate fi trimisă ca atașament. Deschideți înregistrarea ofertei, apăsați jos, lângă butonul de editare și apoi deschideți Email-ul în format PDF.

## Numerotare automată

Puteți creea un câmp de Număr cu ajutorul Managerului de Entități pentru tipul Ofertei entității. Administrare > Manager Entități > Oferte > Câmpuri > Adaugă Câmp > Numbăr. Apoi îl puteți plasa în vizualizarea detaliată, folosind Managerul de Aspect.

Valoarea va fi incrementată de fiecare ofertă nouă. Există posibilitatea de a specifica numărul următor, precum și prefixul.

## Taxă implicită

Disponibilă începând cu versiunea EspoCRM 4.8.0.

1. Specificați înregistrarea implicită a taxei din Administrare > Manager Entități > Oferte > câmpuri > Taxe > Implicit.
2. Specificați cota taxei implicite din Administrare > Manager Entități > Oferte > câmpuri > Cotă Taxe > Implicit.

## Factori

Oferta poate fi tratată ca o factură dacă statutul său a devenit `Aprobat`. Apoi câmpurile _Data Facturării_, _Numărul Facturii_ o să apară. Pentru imprimarea facturilor, puteți folosi diferite șabloane.
