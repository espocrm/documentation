# ORM

EspoCRM utilizes own built-in ORM (object-relational mapping). Create, update, read, delete and search operations are performed via the Entity Manager instance.

The *EntityManager* is available as a [*container service*](di.md). It's a central access point for ORM functionalities.

A *Repository* class serves for fetching and storing records. Base classes: `Espo\ORM\Repositories\RDBRepository`, `Espo\Core\Repositories\Database`. *RDB* stands for a *relational database*.

An *Entity* class represents a single record. Each entity type has its own entity class. Base class: `Espo\Core\ORM\Entity`, interface: `Espo\ORM\Entity`.

An *EntityCollection* is a collection of entities. It's returned by *find* operations. An *SthCollection* is a collection of entities, consuming much less memory than EntityCollection. Collections are iterable.

The ORM uses a data-mapper approach. Note that it does not have an identity map – fetching the same record multiple times in a row will return different instances (of the same record).

## See also

* [Complex expressions](../user-guide/complex-expressions.md)
* [Value objects](orm-value-objects.md)
* [Custom entity type](custom-entity-type.md)
* [Entity definitions](metadata/entity-defs.md)

## Injecting Entity Manager

The Entity Manager is available as a [*Container*](di.md) service.

A class with the `entityManager` dependency:

```php
<?php
namespace Espo\SomeNamespace;

use Espo\ORM\EntityManager;

class SomeClass
{    
    public function __construct(private EntityManager $entityManager)
    {}
}
```

## Working with entities

### Create new entity

```php
<?php
$entity = $entityManager->getNewEntity($entityType)
```

Or type hinted:

```php
<?php
use Espo\Modules\MyModule\Entities\MyEntity;

// Will infer a proper MyEntity type. Useful for static analysis and IDEs
// that support generic types.
$entity = $entityManager->getRDBRepositoryByClass(MyEntity::class)->getNew();
```

!!! note

    It creates a new instance but doesn't store it in DB. The entity doesn't have ID yet.

### Fetch existing entity

```php
<?php
$entity = $entityManager->getEntityById($entityType, $id);
```

Or type hinted:

```php
<?php
use Espo\Modules\MyModule\Entities\MyEntity;

$entity = $entityManager->getRDBRepositoryByClass(MyEntity::class)->getById($id);
```

### Store entity

```php
<?php
$entityManager->saveEntity($entity);
```

#### Save options

Save with options:

```php
<?php
use Espo\Core\ORM\Repository\Option\SaveOption;

$entityManager->saveEntity($entity, [SaveOption::SILENT => true]);
```

Available options:

* skipAll – skip all additional processing;
* skipHooks – skip all hooks; workflows, formula will be ignored;
* silent – workflows will be ignored, modified fields won't be change;
* skipCreatedBy – createdBy won't be set with current user;
* skipModifiedBy – modifiedBy won't be set with current user;
* createdById – override createdBy;
* modifiedById – override modifiedBy.

Options in constants available here: `Espo\Core\ORM\Repository\Option\SaveOption`.

### Create and store entity

```php
<?php
$entity = $entityManager->createEntity($entityType, [
    'name' => 'Test',
    'status' => 'Hello',
]);
```

### Remove entity

```php
<?php
$entityManager->removeEntity($entity);
```

### Get attribute value

```php
<?php
$attributeValue = $entity->get('attributeName');
```

!!! note

    As EspoCRM supports custom fields and relationships which are added dynamically without the need to compile, attribute accessor methods *get*, *set* and *has* were introduced. For type safety, consider creating getters and setters for needed attributes in your custom Entity class. Use these methods in your business logic code.

### Has attribute value

Checks whether an attribute is set. Note: If it's set to `NULL` it will return `true`.

```php
<?php
$attributeIsSet = $entity->has('attributeName'); // true or false
```

### Set attribute value

One:

```php
<?php
$entity->set('attributeName', 'Test Value');
```

Multiple:

```php
<?php
$entity->setMultiple([
    'name' => 'Test Name',
    'assignedUserId' => '1',
]);
```

### Clear attribute value

```php
<?php
$entity->clear('attributeName');
```

