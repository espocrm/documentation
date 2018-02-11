# Mag Kinalkulang Field (Formula)

Sa entity manager, posible na tukuyin ang script (formula) para sa partikular na entity type. Ang script na ito ay isasagawa sa bawat oras bago mai-save ang rekord.
Nagbibigay ito ng kakayahan na awtomatikong ma-set ang mga tiyak na field (attribute) na may mga halaga na mula sa pagkalkula.

Upang ma-edit ang formula, sundin ang Administration > Entity Manager dropdown menu sa kanan sa hanay ng kinakailangang entity > Formula.

Maaari mo ring kailanganin ang mag-set ng mga field, na dapat kalkulahin, Read-only sa pamamagitan ng Entity Manager.


## Syntax

Ang EspoCRM formula ay nakasulat sa simpleng lengguwahe na partikular na idinisenyo para sa tampok na ito.

May mga operator, function, mga attribute at mga value na maaaring magamit sa formula. Ang mga hiwalay na expression ay dapat na ma-delimit sa pamamagitan ng character `;`.

### Mga Operator
* `=` - assignment.
* `||` - lohikal na OR,
* `&&` - lohikal na AND,
* `!` - lohikal na NOT,
* `+`- numeric na sumasyon,
* `-` - numeric na subtraction,
* `*` - numeric na multiplication,
* `/` - numeric na division,
* `%` - numeric na modulo,
* `==` - pantay na paghahambing,
* `!=` - di pantay na paghahambing,
* `>` - mas mahigit pa na paghahambing,
* `<` - mas mababa pa na paghahambing,
* `>=` - pantay o mas mahigit pa na paghahambing,
* `<=` - pantay o mas mababa pa na paghahambing.

Prayoridad ng mga operator:
* `=`;
* `||`, `&&`;
* `==`, `!=`, `>`, `<`, `>=`, `<=`;
* `+`, `-`;
* `*`, `/`, `%`.

### Mga Attribute

Ang mga attribute ay kumakatawan ng mga field value ng target entity. Maari mong i-insert ang mga magagamit na attribute sa pamamagitan ng pag-click ng plus buton.

Posible na ma-access ang mga attribute ng mga ka ugnay na entity sa pamamagitan ng sumusunod na format `linkName.attributeName`.


### Mga Function

Format ng paggamit ng function: `groupName\functionName(argument1, argument2, ..., argumentN)`.

Ang mga out-of-the-box function ay nakalista sa ibaba.

#### ifThenElse
`ifThenElse(CONDITION, CONSEQUENT, ALTERNATIVE)` Kung ang CONDITION ay natugunan, saka gawin ang CONSEQUENT. Kung hindi -- saka gagawin ang ALTERNATIVE.


#### ifThen
`ifThen(CONDITION, CONSEQUENT)` Kung ang CONDITION ay natugunan, saka gawin ang CONSEQUENT. Kung hindi, wala kang gagawin.

#### string\concatenate(
`string\concatenate(STRING_1, STRING_2)` Pinagsasama-sama ang dalawa o higit pang mga string.

#### string\substring
`string\substring(STRING, START, LENGTH)`  Ini-extract ang mga character mula sa isang STRING sa pamamagitan ng START na posisyon at LENGTH.

Kung ang LENGTH ay tinanggal, ang substring na nagmula sa START hanggang sa huli ng string ay ibabalik. 

Kung ang LENGTH ay negatibo, kung gayon ay tatanggalin ang maraming mga characer mua sa dulo ng string.

#### string\\trim
`string\trim(STRING)` Tinatanggal ang whitespace mula sa simula at dulo ng STRING.

#### string\\lowerCase
`string\lowerCase(STRING)` Pinapalitan ang mga letra upang maging lower case. (mula pa sa bersyon 5.0.0)

#### string\\upperCase
`string\upperCase(STRING)` Pinapalitan ang mga letra upang maging upper case. (mula pa sa bersyon 5.0.0)

#### datetime\\today
`datetime\today()` Binabalik ang petsa sa kasalukuyan.

#### datetime\now
`datetime\now()` Binabalik ang kasalukuyang datetime.

#### datetime\format
`datetime\format(VALUE, [TIMEZONE], [FORMAT])`Pinapalitan ang petsa o datetime value upang maging string na na-format ayon sa setting ng application. Ang TIMEZONE at FORMAT ay maaaring tanggalin. Kung ang TIMEZONE ay tatanggalin, ang ang time zone batay sa default ang gagamitin. Kung ang FORMAT ay tatanggalin, ang format batay sa default ang gagamitin.

#### datetime\date
`datetime\date(VALUE, [TIMEZONE])` Ibinabalik ang petsa ng kasaulukuyang buwan (1-31). `0` kung ang VALUE ay walang laman. Kung ang TIMEZONE ay tatanggalin,  ang system timezone ang gagamitin. (mula pa sa bersyon 4.7.0)

