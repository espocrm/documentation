# Entity Manager

Ang Entity Manager ay makikita sa Administration panel. Ito ay nagbibigay ng kakayahan upang lubos na ma-customize ang iyong EspoCRM instance. Maaari mong gawin ang mga sumusunod:

* Magdagdag nga mga bagong urin ng entity.
* I-customize ang mga existing na uri ng entity: baguhin ang mga label, i-order batay sa default ang list view, i-enable o i-disable ang stream.
* Mag-configure ng mga field: magdagdag ng bago, i-customize ang mga existing na.
* Mag-configure ng mga relationship: magdagdag ng bago, baguhin ang mga label ng mga existing na.

## Paglikha ng Bagong Entity

I-click ang `Create Entity` na button sa Entity Manager page. I-specify ang pangalan, mga label at uri. Kung pipiliin mo ang `Person` type, ang iyong entity ay magkakaroon ng Email, Telophono, Unang Pangalan, Apelyido at mga Salutation field. I-check ang `Stream` kung gusto mong magkaroon ng stream panel at mga user ang iyong entity upang masundan ang ganitong uri nga mga entity.

Mga Uri:

* Base - ini-empty ang entity ng mga basic field gaya ng Pangalan, Naka-assign na User, mga Team, Deskripsyon.
* Base Plus - gaya ng Base pero mayroong mga Aktibidad, History, mga Tasks panel (magagamit mula 4.3.0).
* Event - Field ng Petsa ng Pagsisimula, Petsa ng Pagtatapos, Katagalan, Magulang, Status. Magagamit sa Calendar at Activities panel (mula 4.3.0, dapat ma-enable sa Administration > Settings).
* Person - Field ng Email, Telepono, Unang Pangalan, Apelyido, Salutation, Address. Panel ng mga Aktibidad, History, Tasks.
* Company - Field ng Email, Telepono, Billing Address, Shipping Address. Panel ng mga Actibidad, History, Tasks.

## Pag-update ng existing entity

Kung nag-click ka ng `Edit` link sa isang partikular na entity, maaari mong baguhin ang ilang mga parameter ng nasabing entity. 

* Labels - isahan at maramihang pangalan ng entity.
* Ang mga default order rekord ay isinasaayos sa pamamagitan ng mga list view.
* Stream - kung ang Stream na feature ay dapat na i-enable sa entity na ito.
* Disabled - Chini-check kung kakailanganin mo ang entity na ito sa iyong system.
* Text Filter Fields - kung anonog mga field ang dapat i-search para sa iyong main text filter at global search.


## Mga Field

Sa pamamagitan ng pag-click ng `Fields` link, malilipat ka sa isang hiwalay na page. Doon ay maaari kang lumikha nga panibagong mga field o i-update ang mga existing na. Ang mga sumusunod na mga fields are matatagpuan sa Entity Manager: 

* Address - address na may kale, syudad, estate, postal code at bansa;
* Array - listahan ng mga value, na may kakayahan nga mag-select ng maramihan nga mga value (hindi magandang opsyon kung kailangang mong mag-search sa field na ito); ang mga user ay maaaring magdagdag ng sarili nilang mga value kung ang mga opsyon ay hindi nakatukoy.
* Attachment Multiple - maramihan nga mga file attachment;
* Auto-increment - read only generated na numero;
* Boolean - checkbox, tama o mali;
* Currency - para sa mga currency value;
* Date;
* DateTime;
* Enum - selectbox, may kakayang pumili ng iisang value;
* File - pag-upload ng isang file;
* Float - numero na may decimal na parte;
* Foreign - field na may kaugnay na entity;
* Image - pag-upload ng isang image file na may preview;
* Integer - buong numero;
* Number - paga-awto-increment ng numero sa string type na may posibleng prefix at may isang  tiyak na haba;
* Multi-enum - listahan ng mga value, may kakayahang mag-select ng maramihan na mga values (indi magandang opsyon kung kailangang mong mag-search sa field na ito), kapareho ng Array ngunit mas mahusay.
* Text - area ng text, para sa mahabang nga multiline text;
* Url - para sa mga link;
* Varchar - maikling teksto;
* Wysiwyg - kapareho ng Text field, may kakayahang mag-format ng text.

Mga Parameter:
* Required - kung ang pag-fill in ng field ay kinakailangan.
* Default Value - Value ng field na naka-set sa sandaling may bagong rekord na nalikha.
* Audited - mga update ng field ay ila-log sa Stream.

**Tandaan**: Pagkatapos mong madagdag ang bagong field, kailangan mong ilagay ang field na ito sa [layouts](layout-manager.md) (Administration > Layout Manager).

### Dynamic na Lohika

Nagbibigay ng kakayahang gawing dynamic ang mga form. Posible na tukuyin ang mga kundisyon upang ang mga partikular na mga field ay makikita, kinakailangan o read-only. Ang mga kundisyon ay pwedeng i-check ng awtomatiko kung ang data sa form ay babaguhin.

Para sa Enum, Array at Multi Enum na mga field, posible na tukuyin ang iba't ibang set ng mga opsyon na magagamit para sa field depende sa kung anong kondisyon ang natutugunan.


## Mga Relasyon

Maaari kang lumikha ng mga bagong relasyon sa pagitan out-of-box at custom entity. Mayroong tatlong klase ng relasyon: 

* One-to-Many: pagkatapos mong likhain ang relasyon na ito, maari mong lagyan ng link field ang detail layout ang kanang entity at dagdagan ng relationship panel sa kaliwang entity;
* Many-to-One: kapareho ng One-to-Many pero bisebersa;
* Many-to-Many: mga relationship panel sa magkabilang panig.

Ang parameter na 'Link Multiple Field' ay nagpapahiwatig na ang field ng `linkMultiple` type ay maaaring gawing kasama ng relationship. Maaari kang maglagay ng ganitong field sa layout. Ito ay nakatutulong para sa mabilis na pagpili ng mga kaugnay na rekord. Hindi ito magandang opsyon kung ang iyong relasyonay nakalaan na magkaroon ng maraming naka-link na mga rekord na maaaring makapagpabagal ng loading ng detalye ng view screen.

Kung ang parameter na 'Audited' ay naka-check, kung gayon ang mga update ng relasyon ay ila-log sa Stream. 
