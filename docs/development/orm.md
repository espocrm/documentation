# ORM. How to manage entities and perform queries

EspoCRM has built-in own ORM (Object-relational mapping). It’s very simple to create, update, read, delete and search entities. All these operations available through EntityManager object.

The *EntityManager* is available as a [*container service*](di.md). It's a central access point for ORM functionalities.

A **Repository** class serves for fetching and storing records. Base classes: `Espo\ORM\Repositories\RDBRepository`, `Espo\Core\Repositories\Database`. *RDB* stands for a *relational database*.

An *Entity* class represents a single record. Each entity type has it's own entity class. Base class: `Espo\Core\ORM\Entity`, interface: `Espo\ORM\Entity`.

A *EntityCollection* is a collection of entities. It's returned by *find* operations.

An *SthCollection* is a collection of entities, consuming much less memory than EntityCollection.

## See also

* [Complex expressions](../user-guide/complex-expressions.md)
* [Value objects](orm-value-objects.md)

## Injecting Entity Manager

The Entity Manager is available as a [*Container*](di.md) service.

A class with the `entityManager` dependency:

```php
<?php
namespace Espo\SomeNamespace;

use Espo\ORM\EntityManager;

class SomeClass
{
    private EntityManager $entityManager;
    
    public function __construct(EntityManager $entityManager)
    {
        $this->entityManager = $entityManager;
    }
}

```

## Entity Manager usage

### Create new entity

```php
$entity = $entityManager->getEntity($entityType)
```

Note: It creates a new instance but doesn't store it in DB. The entity doesn't have ID yet.

### Fetch existing entity

```php
$entity = $entityManager->getEntity($entityType, $id);
```

### Store entity

```php
$entityManager->saveEntity($entity);
```

With options:

```php
$entityManager->saveEntity($entity, [
    \Espo\Core\ORM\Repository\SaveOption::SILENT => true,
]);
```

Options:

* skipHooks – skip all hooks; workflows, formula will be ignored;
* silent – workflows will be ignored, modified fields won't be change;
* skipAll – skip all additional processing;
* skipCreatedBy – createdBy won't be set with current user;
* skipModifiedBy – modifiedBy won't be set with current user;
* createdById – override createdBy;
* modifiedById – override modifiedBy.

### Create and store entity

```php
$entity = $entityManager->createEntity($entityType, [
    'name' => 'Test',
]);
```

### Remove entity

```php
$entityManager->removeEntity($entity);
```

### Get attribute value

```php
$attributeValue = $entity->get('attributeName');
```

### Has attribute value

Checks whether an attribute is set. Note: If it's set to `NULL` it will return `true`.

```php
$attributeIsSet = $entity->has('attributeName'); // true or false
```

### Set attribute value

One:

```php
$entity->set('attributeName', 'Test Value');
```

Multiple:

```php
$entity->set([
    'name' => 'Test Name',
    'assignedUserId' => '1',
]);
```

### Clear attribute value

```php
$entity->clear('attributeName');
```

It will unset the attribute. If you save the entity after that, it will not change the value to NULL in database.

### Fetched attributes

You can check whether an attribute was changed.

```php
// a value that was set once the record was fetched from DB
$value = $entity->getFetched('attributeName')

// check whether an attribute was changed since the last syncing with DB
$attributeChanged = $entity->isAttributeChanged('attributeName');
```

### Get all attribute values

```php
$valueMap = $entity->getValueMap(); // stdClass
```

### Delete from DB

```php
$entityManager->getRDBRepository($entityType)->deleteFromDb($id);
```

This will delete a record permanently.

### Attributes

Note: As of v7.0 it's recommended to use *ORM Defs* to get entity definitions. See below about ORM Defs.

Each entity type has its own set of defined attributes. You cannot set an arbitrary attribute name.

```php
// whether attribute is defined for entity
$hasAttribute = $entity->hasAttribute('attributeName');

$attributeList = $entity->getAttributeList();

$attributeType = $entity->getAttributeType('attributeName');

$paramValue = $entity->getAttributeParam('attributeName', 'attributeParam');
```

Attribute types:

* `Entity::ID`
* `Entity::VARCHAR`
* `Entity::INT`
* `Entity::FLOAT`
* `Entity::TEXT`
* `Entity::VARCHAR`
* `Entity::FOREIGN`
* `Entity::FOREIGN_ID`
* `Entity::FOREIGN_TYPE`
* `Entity::DATE`
* `Entity::DATETIME`
* `Entity::JSON_ARRAY`
* `Entity::JSON_OBJECT`