#### datetime\month
`datetime\month(VALUE, [TIMEZONE])` Ibinabalik ang kasalukuyang buwan (1-12). `0` kung ang VALUE ay walang laman. Kung ang TIMEZONE ay tatanggalin, ang system timezone ang gagamitin. (mula pa sa bersyon 4.7.0)

#### datetime\year
`datetime\year(VALUE, [TIMEZONE])` Ibinabalik ang kasalukuyang taon. `0` kung ang VALUE ay walang laman. Kung ang TIMEZONE ay tatanggalin, ang system timezone ang gagamitin. (mula pa sa bersyon 4.7.0)

#### datetime\hour
`datetime\hour(VALUE, [TIMEZONE])` Ibinabalik ang kasalukuyang oras (0-23). `-1` kung VALUE ay walang laman. Kung ang TIMEZONE ay tatanggalin, ang system timezone ang gagamitin. (mula pa sa bersyon 4.7.0)

#### datetime\minute
`datetime\minute(VALUE, [TIMEZONE])` Ibinabalik ang kasalukuyang minuto (0-59). `-1` kung ang VALUE ay walang laman. Kung ang TIMEZONE ay tatanggalin, ang system timezone ang gagamitin. (mula pa sa bersyon 4.7.0)

#### datetime\dayOfWeek
`datetime\dayOfWeek(VALUE, [TIMEZONE])` Ibinabalik ang araw ng kasalukuyang linggo (0-6). `-1` kung ang VALUE ay walang laman. `0` - para sa Linggo. Kung ang TIMEZONE ay tatanggalin, ang system timezone ang gagamitin. (mula pa sa bersyon 4.7.3)

#### datetime\diff
`datetime\diff(VALUE_1, VALUE_2, INTERVAL_TYPE)` Ibinabalik ang agwat sa pagitan ng dalawang petsa o datetime. Ang INTERVAL_TYPE ay maaaring maging 'year', 'month', 'days', 'hours', 'minutes'. Ibinabalik sa `null` kapag may failure. Magiging negatibo ang resulta kung ang VALUE_1 < VALUE_2.

#### datetime\addMinutes
`datetime\addMinutes(VALUE, MINUTES)` Nagdadagdag ng minuto sa datetime VALUE. Ang MINUTES ay pwedeng maging negatibo.

#### datetime\addHours
`datetime\addHours(VALUE, HOURS)` Nagdadagdag ng oras sa datetime VALUE. Ang HOURS ay pwedeng maging negatibo.

#### datetime\addDays
`datetime\addDays(VALUE, DAYS)` Nagdadagdag ng araw sa petsa o datetime VALUE. Ang DAYS ay pwedeng maging negatibo.

#### datetime\addWeeks
`datetime\addWeeks(VALUE, WEEKS)` Nagdadagdag ng linggo sa petsa o datetime VALUE. Ang WEEKS ay pwedeng maging negatibo.

#### datetime\addMonths
`datetime\addMonths(VALUE, MONTHS)` Nagdadagdag ng buwan sa petsa o datetime VALUE. Ang MONTHS ay pwedeng maging negatibo.

#### datetime\addYears
`datetime\addYears(VALUE, YEARS)` Nagdadagdag ng taon sa petsa o datetime VALUE. Ang YEARS ay pwedeng maging negatibo.

#### datetime\closest
`datetime\closest(VALUE, TYPE, TARGET, [IS_PAST], [TIMEZONE])` Ibinabalik ang pinakamalapit na petsa o datetime sa VALUE base sa nakaraang mga argumento. (mula pa sa bersyon 5.0.0)

Ang TYPE ay pwedeng maging isa sa mga sumusunod na mga value: 'time', 'minute', 'hour', 'date', 'month', 'dayOfWeek'. Ang TARGET ay isang integer value o isang string value. IS_PAST ay nangangahulugang ang paghahanap ng pinakamalapit sa nakaraan. Kung ang TIMEZONE ay tatanggalin, ang default timezone ang gagamitin.

Mga Halimbawa:

`datetime\closest(datetime\now(), 'time', '20:00')` Ay magbabalik ng pinakamalapit na datetime value sa hinaharap sa 20:00 na oras.

`datetime\closest('2017-11-20', 'date', 1, true)` Ay magbabalik ng `2017-11-01`, ang unang araw ng buwan. 

`datetime\closest(datetime\now(), 'dayOfWeek', 1)` Ay magbabalik ng susunod na Lunes (ang simula ng araw). 

#### number\format
`number\format(VALUE, [DECIMALS], [DECIMAL_MARK], [THOUSAND_SEPARATOR])` Pinapalitan ang numeric VALUE ng string na naka-format ayon sa partikular na format o setting ng application batay sa default. Kung DECIMALS, DECIMAL_MARK OR THOUSAND_SEPARATOR, ang mga system default ang gagamitin.

Mga Halimbawa:

`number\format(2.666667, 2)` - results 2.67;

`number\format(1000, 2)` - results 1,000.00;

