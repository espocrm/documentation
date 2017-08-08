# Creating Scheduled Job

To define a custom Scheduled Job create a file `custom/Espo/Custom/Jobs/{JOB_NAME}.php` with the content.

```
namespace Espo\Custom\Jobs; 

class {JOB_NAME} extends \Espo\Core\Jobs\Base 
{
    
    public function run() 
    {	 
	    //all the logic needs to be defined in the method run
    }	 
}
```

Also, you can set a label for your job (`custom/Espo/Custom/Resources/i18n/{language}/ScheduledJob.json`).
```
{
  "options": { 
    "job": { 
      "{JOB_NAME}": "{JOB_NAME_TRANSLATION}"
    }
  }
}
```

To implement the changes, go to Administration panel and Clear Cache.
