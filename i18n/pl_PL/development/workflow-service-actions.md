# Adding custom service action for Workflow

Workflows allow to create custom service actions. This example will show how this can be done for a Call entity.

## Step 1. Create service class

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

## Step 2. Define the run service method in metadata

Create/edit the file `custom/Espo/Custom/Resources/metadata/entityDefs/Workflow.json`

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
Note: You can also create metadata file Workflow.json file in your module directory.

## Step 3. Add a label

Add or edit (if file exists) the file `custom/Espo/Custom/Resources/i18n/en_US/Workflow.json`.

```json
{
    "serviceActions": {
        "testServiceAction": "Label for TestServiceAction"
    }
}
```
Or if you have the same method name for several entity types, you can define different translation for them.

```json
{
    "serviceActions": {
        "CallTestServiceAction": "Label for Call TestServiceAction",
        "TaskTestServiceAction": "Label for Task TestServiceAction"
    }
}
```
Note: You can also create language file Workflow.json file in your module directory.

## Step 4. Add usage tips (optional)

Add or edit the file `custom/Espo/Custom/Resources/i18n/en_US/Workflow.json`.

```json
{
    "serviceActionsHelp": {
        "testServiceAction": "This is a description of testServiceAction action"
    }
}
```
Or if you have the same method name for several entity types, you can define different tips xts for them.

```json
{
    "serviceActionsHelp": {
        "CallTestServiceAction": "This is a description of TestServiceAction for Call entity",
        "TaskTestServiceAction": "This is a description of TestServiceAction for Task entity"
    }
}
```

## Step 5. Clear cache

Administration panel > Clear Cache. Now the service action is available for Workflows in the Run Service Action form.
