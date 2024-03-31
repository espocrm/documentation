# Adding custom service action for Workflows

Workflows allow to create custom service actions. This example will show how this can be done for a Call entity.

*As of Advanced Pack v3.2.3.*

## Step 1. Create a class

```php
<?php
 
namespace Espo\Custom\ServiceActions;
 
use Espo\ORM\Entity;
use Espo\Modules\Advanced\Tools\Workflow\Action\RunAction\ServiceAction;

class TestAction implements ServiceAction
{
    // Pass dependencies via constructor.

    public function run(Entity $entity, mixed $data): mixed
    {
        // your code here

        return null;
    }
}
```

## Step 2. Define the run service method in metadata

Create/edit the file `custom/Espo/Custom/Resources/metadata/app/workflow.json`

```json
{
    "serviceActions": {
        "Call":{
            "testAction": {
                "className": "Espo\\Custom\\ServiceActions\\TestAction"
            }
        }
    }
}
```

Note: You can also create the metadata file *workflow.json* file in your module directory.

## Step 3. Add a label

Add or edit (if file exists) the file `custom/Espo/Custom/Resources/i18n/en_US/Workflow.json`.

```json
{
    "serviceActions": {
        "testAction": "My Test Action"
    }
}
```

Or if you have the same method name for several entity types, you can define different translation for them.

```json
{
    "serviceActions": {
        "CallTestAction": "My Test Action for Call",
        "TaskTestAction": "My Test Action for Task"
    }
}
```
Note: You can also create a language file Workflow.json file in your module directory.

## Step 4. Add usage tips (optional)

Add or edit the file `custom/Espo/Custom/Resources/i18n/en_US/Workflow.json`.

```json
{
    "serviceActionsHelp": {
        "testAction": "A description."
    }
}
```

Or if you have the same method name for several entity types, you can define different tips xts for them.

```json
{
    "serviceActionsHelp": {
        "CallTesAction": "...",
        "TaskTestAction": "..."
    }
}
```

## Step 5. Clear cache

Administration panel > Clear Cache. Now the service action is available for Workflows in the *Run Service Action* form.
