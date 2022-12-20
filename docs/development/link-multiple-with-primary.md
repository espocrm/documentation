# Link Multiple field with Primary

Sometimes you have a *hasMany* relationship and need to have the ability to a select primary record among related ones. As example, a *Contacts* field of the *Case* entity.

>Need to create a `contacts` linkMultiple field with a primary for our custom entity *Stock*. 
>

### Step 1

Create (or edit) `custom/Espo/Custom/Resources/metadata/entityDefs/Stock.json`:

```json
{
    "fields": {
        "contacts": {
            "type": "linkMultiple",
            "view": "custom:views/stock/fields/contacts"
        },
        "contact": {
            "type": "link"
        }
    },
    "links":{
        "contact": {
            "type": "belongsTo",
            "entity": "Contact",
            "foreign": "stocksPrimary"
        },
        "contacts": {
            "type": "hasMany",
            "entity": "Contact",
            "foreign": "stocks",
            "layoutRelationshipsDisabled": true
        }
    }
}
```

### Step 2

`custom/Espo/Custom/Resources/metadata/entityDefs/Contact.json`

```json
{
    "links":{
        "stocksPrimary": {
            "type": "hasMany",
            "entity": "Stock",
            "foreign": "contact",
            "layoutRelationshipsDisabled": true
        },
        "stocks": {
            "type": "hasMany",
            "entity": "Stock",
            "foreign": "contacts"
        }
    }
}
```

### Step 3
`custom/Espo/Custom/Hooks/Stock/AfterSave.php`

```php
<?php
namespace Espo\Custom\Hooks\Stock;

use Espo/ORM/Entity;
use Espo/ORM/EntityManager;

class AfterSave
{
    public function __construct(private EntityManager $entityManager) {}

    public function afterSave(Entity $entity, array $options): void
    {            
        if (!$entity->isAttributeChanged('contactId')) {
            return;
        }
        
        $contactId = $entity->get('contactId');
        $fetchedContactId = $entity->getFetched('contactId');
        
        $relation = $this->entityManager
            ->getRDBRepository($entity->getEntityType())
            ->getRelation($entity, 'contacts');

        if (!$contactId) {
            $relation->unrelateById($fetchedContactId);
            
            return;
        }
        
        $relation->relateById($contactId);        
    }
}
```

### Step 4
`client/custom/src/views/stock/fields/contacts.js`

```js
define('custom:views/stock/fields/contacts', ['views/fields/link-multiple-with-primary'], function (Dep) {   
    return Dep.extend({
        primaryLink: 'contact',
    });
});
```

### Step 5

Run Rebuild.

### Step 6

Execute an SQL query:

```sql
UPDATE stock
JOIN contact_stock
ON contact_stock.stock_id = stock.id AND contact_stock.deleted = 0
SET stock.contact_id = contact_stock.contact_id
```
