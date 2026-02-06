# app > pdfEngines

Path: metadata > app > pdfEngines.

PDF printing engines. An engine-name => defs map.

```json
{
    "MyCustomEngine": {
        "implementationClassNameMap": {
            "entity": "Espo\\Modules\\MyModule\\MyCustomEngine\\EntityPrinter",
            "collection": "Espo\\Modules\\MyModule\\MyCustomEngine\\CollectionPrinter"
        },
        "fontFaceList": []
    }
}
```

## implementationClassNameMap

Implementations.

### entity

*class-string<Espo\Tools\Pdf\EntityPrinter\>*

### collection

*class-string<Espo\Tools\Pdf\CollectionPrinter\>*

## fontFaceList

*string[]*

A list of fonts available for the engine.

## additionalParams

*object*

Additional engine-wise parameters.
