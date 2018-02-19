# Mga Workflow

Ang tampok na mga Workflow ay makukuka sa [Advanced Pack](https://www.espocrm.com/extensions/advanced-pack/).

Ang mga Workflow ay nag-aawtomeyt ng iyong proseso sa negosyo sa madaling paraan. Makikita mo ito sa Administration panel. Upang lumikha ng patakaran ng workflow, kailangan mong liwanagin ang:

* Target Entity - kung anong entity type workflow ang i-aaply;
* Uri ng Trigger - kung kailan paaandarin ang workflow;
* Mga kondisyon - ang mga kondisyon ay dapat matugunan upang paandarin ang workflow;
* Mga Aksyon - ang mga kailangan gawin kung ang workflow ay napa-andar na.


## Mga Uri ng Paandar

### Pagkatapos na Likhain ang Rekord 

Umaandar lamang kapag ang isang bagong rekord ay nilikha. Kung ang mga tinukoy na mga kondisyon ay natugunan, ang mga aksyon ay maisasakatuparan.

### Pagkatapos na i-save ang rekord

Umaandar lamang kapag ang isang bagong rekord ay nilikha o ang kasalukuyang rekord ay na-update. Kung ang mga tinukoy na mga kondisyon ay natugunan, ang mga aksyon ay maisasakatuparan. 

Para sa mga patakaran ng workflow na maayroong ganitong klaseng paandar, nakagawian na na kailanganin ang isang kondisyon upang ma-check kung may ilang mga field na 'nabago'. E.g. Kung ang estado ng kaso ay nabago, saka isagawa ang ilang mga aksyon. 

### Nakaiskedyul

Pinapaandar ayon sa naitukoy na pag-iiskedyul. Maaari mo itong i-setup na patakbuhin araw-araw,bawat lingo, atbp. Ang mga aksyon ay i-aaply para sa mga rekord na ibinalik ng isang partikular na list report. Kaya kailangan mo ring lumikha ng isang list report. 

Ang pag-iiskedyul ay tinutukoy sa isang notasyon ng crontab.

```
* * * * * *
| | | | | | 
| | | | | +-- Year              (range: 1900-3000)
| | | | +---- Day of the Week   (range: 1-7, 1 standing for Monday)
| | | +------ Month of the Year (range: 1-12)
| | +-------- Day of the Month  (range: 1-31)
| +---------- Hour              (range: 0-23)
+------------ Minute            (range: 0-59)
```

### Sekwensyal

Bihirang ginagamit. Dapat na pinapatakbo ng isa pang workflow. Nagbibigay kakayahang gumawa ng kumplikadong lohika.

Tandaan: Para sa mga workflow na sunud-sunod, inirerekomenda na gumamit ng [BPM tool](bpm.md) sa halip ng isang Workflows feature.

## Mga Kondisyon

Maaari mong detreminahin ang mga kondisyon na dapat matugunan upang mapaandar ang workflow. Mayroong dalawang paraan kung saan ang mga kondisyon ay maaaring matukoy: sa pamamagitan ng UI condition builder at ng formula.

### UI condition builder

Ilang magagamit na mga uri ng kondisyon:

* _equals_ - ang field ay katumbas ng tiyak na halaga o isang halaga ng ibang field;
* _was equal_ - ang field ay katumbas ng tiyak na halaga bago pa napaandar ang workflow;
* _not equals_ - ang field ay hindi katumbas ng tiyak na halaga o isang halaga ng ibang field;
* _was not equal_ - ang field ay hindi katumbas ng tiyak na halaga bago pa napaandar ang workflow;
* _empty_ - ang halaga ng field ay walang laman;
* _not empty_ - ang halaga ng field ay hind bakante;
* _changed_ - ang field ay binago;
* _not changed_ - ang field ay hindi binago.

### Mga Kondisyon ng Pormula

Ang pormula ay nagbibigay kakayahang determinahin ang mga kondisyon ng anumang pagiging kumplikado. Upang basahin ang tungkol sa syntax ng pormula, sundin [ang artikulo na ito](formula.md). 

Tandaan: Hindi dapat magkaroon ng anumang `;` delimiter na ginagamit sa code ng pormula kapag tumutukoy ito sa isang kondisyon.

## Mga Aksyon

### Pagpapadala ng Email

Ang system ay magpapadala ng isang email gamit ang isang tiyak na template ng email. Ang email address ng tatanggap ay maaaring kunin mula sa target na rekord, anumang kaugnay na rekord, ang kasalukuyang user, mga follower, mga team user o tinukoy. Ang email ay maaaring ipadala kaagad o para sa isang tiyak na periyod. 

### Paglikha ng Rekord

Ang system ang lilikha ng panibagong rekord ng anumang uri ng entity. Kung mayroong koneksyon sa pagitan ng target na rekord at ng rekord na nilikha, posible na mag-ugnay ng mga rekord. 

Mayroong kakayahang tukuyin ang pormula upang kalkulahin ang mga field.

### Paglikha ng Kaugnay na Rekord

Ang system ang lilikha ng rekord na may kaugnayan sa target na rekord. Posible na matukoy ang pormula upang ma-kalkula ang mga field.

### Pag-update ng Target na Rekord

Nagpapahintulot sa pagbabago ng mga tiyak na field ng target na rekord. Posible na matukoy ang pormula upang ma-kalkula ang mga field.

Kung kailangan mong magdagdag ng mga bagong item sa Link-Multiple field nang hindi nawawalan ng mga kasalukuyang datos, (hal. mga Team) kailangan mong gamitin ang pormula function na entity\addLinkMultipleId. Halimbawa: `entity\addLinkMultipleId('teams', 'teamId')`.

### Pag-update ng mga Kaugnay na Rekord

Nagpapahintulot sa pagbabago ng mga tiyak na mga field ng kaugnay na rekord o mga rekord. Posible na matukoy ang pormula upang ma-kalkula ang mga field.

### Pag-link sa Ibang Rekord

Iniuugnay ang target entity na may isa pang partikular na entity. E.g. Nagdadagdag ng partikular na team sa rekord.

### Pag-unlink sa Ibang Rekord

Nagtatanggal ng kaugnayan ng target entity mula sa isang partikular na entity. E.g. Nagtatanggal ng partikular na team mula sa rekord.

### Pag-apply ng Patakaran ng Pagtatalaga

Magtalaga ng target na rekord sa user sa pamamagitan ng patakaran ng distribusyon. Mayroong dalawang magagamit na patakaran: Round-Robin at Least-Busy.

* Round-Robin - ang mga user ay pinipili mula sa itaas hanggang sa ibaba ng isang listahan (team) at pagkatapos ay magsisimula muli.
* Least-Busy - ang user na may mas kaunting itinalagang mga rekord ay pipiliin para sa pagtatalaga.

_List Report_ - Para sa distribusyon ng Least-Busy, tinutukoy kung anong mga rekord ang isasaalang-alang upang kalkulahin ang bilang nga mga nakatalagang mga rekord. E.g. para sa mga kaso ay kailangang kunin lamang ang mga rekord na may aktibong status.

### Paglikha ng Notipikasyon

Nag-aabiso sa mga partikular na mga user sa pamamagitan ng mensahe. Posible na gumamit ng mga placeholder sa mga template ng mensahe: {entity} - target na rekord, {user} - kasalukuyang user.

### Make Followed

Pinipilit ang mga partikular na nga mga user na sundin ang target entity o partikular na kaugnay na entity.

### Pagpapa-andar ng Ibang Workflow

Ay nagbibigay-daan upang gumawa ng mga sequential workflow. Posible na pagsanga-sangahin ang sequential workflow sa pamamagitan ng kondisyon: pwede mong i-setup ang workflow para paandarin ang dalawang workflow na mayroong magkaibang mga kondisyon na natukoy sa nasabing workflow.

Posible din ang pagpapaliban ng pagsasagawa ng sequential workflow. Sa sequential wokflow, maaari mong tukuyin ang kondisyon na nagche-check kung ang mga partikular na mga field ay binago pagkat ang parent workflow ay napaandar na sa pamamagitan ng paggamit ng _Changed_ and _Was Equal_ na mga uri ng kondisyon.

Tandaan: Para sa mga sequential workflow, inirerekomenda na gamitin ang [BPM tool](bpm.md) sa halip na Workflows feature.

### Pagpapatakbo ng Service Action

Ay nagbibigay daan na patakbuhin ang mga partikular na service script. Batay sa default, may mga sumusunod na mga aksyon na magagamit:

* Pagpapadala ng mga imbitasyon - para sa mga miting/tawag;
* Pagdagdag ng mga Quote Item - para sa mga Quote.

Ang mga developer ay maaaring magsulat ng sariling mga service action. Tingnan [karagdagang detalye](../development/workflow-service-actions.md).

## Paggamit ng mga Pormula sa mga Aksyon

Posibleng tukuyin ang pormula upang kalkulahin ang mga field para sa Create Rekord, Update Target Rekord, Create Related Rekord, Update Related Rekord. Para sa huling dalawa, upang ma-access ang mga katangian ng target entity dapat mong gamitin ang function na `targetEntity\attribute`. Para ma-access ang mga katangian ng target entity na na-iset bago pinaandar ang workflow, gamitin ang function na `targetEntity\attributeFetched`.

Halimbawa:
```
name = string\concatenate(targetEntity\attribute('name'), ' ', datetime\today());
```
