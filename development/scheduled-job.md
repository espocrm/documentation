# Creating Custom Scheduled Job

To define a custom Scheduled Job create a file `custom/Espo/Custom/Jobs/{YOUR_JOB_NAME}.php` with the content.

```php
namespace Espo\Custom\Jobs; 

class {JOB_NAME} extends \Espo\Core\Jobs\Base 
{
    
    public function run() 
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
           "{YOUR_JOB_NAME}": "{YOUR_JOB_NAME_LABEL}"
       }
   }
}
```

Note: {YOUR_JOB_NAME} should be defined w/o braces`{}`. 

To make the changes applied, clear cache at Administration.
