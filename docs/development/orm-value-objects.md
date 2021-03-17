# Value Objects

Actual as of v6.2.0.

* Value objects are immutable.
* Value objects are available in `Espo\Core\Fields\`.
* It's possible to define custom value object for a field type or for a specific field.

Methods in BaseEntity:

```php
$valueObject = $entity->getValueObject($field);

$entity->setValueObject($field, $valueObject);

$entity->setValueObject($field, null); // null can be set
```

### Address

```php
$address = $accountEntity->getBillingAddress() ?? new Address();

$country = $address->getCountry();
$city = $address->getCity();
```

```php
$address = Address
    ::fromNothing()
    ->withCity($city)
    ->withCountry($country)
    ->withPostalCode($postalCode);

$accountEntity->setBillingAddress($address);
```

### Currency

```php
$value = new Currency($amount, 'USD');

$valueInEur = $converter->convert($value , 'EUR');

$opportunityEntity->setAmount($valueInEur);
```

### Email address, Phone number

```php
$emailAddressGroup = $accountEntity->getEmailAddressGroup();

$primary = $emailAddressGroup->getPrimary();

$modifiedEmailAddressGroup = $emailAddressGroup
    ->withAddedEmailAddress(
        EmailAddress::fromAddress('address@test.com')->optedOut()
    );

$accountEntity->setEmailAddressGroup($modifiedEmailAddressGroup);
```

The same is available for phone numbers.

### Date, DateTime, DateTimeOptional

```php
$closeDate = $opportunityEntity->getCloseDate();

$opportunityEntity->setCloseDate(
    $closeDate->modify('+1 month')
);
```

### Link, Link-Parent, Link-Multiple

```php
$account = $entity->getAccount(); // Link value object

$accountId = $account->getId();
$accountName = $account->getName();
```

```php
$entity->setParent(
    LinkParent::fromEntityTypeAndId($entityType, $id)
);
```

```php
$contacts = $entity->getContacts(); // Link-Multiple value object

$entity->setContacts(
    $contacts->withRemovedById($id)
);
```

```php
$contact = LinkMultipleItem
    ::fromId($contact)
    ->withColumnValue('role', 'Decision Maker');

$entity->setContacts(
    LinkMultiple::fromList([$contact]);
);
```
