# Jobs

Sometimes it's reasonable to execute some actions in background. For example, when sending an email, to prevent a user to wait until sending is processed. 

### Scheduling

```php
<?php
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

Jobs within a queue are processed one by one.

Queues available out of the box:

* e0 – intended for email sending; run as often as possible; one-by-one;
* q0 – for general use; run as often as possible; one-by-one;
* q1 – for general use; run every minute; one-by-one;
* m0 – run in-parallel along with the main queue; used to avoid disruption of the main queue; as of v9.2.

Portion size is controller by [config parameters](../administration/config-params.md#jobs-daemon).

### Groups

A group name can be any string with max length of 128 characters. Jobs with the same group name are processed one by one.
