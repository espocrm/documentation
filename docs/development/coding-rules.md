# Coding Rules

### 1\. Never pass Container into class constructors. Pass all dependencies separately.

❗ Bad:

```php
<?php

namespace Espo\Modules\MyModule;

use Espo\Core\Container;

class MyClass
{
    private Container $container;

    public function __constructor(Container $container)
    {
        $this->container = $container;
    }
}

```

✔️ Good:

```php
<?php

namespace Espo\Modules\MyModule;

use Espo\Core\ORM\EntityManager;
use Espo\Core\Utils\Metadata;

class MyClass
{
    private EntityManager $entityManager;    
    private Metadata $metadata;

    public function __constructor(EntityManager $entityManager, Metadata $metadata)
    {
        $this->entityManager = $entityManager;
        $this->metadata = $metadata;
    }
}
```

Exception: Passing the Container may be acceptable for proxy classes.

### 2\. Never write RAW SQL query. Use ORM instead.

✔️ Good:

```php
<?php

use Espo\Modules\Crm\Entities\Account;

$account = $this->entityManager
    ->getRDBRepository(Account::ENTITY_TYPE)
    ->select(['id', 'name'])
    ->where([
        'type' => 'Customer',
    ])
    ->order('createdAt')
    ->findOne();
```

### 3\. Specify types for method parameters. Also specify a method return type.

❗ Bad:

```php
<?php

class MyClass
{
    public function myMethod($request, $text)
    {
    }
}
```

✔️ Good:

```php
<?php

class MyClass
{
    public function myMethod(Request $request, string $text): void
    {
    }
}
```

✔️ Good:

```php
<?php

class MyClass
{
    public function getString(): ?string
    {
        // ...
    }
}
```

Also avoid the `mixed` type for parameters.

### 4\. Never return TRUE or FALSE to indicate a success or failure. Throw an exception if failure, return NULL for empty result.

✔️ Good:

```php
<?php

use Espo\Core\Exceptions\Error;

class MyClass
{
    public function getAsString(): ?string
    {
        if ($this->isSomethingWrong()) {
            throw new Error("Something is wrong.");
        }

        if ($this->hasNoData()) {
            return null;
        }

        return $this->value;
    }
}
```

### 5\. Don't write comments, write self explanatory code.

In addition: Do not write *phpdoc* for non-public methods and properties. It's OK if you don't write *phpdoc* at all (unless needed for static analysis).

Exception: Adding comments may be reasonable in some rare cases.

❗ Bad (excessive documenting and commenting):

```php
<?php
// ...

    /**
     * Sanitize input.
     *
     * @param string $input Input string.
     * @return string Sanitized string.
     */
    private function sanitizeInput(string $input): string
    {
        // sanitize
        return Util::sanitize($input);
    }
```

✔️ Good:

```php
<?php
// ...

    private function sanitizeInput(string $input): string
    {
        return Util::sanitize($input);
    }
```

✔️ Good (documenting public methods is OK):

```php
<?php
// ...

    /**
     * Run a command.
     */
    public function run(Params $params): void
    {
    }
```

❗ Bad:

```php
<?php
// ...

// start sanitizing
$string = filter_var($string, FILTER_SANITIZE_STRING, FILTER_FLAG_STRIP_HIGH);
// end sanitizing
```

✔️ Good:
```php
<?php
// ...

$string = $this->sanitizeString($string);
```

### 6\. Import classes in the beginning of the file.

❗ Bad:

```php
<?php

namespace Espo\Some;

class SomeClass
{
    public function process(): void
    {
        $object1 = new \Espo\Modules\MyModule\Something();
        $object2 = new \Espo\Modules\MyModule\AnotherThing();
        // ...
        throw new \RuntimeException();
    }
}
```

✔️ Good:

```php
<?php

namespace Espo\Some;

use Espo\Modules\MyModule\Something;
use Espo\Modules\MyModule\AnotherThing;

use RuntimeException;

class SomeClass
{
    public function process(): void
    {
        $object1 = new Something();
        $object2 = new AnotherThing();
        // ...
        throw new RuntimeException();
    }
}
```

### 7\. Not more that 2 levels of indentation per method.

