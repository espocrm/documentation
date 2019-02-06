# Вычисляемые поля (формула)

В управлении объектами можно определить скрипт (формулу) для конкретного типа сущности. Этот скрипт будет выполняться каждый раз перед сохранением записи. Он предоставляет возможность автоматически устанавливать полученные из расчета значения для конкретных полей (атрибутов).

Чтобы изменить формулу, перейдите в Администрирование > Управление объектами > выпадающее меню справа в строке нужного объекта > Формула.

Вам также может понадобиться установить поля, которые должны быть вычеслены,"Только чтение" в Управлении объектами.


## Синтаксис

Формула EspoCRM написана на простом языке, разработанном специально для этой функции.

Существуют операторы, атрибуты функций и значения, которые можно использовать в формуле. Разделенные выражения должны быть разделены символом `;`.

### Operators

* `=` - назначение.
* `||` - логическое ИЛИ,
* `&&` - логическое И,
* `!` - логическое НЕ,
* `+`- числовое суммирование,
* `-` - числовое вычитание,
* `*` - числовое умножение,
* `/` - числовое деление,
* `%` - numeric modulo,
* `==` - сравнение равно,
* `!=` - сравнение не равно,
* `>` - сравнение больше чем,
* `<` - сравнение меньше чем,
* `>=` - сравнение больше чем или равно,
* `<=` - Сравнение меньше чем или равно.

Приоритет операторов:
* `=`;
* `||`, `&&`;
* `==`, `!=`, `>`, `<`, `>=`, `<=`;
* `+`, `-`;
* `*`, `/`, `%`.

### Атрибуты

Атрибуты представляют значения полей целевого объекта. Вы можете вставить доступные атрибуты, нажав на кнопку «плюс».

Можно получить доступ к атрибутам связанных объектов в следующем формате `linkName.attributeName`.


### Функции

Формат использования функции: `groupName\functionName(argument1, argument2, ..., argumentN)`.

Готовые функции перечислены ниже.

#### ifThenElse
`ifThenElse(CONDITION, CONSEQUENT, ALTERNATIVE)` Если Условие (CONDITION) выполнено, тогда выполнить Следующие (CONSEQUENT). Если нет - выполнить Альтернативное (ALTERNATIVE). 

#### ifThen
`ifThen(CONDITION, CONSEQUENT)` Если Условие (CONDITION) выполнено, тогда выполнить Следующие (CONSEQUENT). Если нет - не выполнять ничего. 

#### string\concatenate
`string\concatenate(STRING_1, STRING_2)` Объединяет две или более строки.

#### string\substring
`string\substring(STRING, START, LENGTH)`  Извлекает символы из строки (STRING) по позиции START и LENGTH.

Если LENGTH опущена, будет возвращена подстрока, начинающаяся с START до конца строки (STRING).

Если LENGTH отрицательна, то столько же символов будет опущено в конце строки (STRING).

#### string\contains
`string\contains(STRING, NEEDLE)`  Содержит ли строка (STRING) иглу (NEEDLE). (начиная с версии 5.1.2)

#### string\test
`string\test(STRING, REGULAR_EXPRESSION)`  Поиск соответствия между REGULAR_EXPRESSION и STRING. (начиная с версии 5.5.2)

#### string\length
`string\length(STRING)` Длина строки (STRING). (начиная с версии 5.1.2)

#### string\trim
`string\trim(STRING)` Удаляет пробелы с начала и конца строки (STRING).

#### string\lowerCase
`string\lowerCase(STRING)` Преобразует буквы в нижний регистр. (начиная с версии 5.0.0)

#### string\upperCase
`string\upperCase(STRING)` Преобразует буквы в верхний регистр. (начиная с версии 5.0.0)

#### datetime\today
`datetime\today()` Возвращает сегодняшнюю дату.

#### datetime\now
`datetime\now()` Возвращает текущую дату и время.

#### datetime\format
`datetime\format(VALUE, [TIMEZONE], [FORMAT])` Преобразует дату или дату и время в значение (VALUE), отформатированное в соответствии с настройками приложения или заданным часовым поясом и форматом. TIMEZONE и FORMAT могут быть опущены. Если TIMEZONE не указан, будет использоваться часовой пояс по умолчанию. Если FORMAT опущен, будет использоваться формат по умолчанию.

Примеры:

`datetime\format(closeDate, 'America/New_York', 'MM/DD/YYYY')`

`datetime\format(dateStart, 'America/New_York', 'MM/DD/YYYY hh:mma')`

`datetime\format(dateStart, 'Europe/Amsterdam', 'DD/MM/YYYY HH:mm')`

#### datetime\date
`datetime\date(VALUE, [TIMEZONE])` Возвращает дату месяца (1-31). `0`, если значение (VALUE) пусто. Если часовой пояс (TIMEZONE) не указан, то используется системный часовой пояс. (начиная с версии 4.7.0)

#### datetime\month
`datetime\month(VALUE, [TIMEZONE])` Возвращает месяц (1-12). `0`, если значение (VALUE) пусто. Если часовой пояс (TIMEZONE) не указан, то используется системный часовой пояс. (начиная с версии 4.7.0)

