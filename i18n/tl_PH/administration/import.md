# Import

Ang import ay naa-access lamang ng mga admin user. Administration > Import. Maaari kang mag-import mula sa mga CSV file.

## Unang Step

Piliin kung anong uri ng mga rekord ang kailangan mong i-import (Entity Type field).
Pumili ng isang CSV file. Ang isang file ay dapat naka-format sa `UTF-8`.
Piliin ang `What to do?`. Mga Pwedeng Pagpilian: 'Create Only', 'Create & Update', 'Update Only'.

* `Create Only` - piliin ito kung nais mo lamang lumikha ng rekord.
* `Create & Update` - Ang mga rekord ay gagawin ngunit kung mayroong mga rekord na may magkatugmang field value, ito ay ia-update.Maaari mong i-check kung anong mga field ang pwedeng itugma sa _Step 2_.
* `Update only` - ang mga matatagpuang rekord na may magkatugmang field value lamang ang ia-update.

Kapag pumili ka ng isang csv file, maaari mong makita kung papaano mo ito mapa-parse sa Preview panel. Kapag binago mo ang mga property, ang preview ay maa-update.

* `Header Row` - kung ang CSV file ay may mga field name sa unang row.
* `Execute in idle` - inirerekomenda kung mayroon kang isang malaking grupo ng rekord na dapat i-import. Ang import ay mapopo-proseso sa pamamagitan ng cron. Ang status ay isi-set sa 'Complete' kung ang import process ay tapos na. 
* `Skip searching for duplicates` - binabawasan ang import runtime. 

I-click ang _Next_ button para magpatauloy sa  _Step 2_.

![1](../_static/images/administration/import/step-1.png)

## Pangalawang Hakbang

I-setup ang field mapping: kung papaano tumutugma ang mga field sa mga column ng csf file. Maaari mong i-skip ang mga hindi kinakailangang mga column.
Sa mga kaso ng 'Create & Update' at 'Update only' kailangan mong i-check ang mga field kung saan ang mga rekord nga dapat i-update ay matatagpuan. 
I-dagdag ang mga default value na gusto mong maging bago at ang mga na-update na mga rekord na gusto mong i-set. E.g. pwede mong tukuyin ang Assigned User o ang mga Teams field.

Pagkatapos mong gawing ang pag-import, maaari mong ibalik ang mga rekord na nalikha na at tingnan ang mga duplicate at mga rekord na na-update na. Ang mga duplicate ay mga magkaparehong rekord na nasa system. Maaari mong alisin ang lahat ng na-import nga mga duplicate nang sabay-sabay. Tandaan: Ang revert ay hindi gumagana sa mga rekord na na-update na. 

I-click ang _Run Import_ button upang mapgtauloy. Maaaring tumagal ng ilang oras bago matapos ang isang import process. Kung gusto mong mag-import ng isang malaking grupo ng mga rekord (depende sa iyong server configuration, kadalasan ay higit sa 200 na mga rekord), kailangan mong tiyakin na ang php parameter `set_time_limit` ay sapat ang kalakihan. 

![2](../_static/images/administration/import/step-2.png)

## Paano Mag-import sa Target List

Kapag nag-import ka ng mga Contact, Lead or Account, pwede mo silang idagdag sa ilang mga target list. Sa pangalawang hakbang, kailangan mong idagdag ang Target List field sa `Default Values` panel at piliin ang kinakailangang target list rekord. Maaari mo ring gamitin ang `Update only` o `Create & Update` import upang idagdag ang existing na mga target sa isang target list. 