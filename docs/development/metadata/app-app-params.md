# app > appParams

Path: metadata > app > appParams.

[AppParams framework](../app-params.md) definitions. A name => Object map.

```json
{
    "paramName": {
        "className": "Espo\\Modules\\MyModule\\Classes\\AppParams\\ParamName"
    }
}

```

## className

An implementation class name. Should implement `Espo\Tools\App\AppParam` interface.
