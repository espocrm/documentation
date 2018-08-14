# Paglikha ng Nakaiskedyul na Gawain

Upang tukuyin ang kustom na Nakaiskedyul na Gawain lumikha ng isang file na `custom/Espo/Custom/Jobs/{JOB_NAME}.php` kasama ang nilalaman.

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

Gayundin, maaari kang magtakda ng isang label para sa iyong gawain (`custom/Espo/Custom/Resources/i18n/{language}/ScheduledJob.json`).
```
{
  "options": { 
    "job": { 
      "{JOB_NAME}": "{JOB_NAME_TRANSLATION}"
    }
  }
}
```

Upang ipatupad ang mga pagbabago, pumunta sa panel ng Administrasyon at I-burahin ang Cache.