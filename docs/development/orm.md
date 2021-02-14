# ORM, How to manage entities and perform queries

EspoCRM has built-in own ORM (Object-relational mapping). It’s very simple to create, update, read, delete and search entities. All these operations available through EntityManager object.

**EntityManager** is available in [*Container*](di.md). It's a central access point for ORM functionalities.

**Repository** serves for fetching and storing records. Each entity type has its own repository. Base classes: `Espo\ORM\Repositories\RDB`, `Espo\Core\Repositories\Database`. *RDB* stands for *relational database*.

**Entity** represents a single record. Each entity type has it's own entity class. Base classes: `Espo\ORM\Entity`, `Espo\Core\ORM\Entity`.

**EntityCollection** is a collection of entities. It's returned by *find* operations.

**SthCollection** is a collection of entities, consuming much less memory than EntityCollection.

## See Also

* [Complex expressions](../user-guide/complex-expressions.md)

## Injecting Entity Manager

Entity Manager is available as a [*Container*](di.md) service.

A class with the `entityManager` dependency:

```php
<?php
namespace Espo\SomeNamespace;

use Espo\ORM\EntityManager;

class SomeClass
{
    protected $entityManager;
    
    public function __construct(EntityManager $entityManager)
    {
        $this->entityManager = $entityManager;
    }
}

```

## Entity Manager usage

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

### Get attribute value

```php
$fieldValue = $account->get('attributeName');
```

### Has attribute value

Checks whether an attribute is set. Note: If it's set to `NULL` it will return `true`.

```php
$fieldNameIsSet = $account->has('fieldName'); // true or false
```

### Set attribute value

One:

```php
$account->set('attributeName', 'Test Account');
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
$isChanged = $entity->isChanged('attributeName');
```

### Get all attribute values

```php
$valueMap = $account->getValueMap(); // StdClass
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

### Attributes

Note: As of v6.2.0 it's recommended to use *ORM Defs* to get entity definitions. See below about ORM Defs.

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

Note: As of v6.2.0 it's recommended to use *ORM Defs* to get entity definitions. See below about ORM Defs.

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
$collection = $entityManager
    ->getRepository('Account')
    ->where([
        'type' => 'Customer',
    ])
    ->find();
```

Descending order:

```php
$collection = $entityManager
    ->getRepository('Account')
    ->limit(0, 10)
    ->order('createdAt', true)
    ->find();
```

Ascending order:

```php
$collection = $entityManager
    ->getRepository('Account')
    ->limit(0, 10)
    ->order('createdAt')
    ->find();
```

Descending order:
```php
$collection = $entityManager
    ->getRepository('Account')
    ->limit(0, 10)
    ->order('createdAt', 'DESC')
    ->find();
```

Complex order:

```php
$collection = $entityManager
    ->getRepository('Account')
    ->order([
        ['createdAt', 'ASC'],
        ['name', 'DESC'],
    ])
    ->find();
```

Or:

```php
$collection = $entityManager
    ->getRepository('Account')
    ->order('createdAt', 'ASC')
    ->order('name', 'DESC')
    ->find();
```

Ordering by a value list:

```php
$collection = $entityManager
    ->getRepository('Opportunity')
    ->order('LIST:stage:Prospectring,Qualification,Proposal')
    ->find();
```

Feeding a query to a repository:

```php
$collection = $entityManager
    ->getRepository('SomeEntityType')
    ->clone($query)
    ->limit(0, 10)
    ->find();
```

### Find the first one

```php
$account = $entityManager
    ->getRepository('Account')
    ->where([
        'type' => 'Customer',
    ])
    ->findOne();
```

### Find related

Before v6.0:

```php
$opportunityCollection = $entityManager
    ->getRepository('Account')
    ->findRelated($account, 'opportunities');
```

Since v6.0:

