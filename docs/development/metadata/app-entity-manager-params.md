# app > entityManagerParams

*As of v7.5.*

Path: metadata > app > entityManagerParams

Additional entity parameters. Defined parameters are available in the entity manager. Global, template type and entity type specific parameters can be defined.

Example:

```json
{
    "Global": {
        "optimisticConcurrencyControl": {
            "location": "entityDefs",
            "fieldDefs": {
                "type": "bool",
                "tooltip": true
            }
        }
    },
    "MyEntityType": {
        "someParam": {
            "location": "scopes",
            "fieldDefs": {
                "type": "int",
                "tooltip": true
            }
        }
    },
    "@Event": {
        "someParam": {
            "location": "clientDefs",
            "fieldDefs": {
                "type": "varchar",
                "tooltip": true
            }
        }
    }
}

```

*Global* parameters are available for all entity types. *@Event* defines template specific parameters.

Field labels and tooltips should be defined in language data in the *EntityManager* scope.

## location

*string*

A metadata location. Where the parameter  will be stored. Supported values:

* `scopes`
* `entityDefs`
* `clientDefs`
* `recordDefs` (as of v8.0)

## fieldDefs

Field definitions (same as [entityDefs > fields](entity-defs.md#fields)). The defined field will be rendered on the entity manager edit view.

!!! note

    Only field types that have one attribute are supported. Meaning that you can't use field type like *link*, *linkParent*, *linkMulitple*.
