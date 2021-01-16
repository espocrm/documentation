# Select Builder

Available as of v6.2.0.

Select builder builds select queries for ORM. Applies search parameters (passed from frontend), ACL restrictions, filters, etc.

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
