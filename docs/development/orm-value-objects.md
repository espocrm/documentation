# Value Objects

*As of v7.0.*

* Value objects are immutable.
* Values objects contain modification methods which return a cloned instance.
* Default value objects are available in the namespace `Espo\Core\Field`.
* It's possible to register custom value object for a specific field type or for a specific field.

When defining getters and setters in an Entity class, it's recommended to use value objects for such field types:

* date
* datetime
* datetimeOptional
* address
* currency

All field types with registered value object:

* date
* datetime
* datetimeOptional
* address
* currency
* email
* phone
* link
* linkParent
* linkMultiple

BaseEntity's methods *getValueObject* and *setValueObject* will work for field types with registered value object.

```php
<?php
$valueObject = $entity->getValueObject($field);
$entity->setValueObject($field, $valueObject);
$entity->setValueObject($field, null);
```

Getter:

```php
use Espo\Core\Field\Date;

class MyEntity extends Entity
{
    public function getDateDue(): ?Date
    {
        // It's also possible to use `getValueObject`
        // but the following method is more type safe.

        $rawValue = $this->get('dateDue');

        if ($rawValue === null) {
            return null;
        }

        return Date::fromString($rawValue);
    }

    public function setDateDue(?Date $dateDue): self
    {
        $this->setValueObject('dateDue', $dateDue);

        return $this;
    }
}

```

## Supported field types

### Address

```php
<?php

$address = $accountEntity->getBillingAddress() ?? new Address();

$country = $address->getCountry();
$city = $address->getCity();
```

```php
<?php

$address = Address::create()
    ->withCity($city)
    ->withCountry($country)
    ->withPostalCode($postalCode);

$accountEntity->setBillingAddress($address);
```

### Currency

```php
<?php

$value = new Currency($amount, 'USD');

$valueInEur = $converter->convert($value, 'EUR');

$opportunityEntity->setAmount($valueInEur);
```

### Email address, Phone number

```php
<?php

$emailAddressGroup = $accountEntity->getEmailAddressGroup();

$primary = $emailAddressGroup->getPrimary();

$modifiedEmailAddressGroup = $emailAddressGroup
    ->withAddedEmailAddress(
        EmailAddress::create('address@test.com')->optedOut()
    );

$accountEntity->setEmailAddressGroup($modifiedEmailAddressGroup);
```

The same is available for phone numbers.

### Date, DateTime, DateTimeOptional

```php
<?php

$closeDate = $opportunityEntity->getCloseDate();

$opportunityEntity->setCloseDate(
    $closeDate->modify('+1 month')
);
```

### Link, Link-Parent, Link-Multiple

```php
<?php
$parentLink = LinkParent::create($entityType, $id);
```

```php
<?php
$contact = LinkMultipleItem
    ::create($contact->getId())
    ->withColumnValue('role', 'Decision Maker');

$contacts = LinkMultiple::create([$contact->getId()]);
```

## Registering

Registering a custom value object type for a specific field type.

For a field type you need to define 2 parameters in metadata > fields > {fieldType}:

* `valueFactoryClassName` – implementation of `Espo\ORM\Value\ValueFactory` interface;
* `attributeExtractorClassName` – implementation of `Espo\ORM\Value\AttributeExtractor` interface.

It's also possible to register a value object for a specific field in metadata > entityDefs > {entityType} > fields > {fieldName}:

* `valueFactoryClassName`;
* `attributeExtractorClassName`.