`number\format(10.1, 0)` - results 10.


#### number\abs
`number\abs(VALUE)` Ganap na halaga. Ibinabalik ang null kung ang VALUE ay hindi numeric.

#### number\round
`number\round(VALUE, PRECISION)` Ibinabalik ang rounded value ng VALUE sa tinutukoy na PRECISION (bilang nga mga digit pagkatapos ng decimal point). Ang PRECISION pwedeng maging negatibo o sero (default).

#### number\floor
`number\floor(VALUE)` Ibinabalik ang susunod na pinakababang integer value sa pamamagitan ng pag round down ng value kung kinakailangan. (mula pa sa bersyon 4.9.0)

#### number\ceil
`number\ceil(VALUE)` Ibinabalik ang susunod na pinakamataas na integer value a pamamagitan ng pag round up ng value kung kinakailangan. (mula pa sa bersyon 4.9.0)

#### entity\isNew
`entity\isNew()` Ibinabalik sa TRUE kung ang entity ay bago lang (nilika) at FALSE kung hindi (ina-update).

#### entity\\isAttributeChanged
`entity\isAttributeChanged(ATTRIBUTE)` Ibinabalik sa TRUE kung ang ATTRIBUTE ng entity ay nabago.

Halimbawa:

`entity\isAttributeChanged('status')`

#### entity\isAttributeNotChanged
`entity\isAttributeNotChanged(ATTRIBUTE)` Ibinabalik sa TRUE kung ang ATTRIBUTE ng entity ay hindi nabago.

#### entity\attributeFetched
`entity\attributeFetched(ATTRIBUTE)` Ang Attribute na na-set nang ang target entity ay kinuhamula sa database. Bago ito nabago. 

Halimbawa:

`entity\isAttributeChanged('assignedUserId')`

#### entity\addLinkMultipleId
`entity\addLinkMultipleId(LINK, ID)` Nagdadagdag ng ID sa Link Multiple field. Halimbawa, magdagdag ng 'someTeamId' sa 'teams' field. 

`entity\addLinkMultipleId(LINK, ID_LIST)` Nagdadagdag ng listahan ng mga id. (mula pa sa bersyon 4.8.3)

#### entity\hasLinkMultipleId
`entity\hasLinkMultipleId(LINK, ID)` Nagche-check kung ang Link Multiple field ay may tikayk na ID.

#### entity\removeLinkMultipleId
`entity\removeLinkMultipleId(LINK, ID)` Nag-aalis ng partikular na ID mula sa Link Multiple field.

#### entity\isRelated
`entity\isRelated(LINK, ID)` Nagche-check kung ang target entity ay may kaugnayan sa ibang entity na kinakatawan ng LINK at ID.

#### env\userAttribute
`env\userAttribute(ATTRIBUTE)` Ibinabalik ang ATTRIBUTE ng kasalukuyang user.

#### list
`list(VALUE-1, ... VALUE-N)` Ibinabalik ang array. (mula pa sa bersyon 4.7.0)

#### array\includes
`array\includes(LIST, VALUE)` Babalik bilang true kung ang LIST ay naglalaman ng VALUE. Ay pwedeng gamitin para sa Array at Multi-Enum fields. (mula pa sa bersyon 4.7.0)

#### array\push
`array\push(LIST, VALUE1 [, VALUE2 ...])` Nagdadagdag ng isa o higit pang mga elemento sa dulo ng ng isang array at ibinabalik ang panibagong array.  (mula pa sa bersyon 5.0.0)

#### array\length
`array\length(LIST)` Ibinabalik ang bilang ng mga elemento sa LIST. (mula pa sa bersyon 4.8.1)


### Mga Value

* Strings. E.g. 'some string';
* Number ng mga  Integer. E.g. 1, 100, 40300.
* Number ng mga float. E.g. 5.2.

### Mga Variable

It's possible to define custom variables in formula.
Posible na tukuyin ang mga custom na variable sa formula.
```
$someVariableName = 'Test';
description = $test;
```


## Mga Halimbawa

```
ifThen(
  entity\isNew() && assignedUserId == null,
  assignedUserId = 'managerId'
);

ifThen(
  entity\isNew() && closeDate == null && stage == 'Closed Won',
  datetime\today()
);
```

```
amount = product.listPrice - (product.listPriceConverted * discount / 100.0);
amountCurrency = 'USD';
```

```
someField = string\concatenate(firstName, " '", middleName, "' ", lastName);
```

```
ifThenElse(
  entity\isNew() && status == 'Planned' && dateStart == null,
  dateStart = datetime\addDays(datetime\now(), 10),
  ifThen(
    status == 'Held' && dateStart == null,
    dateStart = datetime\now()
  )
);

```

## Pag-gamit ng Formula sa mga Workflow

Maaari mong gamitin ang formula sa mga kondisyon at aksyon ng workflow. Tingnan ang [workflows dokumentasyon](workflows.md) para sa karagdagang impormasyon.
