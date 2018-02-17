# Adăugarea unor acțiuni de serviciu personalizate pentru Fluxul de lucru

Fluxurile de lucru permit crearea unor acțiuni de serviciu personalizate. Acest exemplu o să arate cum se poate face acest lucru pentru a apela o entitate.

## Pasul 1. Creați clasa de serviciu

```php
<?php
 
namespace Espo\Custom\Services;
 
use \Espo\ORM\Entity;
 
class TestService extends \Espo\Core\Services\Base
{
    public function testServiceAction($workflowId, Entity $entity, $additionalParameters = null)
    {
        // your code here
    }
}
```

## Pasul 2. Definiți metoda de rularea a sreviciului în metadate

Creați/editați fișierul `custom/Espo/Custom/Resources/metadata/entityDefs/Workflow.json`

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
Rețineți: Puteți creea metoda fișierului în fișierul Workflow.json în directorul modulului.

## Pasul 3. Adăugarea unei etichete

Adăugarea sau editarea fișierului (dacă acesta există) `custom/Espo/Custom/Resources/i18n/en_US/Workflow.json`.

```json
{
    "serviceActions": {
        "testServiceAction": "Label for TestServiceAction"
    }
}
```
Sau dacă aveți același nume de metodă pentru mai multe tipuri de entități, puteți defini diferite traduceri pentru ele.

```json
{
    "serviceActions": {
        "CallTestServiceAction": "Label for Call TestServiceAction",
        "TaskTestServiceAction": "Label for Task TestServiceAction"
    }
}
```
Rețineți: Puteți să creați fișierul limbii Workflow.json în directorul modulului.

## Pasul 4. Adăugarea sfaturilor de utilizare (opțional)

Adaugați sau editași fișierul `custom/Espo/Custom/Resources/i18n/en_US/Workflow.json`.

```json
{
    "serviceActionsHelp": {
        "testServiceAction": "This is a description of testServiceAction action"
    }
}
```
Sau dacă aveți același nume de metodă pentru mai multe tipuri de entități, puteți defini diferite sfaturi xtp pentru ele.

```json
{
    "serviceActionsHelp": {
        "CallTestServiceAction": "This is a description of TestServiceAction for Call entity",
        "TaskTestServiceAction": "This is a description of TestServiceAction for Task entity"
    }
}
```

## Pasul 5. Ștergeți cache-ul

Administration panel > Clear Cache. Acșiunea serviciului este diponibilă pentru Fluxurile de lucru în formularul Actiunilor de Rulare a Serviciilor.