# ORM, How to manage entities and perform queries

EspoCRM has built-in own ORM (Object-relational mapping). It’s very simple to create, update, read, delete and search entities. All these operations available through EntityManager object. 

**EntityManager** is available in [*Container*](di.md). It can be obtained in [record services](services.md#record-service) by method `#getEntityManager()`. It provides an access to repositories.

**Repository** serves for fetching and storing records. Each entity type has its own repository. Base classes: `\Espo\ORM\Repositories\RDB`, `\Espo\Core\ORM\Repositories\RDB`. *RDB* stands for *relational database*.

**Entity** represents a single record. Each entity type has it's own entity class. Base classes: `\Espo\ORM\Entity`, `\Espo\Core\ORM\Entity`.

**EntityCollection** is a collection of entities. It's returned by *find* operations.

Obtaining the entity manager in the record service:

```php
$entityManager = $this->getEntityManager();
```

### Create new entity

```php
$account = $entityManager->getEntity('Account')

// or
$account = $entityManager->getRepository('Account')->get();
```

Note: It creates a new instance but doesn't store it in DB. The entity doesn't have ID yet.

### Fetch existing

```php
$account = $entityManager->getRepository('Account')->get($accountId);

// or from entity manager
$account = $entityManager->getEntity('Account', $accountId);
```

### Get value

```php
$fieldValue = $account->get('fieldName');
```

### Has value

Checks whether attribute is set. Note: If it's set to `NULL` it will return `true`.

```php
$fieldNameIsSet = $account->has('fieldName'); // true or false
```

### Set value

One:

```php
$account->set('fieldName', 'Test Account');
```

Multiple:

```php
$account->set([
  'name' => 'Test Account',
  'assignedUserId' => '1',
]);
```

### Clear value

```php
$entity->clear('attributeName');
```

It will unset the attribute. If you save the entity after that, it will not change the value to NULL in database.

### Reset

Resets all attributes.

```php
$entity->reset();
```

### Fetched attributes

You can check whether an attribute was changed.

```php
// a value that was set once the record was fetched from DB
$value = $entity->getFetched('attributeName')

// check whether an attribute was changed since the last syncing with DB
$entity->isChanged('attributeName');
```

### Get all values

```php
$account->getValueMap();
```

### Store

```php
$entityManager->saveEntity($account);

// or
$entityManager->getRepository('Account')->save($account);
```

Options:

```php
$options = [
    'skipHooks' => true, // skip all hooks; workflows, formula will be ignored
    'silent' => true, // workflows will be ignored, modified fields won't be changed
    'skipCreatedBy' => true, // createdBy won't be set with current user
    'skipModifiedBy' => true, // modifiedBy won't be set with current user
    'createdById' => true, // override createdBy
    'modifiedById' => true, // override modifiedBy
];

$entityManager->saveEntity($account, $options);

// or
$entityManager->getRepository('Account')->save($account, $options);
```

### Create and store

```php
$account = $entityManager->createEntity('Account', [
    'name' => 'Test',
]);
```

### Remove

```php
$entityManager->removeEntity($account);

// or
$entityManager->getRepository('Account')->remove($account);
```

### Delete from DB

```php
$entityManager->getRepository('Account')->deleteFromDb($id);
```

This will delete a record permanently.

### Attribues

Each entity type has its own set of defined attributes. You cannot set an arbitrary attribute name.

```php
// whether attribute is defined for entity
$hasAttribute = $entity->hasAttribute('attributeName');

$attributeList = $entity->getAttributeList();

$attributeType = $entity->getAttributeType('attributeName');

$paramValue = $entity->getAttributeParam('attributeName', 'attributeParam');
```

Attribute types:

* id
* varchar
* int
* float
* text
* bool
* foreign
* foreignId
* foreignType
* date
* datetime
* jsonArray
* jsonObject

### Relations

```php
$relationList = $entity->getRelationList();

$type = $entity->getRelationType('relationName'); 

$paramValue = $entity->getRelationParam('relationName', 'paramName')
```

Relation types:

* manyMany
* hasMany
* belongsTo
* hasOne
* belongsToParent
* hasChildren

### Find

```php
$accountList = $entityManager->getRepository('Account')->where([
    'type' => 'Customer',
])->find();
```

Descending order:

```php
$accountList = $entityManager->getRepository('Account')
    ->limit(0, 10)
    ->order('createdAt', true)
    ->find();
```

Ascending order:
```php
$accountList = $entityManager->getRepository('Account')
  ->limit(0, 10)
  ->order('createdAt')
  ->find();
```

or:
```php
$accountList = $entityManager->getRepository('Account')
  ->limit(0, 10)
  ->order('createdAt', 'DESC')
  ->find();
```

Complex order:
```php
$accountList = $entityManager->getRepository('Account')
  ->order([
    ['createdAt', 'ASC'],
    ['name', 'DESC'],
  ])
  ->find();
```

Ordering by list:

```php
$opportunityList = $entityManager->getRepository('Opportunity')
  ->order('LIST:stage:Prospectring,Qualification,Proposal')
  ->find();
```

### Find the first one

```php
$account = $entityManager->getRepository('Account')->where([
    'type' => 'Customer',
])->findOne();
```

### Find related

```php
$opportunityList = $entityManager->getRepository('Account')->findRelated($account, 'opportunities');
```

### Relate entities

```php
$entityManager->getRepository('Account')->relate($account, 'opportunities', $opportunity);

// or
$entityManager->getRepository('Account')->relate($account, 'opportunities', $opportunityId);
```

### Unrelate entities

```php
$entityManager->getRepository('Account')->unrelate($account, 'opportunities', $opportunity);

// or
$entityManager->getRepository('Account')->unrelate($account, 'opportunities', $opportunityId);
```

### Check related

```php
$entityManager->getRepository('EntityType')->isRelated($entity, 'relationName', $relatedEntity);

// or
$entityManager->getRepository('EntityType')->isRelated($entity, 'relationName', $id);
```

## Select Query Parameters

### Where clause

#### Comparison operators

Supported comparison operators: `>`, `<`, `>=`, `<=`, `=`, `!=`.

```php
$opportunityList = $entityManager->getRepository('Opportunity')->where([
  'amount>=' => 100
])->find();
```

#### IN and NOT IN operators

```php
$opportunityList = $entityManager->getRepository('Opportunity')->where([
  'stage' => ['Closed Lost', 'Closed Won']
 ])->find();
```

```
$opportunityList = $entityManager->getRepository('Opportunity')->where([
  'stage!=' => ['Closed Lost', 'Closed Won']
])->find();
```

#### LIKE operators

Supported  operators:

* `*` - LIKE
* `!*` - NOT LIKE

```php
$opportunityList = $entityManager->getRepository('Opportunity')->where([
  'name*' => '%service%'
])->find();
```

#### OR, AND operators

```php
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

### Distinct

```
$opportunityList = $entityManager->getRepository('Opportunity')->distinct()->find();
```

### Join

Join relationship:
```php
$contactList = $entityManager->getRepository('Contact')
  ->distinct()
  ->join('opportunities')
  ->where([
    'opportunities.stage' => 'Closed Won',
  ])->find();
```

Left Join relationship:
```php
$contactList = $entityManager->getRepository('Contact')
  ->distinct()
  ->leftJoin('opportunities')
  ->find();
```

'opportunities' is a relationship name.

Joining any table:

```php
$meetingList = $entityManager->getRepository('Meeting')
  ->join([
      [
          'MeetingUser', // meeting_user table
          'meetingUser', // it's an alias
          [
              'meetingUser.meetingId:' => 'meeting.id' // join condition;
                                                       // colon indicates that the right part is not a value;
                                                       // it translates to meetingUser.meeting_id = meeting.id
          ]
      ]
  ])->where([
    'meetingUser.userId' => $user->id,
  ])->find();
```

Join table alias:
```php
$contactList = $entityManager->getRepository('Contact')
    ->distinct()
    ->join([['opportunities', 'aliasForJoinedTable']])
    ->where([
      'aliasForJoinedTable.stage' => 'Closed Won'
    ])->find();
```

### Group By

```php
$selectParams = [
  'select' => ['MONTH:closeDate', 'SUM:amountConverted']
  'groupBy' => ['MONTH:closeDate'],
  'whereClause' => [
    'stage' => 'Closed Won'
  ],
  'orderBy' => 1, // ordering by the first column
];

$pdo = $this->getEntityManager()->getPDO();
$sql = $this->getEntityManager()->getQuery()->createSelectQuery('Opportunity', $selectParams);
$sth = $pdo->prepare($sql);
$sth->execute();

// results
$rowList = $sth->fetchAll(\PDO::FETCH_ASSOC);
```

### Additional Params

#### STH collection


Can be used with `find` and `findRelated` methods. With this param provided, they will return a collection that doesn't allocate memory for all result data.

```
$collection = $entityManager->getRepository('Email')
  ->limit(0, 10000)
  ->sth()
  ->find();

foreach ($collection as $entity) {
    // memory is allocated for each item, when collection is iterated
}
```

### Complex expressions

`MONTH:closeDate` and `SUM:amountConverted` in the example above are complex expressions. [See more](../user-guide/complex-expressions.md) about them.