❗ Bad:
```php
<?php
// ...

    public function process(): void
    {
        if (!$this->isCached()) {
            foreach ($this->itemList as $item) {
                if (!$this->hasItem($item)) {
                    $this->loadItem($item);
                }
            }
        }
    }
```

✔️ Better:

```php
<?php
// ...

    public function process(): void
    {
        if (!$this->isCached()) {
            foreach ($this->itemList as $item) {
                $this->processLoadItem($item);
            }
        }
    }
```

✔️ Good:

```php
<?php
// ...

    public function process(): void
    {
        if (!$this->isCached()) {
            $this->processLoadItems();
        }
    }
```

### 8\. Use early returns.

❗ Bad:

```php
<?php
// ...

    private function sizeExceedsLimit(Storage $storage, string $id): bool
    {
        $fetchOnlyHeader = false;

        $maxSize = $this->config->get('emailMessageMaxSize');

        if ($maxSize) {
            $size = $storage->getSize($id);

            if ($size > $maxSize) {
                $fetchOnlyHeader = true;
            }
        }

        return $fetchOnlyHeader;
    }
```

✔️ Good:

```php
<?php
// ...

    private function sizeExceedsLimit(Storage $storage, string $id): bool
    {
        $maxSize = $this->config->get('emailMessageMaxSize');

        if (!$maxSize) {
            return false;
        }
            
        $size = $storage->getSize($id);

        if ($size > $maxSize) {
            return true;
        }

        return false;
    }
```

### 8\. Avoid too many parameters in methods.

Less is better. Four is too much.

❗ Bad:

```php
<?php
// ...

    public function process(string $city, string $country, string $postalCode): void
    {
    }
```

✔️ Good:

```php
<?php
// ...

    public function process(Address $address): void
    {
    }
```


❗ Bad:

```php
<?php
// ...
    public function find(array $where, int $offset = 0, ?int $limit = null, bool $applyAcl = false): Collection
    {
    }
```

✔️ Good:

```php
<?php

// Using a builder.
$collection = $finder
    ->createBuilder()
    ->where($where)
    ->offset($offset)
    ->limit($limit)
    ->withAclApplied()
    ->find();
```

### 9\. Methods that return values should not change state. Methods that change state should not return values.

Not a strict rule but in most cases should be followed.

❗ Bad:

```php
<?php

class SomeProcessor
{
    private bool $isProcessed = false;
    
    public function process(): bool
    {
        $this->isProcessed = true;
        
        // do something
        
        return true;
    }
}
```

✔️ Good:

```php
<?php

class SomeProcessor
{
    public function process(): Result
    {
        // do something
        
        return Result::createSuccess();
    }
}
```

### 10\. Prefer composition over inheritance.

Try to use inheritance only when it's really reasonable.

❗ Bad:

```php
<?php

class AccountChecker extends BaseChecker
{
    public function check(Entity $entity): bool
    {
        $result = parent::check($entity);

        // some additional logic

        return $result;
    }
}
```

✔️ Good:

```php
<?php

class AccountChecker implements Checker
{
    private BaseChecker $baseChecker;
    
    private SomeDependency $someDependency;
     
    // Here we can inject additional dependencies that would be problematic
    // if we extended the base class.
    public function __construct(BaseChecker $baseChecker, SomeDependency $someDependency)
    {
        $this->baseChecker = $baseChecker;
        $this->someDependency = $someDependency;
    }

    public function check(Entity $entity): bool
    {
        $result = $this->baseChecker->check($entity);

        // some additional logic

        return $result;
     }
}
```

The *protected* visibility should be used very sparsely.

### 11\. Use DTO rather than associative arrays or stdClass objects.

Use immutable data transfer objects.

❗ Bad:

```php
<?php

$data = [
    'attribute' => $attribute,
    'value' => $value,
    'entityType' => $entityType,
];

$someObject->process($data);
```

✔️ Good (cloning):

```php
<?php

$data = Data::create()
    ->withAttribute($attribute)
    ->withValue($value)
    ->withEntityType($entityType);
    
$someObject->process($data);    
```

✔️ Good (building):

```php
<?php

$data = Data::createBuilder()
    ->setAttribute($attribute)
    ->setValue($value)
    ->setEntityType($entityType)
    ->build();
    
$someObject->process($data);    
```
