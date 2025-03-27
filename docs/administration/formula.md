# Formula Script

Formula Script is a simple scripting language designed specially for EspoCRM. It's a tool that provides the ability to manipulate data and automatically perform operations.

Where it is used:

* [Before-save script](entity-manager.md#before-save-custom-script)
* [API before-save script](api-before-save-script.md)
* Formula sandbox
* [Workflows](workflows.md) tool (conditions and actions)
* [BPM](bpm.md) tool

In the Entity Manager, it's possible to define a script (formula) for a specific entity type. This script will be executed every time before the record is saved. It provides the ability to automatically set specific fields (attributes) with values derived from calculation. In addition, some functions can perform actions (e.g. email sending, record creating).

To edit the formula script for a specific entity type, follow Administration > Entity Manager > a needed entity type > Formula.

!!! note

    It can be reasonable to set fields that are supposed to be calculated by formula as read-only (at Entity Manager > Fields).

The admin can run **Recalculate Formula** action for specific records from the list view: select records (or all search results) > click *Actions* dropdown > click *Recalculate Formula*.

**Formula Sandbox** provides the ability to test formula scripts. It's available in the Administration panel. You can use the function `output\printLine` to print values.

In this article:

* [Syntax](#syntax)
* [Operators](#operators)
* [Control structures](#control-structures)
* [Attributes](#attributes)
* [Functions](#functions)
* [Values](#values)
* [Variables](#variables)
* [Comments](#comments)
* [Comparison](#comparison)
* [Examples](#examples)
* [Explanation](#explanation)
* [Function arguments](#function-arguments)
* [Using formula in Workflows](#using-formula-in-workflows)

## Syntax

There are 6 language elements in Formula script:

* operators (e.g. `+`, `-`, `*`)
* control structures (`if`, `while`)
* functions (e.g. `string\concatenate()`)
* values (scalars and NULL value, e.g. `'string'`, `100`, `true`, `null`)
* variables (e.g. `$temp`)
* attributes (values of the current entity, e.g. `contactId`, `status`)

Separate expressions must be delimited by a semicolon character `;`.

!!! example

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

### Implicit return

*As of v9.1.*

The last evaluated expression is returned.

Example:

```
$a = 1;
$b = $a + 1;
$b;
```

This script is treated as an expression and the value of the variable $b is returned. Can be useful when Formula is used to evaluate a condition or determine a value.

## Operators

* `=` – assignment,
* `??` – null coalescing (as of v7.1),
* `||` – logical OR,
* `&&` – logical AND,
* `!` – logical NOT,
* `+` – numeric summation,
* `-` – numeric subtraction,
* `*` – numeric multiplication,
* `/` – numeric division,
* `%` – numeric modulo,
* `==` – comparison equals,
* `!=` – comparison not equals,
* `>` – comparison greater than,
* `<` – comparison less than,
* `>=` – comparison greater than or equals,
* `<=` – comparison less than or equals.

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

[Attributes](terms-and-naming.md#attribute) represent field values of a target entity. You can insert available attributes by clicking the plus button.

It's possible to access attributes of related entities with the following expression `linkName.attributeName`.

The attribute element type was introduced in the language to be able to write like this:

```
description = 'test';
```

If we didn't have attributes, we would need to write more verbose:

```
entity\setAttribute('description', 'test');
```

## Functions

Format of function usage: `groupName\functionName(argument1, argument2, ..., argumentN)`.

See the list of [out-of-the-box functions](formula-functions.md).

## Values

* Strings. E.g. `'some string'`, `"some string"`.
* Integer numbers. E.g. `1`, `100`, `40300`.
* Float numbers. E.g. `5.2`.
* Booleans: `true`, `false`.
* Null: `null`.

## Variables

Variables starts with a dollar sign.

```
// Assign the value to the variable.
$someVariableName = 'Test';

// Assign the variable to the attribute (field).
description = $test;
```

### Array appending

*As of v9.1.*

If a variable is an array, it's possible to append a value to it with the following syntax:

```
$list[] = 'value';
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

## Comparison

The following comparison operators are available:

* `==` – equals,
* `!=` – not equals,
* `>` – greater than,
* `<` – less than,
* `>=` – greater than or equals,
* `<=` – less than or equals.

!!! important

    A strict comparison is used. If you compare an int `1` to a float `1.0` with `==` operator, they are treated as not equal. You need to compare values of same types or check whether a value falls within a range with `$a - 0.0001 <= $b && $b <= $a + 0.0001`.


## Examples

!!! example

    ```
    if (entity\isNew()) {
        assignedUserId = null;
        status = 'Assigned';
    }
    
    someDateField = ifThen(
      entity\isNew() && closeDate == null && stage == 'Closed Won',
      datetime\today()
    );
    ```

!!! example

    ```
    amount = product.listPrice - (product.listPriceConverted * discount / 100.0);
    amountCurrency = 'USD';
    ```

!!! example

    ```
    someField = string\concatenate(firstName, " '", middleName, "' ", lastName);
    ```

!!! example

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

## Function arguments

Below are explanations of function arguments which are met in the documentation.

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

The list of entity types is available at Administration > Entity Manager.

Entity type names must be wrapped in quotes when used as function arguments. E.g. `record\attribute('Lead', 'someId', 'assignedUserId')`.

More info about entity types [here](terms-and-naming.md#entity-type).

#### FILTER

A name of a filter pre-defined in the system. Developers can define own [filters](../development/metadata/select-defs.md#primaryfilterclassnamemap).

For non-developers, it's possible to apply a [List Report](../user-guide/reports.md#list-reports) as a filter. First, you need to create a [Report Filter](../user-guide/reports.md#report-filters) (at Administration page). Then, you can use the filter name `reportFilter{filterId}` in functions `record\count`, `record\findOne`, `record\findRelatedOne`, `record\findRelatedMany`, `entity\sumRelated`, `entity\countRelated`.

!!! example

    `entity\sumRelated('opportunities', 'amountConverted', 'reportFilter5c41a0a396f66725d')`
    
    Where *5c41a0a396f66725d* is an ID of the Report Filter record which you can obtain from the URL.

## Using formula in Workflows

You can utilize formula in Workflow conditions and actions. See the [Workflows documentation](workflows.md) for more information.

## See also

* [Formula functions](formula-functions.md)
* [Formula scripts examples](formula-scripts-examples.md)
* [Custom functions](../development/new-function-in-formula.md)
