# app > export

Path: metadata > app > export.

Definitions for the Export framework.

## formatList

*string*

Available export formats.

## formatDefs

*Object.<string, Object\>\>*

Definitions for export formats. You can define here also custom params specific to your custom format.

Example:

```json
{
    "formatDefs": {
        "csv": {
            "processorClassName": "Espo\\Tools\\Export\\Format\\Csv\\Processor",
            "additionalFieldsLoaderClassName": "Espo\\Tools\\Export\\Format\\Csv\\AdditionalFieldsLoader",
            "mimeType": "text/csv",
            "fileExtension": "csv"
        }
    }
}
```

### processorClassName

*class-string<Espo\Tools\Export\Processor\>*

A main processing class. Should implement `Espo\Tools\Export\Processor` interface.

### additionalFieldsLoaderClassName

*class-string<Espo\Tools\Export\AdditionalFieldsLoader\>*

An additional field loader class. Should implement `Espo\Tools\Export\AdditionalFieldsLoader` interface.

### mimeType

*string*

A mime type of export files.

### fileExtension

*string*

An extension of export files.