```php
$opportunityCollection = $entityManager
    ->getRepository('Account')
    ->getRelation($account, 'opportunities')
    ->limit(0, 10)
    ->where($whereClause)
    ->find();

$opportunity = $entityManager
    ->getRepository('Account')
    ->getRelation($account, 'opportunities')
    ->order('createdAt', 'DESC')
    ->findOne();
```

Filtering by a relation column:

```php
 $leads = $entityManager
    ->getRepository('TargetList')
    ->getRelation($targetList, 'leads')
    ->where([
        '@relation.optedOut' => false,
    ])
    ->find();
```


### Relate entities

Before v6.0:

```php
$entityManager->getRepository('Account')->relate($account, 'opportunities', $opportunity);

// or
$entityManager->getRepository('Account')->relate($account, 'opportunities', $opportunityId);
```

Since v6.0:

```php
$entityManager
    ->getRepository('Account')
    ->getRelation($account, 'opportunities')
    ->relate($opportunity);

$entityManager
    ->getRepository('Account')
    ->getRelation($account, 'opportunities')
    ->relateById($opportunityId);

$entityManager
    ->getRepository('Account')
    ->getRelation($account, 'contacts')
    ->relate($contact, [
        'role' => 'CEO', // relationship column
    ]);
```

### Unrelate entities

Before v6.0:

```php
$entityManager->getRepository('Account')->unrelate($account, 'opportunities', $opportunity);

// or
$entityManager->getRepository('Account')->unrelate($account, 'opportunities', $opportunityId);
```

Since v6.0:

```php
$entityManager
    ->getRepository('Account')
    ->getRelation($account, 'opportunities')
    ->unrelate($opportunity);

$entityManager
    ->getRepository('Account')
    ->getRelation($account, 'opportunities')
    ->unrelateById($opportunityId);
```

### Update columns

Since v6.0:

```php
$entityManager
    ->getRepository('Account')
    ->getRelation($account, 'contacts')
    ->updateColumns($contact, [
        'role' => 'CEO', // relationship column
    ]);

$entityManager
    ->getRepository('Account')
    ->getRelation($account, 'contacts')
    ->updateColumnsById($contactId, [
        'role' => 'CEO', // relationship column
    ]);
```


### Check related

Before v6.0:

```php
$entityManager->getRepository('EntityType')->isRelated($entity, 'relationName', $relatedEntity);

// or
$entityManager->getRepository('EntityType')->isRelated($entity, 'relationName', $id);
```


Since v6.0:

```php
$isRelated = $entityManager
    ->getRepository('Account')
    ->getRelation($account, 'opportunities')
    ->isRelated($opportunity);
```

## Select Query Parameters

### Where clause

#### Comparison operators

Supported comparison operators: `>`, `<`, `>=`, `<=`, `=`, `!=`.

```php
$opportunityList = $entityManager
    ->getRepository('Opportunity')
    ->where([
      'amount>=' => 100
    ])
    ->find();
```

#### IN and NOT IN operators

```php
$opportunityList = $entityManager
    ->getRepository('Opportunity')
    ->where([
      'stage' => ['Closed Lost', 'Closed Won']
    ])
    ->find();
```

```
$opportunityList = $entityManager
    ->getRepository('Opportunity')
    ->where([
        'stage!=' => ['Closed Lost', 'Closed Won']
    ])
    ->find();
```

#### LIKE operators

Supported  operators:

* `*` - LIKE
* `!*` - NOT LIKE

```php
$opportunityList = $entityManager
    ->getRepository('Opportunity')
    ->where([
        'name*' => '%service%',
    ])
    ->find();
```

#### OR, AND operators

```php
$opportunityList = $entityManager
    ->getRepository('Opportunity')
    ->where([
        [
            'OR' => [
                ['stage' => 'Closed Won'],
                ['stage' => 'Closed Lost'],
            ],
            'AND' => [
                'amountConverted>' => 100,
                'amountConverted<=' => 999,
            ],
        ]
    ])
    ->findOne();
```

#### Sub-query operator

