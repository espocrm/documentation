# Vincule Varios Campos con Primario

~Para EspoCRM 3.6.0 y superiores~

A veces tiene relaciones `hasMany` y necesitas tener la capacidad de seleccionar un historial primario entre los relaciones. Como ejemplo, el campo `Contacts` de entidad Caso.

>Necesita crear `contacts`, vincule Varios campos con un primario para nuestra entidad personalizada `Stock`. 
>

###Paso 1
`custom/Espo/Custom/Resources/metadata/entityDefs/Stock.json`
```json
{
  "fields": {
     ...
	 "contacts": {
		"type": "linkMultiple",
		"view": "custom:views/stock/fields/contacts"
	 },
	 "contact": {
		"type": "link"
	 },
	 ...
  },
  "links": {
     ...
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
        },
	 ...
  }
}
```

###Paso 2
`custom/Espo/Custom/Resources/metadata/entityDefs/Contact.json`
```json
{
  "links": {
     ...
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
	 ...
  }
}
```

###Paso 3
`custom/Espo/Custom/Repositories/Stock.php`
```php
<?php

namespace Espo\Custom\Repositories;

class Stock extends \Espo\Core\ORM\Repositories\RDB
{
    public function afterSave(Entity $entity, array $options)
    {
        $result = parent::afterSave($entity, $options);
        $this->handleAfterSaveContacts($entity, $options);
        return $result;
    }
    protected function handleAfterSaveContacts(Entity $entity, array $options)
    {
        $contactIdChanged = $entity->has('contactId') && $entity->get('contactId') != $entity->getFetched('contactId');
        if ($contactIdChanged) {
            $contactId = $entity->get('contactId');
            if (empty($contactId)) {
                $this->unrelate($entity, 'contacts', $entity->getFetched('contactId'));
                return;
            }
        }
        if ($contactIdChanged) {
            $pdo = $this->getEntityManager()->getPDO();
            $sql = "
                SELECT id FROM contact_stock
                WHERE
                    contact_id = ".$pdo->quote($contactId)." AND
                    stock_id = ".$pdo->quote($entity->id)." AND
                    deleted = 0
            ";
            $sth = $pdo->prepare($sql);
            $sth->execute();
            if (!$sth->fetch()) {
                $this->relate($entity, 'contacts', $contactId);
            }
        }
    }
}
```

###Paso 4
`client/custom/src/views/stock/fields/contacts.js`
```js
Espo.define('custom:views/stock/fields/contacts', 'views/fields/link-multiple-with-primary', function (Dep) {   
    return Dep.extend({
		primaryLink: 'contact'
    });
});
```

###Paso 5
Ejecutar Reconstrucción

###Step 6
Ejecute consulta SQR
```sql
UPDATE stock
JOIN contact_stock
ON contact_stock.stock_id = stock.id AND contact_stock.deleted = 0
SET stock.contact_id = contact_stock.contact_id
```
