# Pagdaragdag ng aksyon ng serbisyong pangmamimili sa Workflow

Pinapayagan ang mga workflow na lumikha ng mga pasadyang pagkilos ng serbisyo. Ang halimbawang ito ay magpapakita kung paano ito magagawa para sa isang Entidad ng tawag.

## Unang Hakbang. Lumikha ng klase ng Serbisyo

```php
<?php
 
namespace Espo\Custom\Services;
 
use \Espo\ORM\Entity;
 
class TestService extends \Espo\Core\Services\Base
{
    public function testServiceAction($workflowId, Entity $entity, $additionalParameters = null)
    {
        // Ang code mo dito
    }
}
```

## Pangalawang hakbang. Tukuyin ang paraan ng serbisyo ng pagpapatakbo sa metadata

Ilikha/i-edit ang file `custom/Espo/Custom/Resources/metadata/entityDefs/Workflow.json`

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
Paalala: Maaari ka ring lumikha ng file na Workflow.json ng metadata sa iyong direktoryo ng module.

## Pangatlong Hakbang. Magdagdag ng label

Magdagdag o i-edit (kung ang file ay umiiral) ang file `custom/Espo/Custom/Resources/i18n/en_US/Workflow.json`.

```json
{
    "serviceActions": {
        "testServiceAction": "Label for TestServiceAction"
    }
}
```
O kung mayroon kang parehong pangalan ng pamamaraan para sa maraming uri ng entidad, maaari mong tukuyin ang iba't ibang pagsasalin para sa mga ito.

```json
{
    "serviceActions": {
        "CallTestServiceAction": "Label for Call TestServiceAction",
        "TaskTestServiceAction": "Label for Task TestServiceAction"
    }
}
```
Tandaan: Maaari ka ring lumikha ng file na Workflow.json file lenggwahe sa iyong direktoryo ng module.

## Pang-apat na hakbang. Magdagdag ng mga tip sa paggamit (hindi sapilitan)

Idagdag o i-edit ang file `custom/Espo/Custom/Resources/i18n/en_US/Workflow.json`.

```json
{
    "serviceActionsHelp": {
        "testServiceAction": "This is a description of testServiceAction action"
    }
}
```
O kung mayroon kang parehong pangalan ng pamamaraan para sa maraming uri ng entidad, maaari mong tukuyin ang iba't ibang mga tip na xts para sa kanila.

```json
{
    "serviceActionsHelp": {
        "CallTestServiceAction": "This is a description of TestServiceAction for Call entity",
        "TaskTestServiceAction": "This is a description of TestServiceAction for Task entity"
    }
}
```

## Panlimang Hakbang. i-clear ang cache

Panel ng Administrasyon > i- Clear ang Cache. Ngayon ang aksyon ng serbisyo ay magagamit para sa Mga Workflow sa form ng Run Service Action.
