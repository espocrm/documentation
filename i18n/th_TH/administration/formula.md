# การคิดคำนวณ Fields (สูตร)

ในการจัดการ entity จะสามารถกำหนดสคริปต์ (สูตร) สำหรับประเภทของ entity แบบเฉพาะเจาะจงได้ สคริปต์นี้จะถูกเรียกใช้ทุกครั้งก่อนที่บันทึกจะถูกบันทึกไว้ และมีความสามารถในการตั้งค่าเฉพาะฟิลด์ (attributes) ด้วยค่าที่ได้จากการคำนวณ


เมื่อต้องการแก้ไขสูตรให้ทำตามนี้
การดูแลระบบ > การจัดการ Entity  > คลิกเมนูแบบเลื่อนลงที่ด้านขวาบนแถวของ entity ที่ต้องการ > สูตร

นอกจากนี้คุณอาจจะต้องตั้งค่าฟิลด์ด้วย, ควรจะคำนวณและ อ่าน-อย่างเดียว ผ่าน Entity Manager.


## Syntax

สูตร EspoCRM เขียนด้วยภาษาง่ายๆที่ออกแบบมาเฉพาะสำหรับคุณลักษณะนี้

มีตัวดำเนินการ, คุณลักษณะและค่าที่สามารถใช้ได้ในสูตร สำนวนที่แยกออกจากกันจะต้องคั่นด้วย `;`

### ตัวดำเนินการ

* `=` - หน้าที่ที่ได้รับมอบหมาย.
* `||` - ตรรกศาสตร์ หรือ,
* `&&` - ตรรกศาสตร์ และ,
* `!` - ตรรกศาสตร์ ไม่ใช่,
* `+`- การบวกตัวเลข,
* `-` - การลบตัวเลข,
* `*` - การคุณตัวเลข,
* `/` - การหารตัวเลข,
* `%` - ตัวเลข modulo,
* `==` - การเปรียบเทียบมีค่าเท่ากับ,
* `!=` - การเปรียบเทียบมีค่าไม่เท่ากับ,
* `>` - การเปรียบเทียบมีค่ามากกว่า,
* `<` - การเปรียบเทียบมีค่าน้อยกว่า,
* `>=` - การเปรียบเทียบมีค่ามากกว่าหรือเท่ากับ,
* `<=` - การเปรียบเทียบมีค่าน้อยกว่าหนือเท่ากับ

ลำดับความสำคัญของตัวดำเนินการ:
* `=`;
* `||`, `&&`;
* `==`, `!=`, `>`, `<`, `>=`, `<=`;
* `+`, `-`;
* `*`, `/`, `%`.

### คุณลักษณะ

คุณลักษณะ แสดงค่าฟิลด์ของ entity เป้าหมาย คุณสามารถแทรก attributes ที่ใช้งานได้ โดยคลิกที่ปุ่มบวก

คุณสามารถเข้าถึง attributes ที่เกี่ยวข้องกับ entities ได้ด้วยรูปแบบดังต่อไปนี้ `linkName.attributeName`.


### ฟังก์ชั่น

รูปแบบการใช้ฟังก์ชัน: `groupName\functionName(argument1, argument2, ..., argumentN)`

Out-of-the-box ดังฟังก์ชั่นที่แสดงด้านล่าง

#### ifThenElse
`ifThenElse(CONDITION, CONSEQUENT, ALTERNATIVE)` ถ้า CONDITION เป็นไปตามที่กำหนดแล้วทำ CONSEITION ถ้าไม่ -- ให้ทำ ALTERNATIVE.

#### ifThen
`ifThen(CONDITION, CONSEQUENT)` ถ้า CONDITION เป็นไปตามที่กำหนดแล้วทำ CONSEITION ถ้าไม่ - ไม่ต้องทำอะไรเลย

#### string\concatenate(
`string\concatenate(STRING_1, STRING_2)` concatenates สตริงสองสตริงหรือสตริงที่มากกว่า

#### string\substring
`string\substring(STRING, START, LENGTH)`  แยกแยะตัวอักษรออกจากสตริง ตามตำแหน่ง START และ LENGTH

