# Management sa mga Role

## Ang Kinatibuk-an

Para ma-restrict ang access sa ubang mga user, gikinahanglan nimo gamiton ang Roles. Ang administrador kay maka dumala ug mga role sa Administration panel. Ang tagsa-tagsa ka mga role kay nag-define sa access sa ubang mga area (mga iskop) nga asa i-aplay sa mga user nga nakatag-iya ana nga role.

Ang usa ka user kay pwede naay daghan nga mga role. Ang kadtong mga role kay pwede ipili para sa usa ka ispisipiko nga user ('Roles' field sa User entry) ug/o i-mana gikan sa mga team nga diin nalangkob ang user.

Kung ang user kay naay daghan nga mga role, i-merge sila para ang permissive rule kay ang mahatagan og mas dako pa na prayoridad. Nagtugot kini nga sayon ra ug flexibly nga madumala sa administrador ang access level control.

Posible nga makita ang mga permission nga gi-aplay sa usa ka user pinaagi sa pag-click sa 'Access' nga pindutanan sa detail view sa user.

![1](https://raw.githubusercontent.com/espocrm/documentation/master/_static/images/administration/roles-management/iskop-level.png)

## Example

Pananglitan, ang user kay nalangkob sa team nga ‘Sales’. Ang kadto nga team kay naa nag-inusara nga role nga ‘Salesman’. Ang tanang user gikan nianing team kay makadawat og ‘Salesman’ nga role.

Ang ‘Salesman’ nga role kay gidefine gamit ang musunod nga pamaagi:

Lead:
```
create - yes
read – team
usab – own
delete – no
stream - team
```

Opportunity:
```
create - yes
read – team
usab – own
delete – no
stream - team
```

Ang mga user kay mamahimong mubasa ngadto ra sa mga lead ug oportunidad kung asa nalangkob sa  ‘Sales Department’ team (‘Teams’ field).
Ang user kay mamahimong mu-usab ngadto ra sa mga lead ug oportunidad kung asa na-assign sila o sa ilahang mga nabuhat.
Ang mga user kay dili mamahimong mutang-tang ug bisan unsang lead o oportunidad.

Gusto mi nga muhatag ug mas daghan mga nga mga right pra sa usa ka user nga nagkupot ug sales manager nga posisyon sa usa ka kompanya. Ang kani nga empleyado kay gikinahanglang naay abilidad nga mu basa/usab/delete sa tanang mga rekord gikan sa ‘Sales’ team. Ang user kay gikinahanglan nalangkob sa atoang ‘Sales’ team. Pero nanginahanglan ta nga mubuhat og bag-o nga role nga ‘Sales Manager’ ug i-select ang kani nga role para ato nga user sa ‘Roles’ field.

Ang ‘Sales Manager’ nga role kay gi-define pinaagi sa musunod:

Lead:
```
create - yes
read – team
usab – team
delete – team
stream - team
```

Opportunity:
```
create - yes
read – team
usab – team
delete – team
stream - team
```

Ang atoang user kay mamahimong mudumala sa tanang mga lead ug oportunidad gikan sa ‘Sales’ team.

## Mga Espesiyal Permisyon

### Assignment nga Permisyon

I-set ni nga parameter aron ma-restrict ang abilidad nga mure-assign ug mga rekord ngadto sa uban nga user ug/o mga team. Kung imong i-set ngadto sa `team` - posible na i-assign ra ni sa mga users gikan sa kaugalingong (mga) team. Kung `no` - ang mga user kay dili mamahimong maka-re-assign.

Mu-define pud kini kung ang user kay mamahimo bang makapost ngadto sa stream sa laing mga user/team.

### User nga Permisyon

Mutugot nga mu-restrict sa abilidad sa mga user nga mutan-aw ug mga aktibidad, kalendaryo og stream sa ubang mga user.

### Portal nga Permisyon

Mudefine ug access sa impormasyon sa portal, abilidad nga makapost ug mga mensahe sa mga portal user.

### Group Email Account nga Permisyon

Mudefine ug access ngadto sa mga group email account, usa ka abilidad nga mupadala og mga email gikan sa group SMTP.

### Export nga Permisyon

Mudefine kung ang user naa bay abilidad para mu-export ug mga rekord. (gikan pa sa bersyon 4.9.0)

## Mga Permisyon nga Default

Ang mga user kay makabasa ug maka-usab sa tanang rekord kung walay nakabutang nga permission. Pero dili sila maka-tangtang gawas sa kadto ilahang binuhat ug kadto pung mga naka-assign sa ilaha.

Naay abilidad para marestrict ang access nga gi-aplay by default pinaagi sa pag-enable sa 'ACL Strict Mode' sa Administration > Settings.

## Field Level nga Seguridad

Mutugot sa pag-control sa access para sa usa ka ispisipiko nga field.

Ang user kay makabasa sa tanan field kung kini kay makabasa sa rekord (by default). Ang user kay maka-usab ug bisan unsang field kung kini kay maka-usab sa rekord. Pwede nimong i-restrict ang access sa mga ispisipiko nga mga field gamit ang Field Level Security.

Sa edit view sa usa ka role rekord sa Field Level seksiyon, i-click ang plus nga icon sunod sa ispisipiko nga iskop dayon pilia ang gikinahanglan nga field. Dayon, gikinihanglan nimo nga i-specify ang access level para sa `read` ug `usab` nga mga aksyon. Naay duha ka mga opsyon: `yes` ug `no`.

![2](https://raw.githubusercontent.com/espocrm/documentation/master/_static/images/administration/roles-management/field-level-secutiry.png)
