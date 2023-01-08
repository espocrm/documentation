# Complex expressions

Complex expressions are used to define SQL expressions. Complex expressions are converted into SQL code in run-time.

Where complex expressions can be utilized:

* in report filters;
* when working with ORM to avoid writing raw SQL (for developers)

Note (for developers): As of v7.0.0 it's possible to build expressions in OOP way with `Espo\ORM\QueryParams\Parts\Expression` class. See [here](../development/orm.md#complex-expressions).

In this article:

* [Functions](#functions)
* [Attribute names](#attribute-names)

## Functions

Function names should be in UPPER_CASE. You need to append the **trailing colon** character to a function name. There **should not be any whitespace** between function name and parentheses.

Examples:

```
CONCAT:(firstName, ' ', lastName)
```

```
IF:(EQUAL:(status, 'Complete'), 'Complete', 'Not Complete')`
```

Functions:

* [Flow control](#flow-control)
* [Comparison](#comparison)
* [Date & time](#date-time)
* [String](#string)
* [Math](#math)
* [Logical](#logical)


### Flow control

#### IF

E.g. `IF:(a, '1', '0')` – if 'a' is true then return '1'; return '0' otherwise.

### Comparison

#### LIKE

Pattern matching.

E.g. `LIKE:(name, 'Cloud%'`) will give true for 'name' equal to 'Cloud Basic' and 'Cloud Enterprise'.

#### NOT_LIKE

Negation of LIKE.

#### EQUAL

Check whether two arguments are equal.

E.g. `EQUAL:(status, 'Complete')` corresponds to SQL statement `status = 'Complete'`.

#### NOT_EQUAL

Negation of equal.

#### GREATER_THAN

Check whether a > b.

E.g. `GREATER_THAN:(amountConverted, 1000.00)` corresponds to SQL statement `amountConverted > 100.00`.

#### LESS_THAN

Check whether a < b.

#### GREATER_THAN_OR_EQUAL

Check whether a >= b.

#### LESS_THAN_OR_EQUAL

Check whether a <= b.

#### IS_NULL

Check whether value is NULL.

E.g. `IS_NULL:(sicCode)` – checks whether Sic Code field is not set.

#### IS_NOT_NULL

Negation of IS_NULL.

#### IN

Check whether a value is within a set of values.

E.g. `IN:(stage, 'Closed Won', 'Closed Lost')` will give true is stage is 'Closed Won' or 'Closed Lost'.

#### NOT_IN

Negation of IN.

#### COALESCE

Returns the first non-NULL value in the list.

E.g. `COALESCE:(dateStart, createdAt)` will return value of createdAt if *dateStart* is not set.

#### IFNULL

If the first argument is not NULL, it returns it; otherwise it returns the second argument.

E.g. `IFNULL:(name, '')` will return empty string if *name* is NULL.

#### NULLIF

If the first argument equals the second, returns NULL, otherwise returns the first argument.

E.g. `NULLIF:(name, '')` will return NULL if *name* is empty string.

### Date & time


#### MONTH_NUMBER

Month number. From 1 to 12.

#### WEEK_NUMBER_0

Week number. Sunday is a first day of week.

#### WEEK_NUMBER_1

Week number. Monday is a first day of week.

#### DAYOFWEEK

Number from 1 to 7.

#### DAYOFMONTH

Number from 1 to 31.

#### YEAR

Year number.

#### YEAR_X

Fiscal year number, where X is a number (between 1 and 12) of the fiscal year start. E.g. `YEAR_3`.

#### HOUR

Number from 0 to 23.

#### MINUTE

Number from 0 to 59.

#### MONTH

Month number w/ year. E.g. `2019-05`.

#### QUARTER

Quarter number w/ year. E.g. `2019_1`.

#### QUARTER_X

Fiscal quarter number, where X is a number (between 1 and 12) of the fiscal year start. E.g. `QUARTER_3`.

#### WEEK_0

Week number w/ a year. Sunday is a first day of week.

E.g. `2018/4`.

#### WEEK_1

Week number w/ a year. Monday as a first day of week.

#### NOW

Current date and time.

#### TZ

Time zone converion.

E.g. `TZ:(createdAt, -10.5)` will apply -10:30 offset.

#### UNIX_TIMESTAMP

UNIX timestamp of a date-time argument or a current timestamp if no argument passed.

#### TIMESTAMPDIFF_YEAR

Difference between two days in years.

E.g. `TIMESTAMPDIFF_YEAR:(createdAt, modifiedAt)`.

#### TIMESTAMPDIFF_MONTH

Difference between two days in months.

#### TIMESTAMPDIFF_WEEK

Difference between two days in weeks.

#### TIMESTAMPDIFF_DAY

Difference between two days in days.

#### TIMESTAMPDIFF_HOUR

Difference between two days in hours.

#### TIMESTAMPDIFF_MINUTE

Difference between two days in minutes.

#### TIMESTAMPDIFF_SECOND

Difference between two days in seconds. Available since v6.0.0.

#### DATE

Returns a date part of a date-time value. Available since v6.0.0.

### String

#### CONCAT

Concatenate. E.g. `CONCAT:(firstName, ' ', lastName)`.

#### LEFT

Returns a specified number of characters from the left of the string. E.g. `LEFT:(someTextColumn, 1000)`. As of v6.1.0.

#### LOWER

Convert to lower case.

#### UPPER

Convert to upper case.

#### TRIM

Remove leading and trailing spaces.

#### CHAR_LENGTH

Number of characters in string.

#### BINARY

Converts a value to a binary string.

`EQUAL:('test', 'Test')` returns true.

`EQUAL:(BINARY:('test'), 'Test')` returns false.

Avalilable since v5.7.0.

#### REPLACE

Replaces all the occurrences of a substring within a string.

`REPLACE:('haystack', 'needle', 'replaceWith')`

Available since v6.0.0.

### Math

#### ADD

Addition. E.g. `ADD:(2, 2)` corresponds to `2 + 2`.

#### SUB

Subtraction. E.g. `SUB:(2, 1)` corresponds to `2 - 1`.

#### MUL

Multiplication. E.g. `MUL:(2, 2)` corresponds to `2 * 2`.

#### DIV

Division. E.g. `DIV:(2, 4)` corresponds to `2 / 4`.

#### MOD

Returns remainder of a number divided by another number. E.g. `MOD:(6, 4)` corresponds to `6 % 4`.

#### FLOOR

The largest integer value not greater than the argument.

#### CEIL

The smallest integer value greater than or equal to the argument.

#### ROUND

Round a number to a specified number of decimal places. E.g. `ROUND:(value, 2)`.

### Logical

#### OR

E.g. `OR:(a, b, c)` corresponds to SQL statement `a OR b OR c`.

#### AND

E.g. `AND:(a, b, c)` corresponds to SQL statement `a AND b AND c`.

#### NOT

E.g. `NOT:(a)` corresponds to SQL statement `NOT a`.

### Custom functions

As of v7.0.8 it's possible to add custom functions. An implementation class name for a custom function should be defined in metadata by the path app > orm > functionConverterClassNameMap_Mysql. The class should implement `Espo\ORM\QueryComposer\Part\FunctionConverter` interface.

## Attribute names

Attribute names usually are same as a system field names. Fields are listed at Administration > Entity Manager > ... > Fields.

Attribute names should be in lowerCamelCase.

Field types having attributes named differently:

* Link: *fieldId*, *fieldName*.
* Link-Parent: *fieldId*, *fieldType*.
* Currency: *field*, *fieldCurrency*.

Where *field* is the name of the field.

More info about attributes [here](../administration/terms-and-naming.md#attribute).

