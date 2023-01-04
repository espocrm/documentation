# Formula Script

Formula-script is a simple scripting language designed specially for EspoCRM. It's a tool that provides the ability to manipulate data and autimatically perform operations.

Where it is used:

* Before-save script;
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
* [Control structures](#control-structures)
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

There are 6 language elements in formula script:

* operators (e.g. `+`, `-`, `*`)
* control structures (`if`, `while`)
* functions (e.g. `string\concatenate()`)
* values (scalars and NULL value, e.g. `'string'`, `100`, `true`, `null`)
* variables (e.g. `$temp`)
* attributes (values of the current entity, e.g. `contactId`, `status`)

Separated expressions must be delimited by the character `;`.

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
* `??` - null coalescing (as of v7.1),
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

## Control structures

### if

*As of v7.4.*

```
if (CONDITION) {
    CODE
}

if (CONDITION) {
    CODE
} else {
    CODE
}

if (CONDITION) {
    CODE
} else if (CONDITION) {
    CODE
} else {
    CODE
}
```

### while

*As of v7.4.*

```
while (CONDITION) {
    CODE
}

while (CONDITION1) {
    if (CONDITION2) {
        break;
    }

    if (CONDITION3) {
        continue;
    }
}
```

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

[general](formula/general.md)

* [ifThenElse](formula/general.md#ifthenelse)
* [ifThen](formula/general.md#ifthen)
* [list](formula/general.md#list)
* [while](formula/general.md#while)

### String

[string](formula/string.md)

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

[datetime](formula/datetime.md)

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

[number](formula/number.md)

* [number\format](formula/number.md#numberformat)
* [number\abs](formula/number.md#numberabs)
* [number\round](formula/number.md#numberround)
* [number\floor](formula/number.md#numberfloor)
* [number\ceil](formula/number.md#numberceil)
* [number\randomInt](formula/number.md#numberrandomint)
* [number\parseInt](formula/number.md#numberparseint)
* [number\parseFloat](formula/number.md#numberparsefloat)

### Entity

[entity](formula/entity.md)

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

[record](formula/record.md)

* [record\exists](formula/record.md#recordexists)
* [record\count](formula/record.md#recordcount)
* [record\findOne](formula/record.md#recordfindone)
* [record\findRelatedOne](formula/record.md#recordfindrelatedone)
* [record\findRelatedMany](formula/record.md#recordfindrelatedmany)
* [record\attribute](formula/record.md#recordattribute)
* [record\relate](formula/record.md#recordrelate)
* [record\unrelate](formula/record.md#recordunrelate)
* [record\create](formula/record.md#recordcreate)
* [record\update](formula/record.md#recordupdate)
* [record\relationColumn](formula/record.md#recordrelationcolumn)
* [record\updateRelationColumn](formula/record.md#recordupdaterelationcolumn)

### Env

[env](formula/env.md)

* [env\userAttribute](formula/env.md#envuserattribute)

### Password

[password](formula/password.md)

* [password\generate](formula/password.md#passwordgenerate)
* [password\hash](formula/password.md#passwordhash)

### Array

[array](formula/array.md)

* [array\includes](formula/array.md#arrayincludes)
* [array\push](formula/array.md#arraypush)
* [array\length](formula/array.md#arraylength)
* [array\at](formula/array.md#arrayat)
* [array\join](formula/array.md#arrayjoin)
* [array\indexOf](formula/array.md#arrayindexof)
* [array\removeAt](formula/array.md#arrayremoveat)
* [array\unique](formula/array.md#arrayunique)

### object

[object](formula/object.md)

* [object\create](formula/object.md#objectcreate)
* [object\get](formula/object.md#objectget)
* [object\set](formula/object.md#objectset)
* [object\clear](formula/object.md#objectclear)
* [object\has](formula/object.md#objecthas)
* [object\cloneDeep](formula/object.md#objectclonedeep)

### Language

[language](formula/language.md)

* [language\translate](formula/language.md#languagetranslate)
* [language\translateOption](formula/language.md#languagetranslateOption)


### Json

[json](formula/json.md)

* [json\retrieve](formula/json.md#jsonretrieve)
* [json\encode](formula/json.md#jsonencode)

### Ext

[ext](formula/ext.md)

* [ext\account\findByEmailAddressDomain](formula/ext.md##extaccountfindbyemailaddressdomain)
* [ext\email\send](formula/ext.md#extemailsend)
* [ext\email\applyTemplate](formula/ext.md#extemailapplytemplate)
* [ext\sms\send](formula/ext.md#extsmssend)
* [ext\pdf\generate](formula/ext.md#extpdfgenerate)
* [ext\user\sendAccessInfo](formula/ext.md#extusersendaccessinfo)


### Util

[util](formula/util.md)

* [util\generateId](formula/util.md#utilgenerateid)

## Values

* Strings. E.g. `'some string'`, `"some string"`.
* Integer numbers. E.g. `1`, `100`, `40300`.
* Float numbers. E.g. `5.2`.
* Booleans: `true`, `false`.
* Null: `null`.

## Variables

Variables starets with the dollar sign.
```
// Assign the value to the variable.
$someVariableName = 'Test';

// Assign the variable to the attribute (field).
description = $test;
```

## Comments

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

A name of a filter pre-defined in the system. Developers can define own [filters](../development/metadata/select-defs.md#primaryfilterclassnamemap).

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

