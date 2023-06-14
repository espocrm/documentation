# Select Manager

Important: Deprecated as of v6.1.0. Use Select Builder instead.

Select Manager can be utilized for generating and managing select params which subsequently will be feed to ORM.

Base class: [Base.php](https://github.com/espocrm/espocrm/blob/stable/application/Espo/Core/SelectManagers/Base.php).

Usage example:

```php
$selectManager = $selectManagerFactory->create('Opportunity');
$params = $selectManager->getEmptySelectParams();

$selectManager->applyAccess($params); // add ACL $params
$selectManager->applyPrimaryFilter('open', $params);
$selectManager->applyOrder('createdAt', true, $params);
$selectManager->applyLimit(0, 5, $params);

$params['whereClause'][] = [
    'accountId' => $accountId,
];

$entityManager->getRepository('Opportunity')->find($params);
```

### Creating an instance of Select Manager

```php
$selectManager = $container->get('selectManagerFactory')->create($entityType);
```

For a specific user, to be able to apply ACL specific to the user.

```php
$selectManager = $container->get('selectManagerFactory')->create($entityType, $user);
```

### Generating empty select params

```php
$params = $selectManager->getEmptySelectParams();
```

### Applying ACL

```php
$selectManager->applyAccess($params);
```

### Primary filter

```php
$selectManager->applyPrimaryFilter($filterName, $params);
```

### Bool filter

```php
$selectManager->applyBoolFilter($filterName, $params);
```

### Distinct

```php
$selectManager->setDistinct(true, $params);
```

### Add Join

```php
$selectManager->addJoin([
    'linkName',
    'someAlias',
], $params);
```

```php
$selectManager->addJoin([
    'TableName', // table name in CamelCase
    'someAlias', // alias for our join
    [
        'someAlias.meetingId:' => 'id', // additional join condition
    ]
], $params);
```

### Add Left Join


```php
$selectManager->addLeftJoin([
    'linkName',
    'someAlias',
], $params);
```

## Custom Select Manager

How to extend an existing select manager for a specific entity type.

Example for *Account*. There is already extended class in `application/Espo/Modules/Crm/SelectManagers/Account.php`, so we need to extend from it.

Create a file `custom/Espo/Custom/SelectManager/Account.php`:

```php
<?php
namespace Espo\Custom\SelectManagers;

class Account extends \Espo\Modules\Crm\SelectManagers\Account
{
    protected function filterMyCustomFilter(&$result)
    {
        $result['whereClause'][] = [
            'someAttribute' => 'Some Value',
        ];
    }
}
```

If there's no select manager class for a specific entity type, you need to extend from `\Espo\Core\SelectManagers\Base`.
