# Pamamahala ng Kaso

Ang mga kaso ay nagbibigay ng kakayahan na tukuyan oh sundan ang anumang isyu.Ito ay isang pangunahing aspeto ng serbisyo sa mamimili ng EspoCRM. Ang terminong ginamit sa tiket ay maaari rin na gamitin para sa mga kaso.

Ang entidad ng kaso ay pwedeng maugnay sa isang Account o kaya naman sa maraming Contacts.

Ang mga bagong kaso ay dapat na nilikha ng mga sumusunod na sitwasyon:

* Mano-mano ng mga gumagamit ng CRM;
* Mano-mano ng mga gumagamit ng portal ng mamimili;
* Sa pamamagitan ng paggamit ng APO (e.g. sa paggamit ng web form);
* Awtomatiko kapag may bagong email ang dumatin sa isang tukoy na mailbox.
* Awtomatiko sa pamamagitan ng panuntunan ng workflow.

Ang rekord ng case ay mayroong stream na pwedeng gamitin para sa isang komunikasyon sa pagitan ng customer at serbisyo. Ang mga gumagamit ng CRM ay maaari ring gumawa ng mga panloob na post na hindi makikita sa isang portal ng mamimili. 

Kapag ang isang bagong kaso ay ginawa ng gumagamit ng portal na hindi naka-assign sa kahit na kaninong gumagamit. Sa paggamit ng [Workflows](https://github.com/espocrm/documentation/blob/master/administration/workflows.md) ay ang administrador ay makakalikha ng panuntunan na magbibigay alam sa ibang gumagamit tungkol sa panibagong kaso sa sistema. Ang mga workflow din ay nakakapagbigay ng abilidad na mag apply ng bagong panuntunan na asaynment sa mga bagong kaso, i.e. Round-Robin at Least-Busy na mga panuntunan. Para sa mga karagdagang komplikadong budiness na mgaa form ay inrerekomenda na gamiting ang [Kagamitang BPM](https://github.com/espocrm/documentation/blob/master/administration/bpm.md).

Para maiwasan na makaligtaan ang mga bagong kaso ay ang gumagamit ay pwedeng dumagdaag ng tipo ng entidad na kaso sa Pangkalahatang listahn ng auto-follow at mga preperansiya. Awtomatiko nilang susundan ang mga panibagong kaso.

Paalala : Kung walang gumagamit ng protal na konektado sa naka-link na contact bagkus ay ang customer ay hindi makakatanggap ng mga abiso sa email tungkol sa mga update sa Stream. Kailangan mong gumamit ng mga email para sa komunikasyon sa mga mamimili.

### Email-sa-Kaso

Ang Administrador ay kayang mag-setup ng Email Account na pang-grupo na sadyang lilikha ng mga bagong kaso sa bawat email na papasok. Para sa karagdagang impormasyon [Tingnan Dito](https://github.com/espocrm/documentation/blob/master/administration/emails.md).

### Batayang Kaalaman

Ang mga gumagamit ay maaaring mag-uugnay sa mga base ng kaalaman sa mga artikulo sa talaan ng kaso.

### Portal ng mamimili

Ang mga Administrator ay makakalikha ng isang [portal](https://github.com/espocrm/documentation/blob/master/administration/portal.md) kung saan ang mga mamimili ay may kakayahang makaliha ng mga kaso.

Dahil awtomatikong sinusunod ng mga gumagamit ng portal ang kanilang mga kaso, makakatanggap sila ng mga abiso sa email tungkol sa mga bagong mensahe sa Stream.
