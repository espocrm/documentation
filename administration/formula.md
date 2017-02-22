# Calculated Fields (Formula)

In entity manager it's possible to define script (formula) for specific entity type. This script will be executed every time before record is saved. 
It provides an ability to automatically set specific fields (attributes) with values derived from calculation.

To edit formula follow Administration > Entity Manager > dropdown menu at the right on the row of needed entity > Formula.

You also might need to set fields, that supposed to be calculated, Read-only via Entity Manager.


## Syntax

EspoCRM formula is written in the simple language designed specially for this feature.

There are operators, functions attributes and values that can be used in formula. Separated expressions mast be delimited by character `;`.

### Operators

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
* `'||`, `&&`;
* `'==`, `!=`, `>`, `<`, `>=`, `<=`;
* `+`, `-`;
* `*`, `/`, `%`.

### Attributes

Attributes represent fields values of the target entity. You can insert available attributes by clicking on the plus button.

It's possible to access to attributes of related entities with following format `linkName.attributeName`.


### Functions

Format of function use: `groupName\functionName(argument1, argument2, ..., argumentN)`.

#### Out-of-the-box functions

`ifThenElse(CONDITION, CONSEQUENT, ALTERNATIVE)` If CONDITION is met then do CONSEQUENT. If not -- then do ALTERNATIVE.

`ifThen(CONDITION, CONSEQUENT)` If CONDITION is met then do CONSEQUENT. If not -- do nothing.

`string\\concatenate(STRING_1, STRING_2)` Concatenates two or more strings.

`string\\substring(STRING, START, LENGTH)`  Extracts the characters from a STRING by START position and LENGTH.

If LENGTH is omitted, the substring starting from START until the end of the STRING will be returned.

If LENGTH is negative, then that many characters will be omitted from the end of STRING.

`string\\trim(STRING)` Strips whitespace from the beginning and end of STRING.

`datetime\\today()` Returns today's date.

`datetime\\now()` Returns current datetime.

`datetime\\format(VALUE, TIMEZONE, FORMAT)` Converts date or datetime VALUE into string formatted according to application settings. TIMEZONE and FORMAT can be omitted. If TIMEZONE is omitted then default time zone will be used. If FORMAT is omitted then default format will be used.

`datetime\\addMinutes(VALUE, MINUTES)` Add MINUTES to datetime VALUE. MINUTES can be negative.

`datetime\\addHours(VALUE, HOURS)` Add HOURS to datetime VALUE. HOURS can be negative.

`datetime\\addDays(VALUE, DAYS)` Add HOURS to date or datetime VALUE. DAYS can be negative.

`datetime\\addWeeks(VALUE, WEEKS)` Add WEEKS to date or datetime VALUE. WEEKS can be negative.

`datetime\\addMonths(VALUE, MONTHS)` Add MONTHS to date or datetime VALUE. MONTHS can be negative.

`datetime\\addYears(VALUE, YEARS)` Add YEARS to date or datetime VALUE. YEARS can be negative.

`number\\format(VALUE)` Converts numeric VALUE into string formatted according to application settings.

`entity\\isNew()` Return TRUE if the entity is new (being created) and FALSE if not (being updated).

`entity\\isAttributeChanged(ATTRIBUTE)` Return TRUE if ATTRIBUTE of the entity was changed.

`entity\\isAttributeNotChanged(ATTRIBUTE)` Return TRUE if ATTRIBUTE of the entity was not changed.

`entity\\attributeFetched(ATTRIBUTE)` Attribute that was set when target entity was fetched from database. Before it was modified.

`entity\\addLinkMultipleId(LINK, ID)` Adds ID to Link Multiple field. For example, add 'someTeamId' to 'teams' field.

`entity\\hasLinkMultipleId(LINK, ID)` Checks whether Link Multiple field has specific ID.

`entity\\isRelated(LINK, ID)` Checks whether target entity is related with another entity represented by LINK and ID.

`env\\userAttribute(ATTRIBUTE)` Returns ATTRIBUTE of the current user.


### Values

* Strings. E.g. 'some string';
* Integer numbers. E.g. 1, 100, 40300.
* Float numbers. E.g. 5.2.

### Variables

It's possible to define custom variables in formula.
```
$someVariableName = 'Test';
description = $test;
```


## Examples

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
