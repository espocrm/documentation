# Coding Rules

### 1\. Never pass Container into class constructors. Pass all dependencies separately.

Bad:
```php
<?php
namespace Espo\Modules\MyModule;

use Espo\Core\{
    Container,
};

class MyClass
{
    protected $container;

    public function __constructor(Container $container)
    {
        $this->container = $container;
    }
}

```

Good:

```php
<?php
namespace Espo\Modules\MyModule;

use Espo\Core\{
    ORM\EntityManager
    Utils\Metadata,
};

class MyClass
{
    protected $entityManager;
    protected $metadata;

    public function __constructor(EntityManager $entityManager, Metadata $metadata)
    {
        $this->entityManager = $entityManager;
        $this->metadata = $metadata;
    }
}
```

Exception: Passing the Container may be acceptable for proxy classes.

### 2\. Never write RAW SQL query. Use ORM instead.

Good:

```php
<?php

$account = $this->entityManager
    ->getRepository('Account')
    ->select(['id', 'name'])
    ->where([
        'type' => 'Customer',
    ])
    ->order('createdAt')
    ->findOne();
```

### 3\. Specify type hinting for method parameters. Also specify a method return type.

Parameter types:

```php
<?php
class MyClass
{
    public function myMethod(Request $request, string $text) : void
    {
    }
}
```

Return type:

```php
<?php
class MyClass
{
    public function getAsString() : ?string
    {
        // ...
    }
}
```

### 4\. Never return TRUE or FALSE to indicate a success or failure. Throw an exception if failure, return NULL for empty result.

```php
<?php

use Espo\Core\Exceptions\Error;

class MyClass
{
    public function getAsString() : ?string
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

Also avoid mixed type hinting. Try to use *mixed* type hinting only when they are really reasonable.

### 5\. Don't write comments, write self explanatory code.

In addition: Do not write *phpdoc* for non-public methods and properties. It's OK if you don't write *phpdoc* at all.

Exception: Adding comments may be reasonable in some rare cases.

Bad:

```php
    /**
     * Sanitize input.
     *
     * @param string $input Input string.
     * @return string Sanitized string.
     */
    protected function sanitizeInput(string $input) : string
    {
        // sanitize
        return Util::sanitize($input);
    }
```

Good:

```php
    protected function sanitizeInput(string $input) : string
    {
        return Util::sanitize($input);
    }
```

Bad:

```php
// start sanitizing
$string = filter_var($string, FILTER_SANITIZE_STRING, FILTER_FLAG_STRIP_HIGH);
// end sanitizing
```

Good:
```php
$string = $this->sanitizeString($string);
```

### 6\. Import classes in the beginning of the file.

Bad:

```php
<?php
namespace Espo\Some;

class SomeClass
{
    public function process()
    {
        $object1 = new \Espo\Modules\MyModule\Something();
        $object2 = new \Espo\Modules\MyModule\AnotherThing();
        // ...
        throw new \RuntimeException();
    }
}
```

Good:
```php

<?php
namespace Espo\Some;

use Espo\Modules\MyModule\{
    Something,
    AnotherThing,
};

use RuntimeException;

class SomeClass
{
    public function process()
    {
        $object1 = new Something();
        $object2 = new AnotherThing();
        // ...
        throw new RuntimeException();
    }
}
```

### 7\. Not more that 2 levels of indentation per method.

Bad:
```php
<?php
// ...
    public function process()
    {
        if (! $this->isCached()) {
            foreach ($this->itemList as $item) {
                if (! $this->hasItem($item)) {
                    $this->loadItem($item);
                }
            }
        }
    }
```

Better:
```php
<?php
// ...
    public function process()
    {
        if (! $this->isCached()) {
            foreach ($this->itemList as $item) {
                $this->processLoadItem($item);
            }
        }
    }
```

Good:
```php
<?php
// ...
    public function process()
    {
        if (! $this->isCached()) {
            $this->processLoadItems();
        }
    }
```

### 8\. Use early returns.

Bad:

```php
<?php
// ...
    public function getData() : ?Data
    {
        if (! $this->isEmpty()) {
            $this->loadData();

            return $this->data;
        }

        return null;
    }
```

Good:

```php
<?php
// ...
    public function getData() : ?Data
    {
        if ($this->isEmpty()) {
            return null;
        }

        $this->loadData();

        return $this->data;
    }
```

### 8\. Avoid too many parameters in methods.

Less is better. Four is too much.

Bad:
```php
<?php
// ...
    public function process(string $city, string $country, string $postalCode)
    {
    }
```

Good:
```php
<?php
// ...
    public function process(Address $address)
    {
    }
```


Bad:
```php
<?php
// ...
    public function find(array $where, int $offset = 0, ?int $limit = null, bool $applyAcl = false)
    {
    }
```

Good:
```php
<?php
// Using builder.
$collection = $finder->createBuilder()
    ->where($where)
    ->offset($offset)
    ->limit($limit)
    ->withAclApplied()
    ->find();
```

### 9\. Methods that return values should not change state. Methods that change state should not return values.

Not a strict rule but in most cases should be followed.

Bad:

```php
class SomeProcessor
{
    private $isProcessed = false;
    
    public function process() : Result
    {
        $this->isProcessed = true;
        
        // do something
        
        return true;
    }
}
```

Good:

```php
class SomeProcessor
{
    public function process() : Result
    {
        // do something
        
        return Reslut::success();
    }
}
```

### 10\. Prefer composition over inheritance.

Try to use inheritance only when it's really reasonable.
