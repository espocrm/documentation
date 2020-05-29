# Formula (& calculated fields)

In entity manager it's possible to define script (formula) for specific entity type. This script will be executed every time before record is saved.

It provides the ability to automatically set specific fields (attributes) with values derived from calculation. Some functions can also perform some actions.

To edit formula for a specific entity type follow Administration > Entity Manager > dropdown menu on the right on the row of the entity type > Formula.

You may also need to set fields, that are supposed to be calculated, read-only via Entity Manager.

Admin can run **recalculate formula** for specific records from the list view: select records (or all search results) > click *Actions* dropdown > click *Recalculate Formula*.

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

[Attributes](terms-and-naming.md#attribute) represent field values of the target entity. You can insert available attributes by clicking on the plus button.

It's possible to access attributes of related entities with the following format `linkName.attributeName`.


## Functions

Format of function use: `groupName\functionName(argument1, argument2, ..., argumentN)`.

Out-of-the-box functions are listed below.

### General

* [ifThenElse](#ifthenelse)
* [ifThen](#ifthen)
* [list](#list)
* [while](#while)

#### ifThenElse

`ifThenElse(CONDITION, CONSEQUENT, ALTERNATIVE)`

If CONDITION is met, then do CONSEQUENT. If not - then do ALTERNATIVE.

#### ifThen

`ifThen(CONDITION, CONSEQUENT)`

If CONDITION is met, then do CONSEQUENT. If not - do nothing.

CONSEQUENT and ALTERNATIVE can consist of mutliple commands separated by the semicolon `;`.

#### list

`list(VALUE-1, ... VALUE-N)` Returns array.

Useful to create an array for link-multiple IDs. Example: `teamsIds = list($teamId)`.

#### while

`while(CONDITION, STATEMENT)`

Executes STATEMENT repeatedly as long CONDITION is true.

Example:

```
$source = list(0, 1, 2);
$target = list();
$i = 0;
while($i < array\length($source),
    $target = array\push(
        $target,
        array\at($source, $i)
    );
    $i = $i + 1;
);
```

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
* [string\replace](#stringreplace)

#### string\concatenate

`string\concatenate(STRING_1, STRING_2)`

Concatenates two or more strings.

#### string\substring

`string\substring(STRING, START, LENGTH)`

Extracts the characters from a STRING by START position and LENGTH.

If LENGTH is omitted, the substring starting from START until the end of the STRING will be returned.

If LENGTH is negative, then that many characters will be omitted from the end of STRING.

#### string\contains

`string\contains(STRING, NEEDLE)`

Whether STRING contains NEEDLE.

#### string\pos
`string\pos(STRING, NEEDLE)`

Returns possition of NEEDLE in STRING, *false* if not found. (since version 5.7.3)

#### string\test
`string\test(STRING, REGULAR_EXPRESSION)`

Search a match between REGULAR_EXPRESSION and STRING. Returns TRUE of FALSE.

#### string\length
`string\length(STRING)`

The length of STRING.

#### string\trim
`string\trim(STRING)`

Strips whitespace from the beginning and end of STRING.

#### string\lowerCase
`string\lowerCase(STRING)` Converts letters to lower case.

#### string\upperCase
`string\upperCase(STRING)`

Converts letters to upper case.

#### string\pad
`string\pad(STRING, LENGTH, [PAD_STRING], [PAD_TYPE])`

Pads STRING to a certain LENGTH with PAD_STRING.

PAD_STRING by default is a whitespace string `' '`.

PAD_TYPE can be *'right'*, *'left'*, *'both'*. By default it is *'right'*.

#### string\match
`string\match(STRING, REGULAR_EXPRESSION, [OFFSET])`

Retrieves the first result of matching a STRING against a REGULAR_EXPRESSION. Returns NULL if no matches are found. (available since version 5.8.3.)

Example:

`string\match('string\\match('{token1} foo {token2} bar', '/{[^}]*}/')`

will return `{token1}`.

#### string\matchAll
`string\matchAll(STRING, REGULAR_EXPRESSION, [OFFSET])`

Retrieves all result of matching a STRING against a REGULAR_EXPRESSION. Returns NULL if no matches are found. (available since version 5.8.3)

Example:

`string\matchAll('string\\match('{token1} foo {token2} bar', '/{[^}]*}/')`

will return an array `['{token1}', '{token2}']`.

#### string\replace
`string\replace(STRING, SEARCH, REPLACE)`

Replaces all occurrences of SEARCH with REPLACE in STRING. (available since version 5.9.0)

Example:

`string\replace('Hello {test}, '{test}, 'world)`

will return `'Hello world'`.

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
`datetime\today()`

Returns today's date.

#### datetime\now
`datetime\now()`

Returns current datetime.

#### datetime\format
`datetime\format(VALUE, [TIMEZONE], [FORMAT])`

Converts date or datetime VALUE into a string formatted according to the application settings or a given timezone and format. TIMEZONE and FORMAT can be omitted. If TIMEZONE is omitted, then default time zone will be used. If FORMAT is omitted, then default format will be used.

Examples:

`datetime\format(closeDate, 'America/New_York', 'MM/DD/YYYY')`

`datetime\format(dateStart, 'America/New_York', 'MM/DD/YYYY hh:mma')`

`datetime\format(dateStart, 'Europe/Amsterdam', 'DD/MM/YYYY HH:mm')`

#### datetime\date
`datetime\date(VALUE, [TIMEZONE])`

Returns date of the month (1-31). `0` if VALUE is empty. If TIMEZONE is omitted, then system timezone is used.

#### datetime\month
`datetime\month(VALUE, [TIMEZONE])`

Returns month (1-12). `0` if VALUE is empty. If TIMEZONE is omitted, then system timezone is used.

#### datetime\year
`datetime\year(VALUE, [TIMEZONE])`

Returns year. `0` if VALUE is empty. If TIMEZONE is omitted, then system timezone is used.

#### datetime\hour
`datetime\hour(VALUE, [TIMEZONE])`

Returns hour (0-23). `-1` if VALUE is empty. If TIMEZONE is omitted, then system timezone is used.

#### datetime\minute
`datetime\minute(VALUE, [TIMEZONE])`

Returns minute (0-59). `-1` if VALUE is empty. If TIMEZONE is omitted, then system timezone is used.

#### datetime\dayOfWeek
`datetime\dayOfWeek(VALUE, [TIMEZONE])`

Returns day of the week (0-6). `-1` if VALUE is empty. `0` - for Sunday. If TIMEZONE is omitted, then system timezone is used.

#### datetime\diff
`datetime\diff(VALUE_1, VALUE_2, INTERVAL_TYPE)`

Returns difference between two dates or datetimes. INTERVAL_TYPE can be 'years', 'months', 'days', 'hours', 'minutes'. Returns `null` if failure. Result will be negative if VALUE_1 < VALUE_2.

#### datetime\addMinutes
`datetime\addMinutes(VALUE, MINUTES)`

Adds MINUTES to datetime VALUE. MINUTES can be negative.

#### datetime\addHours
`datetime\addHours(VALUE, HOURS)`

Adds HOURS to datetime VALUE. HOURS can be negative.

#### datetime\addDays
`datetime\addDays(VALUE, DAYS)`

Adds DAYS to date or datetime VALUE. DAYS can be negative.

#### datetime\addWeeks
`datetime\addWeeks(VALUE, WEEKS)`

Adds WEEKS to date or datetime VALUE. WEEKS can be negative.

#### datetime\addMonths
`datetime\addMonths(VALUE, MONTHS)`

Adds MONTHS to date or datetime VALUE. MONTHS can be negative.

#### datetime\addYears
`datetime\addYears(VALUE, YEARS)`

Adds YEARS to date or datetime VALUE. YEARS can be negative.

#### datetime\closest
`datetime\closest(VALUE, TYPE, TARGET, [IS_PAST], [TIMEZONE])`

Returns closest date or datetime to VALUE based on passed arguments.

TYPE can be one of the following values: 'time', 'minute', 'hour', 'date', 'month', 'dayOfWeek'. TARGET is an integer value or a string value. IS_PAST means to find closest in the past. If TIMEZONE is omitted, then default timezone is used.

Examples:

`datetime\closest(datetime\now(), 'time', '20:00')` Will return the closest datetime value in the future with 20:00 time.

`datetime\closest('2017-11-20', 'date', 1, true)` Will return `2017-11-01`, the first day of the month.

`datetime\closest(datetime\now(), 'dayOfWeek', 1)` Will return the next Monday (the beginning of the day).

### Number

* [number\format](#numberformat)
* [number\abs](#numberabs)
* [number\round](#numberround)
* [number\floor](#numberfloor)
* [number\ceil](#numberceil)
* [number\randomInt](#numberrandomint)

#### number\format
`number\format(VALUE, [DECIMALS], [DECIMAL_MARK], [THOUSAND_SEPARATOR])`

Converts numeric VALUE into string formatted according to a specific format or default application settings. If DECIMALS, DECIMAL_MARK OR THOUSAND_SEPARATOR, then system defaults are used.

Examples:

`number\format(2.666667, 2)` - results 2.67;

`number\format(1000, 2)` - results 1,000.00;

`number\format(10.1, 0)` - results 10.


#### number\abs
`number\abs(VALUE)`

Absolute value. Returns null if VALUE is not numeric.

#### number\round
`number\round(VALUE, PRECISION)`

Returns the rounded value of VALUE to specified PRECISION (number of digits after the decimal point). PRECISION can also be negative or zero (default).

#### number\floor
`number\floor(VALUE)`

Returns the next lowest integer value by rounding down value if necessary.

#### number\ceil
`number\ceil(VALUE)`

Returns the next highest integer value by rounding up value if necessary.

#### number\randomInt
`number\randomInt([MIN, MAX])`

Generates a cryptographic random integer between specified MIN and MAX. If MIN is omitted, then `0` is used. (since v5.9.2)

### Entity

Functions of *Entity* group operates with a target record. There can be only one target record available in formula-script context. For *Before Update Script* the target record is the record that is currently updated. For Workflow's *Create Record* action, the target record is the record is being created. For Workflow's conditions, the target record is the target record of the workflow rule.

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

`entity\isNew()`

Returns TRUE if the entity is new (being created) and FALSE if not (being updated).

#### entity\isAttributeChanged

`entity\isAttributeChanged(ATTRIBUTE)`

Returns TRUE if ATTRIBUTE of the record was changed.

Example:

`entity\isAttributeChanged('status')`

#### entity\isAttributeNotChanged

`entity\isAttributeNotChanged(ATTRIBUTE)`

Return TRUE if ATTRIBUTE of the record was not changed.

#### entity\attribute

`entity\attribute(ATTRIBUTE)`

An ATTRIBUTE value of a target record. It's also possibe to fetch an attribute of a related record.

`$test = entity\attribute('name')` is equivalent to `$test = name`.

Examples:

`entity\attribute('assignedUserId')`

`entity\attribute('account.name')`

#### entity\setAttribute

`entity\setAttribute(ATTRIBUTE, VALUE)`

Set ATTRIBUTE with a VALUE.

`entity\setAttribute('stage', 'Closed Won')` is equivalent to `stage = 'Closed Won'`.

Example:

`entity\setAttribute('stage', 'Closed Won')`


#### entity\attributeFetched
`entity\attributeFetched(ATTRIBUTE)`

An ATTRIBUTE value that was set when a target record was fetched from database. Before it was modified.

Example:

`entity\attributeFetched('assignedUserId')`

#### entity\addLinkMultipleId

`entity\addLinkMultipleId(LINK, ID)`

Adds ID to Link Multiple field.

`entity\addLinkMultipleId(LINK, ID_LIST)`

Adds the list of ids.

Example:

`entity\addLinkMultipleId('teams', 'someTeamId')`

Add 'someTeamId' to 'teams' field.


#### entity\hasLinkMultipleId

`entity\hasLinkMultipleId(LINK, ID)`

Checks whether Link Multiple field has specific ID.

#### entity\removeLinkMultipleId

`entity\removeLinkMultipleId(LINK, ID)`

Removes a specific ID from the Link Multiple field.

#### entity\isRelated

`entity\isRelated(LINK, ID)`

Checks whether target entity is related with another entity represented by LINK and ID.

#### entity\sumRelated

`entity\sumRelated(LINK, FIELD, [FILTER])`

Sums related records by a specified FIELD with an optional FILTER.

Example:

`entity\sumRelated('opportunities', 'amountConverted', 'won')`

FILTER is a name of a filter pre-defined in the system. It's also possible to apply a [list report](../user-guide/reports.md) as a filter. More info [below](#filter).

#### entity\countRelated

`entity\countRelated(LINK, [FILTER])`

Returns a number of related records with an optional FILTER applied.

Example:

`entity\countRelated('opportunities', 'open')`

It's possible to apply a [list report](../user-guide/reports.md) as a filter. More info about filters [below](#filter).

#### entity\getLinkColumn

`entity\getLinkColumn(LINK, ID, COLUMN)`

Fetches a relationship column value (since 5.7.1).

Example:

`entity\getLinkColumn('targetLists', 'TARGET_LIST_ID', 'optedOut')`


### Record

* [record\exists](#recordexists)
* [record\count](#recordcount)
* [record\findOne](#recordfindone)
* [record\findRelatedOne](#recordfindrelatedone)
* [record\findRelatedMany](#recordfindrelatedmany)
* [record\attribute](#recordattribute)
* [record\relate](#recordrelate)
* [record\unrelate](#recordunrelate)
* [record\create](#recordcreate)
* [record\update](#recordupdate)
* [record\relationColumn](#recordrelationcolumn)
* [record\updateRelationColumn](#recordupdaterelationcolumn)

#### record\exists

`record\exists(ENTITY_TYPE, KEY1, VALUE1, [KEY2, VALUE2 ...])`

Check whether a record with specified criteria exists.

Examples:

`record\exists('Lead', 'emailAddress=', fromAddress)`

`record\exists('Lead', 'status=', list('Assigned', 'In Process'))`

#### record\count

`record\count(ENTITY_TYPE, KEY1, VALUE1, [KEY2, VALUE2 ...])`

Returns a count of records with specified criteria.

`record\count(ENTITY_TYPE, [FILTER])`

Returns a count of records with an optional FILTER applied. More info about filters [below](#filter).

Examples:

`record\count('Opportunity', 'accountId=', id, 'stage=', 'Closed Won')`

`record\count('Opportunity', 'amountConverted>', 1000)`

`record\count('Opportunity', 'open')`

`record\count('Lead', 'status=', list('Assigned', 'In Process'))`

FILTER is a name of a filter pre-defined in the system. It's also possible to apply a [list report](../user-guide/reports.md) as a filter. More info [below](#filter).

#### record\findOne

`record\findOne(ENTITY_TYPE, ORDER_BY, ORDER, [KEY1, VALUE1, KEY2, VALUE2 ...])`

Returns a first found ID of a record that matches specific criteria. (since version 5.7.0)

`record\findOne(ENTITY_TYPE, ORDER_BY, ORDER, [FILTER])` Returns a first found ID of a record with an optional FILTER applied. (since version 5.7.0)

Examples:

`record\findOne('Opportunity', 'createdAt', 'desc', 'accountId=', id, 'stage=', 'Closed Won')`

`record\findOne('Opportunity', 'createdAt', 'desc', 'open')`

FILTER is a name of a filter pre-defined in the system. It's also possible to apply a [list report](../user-guide/reports.md) as a filter. More info [below](#filter).

#### record\findRelatedOne

`record\findRelatedOne(ENTITY_TYPE, ID, LINK, [ORDER_BY, ORDER, KEY1, VALUE1, KEY2, VALUE2 ...])`

Returns a first found ID of a related record that matches specific criteria. (since version 5.7.0)

`record\findRelatedOne(ENTITY_TYPE, ID, LINK, [ORDER_BY, ORDER, FILTER])`

Returns a first found ID of a related record with an optional FILTER applied. (since version 5.7.0)

If NULL is passed for ORDER_BY and ORDER then a default order will be applied.

Examples:

`record\findRelatedOne('Account', accountId, 'oppotunities', 'createdAt', 'desc', 'stage=', 'Closed Won')`

`record\findRelatedOne('Account', accountId, 'oppotunities', 'createdAt', 'desc', 'open')`

FILTER is a name of a filter pre-defined in the system. It's also possible to apply a [list report](../user-guide/reports.md) as a filter. More info [below](#filter).

Note: Before version 5.9.0 ORDER_BY and ORDER arguments were mandatory.

#### record\findRelatedMany

`record\findRelatedMany(ENTITY_TYPE, ID, LINK, LIMIT, [ORDER_BY, ORDER, KEY1, VALUE1, KEY2, VALUE2 ...])`

Returns an array of IDs of a related record that matches specific criteria. LIMIT is the max number of record. (since version 5.9.0)

`record\findRelatedMany(ENTITY_TYPE, ID, LINK, LIMIT, [ORDER_BY, ORDER, FILTER])`

Returns an array of IDs of a related record with an optional FILTER applied. (since version 5.9.0)

If NULL is passed for ORDER_BY and ORDER then a default order will be applied.

Examples:

`record\findRelatedMany('Account', accountId, 'oppotunities', 10, 'createdAt', 'desc', 'stage=', 'Closed Won')`

`record\findRelatedOne('Account', accountId, 'oppotunities', 3, 'createdAt', 'desc', 'open')`

FILTER is a name of a filter pre-defined in the system. It's also possible to apply a [list report](../user-guide/reports.md) as a filter. More info [below](#filter).

This function can be utilized for copying related records from one record to another. Example:

```
// copy teams from account to email
$ids = record\findRelatedMany('Account', $accountId, 'teams', 10);
record\relate('Email', $emailId, 'teams', $ids);
```

#### record\attribute

`record\attribute(ENTITY_TYPE, ID, ATTRIBUTE)`

Returns an attribute value of a specific record. (since version 5.7.0)

Examples:

`record\attribute('Opportunity', $opportunityId, 'amountConverted')`

`record\attribute('Opportunity', $opportunityId, 'teamsIds')`

By utilizing this function along with *record\findOne*, it's possible to fetch attribute values of any record in the system.

#### record\relate

`record\relate(ENTITY_TYPE, ID, LINK, FOREIGN_ID)`

Relates two records. Available since version 5.7.8.

`record\relate(ENTITY_TYPE, ID, LINK, LIST_OF_IDS)`

Links a record with multiple records. Available since version 5.9.0.

Examples:

`record\relate('Account', $accountId, 'opportunities', $opportunityId)`

`record\relate('Account', $accountId, 'tasks', list('id1', 'id2'))`

Note: It won't work in *Before save script* when creating a new record, because the record doesn't exist yet when formula is processed.

#### record\unrelate

`record\unrelate(ENTITY_TYPE, ID, LINK, FOREIGN_ID)`

Unlinks two records. Available since version 5.7.8.

Example:

`record\unrelate('Account', $accountId, 'opportunities', $opportunityId)`

#### record\create

`record\create(ENTITY_TYPE, ATTRIBUTE1, VALUE1, [ATTRIBUTE2, VALUE2 ...])`

Creates a new record of entity type with attributes specified as key-value pairs. Returns id of the created record, or NULL if failure.

Available since version 5.9.0.

Examples:

`$id = record\create('Meeting', 'emailAddress', 'SOME@ADDRESS.com', 'assignedUserId', 'SOME-USER-ID')`

#### record\update

`record\update(ENTITY_TYPE, ID, ATTRIBUTE1, VALUE1, [ATTRIBUTE2, VALUE2 ...])`

Updates an existing record with attributes specified as key-value pairs. Returns TRUE if success, FALSE if failure.

Available since version 5.9.0.

Examples:

`record\update('Meeting', 'SOME-MEETING-ID', 'emailAddress', 'SOME@ADDRESS.com', 'assignedUserId', 'SOME-USER-ID')`

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
`env\userAttribute(ATTRIBUTE)`

Returns ATTRIBUTE of the current user.

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
`array\includes(LIST, VALUE)`

Returns true if LIST contains VALUE. Can be used for Array and Multi-Enum fields.

#### array\push
`array\push(LIST, VALUE1 [, VALUE2 ...])`

Adds one or more elements to the end of an array and returns the new array.

Important: An array argument is not passed by reference. You need to re-assign the array to a function result.

Example:

```
$list = array\push($list, 'test');
```

#### array\length
`array\length(LIST)`

Returns the number of elements in LIST.

#### array\at
`array\at(LIST, INDEX)`

Returns a value by INDEX. (since version 5.8.3)

### Ext

* [ext\account\findByEmailAddressDomain](#extaccountfindbyemailaddressdomain)
* [ext\email\send](#extemailsend)
* [ext\email\applyTemplate](#extemailapplytemplate)
* [ext\pdf\generate](#extpdfgenerate)

#### ext\account\findByEmailAddressDomain

`ext\account\findByEmailAddressDomain(EMAIL_ADDRESS)`

Finds an account by an email address. If no full match found, then tries to find by domain name. Free email provider domains are ignored. Returns ID or null. (Available since 5.8.3).

#### ext\email\send

`ext\email\send(EMAIL_ID)`

Sends an email. EMAIL_ID is an ID of the email record. Returns TRUE if sent, false if not sent. (Available since version 5.9.0)

If *from* address is not set in the email, then system email address will be used. If there's match between *from* address and the address of some group email account, then SMTP setting of the group email account will be used.

Example:

```
$id = record\create(
    'Email',
    'from', 'from-address@test.com',
    'to', 'to-address@test.com',
    'subject', 'Test from formula',
    'body', 'Hi,\n\nThis is a test.',
    'isHtml', false,
    'status', 'Sending',
);
ext\email\send($id);
```

#### ext\email\applyTemplate

`ext\email\send(EMAIL_ID, EMAIL_TEMPLATE_ID, [PARENT_TYPE, PARENT_ID])`

Applies an email template to an existng email record. Parent record can be passed optionally. (Available since version 5.9.0)

Example:

```
$emailId = record\create(
    'Email',
    'to', 'to-address@test.com',
    'status', 'Draft',
    'parentId', entity\attribute('id'),
    'parentType', 'Case'
);
ext\email\applyTemplate($emailId, 'some-email-template-id');
ext\email\send($emailId);
```

#### ext\pdf\generate

`ext\pdf\generate(ENTITY_TYPE, ENTITY_ID, TEMPLATE_ID, [FILENAME])`

Generates PDF file and returns attachment ID. If failed, then returns NULL. TEMPLATE_ID is an ID of PDF template. (Available since version 5.9.0)

Example:

```
$attachmentId = ext\pdf\generate(
    'Lead', entity\attribute('id'), 'pdf-template-id', 'test.pdf'
);
$emailId = record\create('Email',
    'subject', 'Test PDF',
    'body', 'PDF is attached',
    'to', entity\attribute('emailAddress'),
    'attachmentsIds', list($attachmentId)
);
ext\email\send($emailId);
```

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

More info about links [here](terms-and-naming.md#link).

#### ATTRIBUTE

Attribute name usually is the same as a system field name. Fields are listed in Entity Manager > ... > Fields.

Field types having multiple attributes:

* Link: *fieldId*, *fieldName*.
* Link-Multiple: *fieldIds*, *fieldNames*.
* Link-Parent: *fieldId*, *fieldType*, *fieldName*.
* Currency: *field*, *fieldCurrency*.

Where *field* is the name of the field.

Attribute names must be wrapped in quotes when used as function arguments. E.g. `record\attribute('Lead', 'someId', 'assignedUserId')`.

More info about attributes [here](terms-and-naming.md#attribute).

#### ENTITY_TYPE

ENTITY_TYPE list is available at Administration > Entity Manager.

Entity type names must be wrapped in quotes when used as function arguments. E.g. `record\attribute('Lead', 'someId', 'assignedUserId')`.

More info about entity types [here](terms-and-naming.md#entity-type).

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

See also [formula scripts examples](formula-scripts-examples.md).

## Using formula in Workflows

You can utilize formula in workflow conditions and actions. See [workflows documentation](workflows.md) for more information.

