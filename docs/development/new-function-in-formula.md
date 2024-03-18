# Custom functions for Formula

EspoCRM provides the ability to create custom functions that can be used in formula-script. 

Create a file `custom/Espo/Custom/FormulaFunctions/MyContains.php` with the code:

```php
<?php
namespace Espo\Custom\FormulaFunctions;

use Espo\Core\Formula\Exceptions\TooFewArguments;
use Espo\Core\Formula\Func;
use Espo\Core\Formula\EvaluatedArgumentList;

class MyContains implements Func
{
    public function __construct(/* pass needed dependencies */) {}

    public function process(EvaluatedArgumentList $arguments): mixed
    {
        if (count($arguments) < 2) {
            throw TooFewArguments::create(1);
        }

        $haystack = $arguments[0];
        $needle = $arguments[1];

        if (count($args) > 2) {
            $offset = $this->evaluate($arguments[2]);
            
            return strpos($haystack, $needle, $offset) !== false;
        }
                
        return strpos($haystack, $needle) !== false;
    }
}
```

Create a file `custom/Espo/Custom/Resources/metadata/app/formula.json` and add the code:

```json
{
    "functionClassNameMap": {
        "myNamespace\\myContains": "Espo\\Custom\\FormulaFunctions\\MyContains"
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

