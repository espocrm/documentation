# Agregar acción de servicio personalizada para Flujo de trabajo

Los flujos de trabajo permiten crear acciones de servicio personalizadas. Este ejemplo mostrará cómo se puede hacer esto para una entidad de Llamada.

## Paso 1. Crear clase de servicio

```php
<?php
 
namespace Espo\Custom\Services;
 
use \Espo\ORM\Entity;
 
class TestService extends \Espo\Core\Services\Base
{
    public function testServiceAction($workflowId, Entity $entity, $additionalParameters = null)
    {
        // tu código aquí
    }
}
```

## Paso 2. Definir el método de servicio de ejecución en los metadatos

Crea/edita el archivo `custom/Espo/Custom/Resources/metadata/entityDefs/Workflow.json`

```json
{
    "serviceActions": {
        "Call":{
            "testServiceAction": {
                "serviceName": "TestService",
                "methodName": "testServiceAction"
            }
        }
    }
}
```
Nota: También puede crear el archivo de metadatos Workflow.json en su directorio de módulos.

## Paso 3. Agregar una etiqueta

Agrega o edita (si el archivo existe) el archivo `custom/Espo/Custom/Resources/i18n/en_US/Workflow.json`.

```json
{
    "serviceActions": {
        "testServiceAction": "Label for TestServiceAction"
    }
}
```
O si tiene el mismo nombre de método para varios tipos de entidad, puede definir una traducción diferente para ellos.

```json
{
    "serviceActions": {
        "CallTestServiceAction": "Etiqueta para Llamar TestServiceAction",
        "TaskTestServiceAction": "Etiqueta para Tarea TestServiceAction"
    }
}
```
Nota: También puede crear el archivo de idioma Workflow.json en su directorio de módulos.

## Paso 4. Agregar sugerencias de uso (opcional)

Agregue o edite el archivo `custom/Espo/Custom/Resources/i18n/en_US/Workflow.json`.

```json
{
    "serviceActionsHelp": {
        "testServiceAction": "Esta es una descripción de la acción testServiceAction"
    }
}
```
O si tiene el mismo nombre de método para varios tipos de entidad, puede definir diferentes consejos xts para ellos.

```json
{
    "serviceActionsHelp": {
        "CallTestServiceAction": "Esta es una descripción de TestServiceAction para la entidad de Llamada",
        "TaskTestServiceAction": "Esta es una descripción de TestServiceAction para la entidad Tarea"
    }
}
```

## Paso 5. Limpiar caché

Panel de Administración > Borrar Caché. Ahora la acción de servicio está disponible para Flujos de Trabajo en el formulario Ejecutar Acción de Servicio.
