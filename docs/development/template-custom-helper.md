# Custom Template Helpers

Available since version 5.8.0.

For PDF templates and system email templates.

Create a file `custom/Espo/Resources/metadata/app/templateHelpers.json`:

```json
{
    "myHelper": "Espo\\Custom\\TemplateHelpers\\MyHelper::myHelper"
}
```

Create a file `custom/Espo/Custom/TemplateHelpers/MyHelper.php`:

```php
<?php

namespace Espo\Custom\TemplateHelpers;

class MyHelper
{
    public static function myHelper()
    {
        $args = func_get_args();
        $context = $args[count($args) - 1];
        $hash = $context['hash'];
        $data = $context['data']['root'];

        $value = $args[0] ?? null; // argument

        $color = $hash['color'] ?? '#EA1'; // option color='VALUE'

        // these objects may be needed in your custom helper
        $dateTime = $data['__dateTime'];
        $metadata = $data['__metadata'];
        $entityManager = $data['__entityManager'];
        $serviceFactory = $data['__serviceFactory'];
        $config = $data['__config'];

        $entityType = $data['__entityType'];

        $html = "<span style=\"color: {$color};\">" . $value . "</span>";

        return new LightnCandy\SafeString($html);
    }
}
```

Then in a template you can use:

```
{{myHelper name color='#bd318e'}}
```
