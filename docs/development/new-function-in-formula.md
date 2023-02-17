# Custom functions for Formula

EspoCRM provides the ability to create custom functions that can be used in formula-script. 

Create a file `custom/Espo/Custom/FormulaFunctions/MyContains.php` with the code:

```php
<?php
namespace Espo\Custom\FormulaFunctions;

use Espo\Core\Formula\Functions\BaseFunction;
use Espo\Core\Formula\ArgumentList;

class MyContains extends BaseFunction
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

Create a file `custom/Espo/Custom/Resources/metadata/app/formula.json` and add the code:

```json
{
    "functionClassNameMap": {
        "string\\myContains": "Espo\\Custom\\FormulaFunctions\\MyContains"
    },
    "functionList": [
        "__APPEND__",
        {
            "name": "myNamespace\\myContains",
            "insertText": "myNamespace\\myContains(HAYSTACK, NEEDLE, OFFSET)"
        }
    ]
}
```

Clear cache.

## Func interface

*As of v7.4.*

Instead of extending *BaseFunction*, you can implement `Espo\Core\Formula\Func` interface. This allows to inject any dependency to the function class via the constructor. Values passed to the *process* method are already evaluated.
