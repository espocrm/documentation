# Mga Calculated Field (Formula)

Sa entity manager, posible ka mu-define og script (formula) para sa episipiko nga entity type. Ang script kay i-execute matag higayon una masave ang rekord.
Muhatag kinig abilidad nga automatic nga mutakda og mga values nga gikuha gikan sa pagkalkula ngadto sa espisipiko nga mga field (attributes).

Para mu-edit ug formula sunda ang Administration > Entity Manager > dropdown menu sa tuong bahin sa row sa gikinahanglan nga entity > Formula.

Pwede usab nga manginahanglan ka mutakda sa mga field, kadto untang mga gikalkula, Read-only via Entity Manager.


## Syntax

Ang EspoCRM formula kay gisuwat sa simple nga pinulongan nga gidisenyo para sa kani nga feature.

Naay mga operator, mga function attribute ug mga value nga pwedeng magamit sa formula. Ang mga gibuwag nga mga expression kay gikinahanglan e-delimit gamit ang karakter nga `;`.

### Mga Operator

* `=` - assignment.
* `||` - lohikal nga OR,
* `&&` - lohikal nga AND,
* `!` - lohikal nga NOT,
* `+`- numero nga summation,
* `-` - numero nga subtraction,
* `*` - numero nga multiplication,
* `/` - numero nga division,
* `%` - numero nga modulo,
* `==` - parehong pagtandi,
* `!=` - di parehong pagtandi,
* `>` - mas labaw pa nga pagtandi,
* `<` - mas gamay pa nga pagtandi,
* `>=` - parehos o mas labaw pa nga pagtandi,
* `<=` - parehos o mas gamay pa nga pagtandi.

Prayoridad sa mga operator:
* `=`;
* `||`, `&&`;
* `==`, `!=`, `>`, `<`, `>=`, `<=`;
* `+`, `-`;
* `*`, `/`, `%`.

### Mga Attribute

Ang mga attribute kay nagrepresentar sa mga field value sa gitarget nga entity. Pwede kang magdungag og mga wala pa na gamit nga mga attribute pinaagi sa pag click sa plus nga pindotanan.

Posible i-access ang mga attribute sa mga nalambigit sa mga entity gamit ang musunod nga format `linkName.attributeName`.


### Mga Function

Ang format sa paggamit sa function: `groupName\functionName(argument1, argument2, ..., argumentN)`.

Ang mga out-of-the-box nga function kay gilista sa ubos.

#### ifThenElse
`ifThenElse(CONDITION, CONSEQUENT, ALTERNATIVE)` Kung ang CONDITION kay natuman na buhata ang CONSEQUENT. Kung wala -- buhata ang ALTERNATIVE.

#### ifThen
`ifThen(CONDITION, CONSEQUENT)` Kung ang CONDITION kay natuman na buhata ang CONSEQUENT. Kung wala -- wala kay buhaton.

#### string\concatenate(
`string\concatenate(STRING_1, STRING_2)` Sumpayon ang duha o mas labaw pa nga mga string.

#### string\substring
`string\substring(STRING, START, LENGTH)`  Kuhaon ang mga character gikan sa STRING pinaagi sa START nga posisyon og LENGTH.

Kung wala nabutangan ang LENGTH, ang substring nga nagsugod gikan sa START hangtod sa kataposan sa STRING ang iuli.

Kung ang LENGTH kay negative, mao sad ang hidaghanon sa mga karakter nga tangtangon sa kataposan sa STRING.

#### string\\trim
`string\trim(STRING)` Tangtangon ang mga whitespace gikan sa sinugdanan ngadto sa kataposan sa STRING.

#### string\\lowerCase
`string\lowerCase(STRING)` Himoon ang mga letra ngadto sa lower case. (ngadto pa sa version 5.0.0)

#### string\\upperCase
`string\upperCase(STRING)` Himoon ang mga letra ngadto sa case. (ngadto pa sa version 5.0.0)

#### datetime\\today
`datetime\today()` Mubalik sa datetime karon.

#### datetime\now
`datetime\now()` Mubalik sa datetime karon dayon.

#### datetime\format

`datetime\format(VALUE, [TIMEZONE], [FORMAT])` Usbon ang date o datetime nga VALUE ngadto sa usa ka string nga giformat basi sa mga application setting. Ang TIMEZONE ug FORMAT kay pwede ra dili butangan. Kung ang TIMEZONE kay wala butangi og value, ang default nga time zone ang gamiton. Kung ang FORMAT kay wala butangi og value, ang default nga format ang gamiton.

#### datetime\date

