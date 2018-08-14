# Pagtukoy sa mga Bagong Function para sa Pormula

Ang EspoCRM nagbibigay ng posibilidad na lumikha ng mga kustom na function na maaaring magamit sa pormula. 

Kung ang iyong function ay may kaugnayan sa isa sa mga grupo tulad ng String, Lohika, Petsa, lumikha ng isang file sa __{GroupName}Group__ na polder, na nagngagalan ng __{FunctionName}Type.php__ kasama ng __{FunctionName}Type__ deklarasyon ng klase. Kailangan mong tukuyin ang pamamaraan na __'process'__.

Halimbawa, gumawa tayo ng bagong string na function para sa pagsusuri kung ang isang string (HAYSTACK) ay naglalaman ng isa pang string (NEEDLE) na may posibleng offset (OFFSET).

Lumikha ng isang file na `application/Espo/Core/Formula/Functions/StringGroup/ContainsType.php` na may code na:

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
## Pagdagdag ng function sa listahan

Upang idagdag ang nilikhang function sa listahan ng function ng pormula, lumikha ng isang file na `custom/Espo/Custom/Resources/metadata/app/formula.json` at idagdag ang code na:
```
{
    "functionList": [
        {
            "name": "string\\contains",
            "insertText": "string\\contains(HAYSTACK, NEEDLE, OFFSET)"
        }
}
```

__Burahin ang cache__ at gamitin ang function na ito sa pormula. Maaari mo itong i-type `string\contains(HAYSTACK, NEEDLE, OFFSET)` o pumili mula sa listahan ng function, kung idagdag mo ito.

