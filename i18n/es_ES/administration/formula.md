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
`datetime\diff(VALUE_1, VALUE_2, INTERVAL_TYPE)` Devuelve la diferencia entre dos fechas o fechas. INTERVAL_TYPE puede ser 'años', 'meses', 'días', 'horas', 'minutos'. Devuelve `null` si falla. El resultado será negativo si VALUE_1 < VALOR_2.

#### datetime\addMinutes
`datetime\addMinutes(VALUE, MINUTES)` Haga clic en el botón Eliminar. Agrega MINUTOS a datetime VALUE. MINUTOS puede ser negativo.

#### datetime\addHours
`datetime\addHours(VALUE, HOURS)` Agrega HOURS a fecha y hora VALUE. HOURS puede ser negativo.

#### datetime\addDays
`datetime\addDays(VALUE, DAYS)` Agrega DAYS a fecha y hora VALUE. DAYS puede ser negativo.

#### datetime\addWeeks
`datetime\addWeeks(VALUE, WEEKS)` Agrega WEEKS a fecha y hora VALUE. WEEKS puede ser negativo.

#### datetime\addMonths
`datetime\addMonths(VALUE, MONTHS)` Agrega MONTHS a fecha y hora VALUE. MONTHS puede ser negativo.

#### datetime\addYears
`datetime\addYears(VALUE, YEARS)` Agrega YEARS a fecha y hora VALUE. YEARS puede ser negativo.

#### datetime\closest
`datetime\closest(VALUE, TYPE, TARGET, [IS_PAST], [TIMEZONE])` Devuelve la fecha más cercana o la fecha y hora a VALUE según los argumentos pasados. (desde la versión 5.0.0)

TYPE puede ser uno de los siguientes valores: 'time', 'minute', 'hour', 'date', 'month', 'dayOfWeek'. TARGET es un valor entero o un valor de cadena. IS_PAST significa encontrar lo más cercano en el pasado. Si se omite TIMEZONE, se usa la zona horaria predeterminada.

Ejemplos:

`datetime\closest(datetime\now(), 'time', '20:00')` Devolverá el valor de fecha y hora más cercano en el futuro con 20:00 horas.

`datetime\closest('2017-11-20', 'date', 1, true)` devolverá `2017-11-01`, el primer día del mes.

`datetime\closest(datetime\now(), 'dayOfWeek', 1)` Regresará el próximo lunes (el comienzo del día).

#### number\format
`number\format(VALUE, [DECIMALS], [DECIMAL_MARK], [THOUSAND_SEPARATOR])` Convierte VALOR numérico en una cadena formateada según un formato específico o la configuración de la aplicación predeterminada. Si se utilizan DECIMALS, DECIMAL_MARK o THOUSAND_SEPARATOR, se utilizan los valores predeterminados del sistema.

Ejemplos:

`number\format(2.666667, 2)` - resulta 2.67;

`number\format(1000, 2)` - resulta 1,000.00;

`number\format(10.1, 0)` - resulta 10.


#### number\abs
`number\abs(VALUE)` Valor absoluto. Devuelve nulo si VALUE no es numérico.

#### number\round
`number\round(VALUE, PRECISION)` Devuelve el valor redondeado de VALOR a la PRECISIÓN especificada (número de dígitos después del punto decimal). PRECISION también puede ser negativo o cero (predeterminado).

#### number\floor
`number\floor(VALUE)`Devuelve el siguiente valor entero más bajo al redondear el valor si es necesario. (desde la versión 4.9.0)

#### number\ceil
`number\ceil(VALUE)` Devuelve el siguiente valor entero más alto redondeando el valor si es necesario. (desde la versión 4.9.0)

#### entity\isNew
`entity\isNew()` Devuelve TRUE si la entidad es nueva (se está creando) y FALSE si no (se está actualizando).

#### entity\\isAttributeChanged
`entity\isAttributeChanged(ATTRIBUTE)` Devuelve TRUE si se modificó ATTRIBUTE de la entidad.

Ejemplo:

`entity\isAttributeChanged('status')`

#### entity\isAttributeNotChanged
`entity\isAttributeNotChanged(ATTRIBUTE)` Devuelve TRUE si ATTRIBUTE de la entidad no fue cambiado.

#### entity\attributeFetched
`entity\attributeFetched(ATTRIBUTE)` Atributo que se estableció cuando la entidad objetivo se extrajo de la base de datos. Antes de que fuera modificado.

Ejemplo:

`entity\isAttributeChanged('assignedUserId')`

#### entity\addLinkMultipleId
`entity\addLinkMultipleId(LINK, ID)` Agrega ID para vincular múltiples campos. Por ejemplo, agregue 'someTeamId' al campo 'equipos'.

`entity\addLinkMultipleId(LINK, ID_LIST)` Agrega la lista de identificadores. (desde la versión 4.8.3)

#### entity\hasLinkMultipleId
`entity\hasLinkMultipleId(LINK, ID)` Comprueba si el campo Enlace múltiple tiene una ID específica.

#### entity\removeLinkMultipleId
`entity\removeLinkMultipleId(LINK, ID)` Elimina una ID específica del campo link multiple.

#### entity\isRelated
`entity\isRelated(LINK, ID)` Comprueba si la entidad objetivo está relacionada con otra entidad representada por LINK e ID.

#### env\userAttribute
`env\userAttribute(ATTRIBUTE)` Devuelve ATTRIBUTE del usuario actual.

#### list
`list(VALUE-1, ... VALUE-N)` Devuelve una matriz. (desde la versión 4.7.0)

#### array\includes
`array\includes(LIST, VALUE)` Devuelve verdadero si LIST contiene VALOR. Se puede usar para campos de Array y Multi-Enum. (desde la versión 4.7.0)

#### array\push
`array\push(LIST, VALUE1 [, VALUE2 ...])` Agrega uno o más elementos al final de una matriz y devuelve la nueva matriz. (desde la versión 5.0.0)

#### array\length
`array\length(LIST)` Devuelve el recuento de elementos en LIST. (desde la versión 4.8.1)


### Values

* Strings. Por ejemplo. 'alguna cadena de texto';
* Numeros enteros. Por ejemplo. 1, 100, 40300.
* Numeros decimales. Por ejemplo. 5,2.

### Variables

Es posible definir variables personalizadas en fórmula.
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

Puede utilizar la fórmula en condiciones y acciones de flujo de trabajo. Consulte [documentación de flujos de trabajo](workflows.md#usar-fórmula-en-acciones-1) para obtener más información.
