# Entity Manager

Ang Entity Manager kay makit-an sa Administration Panel. Muhatag kini og abilidad nga i-customize sa bisan unsa nimong gusto ang imohang EspoCRM instance. Pwede nimo buhaton ang mga musunod:

* Pagpuno og bag-o nga mga klase nga entity.
* I-customize ang mga nahimo nang mga klase sa entity: usbon ang mga label, mga default order sa list view, i-enable o i-disable ang stream.
* I-configure ang mga field: pagdugang og bag-o, pagcustomize sa mga nahimo na.
* I-configure ang mga relationship: pagdugang og bag-o, pag-usab og mga label sa mga nahimo na.

## Paghimo og bag-go nga entity

I-click ang `Create Entity` nga pindutanan sa Entity Manager nga page. I-specify ang pangalan, mga label, og tipo. Kung mupili ka sa `Person` nga tipo, ang imong entity kay mabutangan og Email, Phone, First Name, Last Name ug Salutation nga mga field. I-check ang `Stream` kung gusto nimo nga ang imong entity kay mabutangan og stream panel ug ang mga user nga mamahimong mu-Follow sa mga entity nga in-ani og klase.

Mga Tipo:

* Base - blangko nga entity nga naa ray mga basic nga mga field parehas sa Name, Assigned User, Teams, Description.
* Base Plus - mura rag Base pero naay mga Activities, History, Tasks panels (naa na kini sukad pa sa 4.3.0).
* Event - Date Start, Date End, Duration, Parent, Status fields. Makita ni sa Calendar ug Activities panel (sukad pa sa 4.3.0, gikinahanglan nga ni i-enable sa Administration > Settings).
* Person - Email, Phone, First Name, Last Name, Salutation, Address fields. Activities, History, Tasks panels.
* Company - Email, Phone, Billing Address, Shipping Address fields. Activities, History, Tasks panels.

## I-update ang nahimo na nga entity

Kung imong i-click ang `Edit` nga link sa usa ka entity, pwede nimong usbon ang ubang mga parameter sa kadto nga entity.

* Labels - singular ug plural nga pangalan sa entity.
* Ang mga default order nga rekord kay han-ayon didto sa mga list view.
* Stream - kung ang Stream feature kay na-enable para sa kani nga entity.
* Disabled - i-check kung dili nimo ganahan ni nga entity nga maanaa sa imohang sistema.
* Text Filter Fields - unsa nga mga field ka mangita para sa main text filter ug global search.


## Mga Field

Sa pag-click sa `Fields` nga link, ibalhin ka sa lahi nga page. Didto, mamahimo kang muhimo og bag-o nga mga field o mu-update sa mga nahimo na. Ang mga musunod nga mga klase sa mga field kay makita didto sa Entity Manager:

* Address - adres nga naay dalan, siyudad, estado, postal code ug nasod;
* Array - lista sa mga value, nga naay abilidad nga mupili og daghan nga mga value (dili ni nindot nga opsyon kung gikinahanglan nimo mangita sa kani nga field); ang mga user kay pwede ra makadungag og ilahang kaugalingong mga value kung ang opsyon kay wala gi-specify.
* Attachment Multiple - daghang mga file attachment;
* Auto-increment - numero nga gi-generate ug mabasa ra;
* Boolean - checkbox, true o false;
* Currency - para sa mga currency nga value;
* Date;
* DateTime;
* Enum - selectbox, nga naay abilidad nga mupili og usa ra ka value;
* File - mu-upload og usa ka file;
* Float - numero nga naay decimal nga parte;
* Foreign - usa ka field nga naay related nga entity;
* Image - mu-upload og image file nga naay preview;
* Integer - mga whole number;
* Number - usa ka auto-incrementing nga numero nga usa ka klase ka string nga posible naay prefix ug hitas-on;
* Multi-enum - lista sa mga value, nga naay abilidad nga mupili og daghan nga mga value (dili ni nindot nga opsyon kung nanginahanglan kang mangita sa kani nga field), parehas ra sa Array pero mas nindot pa.
* Text - text area, para sa mga tag-as nga multiline text;
* Url - para sa mga link;
* Varchar - mugbo nga text;
* Wysiwyg - parehas ra sa Textfield, nga naay abilidad nga mu-format og text.

Mga Parameter:
* Required - kung diin ang pagbutang og entry ani nga field kay gikinahanglan.
* Default Value - Value sa kani nga field nga gi-set paghimo ani nga bag-o nga rekord.
* Audited - mga update ani nga field kay i-log sa Stream.

**Timan-e**: Inig human nimo og puno og bago nga field, gikinahanglan nimo nga ibutang ang kini nga field sa [layouts](layout-manager.md) (Administration > Layout Manager).

### Dynamic nga Lohiko

Muhatag og abilidad nga muhimo sa mga form ngadto sa pagka-dynamic. Posible nga ma-takda ang mga kondisyon para himoong visible, required, o read-only ang mga field. Ang mga kondisyon kay i-check automatically kung ang data sa form kay nausab.

Para sa Enum, Array ug Multi Enum nga mga field, posible nga i-define ang nakalainlaing mga set sa opsyon nga mahimong available para sa field depende kung unsa nga kondisyon ang natuman.


## Mga Relationship

Pwede kang muhimo og bag-o nga mga relationship tali sa out-of-box ug custom nga mga entity. Naay 3 ka pwede nga pilian nga mga relationship type:

* One-to-Many: pagkahuman nimo og himo ani nga relationship, pwede nimong ibutang ang link nga field ngadto sa detail layout sa tuo nga entity og magpuno og relationship panel sa wala nga entity;
* Many-to-One: parehas ra sa One-to-Many pero bali;
* Many-to-Many: mga relationship panel nga naa sa duha ka kilid.

Ang parameter nga 'Link Multiple Field' kay nagpasabot nga ang field nga `linkMultiple` type kay himoon dungan sa relationship. Pwede nimong ibutang ang kana nga field sa layout. Sayon kini para sa mga dinalidali nga pagkuha ug mga related nga mga rekord. Dili ni maayo nga opsyon kung ang imohang relationship kay gihimo nga naay daghang gi-link nga mga record nga makahinay sa pag-load sa detail view nga screen.

Kung ang parameter nga 'Audited' kay nacheck, ang mga update sa relationship kay i-log sa Stream.