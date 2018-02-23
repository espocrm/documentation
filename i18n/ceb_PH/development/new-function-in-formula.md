# Pagdeklara sa ug mga bag-o nga punsyon para sa Formula

Ang EspCRM kay naghatag og posibilidad nga muhimo og mga custom nga punsyon nga pwedeng gamiton sa formula.

Kung ang imong punsyon kay naay kalabotan sa usa sa mga grupo parehas sa String, Logic, Date, paghimo og file sa __{GroupName}Group__ nga folder, nga naay pangalan nga __{FunctionName}Type.php__ ug naay __{FunctionName}Type__ nga class nga deklarasyon. Gikinahanglan nimong itakda ang method __'process'__.

Pananglitan, muhimo ta og bag-o nga string nga punsyon para susihon kung ang usa ka string (HAYSTACK) kay naglangkob sa ubang string (NEEDLE) nga posibleng naay offset (OFFSET).

Himo og file `application/Espo/Core/Formula/Functions/StringGroup/ContainsType.php` nga naay code nga:

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
## Pagbutang sa punsyon ngadto sa lista

Para mapuno ang nahimo nga punsyon ngadto sa listahan sa mga punsyon sa formula, himo og file nga `custom/Espo/Custom/Resources/metadata/app/formula.json` ug ipuno ang code nga:
```
{
    "functionList": [
        {
            "name": "string\\contains",
            "insertText": "string\\contains(HAYSTACK, NEEDLE, OFFSET)"
        }
}
```

__Pag-clear cache__ ug gamita ni nga punsyon sa formula. Pwede ni nimong i-type `string\contains(HAYSTACK, NEEDLE, OFFSET)` o pilion gikan sa listahan sa mga punsyon, kung imoha ning ipuno.