#### datetime\year
`datetime\year(VALUE, [TIMEZONE])` Возвращает год. `0`, если значение (VALUE) пусто. Если часовой пояс (TIMEZONE) не указан, то используется системный часовой пояс. (начиная с версии 4.7.0)

#### datetime\hour
`datetime\hour(VALUE, [TIMEZONE])` Возвращает час (0-23). `-1` если значение (VALUE) пусто. Если часовой пояс (TIMEZONE) не указан, то используется системный часовой пояс. (начиная с версии 4.7.0)

#### datetime\minute
`datetime\minute(VALUE, [TIMEZONE])` Возвращает минуту (0-59). `-1` если значение (VALUE) пусто. Если часовой пояс (TIMEZONE) не указан, то используется системный часовой пояс. (начиная с версии 4.7.0)

#### datetime\dayOfWeek
`datetime\dayOfWeek(VALUE, [TIMEZONE])` Возвращает день недели (0-6). `-1`, если значение (VALUE) пусто. `0` - на воскресенье. Если часовой пояс (TIMEZONE) не указан, то используется системный часовой пояс. (начиная с версии 4.7.3)

#### datetime\diff
`datetime\diff(VALUE_1, VALUE_2, INTERVAL_TYPE)` Возвращает разницу между двумя датами или датами и временем. INTERVAL_TYPE может быть «годы», «месяцы», «дни», «часы», «минуты». Возвращает `null`, если ошибка. Результат будет отрицательным, если VALUE_1 <VALUE_2.

#### datetime\addMinutes
`datetime\addMinutes(VALUE, MINUTES)` Добавляет минуты (MINUTES) к значению (VALUE) даты и времени. Минуты (MINUTES) могут быть отрицательными.

#### datetime\addHours
`datetime\addHours(VALUE, HOURS)` Добавляет часы (HOURS) к значению (VALUE) даты и времени. Часы (HOURS) могут быть отрицательными.

#### datetime\addDays
`datetime\addDays(VALUE, DAYS)` Добавляет дни (DAYS) к значению (VALUE) даты или даты и времени. Дни (DAYS) могут быть отрицательными.

#### datetime\addWeeks
`datetime\addWeeks(VALUE, WEEKS)` Добавляет недели (WEEKS) к значению (VALUE) даты или даты и времени. Недели (WEEKS) могут быть отрицательными.

#### datetime\addMonths
`datetime\addMonths(VALUE, MONTHS)` Добавляет месяцы (MONTHS) к значению (VALUE) даты или даты и времени. Месяцы (MONTHS) могут быть отрицательными.

#### datetime\addYears
`datetime\addYears(VALUE, YEARS)` Добавляет годы (YEARS) к значению (VALUE) даты или даты и времени. Годы (YEARS) могут быть отрицательными

#### datetime\closest
`datetime\closest(VALUE, TYPE, TARGET, [IS_PAST], [TIMEZONE])` Возвращает ближайшую дату или дату и время к значению (VALUE) на основе переданных аргументов. (начиная с версии 5.0.0)

TYPE может принимать одно из следующих значений: «время», «минута», «час», «дата», «месяц», «день недели». TARGET - это целочисленное значение или строковое значение. IS_PAST означает найти самое близкое значение в прошлом. Если часовой пояс (TIMEZONE) не указан, то используется часовой пояс по умолчанию.

Примеры:

`datetime\closest(datetime\now(), 'time', '20:00')`Вернет ближайшее значение даты и времени в будущее в 20:00.

`datetime\closest('2017-11-20', 'date', 1, true)` Вернет `2017-11-01`, первый день месяца.

`datetime\closest(datetime\now(), 'dayOfWeek', 1)` Вернет следующий понедельник (начало дня). 

#### number\format
`number\format(VALUE, [DECIMALS], [DECIMAL_MARK], [THOUSAND_SEPARATOR])` Преобразует числовое значение (VALUE) в строку, отформатированную в соответствии с определенным форматом или настройками приложения по умолчанию. Если DECIMALS, DECIMAL_MARK или THOUSAND_SEPARATOR, то используются системные значения по умолчанию. 

Примеры:

`number\format(2.666667, 2)` - результат - 2.67;

`number\format(1000, 2)` - результат - 1,000.00;

`number\format(10.1, 0)` - результат - 10.


#### number\abs
`number\abs(VALUE)` Абсолютное значение. Возвращает ноль, если значение (VALUE) не является числовым.

#### number\round
`number\round(VALUE, PRECISION)` Возвращает округленное значение значения (VALUE) до указанной точности (PRECISION) (количество цифр после десятичной точки). Точность (PRECISION) также может быть отрицательной или нулевой (по умолчанию).

#### number\floor
`number\floor(VALUE)` Возвращает следующее наименьшее целочисленное значение, округляя значение в меньшую сторону при необходимости. (начиная с версии 4.9.0)

