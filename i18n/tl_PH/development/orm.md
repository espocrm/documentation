# Ang ORM, Paano pamahalaan ang mga entity at magsagawa ng mga query

Ang EspoCRM ay mayroong built-in na sariling ORM (Object-relational na pagmamapa). Napakadaling lumikha, mag-update, magbasa, magtanggal at maghanap ng mga entity. Ang lahat ng mga operasyong ito ay magagamit sa pamamagitan ng EntityManager object. Ang EntityManager ay makikita sa mga record Service sa pamamagitan ng pamamaraan ng `#getEntityManager()`.

```php
$entityManager = $this->getEntityManager();
```

#### Paglikha ng Bagong Entity
```php
$account = $entityManager->getEntity('Account')
```
or
```php
$account = $entityManager->getRepository('Account')->get();
```

#### Pagkuha ng existing
```php
$account = $entityManager->getEntity('Account', $accountId);
```
or
```php
$account = $entityManager->getRepository('Account')->get($accountId);
```

#### Pagkuha value
```php
$fieldValue = $account->get('fieldName');
```

#### Mayroong value
```php
$fieldNameIsSet = $account->has('fieldName'); // true or false
```

#### Pagtakda ng value
```php
$account->set('fieldName', 'Test Account');
```

```php
$account->set(array(
  'name' => 'Test Account',
  'assignedUserId' => '1'
));
```

#### Pag-istore
```php
$entityManager->saveEntity($account);
```
or
```php
$entityManager->getRepository('Account')->save($account);
```

#### Pagtanggal
```php
$entityManager->removeEntity($account);
```
or
```php
$entityManager->getRepository('Account')->remove($account);
```

#### Paghanap
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

#### Paghanap ng pinakauna
```php
$account = $entityManager->getRepository('Account')->where([
    'type' => 'Customer',   
])->findOne();
```

#### Paghanap ng kaugnay
```php
$opportunityList = $entityManager->getRepository('Account')->findRelated($account, 'opportunities');
```

#### Mga Kaugnay na Entity
```php
$entityManager->getRepository('Account')->relate($account, 'opportunities', $opportunity);
```
or
```php
$entityManager->getRepository('Account')->relate($account, 'opportunities', $opportunityId);
```

#### Pag-unrelate ng mga entity
```php
$entityManager->getRepository('Account')->unrelate($account, 'opportunities', $opportunity);
```
or
```php
$entityManager->getRepository('Account')->unrelate($account, 'opportunities', $opportunityId);
```

### Pagpili ng mga parametro ng Query

#### Kung Saan ang Clause ay

##### Mga Operator ng Paghahambing

Suportadong mga operator ng paghahambing: `>`, `<`, `>=`, `<=`, `=`, `!=`.

```
$opportunityList = $entityManager->getRepository('Opportunity')->where([
  'amount>=' => 100
])->find();
```

##### IN at NOT IN na mga operator

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

##### Mga LIKE na operator

Suportadong mga operator: 
* `*` - LIKE,
* `!*` -- NOT LIKE.

```
$opportunityList = $entityManager->getRepository('Opportunity')->where([
  'name*' => '%service%'
])->find();
```

##### OR, AND na mga operator

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

#### Naiiba

```
$opportunityList = $entityManager->getRepository('Opportunity')->distinct()->where(...)->find();
```

#### Pagdudugtong-dugtong

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

#### Pag-grupogrupo

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