This will unset the attribute. If you save the Entity after that, it will not change the value to NULL in database. Very rarely used. Not recommended.

### Fetched attributes

Check whether an attribute was changed.

```php
<?php
// a value that was set once the record was fetched from DB
$value = $entity->getFetched('attributeName');

// check whether an attribute was changed since the last syncing with DB
$attributeChanged = $entity->isAttributeChanged('attributeName');
```

### Get all attribute values

```php
<?php
$valueMap = $entity->getValueMap(); // stdClass
```

### Delete from DB

```php
<?php
$entityManager->getRDBRepository($entityType)->deleteFromDb($id);
```

This will delete the record permanently.

## Repository

Use the ORM's repositories to fetch and save entities.

!!! note

    It may be reasonable to wrap all interactions with the repository in a higher-level class (usually also called a Repository), so that your business-logic classes do not depend directly on the Entity Manager. This improves testability.

Get a repository by an entity class:

```php
<?php
use Espo\Modules\Crm\Entities\Account;

// Returns `Collection<Account>`.
$accountRepository = $entityManager->getRDBRepositoryByClass(Account::class);
```

```php
<?php
// The proper type of the returned Entity can be inferred. Useful
// for static analysis and IDEs that support generic types.
$account = $entityManager
    ->getRDBRepositoryByClass(Account::class)
    ->getById($id);
```

Get a repository by an entity type:

```php
<?php
// $entityType can be, for example, 'Opportunity'.

$repository = $entityManager->getRDBRepository($entityType);
```

### Find

```php
<?php
$collection = $entityManager
    ->getRDBRepository($entityType)
    ->where([
        'type' => 'Customer',
    ])
    ->find();
```

Descending order:

```php
<?php
$collection = $entityManager
    ->getRDBRepository($entityType)
    ->limit(0, 10)
    ->order('createdAt', 'DESC')
    ->find();
```

Complex order:

```php
<?php
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
<?php
$collection = $entityManager
    ->getRDBRepository($entityType)
    ->order('createdAt', 'ASC')
    ->order('name', 'DESC')
    ->find();
```

Or:

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
<?php
$collection = $entityManager
    ->getRDBRepository('Opportunity')
    ->order('LIST:stage:Prospecting,Qualification,Proposal')
    ->find();
```

Feeding a query to a repository:

```php
<?php
$collection = $entityManager
    ->getRDBRepository($entityType)
    ->clone($query)
    ->limit(0, 10)
    ->find();
```

Finding the first one:

```php
<?php
$entity = $entityManager
    ->getRDBRepository($entityType)
    ->where([
        'type' => 'Customer',
    ])
    ->findOne();
```

You can use *getRDBRepositoryByClass* for type safety:

```php
<?php
use Espo\Modules\Crm\Entities\Account;

$entity = $entityManager
    ->getRDBRepositoryByClass(Account::class)
    ->findOne();

// Static analysis infers the entity's type.
```

### Get new

Prepare a new entity without saving it:

```php
<?php
use Espo\Modules\Crm\Entities\Account;

$account = $entityManager->getRDBRepositoryByClass(Account::class)
    ->getNew();
```

### Save

Save an entity:

```php
<?php
use Espo\Modules\Crm\Entities\Account;

$entityManager->getRDBRepositoryByClass(Account::class)
    ->save($account);
```

### Remove

Remove an entity (soft delete):

```php
<?php
use Espo\Modules\Crm\Entities\Account;

$entityManager->getRDBRepositoryByClass(Account::class)
    ->remove($account);
```

## Relations

!!! note

    As of v8.4, the *getRelation* method is available in the *EntityManager*. `$entityManager->getRelation($entity, 'relationName');` Before, it could be accessed from a repository.

### Find related

Has-Many:

```php
<?php
// All.
$opportunityCollection = $entityManager
    ->getRelation($account, 'opportunities')
    ->find();

// Filter.
$opportunityCollection = $entityManager
    ->getRelation($account, 'opportunities')
    ->limit(0, 10)
    ->where($whereClause)
    ->find();

