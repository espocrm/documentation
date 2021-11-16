# Custom duplicate check

Duplicate check is performed upon record creation. It's also possible to enable it for a record update.

You can customize (or enable if it's not by default) a duplicate checking for a specific entity type in the service class.

## New way

As of v7.0.0.

You need to define a class name in metadata: recordDefs > {entityType} > duplicateWhereBuilderClassName. The class should implement `Espo\Core\Duplicate\WhereBuilder` interface.

### Example

Create `custom/Espo/Custom/Resources/metadata/recordDefs/Lead.json`:

```json
{
    "duplicateWhereBuilderClassName": "Espo\\Custom\\Classes\\DuplicateWhereBuilders\\Lead"
}
```

Create `custom/Espo/Custom/Classes/DuplicateWhereBuilders/Lead.php`:

```php
<?php
namespace Espo\Custom\Classes\DuplicateWhereBuilders;

use Espo\Core\Duplicate\WhereBuilder;

use Espo\ORM\Query\Part\Condition as Cond;
use Espo\ORM\Query\Part\WhereItem;
use Espo\ORM\Query\Part\Where\OrGroup;
use Espo\ORM\Entity;

class Lead implements WhereBuilder
{
    public function build(Entity $entity): ?WhereItem
    {
        $orBuilder = OrGroup::createBuilder();
        
        $toCheck = false;

        if ($entity->get('firstName') || $entity->get('lastName')) {
            $orBuilder->add(
                Cond::and(
                    Cond::equal(
                        Cond::column('firstName'),
                        $entity->get('firstName')
                    ),
                    Cond::equal(
                        Cond::column('lastName'),
                        $entity->get('lastName')
                    )
                )
            );

            $toCheck = true;
        }
        
        // check for duplicate phone numbers
        if (    $entity->get('phoneNumber') 
            ||  $entity->get('phoneNumberData')
        ) {
            if ($entity->get('phoneNumber')) {
                $phoneNumbers = [$entity->get('phoneNumber')];
            }

            if ($entity->get('phoneNumberData')) {
                foreach ($entity->get('phoneNumberData') as $phoneData) {
                    if (!in_array($phoneData->phoneNumber, $phoneNumbers ?? [])) {
                        $phoneNumbers[] = $phoneData->phoneNumber;
                    }
                }
            }

            foreach ($phoneNumbers as $phoneNumber) {
                $orBuilder->add(
                    Cond::equal(
                        Cond::column('phoneNumber'),
                        $phoneNumber
                    )
                );
            }

            $toCheck = true;
        }
        
        // check for duplicate email addresses
        if (    $entity->get('emailAddress') 
            ||  $entity->get('emailAddressData')
        ) {
            if ($entity->get('emailAddress')) {
                $emailAddresses = [$entity->get('emailAddress')];
            }

            if ($entity->get('emailAddressData')) {
                foreach ($entity->get('emailAddressData') as $emailData) {
                    if (!in_array($emailData->emailAddress, $emailAddresses ?? [])) {
                        $emailAddresses[] = $emailData->emailAddress;
                    }
                }
            }

            foreach ($emailAddresses as $emailAddress) {
                $orBuilder->add(
                    Cond::equal(
                        Cond::column('emailAddress'),
                        $emailAddress
                    )
                );
            }

            $toCheck = true;
        }
        
        // Here you can add more conditions.
        
        if (!$toCheck) {
            return null;
        }

        return $orBuilder->build();
    }
}
```

## Checking for duplicated while update

Disabled by default. Can be enabled in metadata: recordDefs > {entityType} > updateDuplicateCheck.

```json
{
    "updateDuplicateCheck": true
}
```

## Legacy way

Before v7.0.0.

An example for Lead entity type.

Create a file `custom/Espo/Custom/Services/Lead.php`:

```php
<?php

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
