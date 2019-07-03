# Select Manager

Select Manager can be utilized for generating and managing select params which subsequently will be feed to ORM.

Base class: https://github.com/espocrm/espocrm/blob/stable/application/Espo/Core/SelectManagers/Base.php

Usege example:

```php
$selectManager = $selectManagerFactory->create('Opportunity');
$params = $selectManager->getEmptySelectParams();

$selectManager->applyAccess($params); // add ACL $params
$selectManager->applyPrimaryFilter('open', $params);
$selectManager->applyOrder('createdAt', true, $params);
$selectManager->applyLimit(0, 5, $params);

$params['whereClause'][] = [
    'accontId' => $accountId,
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
