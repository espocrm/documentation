# Create a Job

To define own job create a file `advanced/custom/Espo/Custom/Jobs/{JOB_NAME}.php` with similar content

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

Also you could to set translation in ScheduledJob (`custom/Espo/Custom/Resources/i18n/{language}/ScheduledJob.json`)
```
{
  "options": { 
    "job": { 
      "{JOB_NAME}": "{JOB_NAME_TRANSLATION}"
    }
  }
}
```
To implement the changes needs to Clear Cache
