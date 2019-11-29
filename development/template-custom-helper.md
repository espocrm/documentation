# Custom Template Helpers

For PDF templates and system email templates.

Create a file `custom/Espo/Resources/metadata/app/templateHelpers.json`:

```json
{
    "myHelper": "\\Espo\\Custom\\TemplateHelpers\\MyHelper::myHelper"
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

        $value = $args[0] ?? null; // argument

        $color = $context['hash']['color'] ?? '#EA1'; // option

        // these objects may be needed in your custom helper
        $dateTime = $context['data']['root']['__dateTime'];
        $metadata = $context['data']['root']['__metadata'];
        $entityManager = $context['data']['root']['__entityManager'];

        $html = "<span style=\"color: {$color};\">" . $value . "</span>";

        return new LightnCandy\SafeString($html);
    }
}
```

Then in a template you can use:

```
{{myHelper name color='#bd318e'}}
```
