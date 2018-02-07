# Campos calculados (fórmula)

En el administrador de entidades, es posible definir el script (fórmula) para un tipo de entidad específico. Este script se ejecutará cada vez que se guarde el registro.
Proporciona la capacidad de establecer automáticamente campos específicos (atributos) con valores derivados del cálculo.

Para editar la fórmula, siga el menú desplegable Administration > Entity Manager > dropdown menu a la derecha en la fila de entidad necesaria> Fórmula.

También es posible que necesite establecer campos, que se supone que deben calcularse, de solo lectura a través de Entity Manager.


## Sintaxis

La fórmula de EspoCRM está escrita en el lenguaje simple diseñado específicamente para esta función.

Hay operadores, atributos de funciones y valores que se pueden usar en la fórmula. Las expresiones separadas deben estar delimitadas por caracteres `;`.

### Operadores

* `=` - asignación.
* `||` - O logico,
* `&&` - Y logico,
* `!` - NO logico,
* `+`- suma numerica,
* `-` - resta numerica,
* `*` - multiplicacion numerica,
* `/` - Division numerica,
* `%` - Modulo numerico,
* `==` - comparación igual que,
* `!=` - comparación distinto que,
* `>` - comparación mayor que,
* `<` - Comparación menor que,
* `>=` - comparación mayor que o igual a,
* `<=` - comparación menor que o igual.

Prioridad de los operadores:
* `=`;
* `||`, `&&`;
* `==`, `!=`, `>`, `<`, `>=`, `<=`;
* `+`, `-`;
* `*`, `/`, `%`.

### Atributos

Los atributos representan valores de campo de la entidad objetivo. Puede insertar atributos disponibles haciendo clic en el botón más.

Es posible acceder a atributos de entidades relacionadas con el siguiente formato `linkName.attributeName`.


### Funciones

Formato de uso de la función: `groupName\functionName(argument1, argument2, ..., argumentN)`.

Las funciones listas para usar se enumeran a continuación.

#### ifThenElse
`ifThenElse(CONDITION, CONSEQUENT, ALTERNATIVE)` Si se cumple CONDICIÓN, entonces hace CONSECUENT. Si no -- hace ALTERNATIVE.

#### ifThen
`ifThen(CONDITION, CONSEQUENT)` Si se cumple CONDICIÓN, entonces hace CONSECUENT. Si no -- no hace nada.

#### string\concatenate(
`string\concatenate(STRING_1, STRING_2)` Concatena dos o más cadenas.

#### string\substring
`string\substring(STRING, START, LENGTH)`  Extrae los caracteres de un STRING por la posición START y LENGTH.

Si se omite LONGITUD, se devolverá la subcadena que comienza desde START hasta el final de STRING.

Si LENGTH es negativo, se omitirán muchos caracteres al final de STRING.

#### string\\trim
`string\trim(STRING)` Quita espacios en blanco desde el principio y el final de STRING.

#### string\\lowerCase
`string\lowerCase(STRING)` Convierte letras a minúsculas. (desde la versión 5.0.0)

#### string\\upperCase
`string\upperCase(STRING)` Convierte letras a mayúsculas. (desde la versión 5.0.0)

#### datetime\\today
`datetime\today()` Devuelve la fecha de hoy.

#### datetime\now
`datetime\now()` Devuelve la fecha actual.

#### datetime\format
`datetime\format(VALUE, [TIMEZONE], [FORMAT])` Convierte VALOR de fecha o de fecha y hora en una cadena formateada según la configuración de la aplicación. TIMEZONE y FORMAT se pueden omitir. Si se omite TIMEZONE, se usará la zona horaria predeterminada. Si se omite FORMAT, se usará el formato predeterminado.

#### datetime\date
`datetime\date(VALUE, [TIMEZONE])` Devuelve la fecha del mes (1-31). `0` si VALUE está vacío. Si se omite TIMEZONE, se utiliza la zona horaria del sistema. (desde la versión 4.7.0)

#### datetime\month
`datetime\month(VALUE, [TIMEZONE])` Devuelve el mes (1-12). `0` si VALUE está vacío. Si se omite TIMEZONE, se utiliza la zona horaria del sistema. (desde la versión 4.7.0)

#### datetime\year
`datetime\year(VALUE, [TIMEZONE])` Año de devoluciones `0` si VALUE está vacío. Si se omite TIMEZONE, se utiliza la zona horaria del sistema. (desde la versión 4.7.0)

#### datetime\hour
`datetime\hour(VALUE, [TIMEZONE])` Hora de devolución (0-23). `-1` si VALUE está vacío. Si se omite TIMEZONE, se utiliza la zona horaria del sistema. (desde la versión 4.7.0)

#### datetime\minute
`datetime\minute(VALUE, [TIMEZONE])` Devuelve el minuto (0-59). `-1` si VALUE está vacío. Si se omite TIMEZONE, se utiliza la zona horaria del sistema. (desde la versión 4.7.0)