// First one.
$opportunity = $entityManager
    ->getRelation($account, 'opportunities')
    ->order('createdAt', 'DESC')
    ->findOne();
```

Belongs-To or Has-One:

```php
<?php
$account = $entityManager
    ->getRelation($task, 'account')
    ->findOne();
```

Filtering by a relation column:

```php
<?php
 $leads = $entityManager
    ->getRelation($targetList, 'leads')
    ->where(['@relation.optedOut' => false])
    ->find();
```

*optedOut* is a column in the middle table.

### Relate entities

```php
<?php
$entityManager
    ->getRelation($account, 'opportunities')
    ->relate($opportunity);

$entityManager
    ->getRelation($account, 'opportunities')
    ->relateById($opportunityId);

// With relationship column setting.
$entityManager
    ->getRelation($account, 'contacts')
    ->relate($contact, ['role' => 'CEO']);
```

### Unrelate entities

```php
<?php
$entityManager
    ->getRelation($account, 'opportunities')
    ->unrelate($opportunity);

$entityManager
    ->getRelation($account, 'opportunities')
    ->unrelateById($opportunityId);
```

### Update columns

```php
<?php
$entityManager
    ->getRelation($account, 'contacts')
    ->updateColumns($contact, ['role' => 'CEO']);

$entityManager
    ->getRelation($account, 'contacts')
    ->updateColumnsById($contactId, [
        'role' => 'CEO', // relationship column
    ]);
```

### Check whether related

```php
<?php
$isRelated = $entityManager
    ->getRelation($account, 'opportunities')
    ->isRelated($opportunity);
```

### Managing from within Entity class

*As of v9.0.*

A developer can add getter and setters to an Entity class which will allow to read and set related records.

In an Entity class:

```php
<?php
class MyEntity extends Entity
{
    public function getAccount(): ?Account
    {
        return $this->relations->getOne('account');
    }

    public function setAccount(?Account $account): self
    {
        $this->relations->set('account', $account);

        return $this;
    }

    /**
     * @return Collection<Attachment>
     */
    public function getAttachments(): Collection
    {
        return $this->relations->getMany('attachments');
    }

    // Setting multiple is not supported.
}
```

Usage:

```php
<?php
$entity->setAccount($account);

$account = $entity->getAccount();

// The same instance is returned. Useful to prevent re-fetching in different hooks.
assert($account === $entity->getAccount());

$em->saveEntity($entity);
```

* Only available from inside the Entity class.
* Getting is available for many and one relationships.
* Settings is available only for one relationships.


## Collections

Collections contains Entities. An *EntityCollection* is a regular collection of entities. An *SthCollection* is a collection of entities, consuming much less memory. It's reasonable when working with large query results. It does not allocate memory for all results but only for a current entity (e.g. when iterating).

Iteration:

```php
<?php
foreach ($collection as $entity) {
    // Do something with entity.
}
```

Get all values:

```php
<?php
$valueMapList = $collection->getValueMapList(); // stdClass[]
```

Factory:

```php
<?php
$collection = $entityManager->getCollectionFactory()->create(); // EntityCollection
$collection[] = $entity;

$sthCollection = $entityManager->getCollectionFactory()->createFromQuery($selectQuery); // SthCollection
```

## Select Query Parameters

### Where clause

#### Comparison operators

Supported comparison operators: `>`, `<`, `>=`, `<=`, `=`, `!=`.

```php
<?php
$opportunityList = $entityManager
    ->getRDBRepository('Opportunity')
    ->where([
        'amount>=' => 100
    ])
    ->find();
```

#### IN and NOT IN operators

```php
<?php
$opportunityList = $entityManager
    ->getRDBRepository('Opportunity')
    ->where([
        'stage' => ['Closed Lost', 'Closed Won']
    ])
    ->find();
```

```php
<?php
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
<?php
$opportunityList = $entityManager
    ->getRDBRepository('Opportunity')
    ->where([
        'name*' => '%service%',
    ])
    ->find();
```

#### OR, AND operators

```php
<?php
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

#### Sub-query

```php
<?php
use Espo\ORM\Query\Part\Condition as Cond;

$collection = $entityManager
    ->getRDBRepository($entityType)
    ->where(
        Cond::in(Cond::column('id'), $subQuery)
    )
    ->find();
```

