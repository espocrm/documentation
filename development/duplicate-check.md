# Custom duplicate check

Duplicate check is performed upon record creation. It's also possible to enable it for a record update.

You can customize (or enable if it's not by default) a duplicate checking for a specific entity type in the service class.

An example for Lead entity type.

Create a file `custom/Espo/Custom/Services/Lead.php`:

```php

namespace Espo\Custom\Services;

use Espo\ORM\Entity;

class Lead extends \Espo\Modules\Crm\Services\Lead
{
    protected $checkForDuplicatesInUpdate = false; // set true to enable for update

    // copied original method
    protected function getDuplicateWhereClause(Entity $entity, $data)
    {
        $whereClause = [
            'OR' => []
        ];
        $toCheck = false;
        if ($entity->get('firstName') || $entity->get('lastName')) {
            $part = [];
            $part['firstName'] = $entity->get('firstName');
            $part['lastName'] = $entity->get('lastName');
            $whereClause['OR'][] = $part;
            $toCheck = true;
        }
        if (
            ($entity->get('emailAddress') || $entity->get('emailAddressData'))
            &&
            (
                $entity->isNew() || 
                $entity->isAttributeChanged('emailAddress') || 
                $entity->isAttributeChanged('emailAddressData')
            )
        ) {
            if ($entity->get('emailAddress')) {
                $list = [$entity->get('emailAddress')];
            }
            if ($entity->get('emailAddressData')) {
                foreach ($entity->get('emailAddressData') as $row) {
                    if (!in_array($row->emailAddress, $list)) {
                        $list[] = $row->emailAddress;
                    }
                }
            }
            foreach ($list as $emailAddress) {
                $whereClause['OR'][] = [
                    'emailAddress' => $emailAddress
                ];
                $toCheck = true;
            }
        }
        if (!$toCheck) {
            return false;
        }
        return $whereClause;
    }
}

```

More simple example:

```php
    protected function getDuplicateWhereClause(Entity $entity, $data)
    {
        $whereClause = [
            'OR' => []
        ];

        $toCheck = false;

        if ($entity->get('name')) {
            $toCheck = true;
            $whereClause['OR']['name'] = $entity->get('name');
        }

        if ($entity->get('emailAddress')) {
            $toCheck = true;
            $whereClause['OR']['emailAddress'] = $entity->get('emailAddress');
        }

        if (!$toCheck) return null;

        return $whereClause;
    }
```