#### datetime\dayOfWeek
`datetime\dayOfWeek(VALUE, [TIMEZONE])` Devuelve el día de la semana (0-6). `-1` si VALUE está vacío. `0` - para el domingo. Si se omite TIMEZONE, se utiliza la zona horaria del sistema. (desde la versión 4.7.3)

#### datetime\diff
`datetime\diff(VALUE_1, VALUE_2, INTERVAL_TYPE)` Devuelve la diferencia entre dos fechas o fechas. INTERVAL_TYPE puede ser 'años', 'meses', 'días', 'horas', 'minutos'. Devuelve `null` si falla. El resultado será negativo si VALUE_1 <VALOR_2.

#### datetime\addMinutes
`datetime\addMinutes(VALUE, MINUTES)` Haga clic en el botón Eliminar. Agrega MINUTOS a datetime VALUE. MINUTOS puede ser negativo.

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
`datetime\closest(VALUE, TYPE, TARGET, [IS_PAST], [TIMEZONE])` Returns closest date or datetime to VALUE based on passed arguments. (since version 5.0.0)

TYPE can be one of the following values: 'time', 'minute', 'hour', 'date', 'month', 'dayOfWeek'. TARGET is an integer value or a string value. IS_PAST means to find closest in the past. If TIMEZONE is omitted then default timezone is used.

Examples:

`datetime\closest(datetime\now(), 'time', '20:00')` Will return the closest datetime value in the future with 20:00 time.

`datetime\closest('2017-11-20', 'date', 1, true)` Will return `2017-11-01`, the first day of the month. 

`datetime\closest(datetime\now(), 'dayOfWeek', 1)` Will return the next Monday (the beginning of the day). 

#### number\format
`number\format(VALUE, [DECIMALS], [DECIMAL_MARK], [THOUSAND_SEPARATOR])` Converts numeric VALUE into string formatted according to a specific format or default application settings. If DECIMALS, DECIMAL_MARK OR THOUSAND_SEPARATOR then system defaults are used.

Examples:

`number\format(2.666667, 2)` - results 2.67;

`number\format(1000, 2)` - results 1,000.00;

`number\format(10.1, 0)` - results 10.


#### number\abs
`number\abs(VALUE)` Absolute value. Returns null if VALUE is not numeric.

#### number\round
`number\round(VALUE, PRECISION)` Returns the rounded value of VALUE to specified PRECISION (number of digits after the decimal point). PRECISION can also be negative or zero (default).

#### number\floor
`number\floor(VALUE)` Returns the next lowest integer value by rounding down value if necessary. (since version 4.9.0)

#### number\ceil
`number\ceil(VALUE)` Returns the next highest integer value by rounding up value if necessary. (since version 4.9.0)

#### entity\isNew
`entity\isNew()` Returns TRUE if the entity is new (being created) and FALSE if not (being updated).

#### entity\\isAttributeChanged
`entity\isAttributeChanged(ATTRIBUTE)` Returns TRUE if ATTRIBUTE of the entity was changed.

Example:

`entity\isAttributeChanged('status')`

#### entity\isAttributeNotChanged
`entity\isAttributeNotChanged(ATTRIBUTE)` Return TRUE if ATTRIBUTE of the entity was not changed.

#### entity\attributeFetched
`entity\attributeFetched(ATTRIBUTE)` Attribute that was set when target entity was fetched from database. Before it was modified.

Example:

`entity\isAttributeChanged('assignedUserId')`

#### entity\addLinkMultipleId
`entity\addLinkMultipleId(LINK, ID)` Adds ID to Link Multiple field. For example, add 'someTeamId' to 'teams' field. 

`entity\addLinkMultipleId(LINK, ID_LIST)` Adds the list of ids. (since version 4.8.3)

#### entity\hasLinkMultipleId
`entity\hasLinkMultipleId(LINK, ID)` Checks whether Link Multiple field has specific ID.

#### entity\removeLinkMultipleId
`entity\removeLinkMultipleId(LINK, ID)` Removes a specific ID from the Link Multiple field.

#### entity\isRelated
`entity\isRelated(LINK, ID)` Checks whether target entity is related with another entity represented by LINK and ID.

#### env\userAttribute
`env\userAttribute(ATTRIBUTE)` Returns ATTRIBUTE of the current user.

#### list
`list(VALUE-1, ... VALUE-N)` Returns array. (since version 4.7.0)

#### array\includes
`array\includes(LIST, VALUE)` Returns true if LIST contains VALUE. Can be used for Array and Multi-Enum fields. (since version 4.7.0)

#### array\push
`array\push(LIST, VALUE1 [, VALUE2 ...])` Adds one or more elements to the end of an array and returns the new array. (since version 5.0.0)

#### array\length
`array\length(LIST)` Returns count of elements in LIST. (since version 4.8.1)


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

## Using formula in Workflows

You can utilize formula in workflow conditions and actions. See [workflows documentation](workflows.md) for more information.
