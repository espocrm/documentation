# Formula > Functions > Object

* [object\create](#objectcreate)
* [object\get](#objectget)
* [object\set](#objectset)
* [object\clear](#objectclear)
* [object\has](#objecthas)
* [object\cloneDeep](#objectclonedeep)

## object\create

`object\create()`

Creates and returns an empty object (key-value map). (as of v7.1)

## object\get

`object\get(OBJECT, KEY)`

Retrieves a value by a KEY from an OBJECT. Returns NULL if KEY is not set. (as of v7.1)

## object\set

`object\set(OBJECT, KEY, VALUE)`

Sets a value by a KEY. (as of v7.1)

!!! example

    ```
    $object = object\create();
    object\set($object, 'key', 'some-value');
    ```

## object\clear

`object\clear(OBJECT, KEY)`

Unsets a value by a KEY. (as of v7.1)

!!! example

    ```
    object\clear($object, 'some-key');
    ```

## object\has

`object\has(OBJECT, KEY)`

Checks whether an OBJECT has a value set by a KEY. Returns a boolean. (as of v7.1)


## object\cloneDeep

`object\cloneDeep(OBJECT)`

Deep clones an OBJECT. (as of v7.1)