`datetime\date(VALUE, [TIMEZONE])` Muuli og adlaw sa buwan (1-31). `0` kung ang VALUE kay wala butangi. Kung ang TIMEZONE kay wala butangi og value, ang timezone sa sistema ang gamiton. (ngadto pa sa version 4.7.0)


#### datetime\month
`datetime\month(VALUE, [TIMEZONE])` Muuli og buwan (1-12). `0` kung ang VALUE kay wala butangi. Kung ang TIMEZONE kay wala butangi og value, ang timezone sa sistema ang gamiton. (ngadto pa sa version 4.7.0)

#### datetime\year
`datetime\year(VALUE, [TIMEZONE])` Muuli og tuig. `0` kung ang VALUE kay wala butangi. Kung ang TIMEZONE kay wala butangi og value, ang timezone sa sistema ang gamiton. (ngadto pa sa version 4.7.0)

#### datetime\hour
`datetime\hour(VALUE, [TIMEZONE])` Muuli og oras (0-23). `1` kung ang VALUE kay wala butangi. Kung ang TIMEZONE kay wala butangi og value, ang timezone sa sistema ang gamiton. (ngadto pa sa version 4.7.0)

#### datetime\minute
`datetime\minute(VALUE, [TIMEZONE])` Muuli og minuto (0-59). `-1` kung ang VALUE kay wala butangi. Kung ang TIMEZONE kay wala butangi og value, ang timezone sa sistema ang gamiton. (ngadto pa sa version 4.7.0)

#### datetime\dayOfWeek
`datetime\dayOfWeek(VALUE, [TIMEZONE])` Muuli og adlaw sa semana (0-6). `-1` kung ang VALUE kay wala butangi. `0` - para sa Domingo. Kung ang TIMEZONE kay wala butangi og value, ang timezone sa sistema ang gamiton. (ngadto pa sa version 4.7.3)

#### datetime\diff
`datetime\diff(VALUE_1, VALUE_2, INTERVAL_TYPE)` Muuli sa diperensiya sa duha ka date or datetime. INTERVAL_TYPE kay mamahimong 'years', 'months', 'days', 'hours', 'minutes'. Muuli og  `null` kung wala nigana. Ang resulta kay negative kung ang VALUE_1 < VALUE_2.

#### datetime\addMinutes
`datetime\addMinutes(VALUE, MINUTES)` Mudugang og MINUTES ngadto sa datetime nga VALUE. Ang MINUTES kay pwede negative.

#### datetime\addHours
`datetime\addHours(VALUE, HOURS)` Mudugang og HOURS ngadto sa datetime nga VALUE. Ang HOURS kay pwede negative.

#### datetime\addDays
`datetime\addDays(VALUE, DAYS)` Mudugang og DAYS ngadto sa date o datetime nga VALUE. Ang DAYS kay pwede negative.

#### datetime\addWeeks
`datetime\addWeeks(VALUE, WEEKS)` Mudugang og WEEKS ngadto sa date o datetime nga VALUE. Ang WEEKS kay pwede negative.

#### datetime\addMonths
`datetime\addMonths(VALUE, MONTHS)` Mudugang og MONTHS ngadto sa date o datetime nga VALUE. Ang MONTHS kay pwede negative.

#### datetime\addYears
`datetime\addYears(VALUE, YEARS)` Mudugang og YEARS ngadto sa date o datetime nga VALUE. Ang YEARS kay pwede negative.

#### datetime\closest
`datetime\closest(VALUE, TYPE, TARGET, [IS_PAST], [TIMEZONE])` Muuli sa pinakaduol nga date o datetime sa VALUE base sa gipasa nga mga argumento. (ngadto pa sa version 5.0.0)

Ang TYPE kay pwede mamahimong bisan asa ani nga mga musunod nga value: 'time', 'minute', 'hour', 'date', 'month', 'dayOfWeek'. Ang TARGET kay usa ka integer nga value o usa ka string nga value. IS_PAST means to find closest in the past. If TIMEZONE is omitted then default timezone is used.

Mga Example:

`datetime\closest(datetime\now(), 'time', '20:00')` Muuli sa pinakaduol nga datetime value sa umaabot gamit ang 20:00 nga oras.

`datetime\closest('2017-11-20', 'date', 1, true)` Muuli og `2017-11-01`, ang unang adlaw sa buwan. 

`datetime\closest(datetime\now(), 'dayOfWeek', 1)` Muuli sa sunod nga lunes (ang sinugdanan sa adlaw). 