### Relations

Note: As of v7.0 it's recommended to use *ORM Defs* to get entity definitions. See below about ORM Defs.

```php
$relationList = $entity->getRelationList();

$type = $entity->getRelationType('relationName');

$paramValue = $entity->getRelationParam('relationName', 'paramName')
```

Relation types:

* `Entity::MANY_MANY`
* `Entity::HAS_MANY`
* `Entity::BELONGS_TO`
* `Entity::HAS_ONE`
* `Entity::BELONGS_TO_PARENT`
* `Entity::HAS_CHILDREN`

### Find

```php
$collection = $entityManager
    ->getRDBRepository($entityType)
    ->where([ // where clause
        'type' => 'Customer',
    ])
    ->find();
```

Descending order:

```php
$collection = $entityManager
    ->getRDBRepository($entityType)
    ->limit(0, 10)
    ->order('createdAt', true)
    ->find();
```

Ascending order:

```php
$collection = $entityManager
    ->getRDBRepository($entityType)
    ->limit(0, 10)
    ->order('createdAt')
    ->find();
```

Descending order:

```php
$collection = $entityManager
    ->getRDBRepository($entityType)
    ->limit(0, 10)
    ->order('createdAt', 'DESC')
    ->find();
```

Complex order:

```php
$collection = $entityManager
    ->getRDBRepository($entityType)
    ->order([
        ['createdAt', 'ASC'],
        ['name', 'DESC'],
    ])
    ->find();
```

Or:

```php
$collection = $entityManager
    ->getRDBRepository($entityType)
    ->order('createdAt', 'ASC')
    ->order('name', 'DESC')
    ->find();
```

Or (as of v7.0):

```php
<?php
use Espo\ORM\Query\Part\Expression as Expr;

$collection = $entityManager
    ->getRDBRepository($entityType)
    ->order(
        Expr::concat(
            Expr::column('firstName'),
            Expr::column('lastName')
        ),
        'DESC',            
    )
    ->find();
```

Ordering by a value list:

```php
$collection = $entityManager
    ->getRDBRepository('Opportunity')
    ->order('LIST:stage:Prospectring,Qualification,Proposal')
    ->find();
```

Feeding a query to a repository:

```php
$collection = $entityManager
    ->getRDBRepository($entityType)
    ->clone($query)
    ->limit(0, 10)
    ->find();
```

### Find the first one

```php
$entity = $entityManager
    ->getRDBRepository($entityType)
    ->where([
        'type' => 'Customer',
    ])
    ->findOne();
```

### Find related

```php
$opportunityCollection = $entityManager
    ->getRDBRepository('Account')
    ->getRelation($account, 'opportunities')
    ->limit(0, 10)
    ->where($whereClause)
    ->find();

$opportunity = $entityManager
    ->getRDBRepository('Account')
    ->getRelation($account, 'opportunities')
    ->order('createdAt', 'DESC')
    ->findOne();
```

Filtering by a relation column:

```php
 $leads = $entityManager
    ->getRDBRepository('TargetList')
    ->getRelation($targetList, 'leads')
    ->where([
        '@relation.optedOut' => false,
    ])
    ->find();
```

### Relate entities

```php
$entityManager
    ->getRDBRepository('Account')
    ->getRelation($account, 'opportunities')
    ->relate($opportunity);

$entityManager
    ->getRDBRepository('Account')
    ->getRelation($account, 'opportunities')
    ->relateById($opportunityId);

$entityManager
    ->getRDBRepository('Account')
    ->getRelation($account, 'contacts')
    ->relate($contact, [
        'role' => 'CEO', // relationship column
    ]);
```

### Unrelate entities

```php
$entityManager
    ->getRDBRepository('Account')
    ->getRelation($account, 'opportunities')
    ->unrelate($opportunity);

$entityManager
    ->getRDBRepository('Account')
    ->getRelation($account, 'opportunities')
    ->unrelateById($opportunityId);
```

### Update columns

```php
$entityManager
    ->getRDBRepository('Account')
    ->getRelation($account, 'contacts')
    ->updateColumns($contact, [
        'role' => 'CEO', // relationship column
    ]);

$entityManager
    ->getRDBRepository('Account')
    ->getRelation($account, 'contacts')
    ->updateColumnsById($contactId, [
        'role' => 'CEO', // relationship column
    ]);
```


