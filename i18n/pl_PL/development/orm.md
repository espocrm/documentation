# ORM, How to manage entities and perform queries

EspoCRM has built-in own ORM (Object-relational mapping). It’s very simple to create, update, read, delete and search entities. All these operations available through EntityManager object. EntityManager is available in record Services by method `#getEntityManager()`.

```php
$entityManager = $this->getEntityManager();
```

#### Create new entity
```php
$account = $entityManager->getEntity('Account')
```
or
```php
$account = $entityManager->getRepository('Account')->get();
```

#### Fetch existing
```php
$account = $entityManager->getEntity('Account', $accountId);
```
or
```php
$account = $entityManager->getRepository('Account')->get($accountId);
```

#### Get value
```php
$fieldValue = $account->get('fieldName');
```

#### Has value
```php
$fieldNameIsSet = $account->has('fieldName'); // true or false
```

#### Set value
```php
$account->set('fieldName', 'Test Account');
```

```php
$account->set(array(
  'name' => 'Test Account',
  'assignedUserId' => '1'
));
```

#### Store
```php
$entityManager->saveEntity($account);
```
or
```php
$entityManager->getRepository('Account')->save($account);
```

#### Remove
```php
$entityManager->removeEntity($account);
```
or
```php
$entityManager->getRepository('Account')->remove($account);
```

#### Find
```php
$accountList = $entityManager->getRepository('Account')->where([
    'type' => 'Customer'
])->find();
```

Descending order:

```php
$accountList = $entityManager->getRepository('Account')->limit(0, 10)->order('createdAt', true)->find();
```

Ascending order:
```php
$accountList = $entityManager->getRepository('Account')->limit(0, 10)->order('createdAt')->find();
```

or:
```php
$accountList = $entityManager->getRepository('Account')->limit(0, 10)->order('createdAt', 'DESC')->find();
```

#### Find the first one
```php
$account = $entityManager->getRepository('Account')->where([
    'type' => 'Customer',   
])->findOne();
```

#### Find related
```php
$opportunityList = $entityManager->getRepository('Account')->findRelated($account, 'opportunities');
```

#### Relate entities
```php
$entityManager->getRepository('Account')->relate($account, 'opportunities', $opportunity);
```
or
```php
$entityManager->getRepository('Account')->relate($account, 'opportunities', $opportunityId);
```

#### Unrelate entities
```php
$entityManager->getRepository('Account')->unrelate($account, 'opportunities', $opportunity);
```
or
```php
$entityManager->getRepository('Account')->unrelate($account, 'opportunities', $opportunityId);
```

### Select Query Paramaters

#### Where clause

##### Comparison operators

Supported comparison operators: `>`, `<`, `>=`, `<=`, `=`, `!=`.

```
$opportunityList = $entityManager->getRepository('Opportunity')->where([
  'amount>=' => 100
])->find();
```

##### IN and NOT IN operators

```
$opportunityList = $entityManager->getRepository('Opportunity')->where([
  'stage' => ['Closed Lost', 'Closed Won']
 ])->find();
```

```
$opportunityList = $entityManager->getRepository('Opportunity')->where([
  'stage!=' => ['Closed Lost', 'Closed Won']
])->find();
```

##### LIKE operators

Supported  operators: 
* `*` - LIKE,
* `!*` -- NOT LIKE.

```
$opportunityList = $entityManager->getRepository('Opportunity')->where([
  'name*' => '%service%'
])->find();
```

##### OR, AND operators

```
$opportunityList = $entityManager->getRepository('Opportunity')->where([
  [
    'OR' => [
      ['stage' => 'Closed Won'],
      ['stage' => 'Closed Lost']
    ],
    'AND' => [
      'amountConverted>' => 100,
      'amountConverted<=' => 999
    ]
  ]
])->findOne();
```

#### Distinct

```
$opportunityList = $entityManager->getRepository('Opportunity')->distinct()->where(...)->find();
```

#### Join

```
$contactList = $entityManager->getRepository('Contact')->distinct()->join('opportunities')->where([
  'opportunities.stage' => 'Closed Won'
])->find();
```

```
$contactList = $entityManager->getRepository('Contact')
->distinct()->leftJoin('opportunities')->where(...)->find();
```

```
$contactList = $entityManager->getRepository('Contact')
->distinct()
->join(['opportunities', 'aliasForJoinedTable'])
->where([
  'aliasForJoinedTable.stage' => 'Closed Won'
])->find();
```

#### Group By

```
$selectParams = [
  'select' => ['MONTH:closeDate', 'SUM:amountConverted']
  'groupBy' => ['MONTH:closeDate'],
  'whereClause' => [
    'stage' => 'Closed Won'
  ],
  'orderBy' => 1 // ordering by the first column
];

// applying left joins for currency convertion
$this->getEntityManager()->getRepository('Opportunity')->handleSelectParams($selectParams);

$pdo = $this->getEntityManager()->getPDO();
$sql = $this->getEntityManager()->getQuery()->createSelectQuery('Opportunity', $selectParams);
$sth = $pdo->prepare($sql);
$sth->execute();

// results
$rowList = $sth->fetchAll(\PDO::FETCH_ASSOC); 
```