```php
// $query is the instance of Espo\ORM\QueryParams\Select

$collection = $entityManager
    ->getRepository('EntityType')
    ->where([
        'id=s' => $query->getRaw(),
    ])
    ->find();

```

### Distinct

```php
$opportunityList = $entityManager
    ->getRepository('Opportunity')
    ->distinct()
    ->find();
```

### Join

Join relationship:

```php
$contactList = $entityManager
    ->getRepository('Contact')
    ->distinct()
    ->join('opportunities')
    ->where([
        'opportunities.stage' => 'Closed Won',
    ])
    ->find();
```

Left Join relationship:

```php
$contactList = $entityManager
    ->getRepository('Contact')
    ->distinct()
    ->leftJoin('opportunities')
    ->find();
```

'opportunities' is a relationship name.

Joining any table:

```php
$meetingList = $entityManager
    ->getRepository('Meeting')
    ->join(
        'MeetingUser', // meeting_user table
        'meetingUser', // it's an alias
        [
          'meetingUser.meetingId:' => 'meeting.id', // join condition;
                                                   // colon indicates that the right part is not a value;
                                                   // it translates to meetingUser.meeting_id = meeting.id
        ],
    )
    ->where([
        'meetingUser.userId' => $user->id,
    ])
    ->find();
```

Join table alias:

```php
$contactList = $entityManager
    ->getRepository('Contact')
    ->distinct()
    ->join('opportunities', 'aliasForJoinedTable')
    ->where([
      'aliasForJoinedTable.stage' => 'Closed Won'
    ])
    ->find();
```

### Group By

```php

$query = $entityManager
    ->getQueryBuilder()
    ->select() // indicates that we build a SELECT query
    ->from('Opportunity') // entity type
    ->select(['MONTH:(closeDate)', 'SUM:(amountConverted)']) // complex expressions
    ->groupBy('MONTH:(closeDate)') // complex expression
    ->whereClause([
        'stage' => 'Closed Won',
    ])
    ->order(1) // ordering by the first column
    ->build();

$pdoStatement = $entityManager
    ->getQueryExecutor()
    ->execute($query);

$rowList = $pdoStatement->fetchAll(\PDO::FETCH_ASSOC);

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

`MONTH:(closeDate)` and `SUM:(amountConverted)` in the example above are complex expressions. [See more](../user-guide/complex-expressions.md) about them.


## Query builder

Delete:

```php
$select = $entityManager
    ->getQueryBuilder()
    ->select()
    ->from('SomeTable')
    ->where([
        'someColumn' => 'someValue',
    ])
    ->build();

$entityManager
    ->getQueryExecutor()
    ->execute($select);
```

Select:

```php
$select = $entityManager
    ->getQueryBuilder()
    ->select()
    ->from('SomeTable')
    ->select(['column1', 'column2', 'someExpression'])
    ->order('column1', 'DESC')
    ->limit(0, 10)
    ->build();

$pdoStatement = $entityManager
    ->getQueryExecutor()
    ->execute($select);
```

```php
$select = $entityManager
    ->getQueryBuilder()
    ->select()
    ->from('SomeTable')
    ->select('SUM:(someColumn)', 'value')
    ->select('anotherColumn')
    ->groupBy('anotherColumn')
    ->build();

$row = $entityManager
    ->getQueryExecutor()
    ->execute($select)
    ->fetch();

$sum = $row['value'];
```

Update:

```php
$update = $entityManager
    ->getQueryBuilder()
    ->update()
    ->in('SomeTable')
    ->set(['status' => 'Expired'])
    ->where([
        'status' => 'Pending',
        'expiresAt' => $dateTimeString,
    ])
    ->build();

$entityManager->getQueryExecutor()->execute($update);
```

Update with join:

```php
$update = $entityManager
    ->getQueryBuilder()
    ->update()
    ->in('SomeTable')
    ->set(['column:' => 'joinAlias.foreignColumn'])
    ->join('AnotherTable', 'joinAlias', ['joinAlias.foreignId:' => 'id'])
    ->where([
        'someColumn' => 'someValue',
    ])
    ->build();

