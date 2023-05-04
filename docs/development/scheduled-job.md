# Scheduled Jobs

## Creating custom scheduled job

Create a file `custom/Espo/Custom/Resources/metadata/app/scheduledJobs.json`:

```
{
    "YourJobName": {
    	"jobClassName": "Espo\\Custom\\Jobs\\YourJobName"
    }
}
```

Create a file `custom/Espo/Custom/Jobs/YourJobName.php` with the content.

```php
<?php

namespace Espo\Custom\Jobs;

use Espo\Core\Job\JobDataLess;

class YourJobName implements JobDataLess
{
    // Pass dependencies through the constructor using DI.
    public function __construct()
    {
    }
    
    public function run(): void 
    {	 
	// Write your logic here.
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

Now, you can create a scheduled job at Administration > Scheduled Jobs. *YourJobName* will be available in the picklist.

You can also run your job **from CLI**:

```
bin/command run-job YourJobName
```
