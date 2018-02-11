# Import

Ang import kay ma-access ra sa mga admin nga user. Administration > Import. Pwede kang mu-import ra gikan sa CSV nga mga file.

## Step 1

Pili kung unsa nga type nga mga rekord ang imohang gikinahanglan nga i-import (Entity Type field).
Pili ug CSV file Ang file kay gikinahanglan nga giformat gamit ang `UTF-8`.
Pili og `What to do?`. Mga pwede nga mga opsyon: 'Create Only', 'Create & Update', 'Update Only'.

* `Create Only` - pilia ni kung gusto nimong rekord ra ang mahimo.
* `Create & Update` - ang mga rekord kay himoon pero kung ang rekord nga nagkaparehas og mga field value kay makit-an, i-update kini. Pwede nimong e-check kung unsa nga mga field ang i-match by sa _Step 2_.
* `Update only` - ang mga rekord ra nga naay nagkaparehang mga field value ang makitan ug i-update.

Kung nakapili naka og csv nga file, pwede naka makakita kung unsaon ni pag parse sa Preview panel. Kung usbon nimo ang mga property, ang preview kay ma-update.

* `Header Row` - depende kong ang CSV file naay unga nga row nga naay mga field name.
* `Execute in idle` - girekomenda kini kung naa kay daghan nga rekord nga gusto nimong i-import. Ang import kay iproseso gamit ang cron. Ang status kay i-set ngadto sa 'Complete' kung ang proseso sa pag-import kay nahuman na.
* `Skip searching for duplicates` - muminus kini sa import runtime.

I-click ang _Next_ nga pindutanan para musunod ngadto sa _Step 2_.

![1](../_static/images/administration/import/step-1.png)

## Step 2

I-setup ang field mapping: kung unsaon pag correspond sa field sa mga column ngadto sa csv file.
Sa kaso nga 'Create & Update' ug 'Update only', gikinahanglan ra ka mucheck sa mga field kung asa ang mga rekord nga gikinahanglang ma-update kay makit-an.
Pagdungag ug mga default value nga imohang ganahan iset sa mga bag-o o bag-ong giupdate nga mga rekord. E.g. pwede nimong i-specify ang Assigned User o Teams nga mga field.

Pagkahuman sa pag-import, pwede na nimong i-revert ang mga nahimo nang mga rekord, mutan-aw sa mga nagkadoble ug mga na-update nga rekord. Kung nagkadoble, nagpasabot kini nga naay parehas nga rekord sa sistema. Pwede nimong tangtangon ang tanan imported nga mga duplicate sa makausa ra. Timan-e: Ang Revert kay dili mugana sa mga na-update nga mga rekord.

I-click ang _Run Import_ nga pindutanan para magpadayon. Mukaon kini og pila ka oras usa ang import kay mahuman. Kung gusto nimo nga muimport og dagko nga mga rekord (depende ni sa imohang server configuration, kasagaran kung dako pa sa 200 ka mga rekord), gikinahanglan nimo nga siguradohon nga ang php parameter nga `set_time_limit` nga sakto ra sa hidak-on.

![2](../_static/images/administration/import/step-2.png)

## Unsaon pag-import ngadto sa Target List

Kung mu-import kag Contacts, Leads o Accounts, pwede nimong ipuno ni sa ubang mga target list. Sa step 2, gikinahanglan nimong ipuno ang Target List nga field sa `Default Values` panel ug pilion ang gikinahanglan nga target list rekord. Pwede usab nimo gamiton ang `Update only` o `Create & Update` nga import para dungagan og mga dugang pa nga mga target ngadto sa target list.
