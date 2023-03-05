# Formula > Functions > Array

* [array\includes](#arrayincludes)
* [array\push](#arraypush)
* [array\length](#arraylength)
* [array\at](#arrayat)
* [array\join](#arrayjoin)
* [array\indexOf](#arrayindexof)
* [array\removeAt](#arrayremoveat)
* [array\unique](#arrayunique)

## array\includes

`array\includes(LIST, VALUE)`

Returns true if LIST contains VALUE. Can be used for Array and Multi-Enum fields.

## array\push

`array\push(LIST, VALUE1 [, VALUE2 ...])`

Adds one or more elements to the end of an array and returns the new array.


!!! warning

    An array argument is not passed by reference. You need to re-assign the array to a function result.

!!! example

    ```
    $list = array\push($list, 'test');
    ```

!!! example

    Adding values to a multi-enum field.

    ```
    someMultiEnumField = array\push(someMultiEnumField, 'New Value 1', 'New Value 2');
    ```

## array\length

`array\length(LIST)`

Returns the number of elements in LIST.

!!! example

    A number of items in multi-enum field.

    ```
    $number = array\length(someMultiEnumField);
    ```

## array\at

`array\at(LIST, INDEX)`

Returns a value by INDEX.

## array\join

`array\join(LIST, SEPARATOR)`

Joins array elements with a string separator. Returns a string. (as of v6.1.3)

!!! example

    ```
    $string = array\join($array, $separator);
    ```

## array\indexOf

`array\indexOf(LIST, ELEMENT)`

Returns a position of the ELEMENT in the LIST. Returns `null` if the ELEMENT not in the LIST. (as of v7.1)

!!! example

    ```
    $index = array\indexOf($idList, $someId);
    ```

## array\removeAt

`array\removeAt(LIST, INDEX)`

Removes an element by the INDEX and returns a new array. (as of v7.1)

!!! example

    ```
    $newArray = array\removeAt($array, $index);
    ```

## array\unique

`array\unique(LIST)`

Removes duplicates in the LIST and returns a new array. (as of v7.1)

!!! example

    ```
    $newArray = array\unique($array);
    ```
