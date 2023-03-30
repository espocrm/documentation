# Jobs

Sometimes it's reasonable to execute some actions in background. For example, when sending an email, to prevent a user to wait until sending is processed. 

### Scheduling

```php
use Espo\Core\Job\JobSchedulerFactory;
use Espo\Core\Job\QueueName;

/** @var JobSchedulerFactory $jobSchedulerFactory */
$jobSchedulerFactory->create()
    ->setClassName($jobClassName) // should implement `Espo\Core\Job\Job` interface
    ->setQueue(QueueName::Q0) // optional
    ->setGroup('some-group-name') // optional
    ->setData([
        'someKey' => $someValue,
    ])
    ->schedule();
```

You can pass JobSchedulerFactory as a constructor dependency.

### Job

```php
<?php
namespace Espo\Custom\MyJobs;

use Espo\Core\Job\Job;
use Espo\Core\Job\Job\Data;

class MyJob implements Job
{
     public function __construct(/* pass needed dependencies */)
     {}
     
     public function run(Data $data): void
     {
         // job logic here
     }
}
```

### Queues

* e0 – intended for email sending; run as often as possible;
* q0 – for general use; run as often as possible;
* q1 – for general use; run every minute.