#### Condition

*As of v7.0.*

```php
<?php
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
<?php
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
<?php
$opportunityList = $entityManager
    ->getRDBRepository('Opportunity')
    ->distinct()
    ->find();
```

### Join

Join relationship:

```php
<?php
$contactList = $entityManager
    ->getRDBRepository('Contact')
    ->distinct()
    ->join('opportunities')
    ->where([
        'opportunities.stage' => 'Closed Won'
    ])
    ->find();
```

Left-Join relationship:

```php
<?php
$contactList = $entityManager
    ->getRDBRepository('Contact')
    ->distinct()
    ->leftJoin('opportunities')
    ->find();
```

'opportunities' is a relationship name.

Join alias:

```php
<?php
$contactList = $entityManager
    ->getRDBRepository('Contact')
    ->distinct()
    ->join('opportunities', 'aliasForJoinedTable')
    ->where([
        'aliasForJoinedTable.stage' => 'Closed Won'
    ])
    ->find();
```

Joining any table (a table name should start with an upper case letter):

```php
<?php
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
        'meetingUser.userId' => $user->getId()
    ])
    ->find();
```

Joining a table with the query builder:

```php
<?php
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

!!! important

    When joining by a table name (upper case is used), `'deleted' => false` filter is not applied implicitly. You need to provide it explicitly.

### Group By

```php
<?php
$query = $entityManager
    ->getQueryBuilder()
    ->select()
    ->from('Opportunity') // entity type
    ->select(['MONTH:(closeDate)', 'SUM:(amountConverted)']) // complex expressions
    ->groupBy('MONTH:(closeDate)') // complex expression
    ->where([
        'stage' => 'Closed Won'
    ])
    ->order('MONTH:(closeDate)')
    ->build();

$pdoStatement = $entityManager
    ->getQueryExecutor()
    ->execute($query);

$rowList = $pdoStatement->fetchAll(\PDO::FETCH_ASSOC);
```

## STH collection

If STH is set (with `sth` method), the find method will return a collection (instance of `SthCollection`) that doesn't allocate memory for all result data.

```php
<?php
$collection = $entityManager
    ->getRDBRepository('Email')
    ->limit(0, 10000)
    ->sth()
    ->find();

foreach ($collection as $entity) {
    // memory is allocated for each item, when collection is iterated
}
```

## Complex expressions

`MONTH:(closeDate)` and `SUM:(amountConverted)` in the example above are complex expressions. [See more](../user-guide/complex-expressions.md) about them.

It's possible to build expressions with the *Expression* class (as of v7.0).

```php
<?php
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
<?php
use Espo\ORM\Query\Part\Expression as Expr;

$queryBuilder->where(
    Expr::greater(
        Expr::column('opportunity.amount'),
        1000
    )
);
```

It's possible to add custom functions (as of v7.0.8). An implementation class name for a custom function should be defined in metadata by a path app > orm > platforms > Mysql > functionConverterClassNameMap. The class should implement `Espo\ORM\QueryComposer\Part\FunctionConverter` interface.

## Query builder

Delete:

```php
<?php
$deleteQuery = $entityManager
    ->getQueryBuilder()
    ->delete()
    ->from('SomeTable')
    ->where([
        'someColumn' => 'someValue'
    ])
    ->build();

$entityManager
    ->getQueryExecutor()
    ->execute($deleteQuery);
```

Select:

```php
<?php
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
<?php
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
<?php
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

Update with join (in PostgreSQL, a subquery will be used):

```php
<?php
$updateQuery = $entityManager
    ->getQueryBuilder()
    ->update()
    ->in('SomeTable')
    ->set(['column:' => 'joinAlias.foreignColumn'])
    ->join('AnotherTable', 'joinAlias', ['joinAlias.foreignId:' => 'id'])
    ->where([
        'someColumn' => 'someValue'
    ])
    ->build();

$entityManager
    ->getQueryExecutor()
    ->execute($updateQuery);
```

Insert:

