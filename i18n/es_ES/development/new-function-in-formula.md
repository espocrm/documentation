# Definiendo de nuevas funciones para Fórmula

EspoCRM ofrece la posibilidad de crear funciones personalizadas que se pueden usar en fórmula.

Si su función está relacionada con la de grupos como Cadena, Lógico, Fecha, cree un archivo en la carpeta __{NombreGrupo}Grupo__, llamado __{NombreFunción}Tipo.php__ con __{NombreFunción}Tipo__ declaración de clase. Necesita definir el método __'proceso'__.

Por ejemplo, creemos una nueva función de cadena para verificar si una cadena (HAYSTACK) contiene otra cadena (NEEDLE) con un posible desplazamiento (OFFSET).

Crea un archivo
`application/Espo/Core/Formula/Functions/StringGroup/ContainsType.php` con el código:

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
## Añadiendo una función a la lista

Para agregar la función creada a la lista de funciones de fórmula, cree un archivo `custom/Espo/Custom/Resources/metadata/app/formula.json` y agregue el código:
```
{
    "functionList": [
        {
            "name": "string\\contains",
            "insertText": "string\\contains(HAYSTACK, NEEDLE, OFFSET)"
        }
}
```

__Limpie Caché__ y use esta función en la fórmula. Puede escribirlo `string\contains(HAYSTACK, NEEDLE, OFFSET)` o seleccionarlo de la lista de función, si lo añadió.
