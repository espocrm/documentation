# Custom Template Helpers

*As of v7.0.*

Helpers works for PDF templates and system email templates (Administration > Template Manager).


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

class MyHelper implements Helper
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

Then in a template you can use:

```
{{myHelper 'some text' color='#bd318e'}}
```