ถ้า LENGTH ถูกละเว้น, สตริงย่อยเริ่มต้นจาก START สายอักขระย่อยที่เริ่มจาก START จนกว่าจะสิ้นสุด STRING จึงจะถูกส่งกลับ 

หาก LENGTH มีค่าเป็นลบ, จากนั้นตัวอัษรหลายตัวจะถูกละเว้นจากตอนท้ายของ STRING

#### string\\trim
`string\trim(STRING)` บีบช่องว่างจากจุดเริ่มต้นและจุดสิ้นสุดของ STRING

#### string\\lowerCase
`string\lowerCase(STRING)` แปลงตัวอักษรเป็นตัวพิมพ์เล็ก (ตั้งแต่เวอร์ชัน 5.0.0)

#### string\\upperCase
`string\upperCase(STRING)` แปลงตัวอักษรเป็นตัวพิมพ์ใหญ่ (ตั้งแต่เวอร์ชัน 5.0.0)

#### datetime\\today
`datetime\today()` ส่งกลับวันที่วันนี้

#### datetime\now
`datetime\now()` ส่งคืนวันเวลา ณ ปัจจุบัน

#### datetime\format
`datetime\format(VALUE, [TIMEZONE], [FORMAT])` แปลง VALUE วันที่หรือวันเวลา  เป็นสตริงที่จัดรูปแบบตามการตั้งค่าแอปพลิเคชัน ส่วน TIMEZONE และ FORMAT สามารถข้ามได้ ถ้า TIMEZONE ถูกข้ามไป ระบบจะใช้โซนเวลาเริ่มต้น ถ้า FORMAT ถูกละไว้ ระบบจะใช้รูปแบบเริ่มต้น

#### datetime\date
`datetime\date(VALUE, [TIMEZONE])` แสดงวันที่ของเดือน (1-31). `0` ถ้า VALUE ว่างเปล่า ถ้า TIMEZONE ถูกละไว้ระบบจะใช้เขตเวลาของระบบ (ตั้งแต่เวอร์ชัน 4.7.0)

#### datetime\month
`datetime\month(VALUE, [TIMEZONE])` แสดงเป็นเดือน (1-12). `0` ถ้า VALUE ว่างเปล่า ถ้า TIMEZONE ถูกละไว้ระบบจะใช้เขตเวลาของระบบ (ตั้งแต่เวอร์ชัน 4.7.0)

#### datetime\year
`datetime\year(VALUE, [TIMEZONE])` แสดงเป็นปี `0` ถ้า VALUE ว่างเปล่า ถ้า TIMEZONE ถูกละไว้ระบบจะใช้เขตเวลาของระบบ (ตั้งแต่เวอร์ชัน 4.7.0)

#### datetime\hour
`datetime\hour(VALUE, [TIMEZONE])` แสดงเป็นชั่วโมง (0-23). `-1` ถ้า VALUE ว่างเปล่า ถ้า TIMEZONE ถูกละไว้ระบบจะใช้เขตเวลาของระบบ (ตั้งแต่เวอร์ชัน 4.7.0)

#### datetime\minute
`datetime\minute(VALUE, [TIMEZONE])` แสดงเป็นนาที (0-59). `-1` ถ้า VALUE ว่างเปล่า ถ้า TIMEZONE ถูกละไว้ระบบจะใช้เขตเวลาของระบบ (ตั้งแต่เวอร์ชัน 4.7.0)

#### datetime\dayOfWeek
`datetime\dayOfWeek(VALUE, [TIMEZONE])` แสดงวันในสัปดาห์ (0-6). `-1` ถ้า VALUE ว่างเปล่า `0` - สำหรับวันอาทิตย์  ถ้า VALUE ว่างเปล่า ถ้า TIMEZONE ถูกละไว้ระบบจะใช้เขตเวลาของระบบ (ตั้งแต่เวอร์ชัน 4.7.3)

#### datetime\diff
`datetime\diff(VALUE_1, VALUE_2, INTERVAL_TYPE)` แสดงผลต่างระหว่างวันที่สองหรือวันเวลา INTERVAL_TYPE ควรเป็น 'ปี', 'เดือน', 'วัน', 'ชั่วโมง', 'นาที'. ส่งคืน `null` ถ้าเกิดความล้มเหลว ผลจะเป็นลบถ้า VALUE_1 < VALUE_2.

