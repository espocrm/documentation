# Definindo novas funções para Fórmula

EspoCRM oferece a possibilidade de criar funções personalizadas que podem ser usadas na fórmula. 

Se a sua função estiver relacionada com um de grupos como String, Logic, Date, crie um arquivo em __{GroupName}Grupo__ pasta, nomeado __{FunctionName}Tipo.php__ com __{FunctionName}Tipo__ declaração de classe. Precisas de definir o método __'processo'__.

Por exemplo, vamos criar uma nova função de string para verificar se uma string (HAYSTACK) contém outra string (AGULHA) com um possível deslocamento (OFFSET).

Cria o arquivo `application/Espo/Core/Formula/Functions/StringGroup/ContainsType.php` com o código:

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
## Adicionar a função à lista

Para adicionar a função criada à lista de funções da fórmula, crie um arquivo `custom/Espo/Custom/Resources/metadata/app/formula.json` e adiciona o código:
```
{
    "functionList": [
        {
            "name": "string\\contains",
            "insertText": "string\\contains(HAYSTACK, NEEDLE, OFFSET)"
        }
}
```

__Limpe o cache__ e use esta função na fórmula. Pode digitar `string\contains(HAYSTACK, NEEDLE, OFFSET)` ou selecionar a partir da lista de funções, se o adicionares.
