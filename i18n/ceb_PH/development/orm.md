# ORM, Unsaon pagdumala sa mga entity ug pagbuhat og mga query

Ang EspoCRM kay naay mga nahimo na nga ORM (Object-relational mapping). Simple ra ang paghimo, pag-update, pagbasa, pag-tangtang, ug pagpangita sa mga entity. Ang tanan nga operasyon kay pwede himoon gamit ang EntityManager nga object. Ang EntityManager kay makit-an sa rekord nga Services pinaagi sa method nga `#getEntityManager()`.


```php
$entityManager = $this->getEntityManager();
```

#### Paghimo og bag-o nga entity
```php
$account = $entityManager->getEntity('Account')
```
o
```php
$account = $entityManager->getRepository('Account')->get();
```

#### Pagkuha sa mga nahimo na
```php
$account = $entityManager->getEntity('Account', $accountId);
```
o
```php
$account = $entityManager->getRepository('Account')->get($accountId);
```

#### Pagkuha sa balor
```php
$fieldValue = $account->get('fieldName');
```

#### Naay balor
```php
$fieldNameIsSet = $account->has('fieldName'); // true o false
```

#### Pagtakda sa balor
```php
$account->set('fieldName', 'Test Account');
```

```php
$account->set(array(
  'name' => 'Test Account',
  'assignedUserId' => '1'
));
```

#### Pag-Store
```php
$entityManager->saveEntity($account);
```
o
```php
$entityManager->getRepository('Account')->save($account);
```

#### Pag-tangtang
```php
$entityManager->removeEntity($account);
```
o
```php
$entityManager->getRepository('Account')->remove($account);
```

#### Pagpangita
```php
$accountList = $entityManager->getRepository('Account')->where([
    'type' => 'Customer'
])->find();
```

Paubos nga paghan-ay:

```php
$accountList = $entityManager->getRepository('Account')->limit(0, 10)->order('createdAt', true)->find();
```

Pataas nga paghan-ay:
```php
$accountList = $entityManager->getRepository('Account')->limit(0, 10)->order('createdAt')->find();
```

o:
```php
$accountList = $entityManager->getRepository('Account')->limit(0, 10)->order('createdAt', 'DESC')->find();
```

#### Pagpangita sa pinakauna
```php
$account = $entityManager->getRepository('Account')->where([
    'type' => 'Customer',   
])->findOne();
```

#### Pagpangita sa mga naay kalabotan
```php
$opportunityList = $entityManager->getRepository('Account')->findRelated($account, 'opportunities');
```

#### Relate nga mga entity
```php
$entityManager->getRepository('Account')->relate($account, 'opportunities', $opportunity);
```
o
```php
$entityManager->getRepository('Account')->relate($account, 'opportunities', $opportunityId);
```

#### Mga unrelate nga entity
```php
$entityManager->getRepository('Account')->unrelate($account, 'opportunities', $opportunity);
```
o
```php
$entityManager->getRepository('Account')->unrelate($account, 'opportunities', $opportunityId);
```

### Pili og mga Query nga Parametro

#### Where nga clause

##### Mga Comparison Operator

Mga gisuportahang operator: `>`, `<`, `>=`, `<=`, `=`, `!=`.

```
$opportunityList = $entityManager->getRepository('Opportunity')->where([
  'amount>=' => 100
])->find();
```

##### IN ug NOT IN nga mga operator

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

##### Mga LIKE operator

Mga gisuportahan nga mga operator: 
* `*` - LIKE,
* `!*` -- NOT LIKE.

```
$opportunityList = $entityManager->getRepository('Opportunity')->where([
  'name*' => '%service%'
])->find();
```

##### Mga OR, AND operator

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

// pag-gamit og mga left join para sa pag-convert sa currency
$this->getEntityManager()->getRepository('Opportunity')->handleSelectParams($selectParams);

$pdo = $this->getEntityManager()->getPDO();
$sql = $this->getEntityManager()->getQuery()->createSelectQuery('Opportunity', $selectParams);
$sth = $pdo->prepare($sql);
$sth->execute();

// Mga resulta
$rowList = $sth->fetchAll(\PDO::FETCH_ASSOC); 
```