#### datetime\addMinutes
`datetime\addMinutes(VALUE, MINUTES)` เพิ่ม MINUTES เป็น VALUE วันเวลา MINUTES อาจเป็นลบได้

#### datetime\addHours
`datetime\addHours(VALUE, HOURS)` เพิ่ม HOURS เป็น VALUE วันเวลา HOURS อาจเป็นลบได้

#### datetime\addDays
`datetime\addDays(VALUE, DAYS)` เพิ่ม DAYS เป็น VALUE วันที่หรือวันเวลา  DAYS อาจเป็นลบได้

#### datetime\addWeeks
`datetime\addWeeks(VALUE, WEEKS)` เพิ่ม WEEKS เป็น  VALUE วันที่หรือวันเวลา   WEEKS อาจเป็นลบได้

#### datetime\addMonths
`datetime\addMonths(VALUE, MONTHS)` เพิ่ม MONTHS เป็น VALUE วันที่หรือวันเวลา  MONTHS อาจเป็นลบได้

#### datetime\addYears
`datetime\addYears(VALUE, YEARS)` เพิ่ม YEARS เป็น VALUE วันที่หรือวันเวลา  YEARS อาจเป็นลบได้

#### datetime\closest
`datetime\closest(VALUE, TYPE, TARGET, [IS_PAST], [TIMEZONE])` ส่งคืนวันที่หรือ วันเวลา ที่ใกล้ที่สุดไปเป็น VALUE โดยอิงตาม arguments (ตั้งแต่เวอร์ชัน 5.0.0)

TYPE สามารถเป็นหนึ่งในค่าต่อไปนี้: 'เวลา', 'นาที', 'ชั่วโมง', 'วัน', 'เดือน', 'วันในสัปดาห์' TARGET คือจำนวนเต็มหรือค่าสตริง IS_PAST หมายถึงการค้นหาที่ใกล้เคียงที่สุดในอดีตที่ผ่านมา ถ้า TIMEZONE ถูกละไว้ระบบจะใช้เขตเวลาเริ่มต้น

ตัวอย่าง:

`datetime\closest(datetime\now(), 'time', '20:00')` จะคืนค่า วันเวลา ที่ใกล้เคียงที่สุดในอนาคตพร้อมกันเวลา 20:00 น.

`datetime\closest('2017-11-20', 'date', 1, true)` จะแสดง `2017-11-01`,วันแรกของเดือน

`datetime\closest(datetime\now(), 'dayOfWeek', 1)` จะกลับคืนในวันจันทร์ถัดไป (จุดเริ่มต้นของวัน)

#### number\format
`number\format(VALUE, [DECIMALS], [DECIMAL_MARK], [THOUSAND_SEPARATOR])` แปลง VALUE หมายเลข  เป็นสตริงที่จัดรูปแบบ ตามรูปแบบเฉพาะหรือการตั้งค่าเริ่มต้นของแอ็พพลิเคชัน ถ้า DECIMALS, DECIMAL_MARK หรือ THOUSAND_SEPARATOR ใช้ค่าเริ่มต้นระบบ

ตัวอย่าง:

`number\format(2.666667, 2)` - ผล 2.67;

`number\format(1000, 2)` - ผล 1,000.00;

`number\format(10.1, 0)` - ผล 10.


#### number\abs
`number\abs(VALUE)` ค่าสัมบูรณ์ จะส่งกลับค่า null หาก VALUE ไม่ใช่ตัวเลข

#### number\round
`number\round(VALUE, PRECISION)` ส่งกลับค่าที่ปัดเศษของ VALUE ไปยัง PRECISION ที่ระบุ (จำนวนตัวเลขหลังจุดทศนิยม) PRECISION อาจเป็นค่าลบหรือศูนย์ (ค่าเริ่มต้น)

#### number\floor
`number\floor(VALUE)` ส่งกลับค่าจำนวนเต็มถัดไปต่ำสุด โดยปัดเศษค่าลงถ้าจำเป็น (ตั้งแต่เวอร์ชัน 4.9.0)