### Check whether related

```php
$isRelated = $entityManager
    ->getRDBRepository('Account')
    ->getRelation($account, 'opportunities')
    ->isRelated($opportunity);
```

## Select Query Parameters

### Where clause

#### Comparison operators

Supported comparison operators: `>`, `<`, `>=`, `<=`, `=`, `!=`.

```php
$opportunityList = $entityManager
    ->getRDBRepository('Opportunity')
    ->where([
      'amount>=' => 100
    ])
    ->find();
```

#### IN and NOT IN operators

```php
$opportunityList = $entityManager
    ->getRDBRepository('Opportunity')
    ->where([
        'stage' => ['Closed Lost', 'Closed Won']
    ])
    ->find();
```

```php
$opportunityList = $entityManager
    ->getRDBRepository('Opportunity')
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
    ->getRDBRepository('Opportunity')
    ->where([
        'name*' => '%service%',
    ])
    ->find();
```

#### OR, AND operators

```php
$opportunityList = $entityManager
    ->getRDBRepository('Opportunity')
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
// $query is the instance of Espo\ORM\Query\Select

$collection = $entityManager
    ->getRDBRepository($entityType)
    ->where([
        'id=s' => $query->getRaw(),
    ])
    ->find();
```

#### Condition

Available as of v7.0.

```php
use Espo\ORM\Query\Part\Condition as Cond;

$collection = $entityManager
    ->getRDBRepository($entityType)
    ->where(
        Cond::or(
            Cond::equal(Cond::column('someColumn'), '1'),
            Cond::equal(Cond::column('someColumn'), '2')
        )
    )
    ->find();
```

```php
use Espo\ORM\Query\Part\Condition as Cond;

$collection = $entityManager
    ->getRDBRepository($entityType)
    ->where(
        Cond::in(Cond::column('id'), $subQuery)
    )
    ->find();
```

### Distinct

```php
$opportunityList = $entityManager
    ->getRDBRepository('Opportunity')
    ->distinct()
    ->find();
```

### Join

Join relationship:

```php
$contactList = $entityManager
    ->getRDBRepository('Contact')
    ->distinct()
    ->join('opportunities')
    ->where([
        'opportunities.stage' => 'Closed Won',
    ])
    ->find();
```

Left-Join relationship:

```php
$contactList = $entityManager
    ->getRDBRepository('Contact')
    ->distinct()
    ->leftJoin('opportunities')
    ->find();
```

'opportunities' is a relationship name.

Join alias:

```php
$contactList = $entityManager
    ->getRDBRepository('Contact')
    ->distinct()
    ->join('opportunities', 'aliasForJoinedTable')
    ->where([
        'aliasForJoinedTable.stage' => 'Closed Won'
    ])
    ->find();
```

Joining any table (a table name should start with an apper case letter):

```php
$meetingList = $entityManager
    ->getRDBRepository('Meeting')
    ->join(
        'MeetingUser', // meeting_user table
        'meetingUser', // alias
        [
            // Colon indicates that the right part is not a value.
            // It translates to `meetingUser.meeting_id = meeting.id`.
            'meetingUser.meetingId:' => 'id', // join condition
            'meetingUser.deleted' => false, // important
        ],
    )
    ->where([
        'meetingUser.userId' => $user->getId(),
    ])
    ->find();
```

Joining a table with the query builder:

```php
$query = $entityManager
    ->getRDBRepository('Meeting')
    ->select([
        'id',
        'name',
        ['meetingUser.status', 'meetingStatus'], // expression and alias
    ])
    ->join(
        'MeetingUser', // meeting_user table
        'meetingUser', // alias
        [
            'meetingUser.meetingId:' => 'id', // join condition
            'meetingUser.deleted' => false, // important
        ],
    )
    ->where([
        'meetingUser.userId' => $user->getId(),
    ])
    ->find();
```

Important: When joining by a table name (upper case is used), `'deleted' => false` filter is not applied implicitly. You need to provide it explicitly.


### Group By

