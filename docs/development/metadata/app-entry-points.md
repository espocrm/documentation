# app > entryPoints

Path: metadata > app > entryPoints.

*As of v10.1.*

Entry point definitions. A name ⇒ defs map. Names should start with a lower case letter.

Example:

```json
{
    "myEntryPointName": {
        "className": "Espo\\Modules\\MyModule\\EntryPoints\\MyEntryPoint",
        "noAuth": true,
        "allowedMethods": ["post"]
    }
}
```

## className

*class-string<Espo\Core\EntryPoint\EntryPoint\>*

An entry point implementation. Should implement `Espo\Core\EntryPoint\EntryPoint`.

## noAuth

*boolean*

If true, authentication is not required.

## notExposed

*boolean*

If true, the entry point is not available via the regular entryPoint request – can be called only programmatically.

## allowedMethods

*('get'|'post'|'put'|'delete'|'options'|'patch')[]*

Allowed HTTP methods. If not specified, only *GET* is allowed.