# Custom Template Helpers

Helpers works for PDF templates and system email templates (Administration > Template Manager).


## As of v7.0


Create a file `custom/Espo/Custom/Resources/metadata/app/templateHelpers.json`:

```json
{
    "myHelper": "Espo\\Custom\\TemplateHelpers\\MyHelper"
}
```

Create a file `custom/Espo/Custom/TemplateHelpers/MyHelper.php`:

```php
<?php

namespace Espo\Custom\TemplateHelpers;

use Espo\Core\Htmlizer\Helper;
use Espo\Core\Htmlizer\Helper\Data;
use Espo\Core\Htmlizer\Helper\Result;

use Espo\Core\Utils\Metadata;
use Espo\Core\Utils\Config;
use Espo\Core\Utils\Log;

class GoogleMaps implements Helper
{

    public function __construct(
        // Pass needed dependencies.
    ) {

    }
    
    public function render(Data $data): Result
    {
        $color = $data->getOption('color');        
        $text = $data->getArgumentList()[0] ?? '';        
        
        return Result::createSafeString(
            "<span style=\"color: {$color};\">" . $text . "</span>"
        );
    }
}
```

Clear cache.

Then in a template you can use (here `name` refers to the field *name*):

```
{{myHelper name color='#bd318e'}}
```

## Legacy way

Available since version 5.8.0.

For PDF templates and system email templates.

Create a file `custom/Espo/Custom/Resources/metadata/app/templateHelpers.json`:

```json
{
    "myHelper": "Espo\\Custom\\TemplateHelpers\\MyHelper::myHelper"
}
```

Create a file `custom/Espo/Custom/TemplateHelpers/MyHelper.php`:

```php
<?php

namespace Espo\Custom\TemplateHelpers;

use LightnCandy\LightnCandy as LightnCandy;

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
        $injectableFactory = $data['__injectableFactory'];

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
