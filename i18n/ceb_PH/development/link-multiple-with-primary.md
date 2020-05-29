# Pagdugtong sa daghang mga field kauban sa nahauna

Usahay ikaw adunay `hasMany` nga relasyon ug kinahanglan nga aduna kay abilidad sa pagpili sa pangunang rekord sa mga naa nay kabalutan. Pananglitan, `Contacts` nga field sa Case entity.

>Kinahanglan nga buhaton ang `contacts` linkMultiple nga field uban ang panguna para sa atong custom nga entity `Stock`.
>

### Unang Lakang
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

### Ikaduhang Lakang
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

### Ikatulong Lakang
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

### Ika-upat nga Lakang
`client/custom/src/views/stock/fields/contacts.js`
```js
Espo.define('custom:views/stock/fields/contacts', 'views/fields/link-multiple-with-primary', function (Dep) {
    return Dep.extend({
		primaryLink: 'contact'
    });
});
```

### Ikalimang Lakang
Padagan anag Rebuild

### Ika-unom nga lakang
Ipatuman ang SQL query
```sql
UPDATE stock
JOIN contact_stock
ON contact_stock.stock_id = stock.id AND contact_stock.deleted = 0
SET stock.contact_id = contact_stock.contact_id
```