```php
<?php
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
<?php
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
<?php
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
<?php
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
<?php
$clonedQuery = $entityManager
    ->getQueryBuilder()
    ->clone($query)
    ->limit(0, 10)
    ->build();
```

## Mass insert

Mass insert with Mapper:

```php
<?php
$entityManager->getMapper()->massInsert($collection);
```

## Transaction manager

Transaction:

```php
<?php
$tm = $entityManager->getTransactionManager();

$tm->start();

try {
    // do something
    $tm->commit();
} catch (Throwable $e) {
    $tm->rollback(); // this will roll back everything done within the transaction
}
```

Nested transactions:

```php
<?php
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
<?php
$entityManager
    ->getTransactionManager()
    ->run(
        function () {
            // Transaction started implicitly.
            // Do something.
            // Transaction committed implicitly or rolled back if an exception occurred.
        }
    );
```

Locking:

```php
<?php
$entityManager->getTransactionManager()->start();

$entity = $entityManager
    ->getRDBRepository('SomeTable')
    ->where(['id' => $id])
    ->forUpdate() // This will lock the selected rows until the transaction is finished.
    ->findOne();

// Do something with the entity.

$entityManager->saveEntity($entity);

$entityManager->getTransactionManager()->commit();
```

## Locker

```php
<?php
// This will start a transaction implicitly and lock the table.
$entityManager->getLocker()->lockExclusive('SomeEntityType');

// Do something.

// This will unlock all locked tables.
$entityManager->getLocker()->commit();
```

## Defs

*As of v7.0.*

An access point to read ORM metadata: entity, attribute, field, relation and index definitions.

```php
<?php
$defs = $entityManager->getDefs();
```

ORM Defs can also be required as a dependency so that it will be injected into your class. Use the type hint `Espo\ORM\Defs`.

Check entity existence:

```php
<?php
$entityExists = $defs->hasEntity($entityType);
```

Entity defs:

```php
<?php
$entityDefs = $defs->getEntity($entityType);
```

An attribute list:

```php
<?php
$attributeList = $entityDefs->getAttributeNameList();
```

Attribute defs:

```php
<?php
$attributeDefs = $entityDefs->getAttribute($attributeName);
```

A relation list:

```php
<?php
$relationList = $entityDefs->getRelationNameList();
```

Relation defs:

```php
<?php
$relationDefs = $entityDefs->getRelation($relationName);
```

A field list:

```php
<?php
$fieldList = $entityDefs->getFieldNameList();
```

Field defs:

```php
<?php
$fieldDefs = $entityDefs->getField($field);
```

See all available methods in:

* `Espo\ORM\Defs\EntityDefs`
* `Espo\ORM\Defs\AttributeDefs`
* `Espo\ORM\Defs\RelationDefs`
* `Espo\ORM\Defs\FieldDefs`
* `Espo\ORM\Defs\IndexDefs`

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

Relation types:

* `Entity::MANY_MANY`
* `Entity::HAS_MANY`
* `Entity::BELONGS_TO`
* `Entity::HAS_ONE`
* `Entity::BELONGS_TO_PARENT`
* `Entity::HAS_CHILDREN`
* `Entity::JSON_OBJECT`

## Entity relations

In a custom entity type class, you can define getter and setters for relationships. If you call the same getter multiple times, it will return the same instance. It's useful when the same related entity is accessed in multiple hooks during save. After save, the map will be reset – the getter won't return the same instance as before save.

Get one:

```php
<?php
// Returns an Account entity instance.
// 'account' is a link name.
public function getAccount(): ?Account
{
    /** @var ?Account */
    return $this->relations->getOne('account');
}
```

Set one:

```php
<?php
// 'account' is a link name.
public function setAccount(?Account $account): self
{
    return $this->setRelatedLinkOrEntity('account', $account);
}
```

Get many:

```php
<?php
/**
 * @return Traversable<int, Account>
 */
public function getAccounts(): Traversable
{
    /** @var Traversable<int, Account> */
    return $this->relations->getMany('accounts');
}
```

Note that setting collections (many-to-many, one-to-many) is not supported. Use *$entityManager->getRelation* or set the *LinkMultiple* value object insted.
