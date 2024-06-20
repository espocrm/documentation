# Calculated Fields

It's possible to create a custom not-storable read-only field a value of which will be calculated dynamically upon fetching from the database.

Create a file `custom/Espo/Custom/Resources/metadata/entityDefs/YourEntityType.json`:

```json
{
    "fields": {
        "yourCustomField": {
            "type": "float",
            "notStorable": true,
            "readOnly": true,
            "select": {
                "select": "SUB:(field1, field2)"
            }
        }
    }
}
```

`SUB:(field1, field2)` is a [complex expression](../user-guide/complex-expressions.md). In this example the expression subtracts one field from another.

Clear cache.

You will be able to set a label for your new field at Administration > Label Manager or manually in i18n files.
