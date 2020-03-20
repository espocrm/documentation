# Defining new funtions for Formula

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
        if (!property_exists($item, 'value')) {
            throw new Error();
        }

        if (!is_array($item->value)) {
            throw new Error();
        }

        if (count($item->value) < 2) {
            throw new Error();
        }

        $haystack = $this->evaluate($item->value[0]);
        $needle = $this->evaluate($item->value[1]);

        if (count($item->value) > 2) {
            $offset = $this->evaluate($item->value[2]);
            return !(strpos($haystack, $needle, $offset) === false);
        } else {
            return !(strpos($haystack, $needle) === false);
        }
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
        "string\\myContains": "\\Espo\\Custom\\Core\\Formula\\Functions\\StringGroup\\MyContainsType"
    }
}
```

Clear cache.