```php
$query = $entityManager
    ->getQueryBuilder()
    ->select()
    ->from('Opportunity') // entity type
    ->select(['MONTH:(closeDate)', 'SUM:(amountConverted)']) // complex expressions
    ->groupBy('MONTH:(closeDate)') // complex expression
    ->where([
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

If STH is set (with `sth` method), the find method will return a collection (instance of `SthCollection`) that doesn't allocate memory for all result data.

```php
$collection = $entityManager
    ->getRDBRepository('Email')
    ->limit(0, 10000)
    ->sth()
    ->find();

foreach ($collection as $entity) {
    // memory is allocated for each item, when collection is iterated
}
```

### Complex expressions

`MONTH:(closeDate)` and `SUM:(amountConverted)` in the example above are complex expressions. [See more](../user-guide/complex-expressions.md) about them.

It's possible to build expressions with the *Expression* class (as of v7.0).

```php
use Espo\ORM\Query\Part\Expression as Expr;

$queryBuilder->select(
    Expr::if(
        Expr::greaterOrEqual(Expr::column('opportunity.amount'), 1000),
        '1000 or more',
        'less than 1000'
    ),
    'alias'         
);
```

```php
use Espo\ORM\Query\Part\Expression as Expr;

$queryBuilder->where(
    Expr::greater(
        Expr::column('opportunity.amount'),
        1000
    )
);
```

It's possible to add custom functions (as of v7.0.8). An implementation class name for a custom function should be defined in metadata by the path app > orm > functionConverterClassNameMap_Mysql. The class should implement `Espo\ORM\QueryComposer\Part\FunctionConverter` interface.

## Query builder

Delete:

```php
$deleteQuery = $entityManager
    ->getQueryBuilder()
    ->delete()
    ->from('SomeTable')
    ->where([
        'someColumn' => 'someValue',
    ])
    ->build();

$entityManager
    ->getQueryExecutor()
    ->execute($deleteQuery);
```

Select:

```php
$selectQuery = $entityManager
    ->getQueryBuilder()
    ->select(['column1', 'column2', 'someExpression'])
    ->from('SomeTable')    
    ->order('column1', 'DESC')
    ->limit(0, 10)
    ->build();

$pdoStatement = $entityManager
    ->getQueryExecutor()
    ->execute($selectQuery);
```

```php
$selectQuery = $entityManager
    ->getQueryBuilder()
    ->select('SUM:(someColumn)', 'value')
    ->from('SomeTable')    
    ->select('anotherColumn')
    ->groupBy('anotherColumn')
    ->build();

$row = $entityManager
    ->getQueryExecutor()
    ->execute($selectQuery)
    ->fetch();

$sum = $row['value'];
```

Update:

```php
$updateQuery = $entityManager
    ->getQueryBuilder()
    ->update()
    ->in('SomeTable')
    ->set(['status' => 'Expired'])
    ->where([
        'status' => 'Pending',
        'expiresAt' => $dateTimeString,
    ])
    ->build();

$entityManager->getQueryExecutor()->execute($updateQuery);
```

Update with join:

```php
$updateQuery = $entityManager
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
    ->execute($updateQuery);
```

Insert:

```php
$insertQuery = $entityManager
    ->getQueryBuilder()
    ->insert()
    ->into('SomeTable')
    ->columns(['column1', 'column2'])
    ->values([
        'column1' => 'value1',
        'column2' => 'value2',
    ])
    ->build();

$entityManager->getQueryExecutor()->execute($insertQuery);
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
$insertQuery = $entityManager
    ->getQueryBuilder()
    ->insert()
    ->into('SomeTable')
    ->columns(['column'])
    ->valuesQuery($subQuery)
    ->build();

$entityManager
    ->getQueryExecutor()
    ->execute($insertQuery);
```

Union:

```php
$unionQuery = $entityManager
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
    ->execute($unionQuery);
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
    ->getRDBRepository('SomeTable')
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

Available as of v7.0.

```php
$defs = $entityManager->getDefs();
```

ORM Defs can also be required as a dependency so that it will be injected into your class. Use the type hint `Espo\ORM\Defs`.

Check entity existence:

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

A field list:

```php
$fieldList = $entityDefs->getFieldNameList();
```

Field defs:

```php
$fieldDefs = $entityDefs->getField($field);
```

See all available methods in:

* `Espo\ORM\Defs\EntityDefs`
* `Espo\ORM\Defs\AttributeDefs`
* `Espo\ORM\Defs\RelationDefs`
* `Espo\ORM\Defs\FieldDefs`
* `Espo\ORM\Defs\IndexDefs`
