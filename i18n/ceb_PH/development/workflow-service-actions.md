# Pagpuno og custom nga service nga aksyon para sa Workflow

Ang Workflows mutugot sa paghimo og mga custom service nga mga aksyon. Ang musunod nga example kay mupakita kung unsaon ni pagbuhat para sa Call nga entity.

## Unang Lakang. Himo og service nga class

```php
<?php
 
namespace Espo\Custom\Services;
 
use \Espo\ORM\Entity;
 
class TestService extends \Espo\Core\Services\Base
{
    public function testServiceAction($workflowId, Entity $entity, $additionalParameters = null)
    {
        // imohang code diri
    }
}
```

## Ikaduhang Lakang. Himoa ang run service method sulod sa metadata

Himo/i-edit ang file nga `custom/Espo/Custom/Resources/metadata/entityDefs/Workflow.json`

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
Timan-e: Pwede pud ka muhimo og metadata nga file nga Workflow.json file sa sulod sa imohang module nga direktoryo.

## Ikatulong Lakang. Pagdungag og label

Idungag o i-edit (kung naa ang file) ang file`custom/Espo/Custom/Resources/i18n/en_US/Workflow.json`.

```json
{
    "serviceActions": {
        "testServiceAction": "Label para sa TestServiceAction"
    }
}
```
O kung naa kay parehas nga pangalan sa method para sa daghang mga entity type, pwede kang muhimo og nagkalainlaing mga translation para nila.

```json
{
    "serviceActions": {
        "CallTestServiceAction": "Label para sa Call TestServiceAction",
        "TaskTestServiceAction": "Label para sa Task TestServiceAction"
    }
}
```
Note: You can also create language file Workflow.json file in your module directory.

## Ikaupat nga Lakang. Pagdungag og mga usage tip (opsyonal)

Idungag o i-edit ang file `custom/Espo/Custom/Resources/i18n/en_US/Workflow.json`.

```json
{
    "serviceActionsHelp": {
        "testServiceAction": "Usa ni ka deskripsyon sa testServiceAction nga  aksyon"
    }
}
```
O kung naa kay parehas nga pangalan sa method para sa daghang mga entity type, pwede kang muhimo og nagkalainlaing mga tip xts para nila.

```json
{
    "serviceActionsHelp": {
        "CallTestServiceAction": "Usa ni ka deskripsyon sa TestServiceAction para sa Call entity",
        "TaskTestServiceAction": "Usa ni ka deskripsyon sa TestServiceAction para sa Task entity"
    }
}
```

## Ikalimang Lakang. I-clear ang Cache

Administration panel > Clear Cache. Karon, magamit na ang service action para sa Workflows nga naa sa Run Service Action nga form.
