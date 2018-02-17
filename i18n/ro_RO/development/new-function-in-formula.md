# Definirea unor noi funcții pentru Formulă

EspoCRM oferă posibilitatea creării unor funcții personalizate care pot fi folosite în formulă.

Dacă funcția este asemănătoare cu grupuri ca String, Logic, Date, creați un fișier in __{GroupName}Group__ folder, named __{FunctionName}Type.php__ with __{FunctionName}Type__ class declaration. Va trebui să definiți metoda __'process'__.

De exemplu, putem creea o nouă funție șir dacă șirul conține (HAYSTACK) un alt șir (NEEDLE) cu un posibil offset (OFFSET).

Creați un fișier `application/Espo/Core/Formula/Functions/StringGroup/ContainsType.php` cu codul:

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
## Adăugarea funției în lista

Pentru a putea adăuga funcția la lista funcțiilor formulei, creați un fișier `custom/Espo/Custom/Resources/metadata/app/formula.json` și adăugați codul:
```
{
    "functionList": [
        {
            "name": "string\\contains",
            "insertText": "string\\contains(HAYSTACK, NEEDLE, OFFSET)"
        }
}
```

__Clear cache__ și folosiți funcția în formula. Puteți să tastți `string\contains(HAYSTACK, NEEDLE, OFFSET)` sau selectați din lista funcției, dacă ați adăugat-o.

