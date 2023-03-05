# Formula > Functions > JSON

* [json\retrieve](#jsonretrieve)
* [json\encode](#jsonencode)

## json\retrieve

`json\retrieve(JSON, PATH)`

Retrieves a specific attribute from a JSON string. PATH is a string, items are separated by dots. (as of v6.0)

!!! example

    Retrieving *id* from `{"id": "SOME_ID"}`:

    ```
    $value = json\retrieve($someJsonString, 'id');`
    ```

!!! example

    Retrieving *id* from `[{"id": "SOME_ID"}]`:

    ```
    $value = json\retrieve($someJsonString, '0.id');`
    ```

## json\encode

`json\encode(VALUE)`

Encodes a VALUE to a json string. (as of v7.1)
