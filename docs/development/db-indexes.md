# Database indexes

Proper database indexes can drastically improve a performance of list view loading, reports, search operations etc.

After changes you need to rebuild database. It's better to do from CLI to avoid timeout issue.

Command to run rebuild:

```
php rebuild.php
```

## Defining indexes

Indexes are defined in metadata > entityDefs.

### Example

For *Lead* entity type.

`custom/Espo/Custom/Resources/metadata/entityDefs/Lead.json`:


```json
{

    "indexes": {
        "myIndexNameOne": {
            "columns": ["columnName"]   
        },
        "myIndexNameTwo": {
            "columns": ["columnNameOne", "columnNameTwo"]  
        },
        "myUniqueIndexName": {
            "type": "unique",
            "columns": ["id", "columnNameOne", "columnNameTwo"]  
        }
    }
}
```

Note: Column names should be in camel case.

You need to run rebuild after changes.

## Forcing index usage in ORM

You need to specify an index name in *useIndex* param.

```php
<?php
$query = $entityManager->getQueryBuilder()
    ->select()
    ->from($entityType)    
    ->where($whereClause)
    ->useIndex('myIndexNameOne')
    ->build();
    
$collection = $entityManager->getRDBRepository($entityType)
    ->clone($query)
    ->find();
```

## Relationship table indexes

In entityDefs:

```json
{
    "links": {
        "linkName": {
            "additionalColumns": {
                "role": {
                    "type": "varchar"
                }
            },
            "indexes": {
                "role": {
                    "columns": ["role"]
                }
            }
        }
    }
}    
```
