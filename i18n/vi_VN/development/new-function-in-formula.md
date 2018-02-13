# Defining new funtions for Formula

EspoCRM provides the possibility to create custom functions that can be used in formula. 

If your function is related to the one of groups like String, Logic, Date, create a file in __{GroupName}Group__ folder, named __{FunctionName}Type.php__ with __{FunctionName}Type__ class declaration. You need to define the method __'process'__.

For example, let's create a new string function for checking if a string (HAYSTACK) contains another string (NEEDLE) with a possible offset (OFFSET).

Create a file `application/Espo/Core/Formula/Functions/StringGroup/ContainsType.php` with the code:

```
namespace Espo\Core\Formula\Functions\StringGroup;

use \Espo\Core\Exceptions\Error;

class ContainsType extends \Espo\Core\Formula\Functions\Base
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
## Adding the function to the list

In order to add the created function to the function list of formula, create a file `custom/Espo/Custom/Resources/metadata/app/formula.json` and add the code:
```
{
    "functionList": [
        {
            "name": "string\\contains",
            "insertText": "string\\contains(HAYSTACK, NEEDLE, OFFSET)"
        }
}
```

__Clear cache__ and use this function in formula. You can type it `string\contains(HAYSTACK, NEEDLE, OFFSET)` or select from function list, if you add it.

