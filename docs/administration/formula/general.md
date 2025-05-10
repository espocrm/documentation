# Formula > Functions > General

* [list](#list)
* [ifThenElse](#ifthenelse)
* [ifThen](#ifthen)

## list

`list(VALUE-1 [, ... VALUE-N])` 

Returns array. Values are passed as arguments of the function.

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
