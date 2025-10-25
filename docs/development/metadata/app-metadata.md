# app > metadata

Path: metadata > app > metadata.

Definitions for metadata itself.

## frontendHiddenPathList

*Array*

Sections of metadata (defined as paths) to be hidden from the front-end.

Example:

```json
{
    "frontendHiddenPathList": [
        "__APPEND__",
        ["app", "calendar", "additionalAttributeList"]
    ]
}
```

## frontendNonAdminHiddenPathList

*Array*

*As of v8.0*.

Sections of metadata (defined as paths) to be hidden from the front-end for non-admin users.

## aclDependencies

*Object.<string, Object\>\>*

Rules making a metadata sections available for the user when they don't have access to the scope.

Example:

```json
{
    "aclDependencies": {
        "entityDefs.Lead.fields.source.options": {
            "scope": "Opportunity",
            "field": "leadSource"
        },
        "entityDefs.Account.fields.industry.options": {
            "scope": "Lead",
            "field": "industry"
        },
        "entityDefs.MyEntityType": {
            "anyScopeList": ["AnotherEntityType"]
        }
    }
}
```

### scope

*string*

If the user has access to the scope, they will have access to the metadata section defined by the key.

### field

*string*

If the user has access to the field (of the scope), they will have access to the metadata section defined by the key.

### anyScopeList

*string[]*

*As of v9.2.5.*

If the user has access to any of the list scopes, they will have access to the metadata section defined by the key. 

## additionalBuilderClassNameList

*class-string<Espo\Core\Utils\Metadata\AdditionalBuilder\>[]*

*As of v8.4.*

Additional builders. Allows adding conditional metadata.
