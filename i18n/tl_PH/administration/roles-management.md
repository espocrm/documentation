# Pamamahala ng mga Tungkulin

## Pangkalahatang Ideya

Upang mahadlangan ang access para sa ilang mga user, kailangan mong gumamit ng mga tungkulin. Ang administrador ay maaaring mamahala ng mga tungkulin sa Administration panel. Ang bawat tungkulin ay tumutukoy sa isang access ng ilang mga mga parte (mga scope) na inilalapat sa mga gumagamit na nagmamay-ari ng tungkulin na iyon. 

Ang isang user ay maaaring magkaroon ng maraming mga tungkulin. Ang mga tungukulin na iyon ay maaaring piliin para sa isang partikular na user (field ng ‘Roles’ sa User entry) at/o ay maaaring kunin mula sa mga pangkat kung saan nabibilang ang user. 

Kung ang user ay mayroong maraming tungkulin, ito ay pagsasama-samahin upang ang permissive rule ay magkakaroon ng mas mataas na priyoridad. Iyon ay nagbibigay-daan sa admnistrador na madaling pamahalaan ang access lebel kontrol.

Posible ring makita ang mga permiso na i-aaply sa isang partikular na user sa pamamagitan ng pag-click ng 'Access'na buton sa detail view ng user. 

![1](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/roles-management/scope-level.png)

## Halimbawa

Halimbawa, ang user ay kabilang sa grupo na ‘Sales’. Ang grupo ay mayroong isang tungkulin ‘Salesman’. Kaya lahat ng mga user sa grupo na itoy ay makakakuha ng ‘Salesman’ na tungkulin.

‘Salesman’ na tungkulin ay tutukuyin sa sumusunod na paraan:

Mga Lead:
```
create - yes
read – team
edit – own
delete – no
stream - team
```

Mga Oportunidad:
```
create - yes
read – team
edit – own
delete – no
stream - team
```

Ang mga user ay maaari lamang mag read only ng mga lead at oportunidad na iyon na kabilang sa grupo ng ‘Sales Department’ (‘Teams’ field).
Ang user ay maaaring lamang mag-edit ng mga lead at mga oportunidad na itinalaga sa kanila o sa mga nilikha nila.
Abg mga user ay hindi maaaring mag-alis nga mga lead at oportunidad.

Gusto naming magbigay ng mas maraming karapatan sa isang partikular na user more rights to a certain user na may hawak ng posisyon ng sales manager sa kompanya. Ang empleyado na ito ay dapat mayroong kakayahan na magbasa/mag-edit/mag-alis nga mga rekord mula sa grupo ng ‘Sales’. Ang user ay dapat maging parte ng grupo ng ‘Sales’. Ngunit kailangan nating lumikha ng panibagong tungkulin na ‘Sales Manager’ at piliin ang tungkulin para sa user na iyon sa ‘Roles’ field.

Ang tungkulin ng ‘Sales Manager’ role ay tinutukoy sa sumusunod na paraan:

Ang Lead:
```
create - yes
read – team
edit – team
delete – team
stream - team
```

Ang Oportunidad:
```
create - yes
read – team
edit – team
delete – team
stream - team
```

Ang ating user ay maaaring mamahala sa lahat ng mga lead at oportunidad mula sa grupo ng ‘Sales’.

## Mga Espesyal na Permiso

### Ang Assignment na Permiso

I-set ang parametro na ito upang hadlangan ang pag re-assign ng mga rekord sa ibang user at/o mga grupo. Kung ise-set mo ang `team` - posibleng magtakda ng mga user mula lamang sa sariling grupo. Kung `no` - ang mga user ay hindi maaaring mag re-assign sa anumang paraan. 

Ito rin ay tumutukoy kung ang user ay pwedeng magpost sa stream ng ibang mga user o grupo.

### Permiso ng User

Humahadlang sa mga user na mag-view ng mga actibidad, kalendaryo at stream ng iba pang mga user.

### Permiso ng Portal

Tumutukoy sa pag-access sa impormasyon ng portal at ang kakayahan na mag-post ng mga mensahe sa mga user ng portal.

### Permiso ng Group Email Account 

Tumutukoy sa pag-access ng mga group email account, at kakayahang magpadala ng mga email mula sa group SMTP.

### Permiso ng Pag-export 

tumutukoy kung ang user ay may kakayahang mag-export, ng mga rekord. (mula bersyon 4.9.0)

## Mga Permiso Batay sa Default 

Batay sa default (kung walang naka-apply) ang mga user ay maaaring magbasa at mag-edit ng mga rekord. Ngunit hindi maaaring mag-delete ng kahit na ano maliban lamang doon sa nilikha nila at doon sa mga naka-assign na sa parehong oras. 

Mayroon din itong kakayahan na hadlangan ang pag-access na naka-apply na batay sa default sa pamamagitan ng pag-enable ng 'ACL Strict Mode' at Administration > Settings.

## Seguridad ng Field Lebel

Hinahayaang mag-kontrol ng pag-access para sa mga partiukar na mga filed.

Batay sa default, ang user ay maaaring magbasa ng lahat ng mga filed kung ito ay makakapagbasa ng rekord. Ang user ay maaari ring mag-edit ng kahit na anong field kung ito ay makakapag-edit ng rekord. Maari mo ring hadlangan ang pag-access sa mga partikular na mga field gamit ang Field Level Security.

Sa edit view ng isang role record sa seksyon ng Field lebel, i-click ang plus icon kasunod ng partikular na scope at piliin ang kinakailangang field. Pagkatapos ay maaari mo ng tukuyin ang access level para sa `read` at `edit` na mga aksyon. Mayroong dawalang mga opsyon: `yes` at `no`.

![2](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/roles-management/field-level-secutiry.png)
