# Jobs

Sometimes it's reasonable to execute the script in background. For example, to avoid a used waiting for a response  for a long time.

### Creating job record

```php
$entityManager->createEntity('Job', [
    'serviceName' => 'MyJobService',
    'methodName' => 'jobDoSomething',
    'data' => (object) [
        'key1' => 'value1',
        'key2' => 'value2',
    ],
    'executeTime' => date('Y-m-d H:i:s'), // you can delay execution by setting a later time
    'queue' => 'q0', // available queues are listed below
]);
```

### Job implementation

Create a service class file `custom/Espo/Custom/Resources/Services/MyJobService.php`:

```php
<?php
namespace Espo\Custom\Services;

class MyJobService extends \Espo\Core\Services\Base
{
    protected function init()
    {
        $this->addDependencyList([
            'entityManager',
        ]);
    }

    public function jobDoSomething($data)
    {
        $key1 = $data->key1;
        $key2 = $data->key2;

        $entityManager = $this->getInjection('entityManager');

        // do something
    }
}

```

Clear cache from the admin panel.

More detail about services is [here](services.md).

### Queues

* e0 - intended for email sending; run as often as possible;
* q0 - for general use; run as often as possible;
* q1 - for general use; run every minute.
