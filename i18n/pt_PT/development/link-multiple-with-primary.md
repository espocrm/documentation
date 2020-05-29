# Vincular campo múltiplo com primário

Às vezes, tu tens um relacionamento `hasMany` e precisas de ter a capacidade de selecionar o registro primário entre os relacionados. Como exemplo, campo `Contatos` da entidade Case.



>Precisas criar um link de `contatos` múltiplo campo com um primário para a nossa entidade personalizada `Stock`.
>

### Passo 1
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

### Passo 2
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

### Passo 3
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

### Passo 4
`client/custom/src/views/stock/fields/contacts.js`
```js
Espo.define('custom:views/stock/fields/contacts', 'views/fields/link-multiple-with-primary', function (Dep) {   
    return Dep.extend({
		primaryLink: 'contact'
    });
});
```

### Passo 5
Corre o reconstruir

### Passo 6
Executa SQL query
```sql
ATUALIZA stock
JUNTA contact_stock
ON contact_stock.stock_id = stock.id AND contact_stock.deleted = 0
SET stock.contact_id = contact_stock.contact_id
```
