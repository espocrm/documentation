# Custom functions for Formula

EspoCRM provides the possibility to create custom functions that can be used in formula. 

Create a file `custom/Espo/Custom/Core/Formula/Functions/StringGroup/MyContainsType.php` with the code:

```php
<?php
namespace Espo\Custom\Core\Formula\Functions\StringGroup;

use Espo\Core\Exceptions\Error;

class MyContainsType extends \Espo\Core\Formula\Functions\Base
{
    public function process(\StdClass $item)
    {
        $args = $this->fetchArguments($item);
        
        if (count($args) < 2) {
            throw new Error("MyContains: Too few arguments.");
        }

        $haystack = $args[0];
        $needle = $args[1];

        if (count($args) > 2) {
            $offset = $args[2];
            
            return strpos($haystack, $needle, $offset) !== false;
        }

        return strpos($haystack, $needle) !== false;
    }
}
```

In order to add the created function to the function list of formula, create a file `custom/Espo/Custom/Resources/metadata/app/formula.json` and add the code:
```json
{
    "functionList": [
        "__APPEND__",
        {
            "name": "string\\myContains",
            "insertText": "string\\myContains(HAYSTACK, NEEDLE, OFFSET)"
        }
    ],
    "functionClassNameMap": {
        "string\\myContains": "Espo\\Custom\\Core\\Formula\\Functions\\StringGroup\\MyContainsType"
    }
}
```

Clear cache.
