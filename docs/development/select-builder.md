# Select Builder

*As of v7.0.*

The Select Builder builds select queries for the ORM. It applies search parameters (passed from the frontend), access control restrictions, text filters, bool filters, primary filters. It's utilized as a layer over the ORM, since the ORM does not know anything about access control, predefined filters. It does not know how to handle text filters. As well as it does not understand the format of search parameters passed from the frontend.

See all available methods in the class `Espo\Core\Select\SelectBuilder`.

Usage example (building a query):

```php
<?php
$selectBuilder = $this->selectBuilderFactory->create();

$query = $selectBuilder
    ->from($entityType)
    ->withStrictAccessControl() // applies ACL
    ->withSearchParams($searchParams) // search parameters passed from the frontend
    ->build();

$collection = $this->entityManager
    ->getRDBRepository($entityType)
    ->clone($query)
    ->find();
```

Usage example (building a query builder):

```php
<?php
$query = $selectBuilder
    ->from($entityType)
    ->withPrimaryFilter($primaryFilter)
    ->buildQueryBuilder() // to continue building by means of ORM
    ->where([
        'someAttribute' => $someValue,
    ])
    ->build();
```

Usage example (another user):

```php
<?php
$query = $selectBuilder
    ->from($entityType)
    ->forUser($user) // to apply access control for another user
    ->withStrictAccessControl()
    ->build();
```

In your class you need to require `Espo\Core\Select\SelectBuilderFactory` as a dependency.

```php
<?php
namespace Espo\Custom\SomeNamespace;

use Espo\Core\Select\SelectBuilderFactory;

class SomeClass
{    
    public function __construct(private SelectBuilderFactory $selectBuilderFactory)
    {}
}
```

Once you built a query you can pass it to the repository:

```php
<?php
$collection = $entityManager
    ->getRDBRepository($entityType)
    ->clone($query)
    ->find();
```

Or you can pass it to the QueryExecutor:

```php
<?php
$sth = $entityManager->getQueryExecutor()->execute($query);
```

## Search Params

Search parameters. Usually passed from the frontend. The SearchParams object contains a primary filter, bool filters, text filter, where conditions, offset, limit, order, and what columns to select. When a frontend collection is fetched, search parameters are passed in the request.

Class: `Espo\Core\Select\SearchParams`.

A SearchParams object can be fetched from a Request object by using `Espo\Core\Record\SearchParamsFetcher`. Usually it's done in API action classes.

```php
<?php
namespace Espo\Custom\Api;

use Espo\Core\Api\Action;
use Espo\Core\Api\Request;
use Espo\Core\Api\Response;
use Espo\Core\Record\SearchParamsFetcher;

class MyAction extends Action
{
    public function __construct(
        private SearchParamsFetcher $searchParamsFetcher,
    ) {}

    public function process(Request $request): Response
    {
        $searchParams = $searchParams = $this->searchParamsFetcher->fetch($request);

        // ...
    }
}
```

## See also

* [Definitions of Select framework, metadata > selectDefs](metadata/select-defs.md)

