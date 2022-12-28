# app > templates

Path: metadata > app > templates.

Templates (available at Administration > Templates). Usually used for system emails.

Example:

```json
{
    "myTemplateName": {
        "scopeList": [
            "EntityType1",
            "EntityType2"
        ],
        "module": "MyModule"
    }
}
```

## scopeList

*string[]*

A list of scopes (entity types) for which the template is available.


## scope

*string*

A scope (entity types) for which the template is available. Use it if it's needed only for one entity type.

## scopeListConfigParam

*string*

A config parameter defining for which entity types the template is available.

## module

*string*

A module name.