#### number\ceil
`number\ceil(VALUE)` Возвращает следующее наибольшее целочисленное значение, округляя значение в большую сторону при необходимости. (начиная с версии 4.9.0)

#### entity\isNew
`entity\isNew()` Возвращает TRUE, если сущность является новой (создается), и FALSE, если нет (обновляется).

#### entity\\isAttributeChanged
`entity\isAttributeChanged(ATTRIBUTE)` Возвращает TRUE, если атрибут (ATTRIBUTE) сущности был изменен.

Пример:

`entity\isAttributeChanged('status')`

#### entity\isAttributeNotChanged
`entity\isAttributeNotChanged(ATTRIBUTE)` Возвращает TRUE, если атрибут (ATTRIBUTE) сущности не был изменен.

#### entity\attributeFetched
`entity\attributeFetched(ATTRIBUTE)` Атрибут, который был установлен, когда целевая сущность была выбрана из базы данных. До того как он был изменен.

Пример:

`entity\isAttributeChanged('assignedUserId')`

#### entity\addLinkMultipleId
`entity\addLinkMultipleId(LINK, ID)` Добавляет ID в поле Link Multiple.

`entity\addLinkMultipleId(LINK, ID_LIST)` Добавляет список id. (начиная с версии 4.8.3)

Пример:

`entity\addLinkMultipleId('teams', 'someTeamId')` Добавляет 'someTeamId' в поле 'teams'.  

#### entity\hasLinkMultipleId
`entity\hasLinkMultipleId(LINK, ID)` Проверяет, имеет ли поле Link Multiple особый ID.

#### entity\removeLinkMultipleId
`entity\removeLinkMultipleId(LINK, ID)` Удаляет особый ID из поля Link Multiple.

#### entity\isRelated
`entity\isRelated(LINK, ID)` Проверяет, связана ли целевяая сущность с другой сущностью, представленной LINK и ID. 

#### entity\sumRelated
`entity\sumRelated(LINK, FIELD, [FILTER])` Суммирует связанные записи по указанному полю (FIELD) с необязательным фильтром (FILTER). (начиная с версии 5.2.6)

Пример:

`entity\sumRelated('opportunities', 'amountConverted', 'won')`

Можно применять [list report](../user-guide/reports.md) как фильтр. Сначала необходимо создать Report Filter (на странице администрирования). Тогда вы можете использовать: `entity\sumRelated('opportunities', 'amountConverted', 'reportFilter5c41a0a396f66725d')`, где '5c41a0a396f66725d' это ID записи Report Filter, которое можно получить по URL-адресу.

#### entity\countRelated
`entity\countRelated(LINK, [FILTER])` Возвращает количество связанных записей с применением необязательного фильтра (FILTER). (начиная с версии 5.2.6) 

Пример:

`entity\countRelated('opportunities', 'open')`

Можно применять [list report](../user-guide/reports.md) как фильтр, так же как и для функции sumRelated.

#### record\exists

`record\exists(ENTITY_TYPE, KEY1, VALUE2, [KEY2, VALUE2 ...])` Проверяет, существует ли запись с указанными критериями. (начиная с версии 5.5.6)

Пример:

`record\exists('Lead', 'emailAddress=', fromAddress)`

#### record\count

`record\count(ENTITY_TYPE, KEY1, VALUE2, [KEY2, VALUE2 ...])` Возвращает количество записей с указанными критериями. (начиная с версии 5.5.6)

или

`record\count(ENTITY_TYPE, [FILTER])` Возвращает количество записей с применением необязательного фильтра (FILTER). (начиная с версии 5.5.7)

Примеры:

`record\count('Opportunity', 'accountId=', id, 'stage=', 'Closed Won')`

`record\count('Opportunity', 'amountConverted>', 1000)`

`record\count('Opportunity', 'open')`

#### env\userAttribute
`env\userAttribute(ATTRIBUTE)` Возвращает атрибут (ATTRIBUTE) текущего пользователя.

Пример:

`env\userAttribute('id')` - ID текущего пользователя.

#### list
`list(VALUE-1, ... VALUE-N)` Возвращает массив. (начиная с версии 4.7.0)

#### array\includes
`array\includes(LIST, VALUE)` Возвращает true, если список (LIST) содержит значение (VALUE). Может использоваться для полей Array и Multi-Enum. (начиная с версии 4.7.0)

#### array\push
`array\push(LIST, VALUE1 [, VALUE2 ...])` Добавляет один или несколько элементов в конец массива и возвращает новый массив. (начиная с версии 5.0.0)

#### array\length
`array\length(LIST)` Возвращает количество элементов в списке (LIST). (начиная с версии 4.8.1)


### Значения

* Строки. Например, 'some string';
* Целые числа. Например, 1, 100, 40300.
* Числа с плавающей точкой. Например, 5.2.

### Переменные

Можно определить пользовательские переменные в формуле.
```
$someVariableName = 'Test';
description = $test;
```


## Примеры

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

## Использование формулы в рабочих потоках

Вы можете использовать формулу в условиях и действиях рабочего потока. Смотрите [workflows documentation](workflows.md) для получения дополнительной информации.
