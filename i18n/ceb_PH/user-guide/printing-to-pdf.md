# Pagprint ngadto sa PDF

Timan-e: Ang kaning feature kay maanaa na gikan sa EspoCRM version 5.0.5.

Ang pagprint ngadto sa PDF muhatag og abilidad nga mugenerate og mga PDF nga dokumento nga naay rekord nga datos. Ang sulod sa dokumento kay i-define pinaagi sa Template.


1. Gikinahanglan nimong naay labing menos usa ka Template para sa entity type sa rekord nga imohang gusto i-print.
2. 'Print to PDF' kay naa makit-an sa detail view ubos sa dropdown sunod sa 'Edit' nga pindutanan.

## Mga Template

Ang Templates nga tab ka gitago kung wala ray giusab. Ang administrador kay pwede kani ipuno ngadto sa Administration > User Interface.

Para sa mga mas tukma nga pag-edit, girekomenda nga mugamit og Code View nga mode.

Pwede nimong iprint ang mga field sa rekord ingon man usab ang mga field sa mga naay kalabutan nga rekord pinaagi sa paggamit og mga placeholder sa imohang template.

Mga Example: 

* `{{name}}` – Pangalan sa rekord;
* `{{assignedUserName}}` – Assigned nga User;
* `{{account.name}}` – Pangalan sa naay kalibutan nga rekord.

Posible pud nga muprint og mga image field:
```
<img src="{{file imageId}}">
```

kung asa `imageId` – ang pangalan sa custom image nga field, gisumpayan og suffix nga `Id`.

Para ipakit ang mga float nga numero nga walay praksyonal nga parte (isip usa ka integer), gamita ang musunod nga mga ekspresyon:
```
{{numberFormat quantity_RAW decimals=0}}
```

Custom nga formatting para sa mga currency value:
```
{{numberFormat unitPrice_RAW decimals=2 decimalPoint=',' thousandsSeparator=' '}}
```

Ang balor nga `10000.5` kay i-imprinta isip `10 000,50`.

Para i-display ang mga text field (daghan nga linya), paggamit og tulo ka brace: ```{{{description}}}```.
