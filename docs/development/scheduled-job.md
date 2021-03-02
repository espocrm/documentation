# Creating custom Job (& Scheduled Job)

To define a custom Scheduled Job, create a file `custom/Espo/Custom/Jobs/YourJobName.php` with the content.

```php
<?php

namespace Espo\Custom\Jobs;

use Espo\Core\Jobs\Job;

class YourJobName implements Job
{
    // Pass dependencies through the constructor using DI.
    public function __construct()
    {
    }
    
    public function run() : void 
    {	 
	// all the logic needs to be defined in the method run
    }	 
}
```

Also, you can set a label for your job (`custom/Espo/Custom/Resources/i18n/en_US/ScheduledJob.json`).
```json
{
   "options": { 
       "job": { 
           "YourJobName": "Your Job Label"
       }
   }
}
```

To make the changes applied, clear cache at Administration.

Now, you can create a scheduled job at Administration > Scheduled Jobs.