#### number\format
`number\format(VALUE, [DECIMALS], [DECIMAL_MARK], [THOUSAND_SEPARATOR])` Muilis og numeric nga VALUE ngadto sa string formatted nga gibase sa episipiko nga format o default nga application setting. Kung DECIMALS, DECIMAL_MARK, o THOUSAND_SEPARATOR, ang mga default sa sistema ang gamiton.

Mga Example:

`number\format(2.666667, 2)` - Ang result kay 2.67;

`number\format(1000, 2)` - Ang result kay 1,000.00;

`number\format(10.1, 0)` - Ang result kay 10.


#### number\abs
`number\abs(VALUE)` Absolute nga value. Muuli og null kong dili numero ang VALUE.

#### number\round
`number\round(VALUE, PRECISION)` Muuli og mga rounded nga value sa VALUE nga gipilian ug PRECISION (hidaghanon sa mga numero pagkahuman sa decimal point). Ang PRECISION kay pwede usab kini ma negative o zero (ang default);

#### number\floor
`number\floor(VALUE)` Muuli og sunod nga pinakaubos nga integer value pinaagi sa pag round down sa value kong gikinahanglan. (ngadto pa sa version 4.9.0)

#### number\ceil
`number\ceil(VALUE)` Muuli sa sunod nga pinakataas nga integer value pinaagi sa pag round up sa value kong gikinahanglan. (ngadto pa sa version 4.9.0)

#### entity\isNew
`entity\isNew()` Muuli og TRUE kung ang entity kay bago (gihimo pa) ug FALSE kong dili (giupdate pa).

#### entity\\isAttributeChanged
`entity\isAttributeChanged(ATTRIBUTE)` Muuli og TRUE kung ang ATTRIBUTE sa entity kay nausab.

Example:

`entity\isAttributeChanged('status')`

#### entity\isAttributeNotChanged
`entity\isAttributeNotChanged(ATTRIBUTE)` Muuli og TRUE kung ang ATTRIBUTE sa entity kay wala nausab.

#### entity\attributeFetched
`entity\attributeFetched(ATTRIBUTE)` Ang attribute nga giset sa kadtong gikuha pa gikan sa database ang gitarget nga entity. Sa wala pa kini giusab.

Example:

`entity\isAttributeChanged('assignedUserId')`

#### entity\addLinkMultipleId
`entity\addLinkMultipleId(LINK, ID)` Mudugang ug ID ngadto sa Link Multiple field. Panaglitan, dungagan og 'someTeamId' ang 'teams' nga field. 

`entity\addLinkMultipleId(LINK, ID_LIST)` Mudugang ug lista sa mga id. (ngadto pa sa version 4.8.3)

#### entity\hasLinkMultipleId
`entity\hasLinkMultipleId(LINK, ID)` Mucheck kung ang Link Multiple nga field kay naay espisipiko nga ID.

#### entity\removeLinkMultipleId
`entity\removeLinkMultipleId(LINK, ID)` Mutangtang sa espisipiko nga ID gikan sa Link Multiple nga field.

#### entity\isRelated
`entity\isRelated(LINK, ID)` Mucheck kong ang gitarget nga entity kay naay relasyon ngadto sa laing entity nga gireprestar sa LINK og ID.

#### env\userAttribute
`env\userAttribute(ATTRIBUTE)` Muuli og ATTRIBUTE sa current nga user.

#### list
`list(VALUE-1, ... VALUE-N)` Muuli og array. (ngadto pa sa version 4.7.0)

#### array\includes
`array\includes(LIST, VALUE)` Muuli og true kung ang LIST naay sulod nga VALUE. Pwede ni gamiton para sa Array ug Multi-Enum nga field. (ngadto pa sa version 4.7.0)

#### array\push
`array\push(LIST, VALUE1 [, VALUE2 ...])` Mudugang ug usa o mas labaw pa nga mga elemento ngadto sa kataposan sa array ug muuli og bago nga array. (ngadto pa sa version 5.0.0)

#### array\length
`array\length(LIST)` Muuli og ihap sa pila ka elemento sa LIST. (ngadto pa sa version 4.8.1)

### Mga Value

* Mga String. E.g. 'some string';
* Mga Integer nga numero. E.g. 1, 100, 40300.
* Mga Float nga numero. E.g. 5.2.

### Mga Variable

Posible nga mu-define og custom nga mga variable sa formula.
```
$someVariableName = 'Test';
description = $test;
```


## Mga Example

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

## Pag-gamit sa Formula sa Mga Workflow

Pwede gamiton ang formula ngadto sa mga workflow kondisyon og aksyon. Tanawa ang [workflows nga dokumentasyon](workflows.md) para sa dugang pa nga impormasyon.
