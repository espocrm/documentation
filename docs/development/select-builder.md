# Select Builder

Available as of v6.2.0.

The Select Builder builds select queries for the ORM. Applies search parameters (passed from frontend), access control restrictions, text filters, bool filters, primary filters. It's utilized as a layer over the ORM.

See all available methods in the class `Espo\Core\Select\SelectBuilder`.

Usage example (building a query):

```php
$selectBuilder = $selectBuilderFactory->create();

$query = $selectBuilder
    ->from($entityType)
    ->withStrictAccessControl() // applies ACL
    ->withSearchParams($searchParams) // search parameters passed from the frontend
    ->build();

$collection = $this->entityManager
    ->getRepository($entityType)
    ->clone($query)
    ->find();
```

Usage example (building a query builder):

```php
$query = $selectBuilder
    ->from($entityType)
    ->withPrimaryFilter($primaryFilter)
    ->buildQueryBuilder() // to continue building by means of ORM
    ->where([
        'someAttribute' => $someValue,
    ])
    ->build();
```

In your class you need to require `Espo\Core\Select\SelectBuilderFactory` as a dependency.

```php
<?php
namespace Espo\Custom\SomeNamespace;

use Espo\Core\Select\SelectBuilderFactory;

class SomeClass
{
    protected $selectBuilderFactory;
    
    public function __construct(SelectBuilderFactory $selectBuilderFactory)
    {
        $this->selectBuilderFactory = $selectBuilderFactory
    }
}
```

Once you built a query you can pass it to a repository:

```php
$collection = $entityManager->getRepository($entityType)
    ->clone($query)
    ->find();
```

Or you can pass it to the QueryExecutor:

```php
$sth = $entityManager->getQueryExecutor()->execute($query);
```
