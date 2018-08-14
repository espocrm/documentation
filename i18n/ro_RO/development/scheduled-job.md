# Crearea unei Activități Planificate

Pentru a defini o Activitate Planificată personalizată creați un fișier `custom/Espo/Custom/Jobs/{JOB_NAME}.php` cu conținut.

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

De asemenea, puteți seta o etichetă pentru activitate (`custom/Espo/Custom/Resources/i18n/{language}/ScheduledJob.json`).
```
{
  "options": { 
    "job": { 
      "{JOB_NAME}": "{JOB_NAME_TRANSLATION}"
    }
  }
}
```

Pentru a implementa schimbările, mergi la panoul din Administrare și ștergeți Cache-ul.