#### number\ceil
`number\ceil(VALUE)` ส่งกลับค่าจำนวนเต็มถัดไปสูงสุด โดยปัดเศษค่าถ้าจำเป็น (ตั้งแต่เวอร์ชัน 4.9.0)

#### entity\isNew
`entity\isNew()` ส่งคืนค่า TRUE หาก entity ใหม่ (กำลังสร้าง) และ FALSE ถ้าไม่ใช่ (กำลังถูกอัพเดต)

#### entity\\isAttributeChanged
`entity\isAttributeChanged(ATTRIBUTE)` ส่งคืนค่า TRUE หากมีการเปลี่ยนแปลง ATTRIBUTE ของ entity

ตัวอย่าง:

`entity\isAttributeChanged('status')`

#### entity\isAttributeNotChanged
`entity\isAttributeNotChanged(ATTRIBUTE)` ส่งคืนค่า TRUE หากไม่มีการเปลี่ยนแปลง ATTRIBUTE ของ entity


#### entity\attributeFetched
`entity\attributeFetched(ATTRIBUTE)` Attribute ถูกตั้งค่า เมื่อดึงข้อมูล entity เป้าหมายจากฐานข้อมูล ก่อนที่จะแก้ไข 

ตัวอย่าง:

`entity\isAttributeChanged('assignedUserId')`

#### entity\addLinkMultipleId
`entity\addLinkMultipleId(LINK, ID)` เพิ่ม ID ในฟิลด์ การเชื่อมโยงหลายช่อง ตัวอย่างเช่นเพิ่ม 'someTeamId' ในฟิลด์ 'teams' 

`entity\addLinkMultipleId(LINK, ID_LIST)` เพิ่มรายการรหัส (ตั้งแต่เวอร์ชัน 4.8.3)

#### entity\hasLinkMultipleId
`entity\hasLinkMultipleId(LINK, ID)` ตรวจสอบว่าการเชื่อมโยงแบบ Multiple ใน field มีรหัสเฉพาะหรือไม่

#### entity\removeLinkMultipleId
`entity\removeLinkMultipleId(LINK, ID)` นำ ID ที่ระบุออกจากฟิลด์ การเชื่อมโยงแบบ Multiple

#### entity\isRelated
`entity\isRelated(LINK, ID)` ตรวจสอบว่า entity เป้าหมายเกี่ยวข้องกับเอนทิตีอื่นที่แสดงโดย LINK และ ID

#### env\userAttribute
`env\userAttribute(ATTRIBUTE)` ส่งคืนค่า ATTRIBUTE ของผู้ใช้ปัจจุบัน

#### list
`list(VALUE-1, ... VALUE-N)` ส่งกลับ array (ตั้งแต่เวอร์ชัน 4.7.0)

#### array\includes
`array\includes(LIST, VALUE)` ส่งกลับค่าจริงถ้า LIST มี VALUE สามารถใช้สำหรับฟิลด์ Array และ Multi-Enum (ตั้งแต่เวอร์ชัน 4.7.0)

#### array\push
`array\push(LIST, VALUE1 [, VALUE2 ...])` เพิ่มองค์ประกอบอย่างน้อยหนึ่งรายการในตอนท้ายของ array และส่งกลับ array ใหม่ (ตั้งแต่เวอร์ชัน 5.0.0)
#### array\length
`array\length(LIST)` ส่งคืนจำนวนองค์ประกอบใน LIST (ตั้งแต่เวอร์ชัน 4.8.1)


### Values

* Strings. เช่น 'some string';
* Integer numbers. เช่น 1, 100, 40300.
* Float numbers. เช่น 5.2.

### Variables

เป็นไปได้ที่จะกำหนดตัวแปรที่กำหนดค่าเองในสูตร
```
$someVariableName = 'Test';
description = $test;
```


## ตัวอย่าง

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

## ใช้สูตรใน Workflows

คุณสามารถใช้สูตรในเงื่อนไขและการทำงานใน workflow ์ได้ ดูจาก [workflows documentation](workflows.md) สำหรับข้อมูลเพิ่มเติม.
