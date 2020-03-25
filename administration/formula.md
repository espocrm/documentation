# Formula (& calculated fields)

In entity manager it's possible to define script (formula) for specific entity type. This script will be executed every time before record is saved. 

It provides an ability to automatically set specific fields (attributes) with values derived from calculation.

To edit formula follow Administration > Entity Manager > dropdown menu at the right on the row of needed entity > Formula.

You may also need to set fields, that are supposed to be calculated, read-only via Entity Manager.

Admin can run 'Recalculate Formula' for specific records from the list view.

Formula can also be utilized in Workflows and BPM tool.

In this article:

* [Syntax](#syntax)
* [Operators](#operators)
* [Attributes](#operators)
* [Functions](#functions)
  * [General](#general)
  * [String](#string)
  * [Datetime](#datetime)
  * [Number](#number)
  * [Entity](#entity)
  * [Record](#record)
  * [Env](#env)
  * [Password](#password)
  * [Array](#array)
  * [Ext](#ext)
* [Values](#values)
* [Variables](#variables)
* [Comments](#comments)
* [Function arguments](#function-arguments)
* [Examples](#examples)
* [Using formula in Workflows](#using-formula-in-workflows)

## Syntax

EspoCRM formula is written in the simple language designed specifically for this feature.

There are 4 element types that can be used in formula:

* operators
* functions
* attributes
* values

Separated expressions must be delimited by character `;`.

Example:

```
string\concatenate(name, ' + ', $test);
```
where:

* `string\concatenate` – function
* `name` – attribute (of a target entity, to which formula is applied)
* `' + '` – value (of string type)
* `$test` – variable (supposed to be declared somewhere above)


## Operators

* `=` - assignment.
* `||` - logical OR,
* `&&` - logical AND,
* `!` - logical NOT,
* `+`- numeric summation,
* `-` - numeric subtraction,
* `*` - numeric multiplication,
* `/` - numeric division,
* `%` - numeric modulo,
* `==` - comparison equals,
* `!=` - comparison not equals,
* `>` - comparison greater than,
* `<` - comparison less than,
* `>=` - comparison greater than or equals,
* `<=` - comparison less than or equals.

Priority of operators:
* `=`;
* `||`, `&&`;
* `==`, `!=`, `>`, `<`, `>=`, `<=`;
* `+`, `-`;
* `*`, `/`, `%`.

## Attributes

Attributes represent field values of the target entity. You can insert available attributes by clicking on the plus button.

It's possible to access attributes of related entities with the following format `linkName.attributeName`.


## Functions

Format of function use: `groupName\functionName(argument1, argument2, ..., argumentN)`.

Out-of-the-box functions are listed below.

## General

#### ifThenElse
`ifThenElse(CONDITION, CONSEQUENT, ALTERNATIVE)` If CONDITION is met, then do CONSEQUENT. If not -- then do ALTERNATIVE.

#### ifThen
`ifThen(CONDITION, CONSEQUENT)` If CONDITION is met, then do CONSEQUENT. If not -- do nothing.

CONSEQUENT and ALTERNATIVE can consist of mutliple commands separated by the semicolon `;`.

#### list
`list(VALUE-1, ... VALUE-N)` Returns array.

Useful to create an array for link-multiple IDs. Example: `teamsIds = list($teamId)`.

### String

* [string\concatenate](#stringconcatenate)
* [string\substring](#stringsubstring)
* [string\contains](#stringcontains)
* [string\pos](#stringpos)
* [string\test](#stringtest)
* [string\length](#stringlength)
* [string\trim](#stringtrim)
* [string\lowerCase](#stringlowercase)
* [string\upperCase](#stringuppercase)
* [string\pad](#stringpad)
* [string\match](#stringmatch)
* [string\matchAll](#stringmatchall)

#### string\concatenate
`string\concatenate(STRING_1, STRING_2)` Concatenates two or more strings.

#### string\substring
`string\substring(STRING, START, LENGTH)`  Extracts the characters from a STRING by START position and LENGTH.

If LENGTH is omitted, the substring starting from START until the end of the STRING will be returned.

If LENGTH is negative, then that many characters will be omitted from the end of STRING.

#### string\contains
`string\contains(STRING, NEEDLE)`  Whether STRING contains NEEDLE.

#### string\pos
`string\pos(STRING, NEEDLE)`  Returns possition of NEEDLE in STRING, *false* if not found. (since version 5.7.3)

#### string\test
`string\test(STRING, REGULAR_EXPRESSION)`  Search a match between REGULAR_EXPRESSION and STRING. Returns TRUE of FALSE.

#### string\length
`string\length(STRING)` The length of STRING.

#### string\trim
`string\trim(STRING)` Strips whitespace from the beginning and end of STRING.

#### string\lowerCase
`string\lowerCase(STRING)` Converts letters to lower case.

#### string\upperCase
`string\upperCase(STRING)` Converts letters to upper case.

#### string\pad
`string\pad(STRING, LENGTH, [PAD_STRING], [PAD_TYPE])`  Pads STRING to a certain LENGTH with PAD_STRING.

PAD_STRING by default is a whitespace string `' '`.

PAD_TYPE can be *'right'*, *'left'*, *'both'*. By default it is *'right'*.

#### string\match
`string\match(STRING, REGULAR_EXPRESSION, [OFFSET])`  Retrieves the first result of matching a STRING against a REGULAR_EXPRESSION. Returns NULL if no matches are found. (available since version 5.8.3.)

Example:

`string\match('string\\match('{token1} foo {token2} bar', '/{[^}]*}/')`

will return `{token1}`.

#### string\matchAll
`string\matchAll(STRING, REGULAR_EXPRESSION, [OFFSET])`  Retrieves all result of matching a STRING against a REGULAR_EXPRESSION. Returns NULL if no matches are found. (available since version 5.8.3.)

Example:

`string\matchAll('string\\match('{token1} foo {token2} bar', '/{[^}]*}/')`

will return an array `['{token1}', '{token2}']`.

### Datetime

* [datetime\today](#datetimetoday)
* [datetime\now](#datetimenow)
* [datetime\format](#datetimeformat)
* [datetime\date](#datetimedate)
* [datetime\month](#datetimemonth)
* [datetime\year](#datetimeyear)
* [datetime\hour](#datetimehour)
* [datetime\minute](#datetimeminute)
* [datetime\dayOfWeek](#datetimedayofweek)
* [datetime\diff](#datetimediff)
* [datetime\addMinutes](#datetimeaddminutes)
* [datetime\addHours](#datetimeaddhours)
* [datetime\addDays](#datetimeadddays)
* [datetime\addWeeks](#datetimeaddweeks)
* [datetime\addMonths](#datetimeaddmonths)
* [datetime\addYears](#datetimeaddyears)
* [datetime\closest](#datetimeclosest)

#### datetime\today
`datetime\today()` Returns today's date.

#### datetime\now
`datetime\now()` Returns current datetime.

#### datetime\format
`datetime\format(VALUE, [TIMEZONE], [FORMAT])` Converts date or datetime VALUE into a string formatted according to the application settings or a given timezone and format. TIMEZONE and FORMAT can be omitted. If TIMEZONE is omitted, then default time zone will be used. If FORMAT is omitted, then default format will be used.

Examples:

`datetime\format(closeDate, 'America/New_York', 'MM/DD/YYYY')`

`datetime\format(dateStart, 'America/New_York', 'MM/DD/YYYY hh:mma')`

`datetime\format(dateStart, 'Europe/Amsterdam', 'DD/MM/YYYY HH:mm')`

#### datetime\date
`datetime\date(VALUE, [TIMEZONE])` Returns date of the month (1-31). `0` if VALUE is empty. If TIMEZONE is omitted, then system timezone is used.

#### datetime\month
`datetime\month(VALUE, [TIMEZONE])` Returns month (1-12). `0` if VALUE is empty. If TIMEZONE is omitted, then system timezone is used.

#### datetime\year
`datetime\year(VALUE, [TIMEZONE])` Returns year. `0` if VALUE is empty. If TIMEZONE is omitted, then system timezone is used.

#### datetime\hour
`datetime\hour(VALUE, [TIMEZONE])` Returns hour (0-23). `-1` if VALUE is empty. If TIMEZONE is omitted, then system timezone is used.

#### datetime\minute
`datetime\minute(VALUE, [TIMEZONE])` Returns minute (0-59). `-1` if VALUE is empty. If TIMEZONE is omitted, then system timezone is used.

#### datetime\dayOfWeek
`datetime\dayOfWeek(VALUE, [TIMEZONE])` Returns day of the week (0-6). `-1` if VALUE is empty. `0` - for Sunday. If TIMEZONE is omitted, then system timezone is used.

#### datetime\diff
`datetime\diff(VALUE_1, VALUE_2, INTERVAL_TYPE)` Returns difference between two dates or datetimes. INTERVAL_TYPE can be 'years', 'months', 'days', 'hours', 'minutes'. Returns `null` if failure. Result will be negative if VALUE_1 < VALUE_2.

#### datetime\addMinutes
`datetime\addMinutes(VALUE, MINUTES)` Adds MINUTES to datetime VALUE. MINUTES can be negative.

#### datetime\addHours
`datetime\addHours(VALUE, HOURS)` Adds HOURS to datetime VALUE. HOURS can be negative.

#### datetime\addDays
`datetime\addDays(VALUE, DAYS)` Adds DAYS to date or datetime VALUE. DAYS can be negative.

#### datetime\addWeeks
`datetime\addWeeks(VALUE, WEEKS)` Adds WEEKS to date or datetime VALUE. WEEKS can be negative.

#### datetime\addMonths
`datetime\addMonths(VALUE, MONTHS)` Adds MONTHS to date or datetime VALUE. MONTHS can be negative.

#### datetime\addYears
`datetime\addYears(VALUE, YEARS)` Adds YEARS to date or datetime VALUE. YEARS can be negative.

#### datetime\closest
`datetime\closest(VALUE, TYPE, TARGET, [IS_PAST], [TIMEZONE])` Returns closest date or datetime to VALUE based on passed arguments.

TYPE can be one of the following values: 'time', 'minute', 'hour', 'date', 'month', 'dayOfWeek'. TARGET is an integer value or a string value. IS_PAST means to find closest in the past. If TIMEZONE is omitted, then default timezone is used.

Examples:

`datetime\closest(datetime\now(), 'time', '20:00')` Will return the closest datetime value in the future with 20:00 time.

`datetime\closest('2017-11-20', 'date', 1, true)` Will return `2017-11-01`, the first day of the month. 

`datetime\closest(datetime\now(), 'dayOfWeek', 1)` Will return the next Monday (the beginning of the day). 

### Number

#### number\format
`number\format(VALUE, [DECIMALS], [DECIMAL_MARK], [THOUSAND_SEPARATOR])` Converts numeric VALUE into string formatted according to a specific format or default application settings. If DECIMALS, DECIMAL_MARK OR THOUSAND_SEPARATOR, then system defaults are used.

Examples:

`number\format(2.666667, 2)` - results 2.67;

`number\format(1000, 2)` - results 1,000.00;

`number\format(10.1, 0)` - results 10.


#### number\abs
`number\abs(VALUE)` Absolute value. Returns null if VALUE is not numeric.

#### number\round
`number\round(VALUE, PRECISION)` Returns the rounded value of VALUE to specified PRECISION (number of digits after the decimal point). PRECISION can also be negative or zero (default).

#### number\floor
`number\floor(VALUE)` Returns the next lowest integer value by rounding down value if necessary.

#### number\ceil
`number\ceil(VALUE)` Returns the next highest integer value by rounding up value if necessary.

### Entity

* [entity\isNew](#entityisnew)
* [entity\isAttributeChanged](#entityisattributechanged)
* [entity\isAttributeNotChanged](#entityisattributenotchanged)
* [entity\attribute](#entityattribute)
* [entity\setAttribute](#entitysetattribute)
* [entity\attributeFetched](#entityattributefetched)
* [entity\addLinkMultipleId](#entityaddlinkmultipleid)
* [entity\hasLinkMultipleId](#entityhaslinkmultipleid)
* [entity\removeLinkMultipleId](#entityremovelinkmultipleid)
* [entity\isRelated](#entityisrelated)
* [entity\sumRelated](#entitysumrelated)
* [entity\countRelated](#entitycountrelated)
* [entity\getLinkColumn](#entitygetlinkcolumn)

#### entity\isNew
`entity\isNew()` Returns TRUE if the entity is new (being created) and FALSE if not (being updated).

#### entity\isAttributeChanged
`entity\isAttributeChanged(ATTRIBUTE)` Returns TRUE if ATTRIBUTE of the record was changed.

Example:

`entity\isAttributeChanged('status')`

#### entity\isAttributeNotChanged
`entity\isAttributeNotChanged(ATTRIBUTE)` Return TRUE if ATTRIBUTE of the record was not changed.

#### entity\attribute
`entity\attribute(ATTRIBUTE)` An ATTRIBUTE value of a target record. It's also possibe to fetch an attribute of a related record.

`$test = entity\attribute('name')` is equivalent to `$test = name`.

Examples:

`entity\attribute('assignedUserId')`

`entity\attribute('account.name')`


#### entity\setAttribute
`entity\setAttribute(ATTRIBUTE, VALUE)` Set ATTRIBUTE with a VALUE.

`entity\setAttribute('stage', 'Closed Won')` is equivalent to `stage = 'Closed Won'`.

Example:

`entity\setAttribute('stage', 'Closed Won')`


#### entity\attributeFetched
`entity\attributeFetched(ATTRIBUTE)` An ATTRIBUTE value that was set when a target record was fetched from database. Before it was modified.

Example:

`entity\attributeFetched('assignedUserId')`

#### entity\addLinkMultipleId
`entity\addLinkMultipleId(LINK, ID)` Adds ID to Link Multiple field.

`entity\addLinkMultipleId(LINK, ID_LIST)` Adds the list of ids.

Example:

`entity\addLinkMultipleId('teams', 'someTeamId')` Add 'someTeamId' to 'teams' field. 


#### entity\hasLinkMultipleId
`entity\hasLinkMultipleId(LINK, ID)` Checks whether Link Multiple field has specific ID.

#### entity\removeLinkMultipleId
`entity\removeLinkMultipleId(LINK, ID)` Removes a specific ID from the Link Multiple field.

#### entity\isRelated
`entity\isRelated(LINK, ID)` Checks whether target entity is related with another entity represented by LINK and ID.

#### entity\sumRelated
`entity\sumRelated(LINK, FIELD, [FILTER])` Sums related records by a specified FIELD with an optional FILTER.

Example:

`entity\sumRelated('opportunities', 'amountConverted', 'won')`

FILTER is a name of a filter pre-defined in the system. It's also possible to apply a [list report](../user-guide/reports.md) as a filter. More info [below](#filter).

#### entity\countRelated
`entity\countRelated(LINK, [FILTER])` Returns a number of related records with an optional FILTER applied.

Example:

`entity\countRelated('opportunities', 'open')`

It's possible to apply a [list report](../user-guide/reports.md) as a filter. More info about filters [below](#filter).

#### entity\getLinkColumn
`entity\getLinkColumn(LINK, ID, COLUMN)` Fetches a relationship column value (since 5.7.1).

Example:

`entity\getLinkColumn('targetLists', 'TARGET_LIST_ID', 'optedOut')`


### Record

* [record\exists](#recordexists)
* [record\count](#recordcount)
* [record\findOne](#recordfindone)
* [record\findRelatedOne](#recordfindrelatedone)
* [record\attribute](#recordattribute)
* [record\relate](#recordrelate)
* [record\unrelate](#recordunrelate)
* [record\relationColumn](#recordrelationcolumn)
* [record\updateRelationColumn](#recordupdaterelationcolumn)

#### record\exists

`record\exists(ENTITY_TYPE, KEY1, VALUE1, [KEY2, VALUE2 ...])` Check whether a record with specified criteria exists.

Examples:

`record\exists('Lead', 'emailAddress=', fromAddress)`

`record\exists('Lead', 'status=', list('Assigned', 'In Process'))`

#### record\count

`record\count(ENTITY_TYPE, KEY1, VALUE1, [KEY2, VALUE2 ...])` Returns a count of records with specified criteria.

`record\count(ENTITY_TYPE, [FILTER])` Returns a count of records with an optional FILTER applied. More info about filters [below](#filter).

Examples:

`record\count('Opportunity', 'accountId=', id, 'stage=', 'Closed Won')`

`record\count('Opportunity', 'amountConverted>', 1000)`

`record\count('Opportunity', 'open')`

`record\count('Lead', 'status=', list('Assigned', 'In Process'))`

FILTER is a name of a filter pre-defined in the system. It's also possible to apply a [list report](../user-guide/reports.md) as a filter. More info [below](#filter).

#### record\findOne

`record\findOne(ENTITY_TYPE, ORDER_BY, ORDER, [KEY1, VALUE1, KEY2, VALUE2 ...])` Returns a first found ID of a record that matches specific criteria. (since version 5.7.0)

`record\findOne(ENTITY_TYPE, ORDER_BY, ORDER, [FILTER])` Returns a first found ID of a record with an optional FILTER applied. (since version 5.7.0)

Examples:

`record\findOne('Opportunity', 'createdAt', 'desc', 'accountId=', id, 'stage=', 'Closed Won')`

`record\findOne('Opportunity', 'createdAt', 'desc', 'open')`

FILTER is a name of a filter pre-defined in the system. It's also possible to apply a [list report](../user-guide/reports.md) as a filter. More info [below](#filter).

#### record\findRelatedOne

`record\findRelatedOne(ENTITY_TYPE, ID, LINK, ORDER_BY, ORDER, [KEY1, VALUE1, KEY2, VALUE2 ...])` Returns a first found ID of a related record that matches specific criteria. (since version 5.7.0)

`record\findRelatedOne(ENTITY_TYPE, ID, LINK, ORDER_BY, ORDER, [FILTER])` Returns a first found ID of a related record with an optional FILTER applied. (since version 5.7.0)

Examples:

`record\findRelatedOne('Account', accountId, 'oppotunities', 'createdAt', 'desc', 'stage=', 'Closed Won')`

`record\findRelatedOne('Account', accountId, 'oppotunities', 'createdAt', 'desc', 'open')`

FILTER is a name of a filter pre-defined in the system. It's also possible to apply a [list report](../user-guide/reports.md) as a filter. More info [below](#filter).

#### record\attribute

`record\attribute(ENTITY_TYPE, ID, ATTRIBUTE)`

Returns an attribute value of a specific record. (since version 5.7.0)

Examples:

`record\attribute('Opportunity', $opportunityId, 'amountConverted')`

`record\attribute('Opportunity', $opportunityId, 'teamsIds')`

By utilizing this function along with *record\findOne*, it's possible to fetch attribute values of any record in the system.

#### record\relate

`record\relate(ENTITY_TYPE, ID, LINK, FOREIGN_ID)`

Links two records. Available since version 5.7.8.


Example:

`record\relate('Account', $accountId, 'opportunities', $opportunityId)`

Note: It won't work in *Before save script* when creating a new record, because the record doesn't exist yet when formula is processed.

#### record\unrelate

`record\unrelate(ENTITY_TYPE, ID, LINK, FOREIGN_ID)`

Unlinks two records. Available since version 5.7.8.

Example:

`record\unrelate('Account', $accountId, 'opportunities', $opportunityId)`

#### record\relationColumn

`record\relationColumn(ENTITY_TYPE, ID, LINK, FOREIGN_ID, COLUMN)`

Returns a relation column. Available since version 5.8.0.

Example:

`record\relationColumn('Account', $accountId, 'contacts', $contactId, 'role')`

#### record\updateRelationColumn

`record\updateRelationColumn(ENTITY_TYPE, ID, LINK, FOREIGN_ID, COLUMN, VALUE)`

Updates a relation column. Available since version 5.8.0.

Example:

`record\updateRelationColumn('Account', $accountId, 'contacts', $contactId, 'role', 'CEO')`

### Env

#### env\userAttribute
`env\userAttribute(ATTRIBUTE)` Returns ATTRIBUTE of the current user.

Example:

`env\userAttribute('id')` - ID of the current user.

### Password

Since version 5.7.0.

#### password\generate

`password\generate()`

Generates and returns a password.

#### password\hash

`password\hash(PASSWORD)`

Hashes a password. You need to hash the password before setting *password* field of *User* record.

Example:

```
$password = password\generate();
$hash = password\hash($password);
```


### Array

#### array\includes
`array\includes(LIST, VALUE)` Returns true if LIST contains VALUE. Can be used for Array and Multi-Enum fields.

#### array\push
`array\push(LIST, VALUE1 [, VALUE2 ...])` Adds one or more elements to the end of an array and returns the new array.

#### array\length
`array\length(LIST)` Returns count of elements in LIST.

#### array\at
`array\at(LIST, INDEX)` Returns value by INDEX. (since version 5.8.3)

### Ext

#### ext\account\findByEmailAddressDomain
`ext\account\findByEmailAddressDomain(EMAIL_ADDRESS)` Finds account by email address. If no full match found, then tries to find by domain name. Free email provider domains are ignored. Returns ID or null. (Available since 5.8.3).


## Values

* Strings. E.g. 'some string';
* Integer numbers. E.g. 1, 100, 40300.
* Float numbers. E.g. 5.2.

## Variables

It's possible to define custom variables in formula.
```
$someVariableName = 'Test';
description = $test;
```

## Comments

Available since version 5.7.6.

Line comment:

```
// comment
```

Section comment:

```
/*
    comment
*/
```

## Function arguments

#### LINK

A name of the relationship. Available link names can be found at Administration > Entity Manager > ... > Relationships.

Link names must be wrapped in quotes when used as function arguments.

#### ATTRIBUTE

Attribute name usually is the same as a system field name. Fields are listed in Entity Manager > ... > Fields. 

Field types having multiple attributes: 

* Link: *fieldId*, *fieldName*.
* Link-Multiple: *fieldIds*, *fieldNames*.
* Link-Parent: *fieldId*, *fieldType*, *fieldName*.
* Currency: *field*, *fieldCurrency*.

Where *field* is the name of the field.

Attribute names must be wrapped in quotes when used as function arguments. E.g. `record\attribute('Lead', 'someId', 'assignedUserId')`.
 
#### ENTITY_TYPE

ENTITY_TYPE list is available at Administration > Entity Manager.

Entity type names must be wrapped in quotes when used as function arguments. E.g. `record\attribute('Lead', 'someId', 'assignedUserId')`.

#### FILTER

A name of a filter pre-defined in the system. Usually it is defined in [SelectManager class](../development/select-manager.md). Developers can define own filters in a custom SelectManager class.

For non-developers it's possible to apply a [list report](../user-guide/reports.md) as a filter. First, you need to create Report Filter (at Administration page). Then you can use: `entity\sumRelated('opportunities', 'amountConverted', 'reportFilter5c41a0a396f66725d')`, where '5c41a0a396f66725d' is an ID of Report Filter record, that you can obtain from a URL.

## Examples

```
ifThen(
  entity\isNew() && assignedUserId == null,
  assignedUserId = 'managerId'; status = 'Assigned'
);

someDateField = ifThen(
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

## Using formula in Workflows

You can utilize formula in workflow conditions and actions. See [workflows documentation](workflows.md) for more information.

