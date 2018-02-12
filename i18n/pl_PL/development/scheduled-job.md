# Tworzenie Planowanych Prac

Aby utworzyć niestandardową Zaplanowaną Prace stwórz plik `custom/Espo/Custom/Jobs/{JOB_NAME}.php` z zawartością.

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

Możesz również swtorzyć etykietę dla swojej pracy(`custom/Espo/Custom/Resources/i18n/{language}/ScheduledJob.json`).
```
{
  "options": { 
    "job": { 
      "{JOB_NAME}": "{JOB_NAME_TRANSLATION}"
    }
  }
}
```

Aby zaimplementować zmiany, idź do panelu administratora i wyczyść Cache.
