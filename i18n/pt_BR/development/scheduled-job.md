# Criar trabalho agendado

Para definir um trabalho personalizado agendado, crie um arquivo `custom/Espo/Custom/Jobs/{JOB_NAME}.php` com o conteúdo.

```
namespace Espo\Custom\Jobs; 

class {JOB_NAME} extends \Espo\Core\Jobs\Base 
{
    
    public function run() 
    {	 
	    //toda a lógica precisa ser definida no método executado
    }	 
}
```

Além disso, podes definir uma etiqueta para o teu trabalho (`custom/Espo/Custom/Resources/i18n/{language}/ScheduledJob.json`).
```
{
  "options": { 
    "job": { 
      "{JOB_NAME}": "{JOB_NAME_TRANSLATION}"
    }
  }
}
```

Para implementar as alterações, vá para o painel Administração e Limpe o Cache.
