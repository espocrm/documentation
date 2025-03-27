# Formula > Functions > Object

* [object\create](#objectcreate)
* [object\get](#objectget)
* [object\set](#objectset)
* [object\clear](#objectclear)
* [object\has](#objecthas)
* [object\cloneDeep](#objectclonedeep)

## object\create

`object\create()`

Creates and returns an empty object (key-value map).

## object\get

`object\get(OBJECT, KEY)`

Retrieves a value by a KEY from an OBJECT. Returns NULL if KEY is not set.

!!! note

    Alternatively, it's possible to use *[]* syntax: `$value = $object['key'];`. As of v9.1.

## object\set

`object\set(OBJECT, KEY, VALUE)`

Sets a value by a KEY.

!!! note

    Alternatively, it's possible to use *[]* syntax: `$object['key'] = $value;`. As of v9.1.

!!! example

    ```
    $object = object\create();
    object\set($object, 'key', 'some-value');
    ```

## object\clear

`object\clear(OBJECT, KEY)`

Unsets a value by a KEY.

!!! example

    ```
    object\clear($object, 'some-key');
    ```

## object\has

`object\has(OBJECT, KEY)`

Checks whether an OBJECT has a value set by a KEY. Returns a boolean.


## object\cloneDeep

`object\cloneDeep(OBJECT)`

Deep clones an OBJECT. (as of v7.1)
