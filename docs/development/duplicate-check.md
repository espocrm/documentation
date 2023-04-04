# Custom duplicate check

Duplicate check is performed upon record creation. Optionally, it can be enabled for record update.

*As of v7.0.*

You need to define a class name in metadata: recordDefs > {entityType} > duplicateWhereBuilderClassName. The class should implement `Espo\Core\Duplicate\WhereBuilder` interface.

### Example

Create `custom/Espo/Custom/Resources/metadata/recordDefs/Lead.json`:

```json
{
    "duplicateWhereBuilderClassName": "Espo\\Custom\\Classes\\DuplicateWhereBuilders\\Lead"
}
```

Create a file `custom/Espo/Custom/Classes/DuplicateWhereBuilders/Lead.php`:

```php
<?php
namespace Espo\Custom\Classes\DuplicateWhereBuilders;

use Espo\Core\Duplicate\WhereBuilder;
use Espo\Core\Field\EmailAddressGroup;
use Espo\Core\Field\PhoneNumberGroup;
use Espo\Core\ORM\Entity as CoreEntity;

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

        // check for duplicate email addresses
         if (
            ($entity->get('emailAddress') || $entity->get('emailAddressData')) &&
            (
                $entity->isNew() ||
                $entity->isAttributeChanged('emailAddress') ||
                $entity->isAttributeChanged('emailAddressData')
            )
        ) {
            foreach ($this->getEmailAddressList($entity) as $emailAddress) {
                $orBuilder->add(
                    Cond::equal(
                        Cond::column('emailAddress'),
                        $emailAddress
                    )
                );

                $toCheck = true;
            }
        }
        
        // check for duplicate phone numbers
         if (
            ($entity->get('phoneNumber') || $entity->get('phoneNumberData')) 
                &&
            (
                $entity->isNew() ||
                $entity->isAttributeChanged('phoneNumber') ||
                $entity->isAttributeChanged('phoneNumberData')
            )
        ) {
            foreach ($this->getPhoneNumberList($entity) as $phoneNumber) {
                $orBuilder->add(
                    Cond::equal(
                        Cond::column('phoneNumber'),
                        $phoneNumber
                    )
                );

                $toCheck = true;
            }
        }
        
        // Here you can add more conditions.
        
        if (!$toCheck) {
            return null;
        }

        return $orBuilder->build();
    }

    /**
     * @return string[]
     */
    private function getEmailAddressList(CoreEntity $entity): array
    {
        if ($entity->get('emailAddressData')) {
            /** @var EmailAddressGroup $eaGroup */
            $eaGroup = $entity->getValueObject('emailAddress');

            return $eaGroup->getAddressList();
        }

        if ($entity->get('emailAddress')) {
            return [
                $entity->get('emailAddress')
            ];
        }

        return [];
    }
    
    /**
     * @return string[]
     */
    private function getPhoneNumberList(CoreEntity $entity): array
    {
        if ($entity->get('phoneNumberData')) {
            /** @var PhoneNumberGroup $eaGroup */
            $eaGroup = $entity->getValueObject('phoneNumber');

            return $eaGroup->getNumberList();
        }

        if ($entity->get('phoneNumber')) {
            return [
                $entity->get('phoneNumber')
            ];
        }

        return [];
    }
}
```

## Checking for duplicates when update

Disabled by default. Can be enabled in metadata: recordDefs > {entityType} > updateDuplicateCheck.

```json
{
    "updateDuplicateCheck": true
}
```
