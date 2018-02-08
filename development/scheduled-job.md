# Creando un Trabajo Agendado

Para definir un trabajo Agendado personalizado, cree un archivo `custom/Espo/Custom/Jobs/{JOB_NAME}.php` con el contenido.

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

También puede establecer una etiqueta para su trabajo (`custom/Espo/Custom/Resources/i18n/{language}/ScheduledJob.json`).
```
{
  "options": { 
    "job": { 
      "{JOB_NAME}": "{JOB_NAME_TRANSLATION}"
    }
  }
}
```

Para implementar los cambios, diríjase al panel de Administración para Vacia Caché.
