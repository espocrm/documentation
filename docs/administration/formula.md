# Formula

Formula-script is a simple scripting language designed specially for EspoCRM. It's a tool that provides the ability to manipulate data and autimatically perform operations.

Where it is used:

* Before-Save script;
* Formula sandbox;
* [Workflows](workflows.md) tool (conditions and actions);
* [BPM tool](bpm.md) tool.

In the Entity Manager, it's possible to define a script (formula) for a specific entity type. This script will be executed every time before the record is saved. It provides the ability to automatically set specific fields (attributes) with values derived from calculation. In addition, some functions can perform actions (e.g. email sending, record creating).

To edit the formula script for a specific entity type, follow Administration > Entity Manager > a needed entity type > Formula.

Note: It can be reasonable to set fields that are supposed to be calculated by formula as read-only (at Entity Manager > Fields).

The admin can run **Recalculate Formula** action for specific records from the list view: select records (or all search results) > click *Actions* dropdown > click *Recalculate Formula*.

**Formula Sandbox** provides the ability to test formula scripts. It's available in the Administration panel. You can use the function `output\printLine` to print values.

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
  * [Object](#object)
  * [Language](#language)
  * [Json](#json)
  * [Ext](#ext)
  * [Util](#util)
* [Values](#values)
* [Variables](#variables)
* [Comments](#comments)
* [Function arguments](#function-arguments)
* [Comparison](#comparison)
* [Examples](#examples)
* [Explanation](#explanation)
* [Using formula in Workflows](#using-formula-in-workflows)

## Syntax

EspoCRM formula is written in a simple language designed specifically for EspoCRM.

There are 5 element types that can be used in formula:

* operators (e.g. `+`, `-`, `*`)
* functions (e.g. `string\concatenate()`)
* values (scalars and NULL value, e.g. `'string'`, `100`, `true`, `null`)
* variables (e.g. `$temp`)
* attributes (values of the current entity, e.g. `contactId`, `status`)

Separated expressions must be delimited by character `;`.

Example:

```
string\concatenate(name, ' + ', $test);
```
where:

* `string\concatenate` – a function
* `name` – an attribute (of a target entity, to which formula is applied)
* `' + '` – a value (of string type)
* `$test` – a variable (supposed to be declared somewhere above)

Available scalar types:

* string – `'string'`
* int – `1000`
* float – `1000.5`
* boolean – `true` or `false`

## Operators

* `=` - assignment,
* `??` - null coalescing (as of v7.1.0),
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

The priority of operators:

* `=`;
* `??`;
* `||`;
* `&&`
* `==`, `!=`, `>`, `<`, `>=`, `<=`;
* `+`, `-`;
* `*`, `/`, `%`.

## Attributes

[Attributes](terms-and-naming.md#attribute) represent field values of a target entity. You can insert available attributes by clicking on the plus button.

It's possible to access attributes of related entities with the following format `linkName.attributeName`.

The attribute element type was introduced to be able to write like this:

```
description = 'test';
```

If we didn't have attributes we would need to write more verbose:

```
entity\setAttribute('description', 'test');
```

## Functions

Format of function use: `groupName\functionName(argument1, argument2, ..., argumentN)`.

Out-of-the-box functions are listed below.

### General

* [ifThenElse](formula/general.md#ifthenelse)
* [ifThen](formula/general.md#ifthen)
* [list](formula/general.md#list)
* [while](formula/general.md#while)

### String

* [string\concatenate](formula/string.md#stringconcatenate)
* [string\substring](formula/string.md#stringsubstring)
* [string\contains](formula/string.md#stringcontains)
* [string\pos](formula/string.md#stringpos)
* [string\test](formula/string.md#stringtest)
* [string\length](formula/string.md#stringlength)
* [string\trim](formula/string.md#stringtrim)
* [string\lowerCase](formula/string.md#stringlowercase)
* [string\upperCase](formula/string.md#stringuppercase)
* [string\pad](formula/string.md#stringpad)
* [string\match](formula/string.md#stringmatch)
* [string\matchAll](formula/string.md#stringmatchall)
* [string\replace](formula/string.md#stringreplace)


### Datetime

* [datetime\today](formula/datetime.md#datetimetoday)
* [datetime\now](formula/datetime.md#datetimenow)
* [datetime\format](formula/datetime.md#datetimeformat)
* [datetime\date](formula/datetime.md#datetimedate)
* [datetime\month](formula/datetime.md#datetimemonth)
* [datetime\year](formula/datetime.md#datetimeyear)
* [datetime\hour](formula/datetime.md#datetimehour)
* [datetime\minute](formula/datetime.md#datetimeminute)
* [datetime\dayOfWeek](formula/datetime.md#datetimedayofweek)
* [datetime\diff](formula/datetime.md#datetimediff)
* [datetime\addMinutes](formula/datetime.md#datetimeaddminutes)
* [datetime\addHours](formula/datetime.md#datetimeaddhours)
* [datetime\addDays](formula/datetime.md#datetimeadddays)
* [datetime\addWeeks](formula/datetime.md#datetimeaddweeks)
* [datetime\addMonths](formula/datetime.md#datetimeaddmonths)
* [datetime\addYears](formula/datetime.md#datetimeaddyears)
* [datetime\closest](formula/datetime.md#datetimeclosest)


### Number

* [number\format](formula/datetime.md#numberformat)
* [number\abs](formula/datetime.md#numberabs)
* [number\round](formula/datetime.md#numberround)
* [number\floor](formula/datetime.md#numberfloor)
* [number\ceil](formula/datetime.md#numberceil)
* [number\randomInt](formula/datetime.md#numberrandomint)

### Entity

* [entity\isNew](formula/entity.md#entityisnew)
* [entity\isAttributeChanged](formula/entity.md#entityisattributechanged)
* [entity\isAttributeNotChanged](formula/entity.md#entityisattributenotchanged)
* [entity\attribute](formula/entity.md#entityattribute)
* [entity\setAttribute](formula/entity.md#entitysetattribute)
* [entity\attributeFetched](formula/entity.md#entityattributefetched)
* [entity\addLinkMultipleId](formula/entity.md#entityaddlinkmultipleid)
* [entity\hasLinkMultipleId](formula/entity.md#entityhaslinkmultipleid)
* [entity\removeLinkMultipleId](formula/entity.md#entityremovelinkmultipleid)
* [entity\isRelated](formula/entity.md#entityisrelated)
* [entity\sumRelated](formula/entity.md#entitysumrelated)
* [entity\countRelated](formula/entity.md#entitycountrelated)
* [entity\getLinkColumn](formula/entity.md#entitygetlinkcolumn)


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

Returns a first found ID of a record that matches specific criteria. (as of v5.7.0)

`record\findOne(ENTITY_TYPE, ORDER_BY, ORDER, [FILTER])` Returns a first found ID of a record with an optional FILTER applied. (as of v5.7.0)

Examples:

`record\findOne('Opportunity', 'createdAt', 'desc', 'accountId=', id, 'stage=', 'Closed Won')`

`record\findOne('Opportunity', 'createdAt', 'desc', 'open')`

FILTER is a name of a filter pre-defined in the system. It's also possible to apply a [list report](../user-guide/reports.md) as a filter. More info [below](#filter).

#### record\findRelatedOne

`record\findRelatedOne(ENTITY_TYPE, ID, LINK, [ORDER_BY, ORDER, KEY1, VALUE1, KEY2, VALUE2 ...])`

Returns a first found ID of a related record that matches specific criteria. (as of v5.7.0)

`record\findRelatedOne(ENTITY_TYPE, ID, LINK, [ORDER_BY, ORDER, FILTER])`

Returns a first found ID of a related record with an optional FILTER applied. (as of v5.7.0)

If NULL is passed for ORDER_BY and ORDER then a default order will be applied.

Examples:

`record\findRelatedOne('Account', accountId, 'oppotunities', 'createdAt', 'desc', 'stage=', 'Closed Won')`

`record\findRelatedOne('Account', accountId, 'oppotunities', 'createdAt', 'desc', 'open')`

FILTER is a name of a filter pre-defined in the system. It's also possible to apply a [list report](../user-guide/reports.md) as a filter. More info [below](#filter).

Note: Before version 5.9.0 ORDER_BY and ORDER arguments were mandatory.

#### record\findRelatedMany

`record\findRelatedMany(ENTITY_TYPE, ID, LINK, LIMIT, [ORDER_BY, ORDER, KEY1, VALUE1, KEY2, VALUE2 ...])`

Returns an array of IDs of a related record that matches specific criteria. LIMIT is the max number of record. (as of v5.9.0)

`record\findRelatedMany(ENTITY_TYPE, ID, LINK, LIMIT, [ORDER_BY, ORDER, FILTER])`

Returns an array of IDs of a related record with an optional FILTER applied. (as of v5.9.0)

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

Returns an attribute value of a specific record. (as of v5.7.0)

Examples:

`record\attribute('Opportunity', $opportunityId, 'amountConverted')`

`record\attribute('Opportunity', $opportunityId, 'teamsIds')`

By utilizing this function along with *record\findOne*, it's possible to fetch attribute values of any record in the system.

#### record\relate

`record\relate(ENTITY_TYPE, ID, LINK, FOREIGN_ID)`

Relates two records. (as of v5.7.8)

`record\relate(ENTITY_TYPE, ID, LINK, LIST_OF_IDS)`

Links a record with multiple records. (as of v5.9.0)

Examples:

`record\relate('Account', $accountId, 'opportunities', $opportunityId)`

`record\relate('Account', $accountId, 'tasks', list('id1', 'id2'))`

Note: It won't work in *Before save script* when creating a new record, because the record doesn't exist yet when formula is processed.

#### record\unrelate

`record\unrelate(ENTITY_TYPE, ID, LINK, FOREIGN_ID)`

Unlinks two records. (as of v5.7.8)

Example:

`record\unrelate('Account', $accountId, 'opportunities', $opportunityId)`

#### record\create

`record\create(ENTITY_TYPE, ATTRIBUTE1, VALUE1, [ATTRIBUTE2, VALUE2 ...])`

Creates a new record of entity type with attributes specified as key-value pairs. Returns id of the created record, or NULL if failure. (as of v5.9.0)

Examples:

`$id = record\create('Meeting', 'emailAddress', 'SOME@ADDRESS.com', 'assignedUserId', 'SOME-USER-ID')`

#### record\update

`record\update(ENTITY_TYPE, ID, ATTRIBUTE1, VALUE1, [ATTRIBUTE2, VALUE2 ...])`

Updates an existing record with attributes specified as key-value pairs. Returns TRUE if success, FALSE if failure. (as of v5.9.0)

Examples:

`record\update('Meeting', 'SOME-MEETING-ID', 'emailAddress', 'SOME@ADDRESS.com', 'assignedUserId', 'SOME-USER-ID')`

It will update the meeting with ID `SOME-MEETING-ID`, and will set `emailAddress = 'SOME@ADDRESS.com'`, `assignedUserId = 'SOME-USER-ID'`.

#### record\relationColumn

`record\relationColumn(ENTITY_TYPE, ID, LINK, FOREIGN_ID, COLUMN)`

Returns a relation column. (as of v5.8.0)

Example:

`record\relationColumn('Account', $accountId, 'contacts', $contactId, 'role')`

Example (condition checking position in team):

`record\relationColumn('User', $someUserId, 'teams', 'some-team-id, 'role') == 'Support Manager'`


#### record\updateRelationColumn

`record\updateRelationColumn(ENTITY_TYPE, ID, LINK, FOREIGN_ID, COLUMN, VALUE)`

Updates a relation column. (as of v5.8.0)

Example:

`record\updateRelationColumn('Account', $accountId, 'contacts', $contactId, 'role', 'CEO')`

### Env

#### env\userAttribute
`env\userAttribute(ATTRIBUTE)`

Returns ATTRIBUTE of the current user.

Example:

`env\userAttribute('id')` - ID of the current user.

### Password

#### password\generate

`password\generate()`

Generates and returns a password. (as of v5.7.0)

#### password\hash

`password\hash(PASSWORD)`

Hashes a password. You need to hash the password before setting *password* field of *User* record.

Example:

```
$password = password\generate();
$hash = password\hash($password);
```


### Array

* [array\includes](#arrayincludes)
* [array\push](#arraypush)
* [array\length](#arraylength)
* [array\at](#arrayat)
* [array\join](#arrayjoin)
* [array\indexOf](#arrayindexof)
* [array\removeAt](#arrayremoveat)
* [array\unique](#arrayunique)

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

Example (adding values to a multi-enum field):

```
someMultiEnumField = array\push(someMultiEnumField, 'New Value 1', 'New Value 2');
```

#### array\length

`array\length(LIST)`

Returns the number of elements in LIST.

Example (a number of items in multi-enum field):

```
$number = array\length(someMultiEnumField);
```

#### array\at

`array\at(LIST, INDEX)`

Returns a value by INDEX. (as of v5.8.3)

#### array\join

`array\join(LIST, SEPARATOR)`

Joins array elements with a string separator. Returns a string. (as of v6.1.3)

Example:

```
$string = array\join($array, $separator);
```

#### array\indexOf

`array\indexOf(LIST, ELEMENT)`

Returns a position of the ELEMENT in the LIST. Returns `null` if the ELEMENT not in the LIST. (as of v7.1.0)

Example:

```
$index = array\indexOf($idList, $someId);
```

#### array\removeAt

`array\removeAt(LIST, INDEX)`

Removes an element by the INDEX and returns a new array. (as of v7.1.0)

Example:

```
$newArray = array\removeAt($array, $index);
```

#### array\unique

`array\unique(LIST)`

Removes duplicates in the LIST and returns a new array. (as of v7.1.0)

Example:

```
$newArray = array\unique($array);
```

### object

* [object\create](#objectcreate)
* [object\get](#objectget)
* [object\set](#objectset)
* [object\clear](#objectclear)
* [object\has](#objecthas)
* [object\clonedeep](#objectclonedeep)


### object\create

`object\create()`

Creates and returns an empty object (key-value map). (as of v7.1.0)

### object\get

`object\get(OBJECT, KEY)`

Retrieves a value by a KEY from an OBJECT. Returns NULL if KEY is not set. (as of v7.1.0)

### object\set

`object\set(OBJECT, KEY, VALUE)`

Sets a value by a KEY. (as of v7.1.0)

Example:

```
$object = object\create();
object\set($object, 'key', 'some-value');
```

### object\clear

`object\clear(OBJECT, KEY)`

Unsets a value by a KEY. (as of v7.1.0)

Example:

```
object\clear($object, 'some-key');
```

### object\has

`object\has(OBJECT, KEY)`

Checks whether an OBJECT has a value set by a KEY. Returns a boolean. (as of v7.1.0)


### object\cloneDeep

`object\cloneDeep(OBJECT)`

Deep clones an OBJECT. (as of v7.1.0)


### Language

#### language\translate

`language\translate(LABEL, [CATEGORY, SCOPE])`

Translates a label to the language set as default. (as of v6.0.0)

Example:

`language\translate('passwordWillBeSent', 'messages', 'User')`

#### language\translateOption

`language\translateOption(OPTION, FIELD, [SCOPE])`

Translates an option of a specific field to the language set as default. The field can be of the following types: Enum, Multi-enum, Checklist, Array, Varchar. (as of v6.0.0)

Example:

`language\translateOption('Customer', 'type', 'Account')`

### Json

#### json\retrieve

`json\retrieve(JSON, PATH)`

Retrieves a specific attribute from a JSON string. PATH is a string, items are separated by dots. (as of v6.0.0)

Example, retrieving *id* from `{"id": "SOME_ID"}`:

```
$value = json\retrieve($someJsonString, 'id');`
```

Example, retrieving *id* from `[{"id": "SOME_ID"}]`:
```
$value = json\retrieve($someJsonString, '0.id');`
```

#### json\encode

`json\encode(VALUE)`

Encodes a VALUE to a json string. (as of v7.1.0)

### Ext

* [ext\account\findByEmailAddressDomain](#extaccountfindbyemailaddressdomain)
* [ext\email\send](#extemailsend)
* [ext\email\applyTemplate](#extemailapplytemplate)
* [ext\sms\send](#extsmssend)
* [ext\pdf\generate](#extpdfgenerate)
* [ext\user\sendAccessInfo](#extusersendaccessinfo)

#### ext\account\findByEmailAddressDomain

`ext\account\findByEmailAddressDomain(EMAIL_ADDRESS)`

Finds an account by an email address. If no full match found, then tries to find by domain name. Free email provider domains are ignored. Returns ID or null. (Available as of 5.8.3).

#### ext\email\send

`ext\email\send(EMAIL_ID)`

Sends an email. EMAIL_ID is an ID of an email record. Returns TRUE if sent, false if not sent. (as of v5.9.0)

If *from* address is not set in the email, then the system email address will be used. If there's match between *from* address and the address of some group email account, then SMTP setting of the group email account will be used.

Example:

```
$id = record\create(
    'Email',
    'from', 'from-address@test.com',
    'to', 'to-address@test.com',
    'subject', 'Test from formula',
    'body', 'Hi,\n\nThis is a test.',
    'isHtml', false,
    'status', 'Sending'
);
ext\email\send($id);
```

#### ext\email\applyTemplate

`ext\email\applyTemplate(EMAIL_ID, EMAIL_TEMPLATE_ID, [PARENT_TYPE, PARENT_ID])`

Applies an email template to an existng email record. Parent record can be passed optionally. (as of v5.9.0)

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

#### ext\sms\send

`ext\sms\send(SMS_ID)`

Sends an SMD. SMS_ID is an ID of an SMS record. Returns TRUE if sent, false if not sent. (Available as of v7.0.0)

Example:

```
$smsId = record\create(
    'Sms',
    'to', '+1 000 111 222',
    'body', 'This is a test.'
);

ext\sms\send($smsId);
```

If *from* address is not set in the SMS, then the system SMS from number will be used.

The extension with SMS providers can be downloaded [here](https://github.com/espocrm/ext-sms-providers/releases).

#### ext\pdf\generate

`ext\pdf\generate(ENTITY_TYPE, ENTITY_ID, TEMPLATE_ID, [FILENAME])`

Generates PDF file and returns attachment ID. If failed, then returns NULL. TEMPLATE_ID is an ID of PDF template. (as of v5.9.0)

Example:

```
$attachmentId = ext\pdf\generate(
    'Lead',
    entity\attribute('id'),
    'pdf-template-id',
    'test.pdf'
);

$emailId = record\create('Email',
    'subject', 'Test PDF',
    'body', 'PDF is attached',
    'to', entity\attribute('emailAddress'),
    'attachmentsIds', list($attachmentId)
);

ext\email\send($emailId);
```

Note, that this won't work for new records in before-create script because a record is not yet created. It will work in Workfows.

#### ext\user\sendAccessInfo

`ext\user\sendAccessInfo(USER_ID)`

Send an email with access info to a specific user (via email). A user password will be reset. The user will be promted to specify their new password. This function is useful when creating a new user via formula. (as of v7.1.0)

Example:

```
$userId = record\create(
    'User',
    'userName', $userName,
    'firstName', $firstName,
    'lastName', $lastName,
    'type', 'portal',
    'portalsIds', list($portalId)
);

ext\user\sendAccessInfo($userId);
```

### Util

* [util\generateId](#utilgenerateid)

#### util\generateId

Generates a unique ID. Returns a string. (as of v6.1.3)

Example:

```
$uniqueId = util\generateId();
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

Available as of v5.7.6.

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

A name of the relationship. Available link names can be found at Administration > Entity Manager > {Entity Type} > Relationships.

Link names must be wrapped in quotes when used as function arguments.

More info about links [here](terms-and-naming.md#link).

#### ATTRIBUTE

Attribute name usually is the same as a system field name. Fields are listed at Administration > Entity Manager > {Entity Type} > Fields.

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

A name of a filter pre-defined in the system. Usually, it is defined in [SelectManager class](../development/select-manager.md). Developers can define own filters in a custom SelectManager class.

For non-developers, it's possible to apply a [list report](../user-guide/reports.md) as a filter. First, you need to create Report Filter (at Administration page). Then, you can use: `entity\sumRelated('opportunities', 'amountConverted', 'reportFilter5c41a0a396f66725d')`, where '5c41a0a396f66725d' is an ID of Report Filter record, that you can obtain from the URL.

## Comparison

The following comparison operators are available:

* `==` - equals,
* `!=` - not equals,
* `>` - greater than,
* `<` - less than,
* `>=` - greater than or equals,
* `<=` - less than or equals.

Important: Strict comparison is used. If you compare int `1` to float `1.0` with `==` operator they are treated as not equal. You need to compare values of same types or check whether a value falls in range with `$a - 0.0001 <= $b && $b <= $a + 0.0001`.


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

## Explanation

Functions accept expressions as arguments. 

```
someFunction(EXPRESSION1, EXPRESSION2);
```

EXPRESSION1 can be:

* scalar value
* variable
* attribute
* combination of all those forming an expression

Scalar STRING as an argument:

```
someFunction('some string');
```

Scalar INT as an argument:

```
someFunction(10);
```

Scalar FLOAT as an argument:

```
someFunction(10.5);
```

Scalar BOOLEAN as an argument:

```
someFunction(true);
```

NULL value as an argument:

```
someFunction(null);
```

Expression as an argument:

```
someFunction(2 + 2);
```

Expression as an argument:

```
someFunction(anotherFunction());
```

Variable as an argument:

```
someFunction($someVariable);
```

Attribute as an argument:

```
someFunction(attributeName);
```

## See also

* [Formula scripts examples](formula-scripts-examples.md)
* [Custom functions](../development/new-function-in-formula.md)

## Using formula in Workflows

You can utilize formula in workflow conditions and actions. See [workflows documentation](workflows.md) for more information.

