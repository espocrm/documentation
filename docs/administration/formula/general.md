# Formula > Functions > General

* [ifThenElse](#ifthenelse)
* [ifThen](#ifthen)
* [list](#list)
* [while](#while)

#### ifThenElse

`ifThenElse(CONDITION, CONSEQUENT, ALTERNATIVE)`

If CONDITION is met, then do CONSEQUENT. If not - then do ALTERNATIVE.

CONSEQUENT and ALTERNATIVE can consist of mutliple commands separated by the semicolon `;`.

Example:

```
ifThenElse(
    $someVariable == 'someValue', // if condition is true
    $anotherVariable = 1, // do this
    $anotherVariable = 2 // otherwise do this
)
```

Multiple expressions:

```
ifThenElse(
    $someVariable == 'someValue',
    (
        $anotherVariable1 = 'test-1';
        $anotherVariable2 = 'test-2';
    ),
    (
        $anotherVariable1 = 'hello-1';
        $anotherVariable2 = 'hello-2';
    )
)
```

Assigning:

```
$value = ifThenElse(
    $someVariable == 'someValue', // if condition is true
    'one value', // return this value
    'another value' // otherwise this
)
```

#### ifThen

`ifThen(CONDITION, CONSEQUENT)`

If CONDITION is met, then do CONSEQUENT. If not - do nothing.

CONSEQUENT can consist of mutliple commands separated by the semicolon `;`.

Example:

```
ifThenElse(
    $someVariable == 'someValue', // if condition is true
    $anotherVariable = 1, // do this
)
```

#### list

`list(VALUE-1[, ... VALUE-N])` 

Returns array. Values are passed as arguments to the function.

Example:

```
$list = list(0, 1, 2); // will return array [0, 1, 2]
```

Useful to create an array for link-multiple IDs.

Example: 

```
teamsIds = list($teamId) // `['team-id']`
```

#### while

`while(CONDITION, STATEMENT)`

Executes STATEMENT repeatedly as long CONDITION is true.

Example:

```
$source = list(0, 1, 2);
$target = list();

$i = 0;

while(
    $i < array\length($source),
    (
        $target = array\push(
            $target,
            array\at($source, $i)
        );
        $i = $i + 1;
    )
);
```
