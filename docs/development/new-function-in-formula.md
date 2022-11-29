# Custom functions for Formula

EspoCRM provides the possibility to create custom functions that can be used in formula. 

Create a file `custom/Espo/Custom/Core/Formula/Functions/MyGroup/MyContainsType.php` with the code:

```php
<?php
namespace Espo\Custom\Core\Formula\Functions\MyGroup;

use Espo\Core\Formula\Functions\BaseFunction;
use Espo\Core\Formula\ArgumentList;

class MyContainsType extends BaseFunction
{
    public function process(ArgumentList $args)
    {
        if (count($args) < 2) {
            $this->throwTooFewArguments();
        }

        $haystack = $this->evaluate($args[0]);
        $needle =  $this->evaluate($args[1]);

        if (count($args) > 2) {
            $offset = $this->evaluate($args[2]);
            
            return strpos($haystack, $needle, $offset) !== false;
        }
        
        // the entity:
        // $this->entity
        
        // variables:
        // $this->variables
        
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
            "insertText": "myGroup\\myContains(HAYSTACK, NEEDLE, OFFSET)"
        }
    ],
    "functionClassNameMap": {
        "string\\myContains": "Espo\\Custom\\Core\\Formula\\Functions\\MyGroup\\MyContainsType"
    }
}
```

Clear cache.
