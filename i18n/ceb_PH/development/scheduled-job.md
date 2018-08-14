# Ang Paghimo og Gischedule nga Trabahoon

Para muhimo og usa ka custom nga Gischedule nga Trabahoon, himo og usa ka file `custom/Espo/Custom/Jobs/{JOB_NAME}.php` nga naay sulod nga.

```
namespace Espo\Custom\Jobs; 

class {JOB_NAME} extends \Espo\Core\Jobs\Base 
{
    
    public function run() 
    {	 
      //ang tanang lohika kay gikinahanglan himoon diri sa method nga run
    }	 
}
```

Usab, pwede sad ka mu-set ug label para sa imohang trabahoon (`custom/Espo/Custom/Resources/i18n/{language}/ScheduledJob.json`).

```
{
  "options": { 
    "job": { 
      "{JOB_NAME}": "{JOB_NAME_TRANSLATION}"
    }
  }
}
```

Para i-implementar ang mga kausaban, adto sa Administration nga panel ug i-Clear ang Cache.
