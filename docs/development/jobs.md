# Jobs

Sometimes it's reasonable to execute some actions in background.

### Scheduling job

As of v7.0:

```php
use Espo\Core\Job\JobSchedulerFactory;
use Espo\Core\Job\QueueName;

/** @var JobSchedulerFactory $jobSchedulerFactory */
$jobSchedulerFactory->create()
    ->setClassName($jobClassName) // should implement `Espo\Core\Job\Job` interface
    ->setQueue(QueueName::Q0) // optional
    ->setGroup('some-group-name') // optional
    ->setData([
        'someKey' => $someValue
    ])
    ->schedule();
```

You can pass JobSchedulerFactory as a constructor dependency.

### Job implementation

As of v7.0:

```php
<?php
namespace Espo\Custom\MyJobs;

use Espo\Core\Job\Job;
use Espo\Core\Job\Job\Data;

class MyJob implements Job
{
     public function __construct(/* pass needed dependencies */)
     {
     }
     
     public function run(Data $data): void
     {
         // job logic here
     }
}
```


Legacy method. Create a service class file `custom/Espo/Custom/Services/MyJobService.php`:

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

### Queues

* e0 - intended for email sending; run as often as possible;
* q0 - for general use; run as often as possible;
* q1 - for general use; run every minute.
