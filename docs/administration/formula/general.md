# Formula > Functions > General

* [list](#list)
* [ifThenElse](#ifthenelse)
* [ifThen](#ifthen)
* [while](#while)

## list

`list(VALUE-1 [, ... VALUE-N])` 

Returns array. Values are passed as arguments to the function.

!!! example

    ```
    $list = list(0, 1, 2); // will return array [0, 1, 2]
    ```

Useful to create an array for link-multiple IDs.

!!! example

    ```
    teamsIds = list($teamId) // `['team-id']`
    ```

## ifThenElse

`ifThenElse(CONDITION, CONSEQUENT, ALTERNATIVE)`

If CONDITION is met, then return CONSEQUENT. If not, then return ALTERNATIVE.

!!! example

    ```
    $value = ifThenElse(
        $someVariable == 'someValue', // if condition is true
        'one value', // return this value
        'another value' // otherwise, this
    )
    ```

## ifThen

`ifThen(CONDITION, CONSEQUENT)`

If CONDITION is met, then return CONSEQUENT. Otherwise, return NULL.

!!! example

    ```
    ifThen(
        $someVariable == 'someValue', // if condition is true
        $anotherVariable = 1, // do this
    )
    ```

## while

`while(CONDITION, STATEMENT)`

Executes STATEMENT repeatedly as long CONDITION is true.

!!! note

    As of v7.4, it's recommended to use the [*while*](../formula.md#while) statement instead.

!!! example

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
