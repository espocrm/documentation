# Adicionar ação de serviço personalizado para Workflow

Fluxos de trabalho permitem criar ações de serviço personalizado. Este exemplo mostrará como isto pode ser feito para uma entidade de chamada.

## Passo 1. Criar classe de serviço

```php
<?php
 
namespace Espo\Custom\Services;
 
use \Espo\ORM\Entity;
 
class TestService extends \Espo\Core\Services\Base
{
    public function testServiceAction($workflowId, Entity $entity, $additionalParameters = null)
    {
        // o teu código aqui
    }
}
```

## Passo 2. Define o método do serviço de execução em metadados

Criar/editar o arquivo `custom/Espo/Custom/Resources/metadata/entityDefs/Workflow.json`

```json
{
    "serviceActions": {
        "Call":{
            "testServiceAction": {
                "serviceName": "TestService",
                "methodName": "testServiceAction"
            }
        }
    }
}
```
Nota: Tu também pode criar um arquivo de metadados arquivo Workflow.json no diretório do teu módulo.

## Passo 3. Adicionar uma etiqueta

Adicionar ou editar (se o arquivo existir) o arquivo `custom/Espo/Custom/Resources/i18n/en_US/Workflow.json`.

```json
{
    "serviceActions": {
        "testServiceAction": "Label for TestServiceAction"
    }
}
```
Ou se tens o mesmo nome de método para vários tipos de entidade, podes definir uma tradução diferente para eles.

```json
{
    "serviceActions": {
        "CallTestServiceAction": "Label for Call TestServiceAction",
        "TaskTestServiceAction": "Label for Task TestServiceAction"
    }
}
```
Nota: Você também pode criar arquivos do arquivo Fileflow.json no diretório do teu módulo.

## Passo 4. Adicionar dicas de uso (opcional)

Adicione ou edite o arquivo `custom/Espo/Custom/Resources/i18n/en_US/Workflow.json`.

```json
{
    "serviceActionsHelp": {
        "testServiceAction": "This is a description of testServiceAction action"
    }
}
```
Ou se você possuir o mesmo nome de método para vários tipos de entidade, pode definir dicas diferentes para eles.

```json
{
    "serviceActionsHelp": {
        "CallTestServiceAction": "This is a description of TestServiceAction for Call entity",
        "TaskTestServiceAction": "This is a description of TestServiceAction for Task entity"
    }
}
```

## Passo 5. Limpar cache

Painel de administração > Limpar Cache. Agora, a ação do serviço está disponível para fluxos de trabalho no formulário Execução do serviço.
