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

Rules making a metadata sections available for a user when they don't have access to a scope.

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
        }
    }
}
```

### scope

*string*

If a user have access to the scope, they will have access to a metadata section defined by a key.

### field

*string*

If a user have access to the field (of a scope), they will have access to a metadata section defined by a key.

### anyScopeList

*string[]*

Not supported. TBD.

## additionalBuilderClassNameList

*class-string<Espo\Core\Utils\Metadata\AdditionalBuilder\>[]*

*As of v8.4.*

Additional builders. Allows adding conditional metadata.