$entityManager
    ->getQueryExecutor()
    ->execute($update);
```

Insert:

```php
$insert = $entityManager
    ->getQueryBuilder()
    ->insert()
    ->into('SomeTable')
    ->columns(['column1', 'column2'])
    ->values([
        'column1' => 'value1',
        'column2' => 'value2',
    ])
    ->build();

$entityManager->getQueryExecutor()->execute($insert);
```

Mass insert:

```php
$insert = $entityManager
    ->getQueryBuilder()
    ->insert()
    ->into('SomeTable')
    ->columns(['column'])
    ->values([
        ['column1' => 'value1'],
        ['column2' => 'value2'],
    ])
    ->build();

$entityManager
    ->getQueryExecutor()
    ->execute($insert);
```

Mass insert by populating with a select sub-query:

```php
$insert = $entityManager
    ->getQueryBuilder()
    ->insert()
    ->into('SomeTable')
    ->columns(['column'])
    ->valuesQuery($subQuery)
    ->build();

$entityManager
    ->getQueryExecutor()
    ->execute($insert);
```

Union:

```php
$union = $entityManager
    ->getQueryBuilder()
    ->union()
    ->all()
    ->query($subQuery1)
    ->query($subQuery2)
    ->order(1, 'DESC')
    ->limit(0, 5)
    ->build();

$sth = $entityManager
    ->getQueryExecutor()
    ->execute($union);
```

Cloning and modifying an existing query:

```php
$clonedQuery = $entityManager
    ->getQueryBuilder()
    ->clone($query)
    ->limit(0, 10)
    ->build();
```

## Mass insert

Mass insert with Mapper:

```php
$entityManager->getMapper()->massInsert($collection);
```

## Transaction manager

Transaction:

```php
$tm = $entityManager->getTransactionManager();
$tm->start();

try {
    // do something
    $tm->commit();
}
catch (Throwable $e) {
    $tm->rollback(); // this will roll back everything done within the transaction
}
```

Nested transactions:

```php
$tm = $entityManager->getTransactionManager();

$tm->start();

// do something

$tm->start();

// do something

$tm->commit();

// do something

$tm->commit();
```

Running a function in a transaction:

```php
$entityManager
    ->getTransactionManager()
    ->run(
        function () {
            // transaction started implicitly
            // do something
            // transaction committed implicitly or rolled back if an exception occurred
        }
    );
```

Locking:

```php
$entityManager->getTransactionManager()->start();

$entity = $entityManager
    ->getRepository('SomeTable')
    ->where(['id' => $id])
    ->forUpdate() // this will lock selected rows until the transaction is finished
    ->findOne();

// do something with entity

$entityManager->saveEntity($entity);

$entityManager->getTransactionManager()->commit();
```

## Locker

```php
// this will start a transaction implicitly and lock a table
$entityManager->getLocker()->lockExclusive('SomeEntityType');

// do something

// this will unlock all locked tables
$entityManager->getLocker()->commit();
```

## Defs

Available as of v6.2.0.

```php
$defs = $entityManager->getDefs();
```

ORM Defs can also be required as a dependency so that it will be injected into your class. Use the type hint `Espo\ORM\Defs\Defs`.

Check entity existance:

```php
$entityExists = $defs->hasEntity($entityType);
```

Entity defs:

```php
$entityDefs = $defs->getEntity($entityType);
```

An attribute list:

```php
$attributeList = $entityDefs->getAttributeNameList();
```

Attribute defs:

```php
$attributeDefs = $entityDefs->getAttribute($attributeName);
```

A relation list:

```php
$relationList = $entityDefs->getRelationNameList();
```

Relation defs:

```php
$relationDefs = $entityDefs->getRelation($relationName);
```

See all available methods in `Espo\ORM\Defs\AttributeDefs` and `Espo\ORM\Defs\RelationDefs`.

