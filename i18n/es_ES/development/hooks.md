# Ganchos

## Crear Gancho

Para crear un gancho, necesita:
- crear un archivo `custom/Espo/Custom/Hooks/{EntityName}/{HookName}.php`;
- declarar acción de tipo gancho;
- limpiar el Caché en Administración.

## Tipos de Gancho

Los principales tipos de gancho son:

- beforeSave; - antes de guardar
- afterSave; - después de guardar
- beforeRemove; - antes de remover
- afterRemove; - después de remover
- afterRelate; - después de relacionar
- afterUnrelate; - después de quitar relación
- afterMassRelate. - después de relación masiva

### Nuevo Tipo de Gancho
Puede usar su propio tipo de gancho y activarlo con

`$this->getEntityManager()->getHookManager()->process($entityType, $hookType, $entity, $options);`.

## Orden de Gancho
Si tiene varios ganchos relacionados con un tipo de entidad y con el mismo tipo de gancho, y el orden de ejecución es importante, puede establecer una propiedad `public static $ order` en un valor entero.

Orden ascendente - el gancho con el menor número de orden se ejecuta primero.

## Ejemplo
Este ejemplo establece el Nombre de la Cuenta para nuevos Clientes Potenciales, si no está establecido.

`custom/Espo/Custom/Hooks/Lead/AccountName.php`

```php
namespace Espo\Custom\Hooks\Lead;

use Espo\ORM\Entity;

class AccountName extends \Espo\Core\Hooks\Base
{    
    public function beforeSave(Entity $entity, array $options = array())
    {
        if ($entity->isNew() && !$entity->get('accountName')) { 
            $entity->set("accountName", "No Account");
        }
    }
}
```

## Ganchos Globales
Si necesita aplicar un gancho para todas las entidades, puede usar ganchos comunes. Para hacer esto, ponga la clase de su gancho en el Directorio Común, P.ej. `custom/Espo/Custom/Hooks/Common/{HookName}.php`.
