# Coding Rules

### 1\. Never pass Container into class constructors. Pass all dependencies separately.

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


### 2\. Never write RAW SQL query. Use ORM instead.

### 3\. Always specify type hinting for all method arguments.

### 4\. Always indicate a method return type unless it's supposed to be void.

### 5\. Never return TRUE or FALSE to indicate success or failure. Throw an exception if failure, return NULL for empty result.
