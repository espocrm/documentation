# Ganchos

## Criar um Gancho
Para criar um gancho, tu precisas:
- cria um arquivo `custom/Espo/Custom/Hooks/{EntityName}/{HookName}.php`;
- declara ação do tipo gancho;
- limpa o Cache na Administração.

## Tipos de Gancho

Os principais tipos de gancho são:

- beforeSave;
- afterSave;
- beforeRemove;
- afterRemove;
- afterRelate;
- afterUnrelate;
- afterMassRelate.

### Novo Tipo de Gancho
Podes usar o teu próprio tipo de gancho e desencadeá-lo com

`$this->getEntityManager()->getHookManager()->process($entityType, $hookType, $entity, $options);`.

## Ordem Gancho
Se tiveres vários ganchos, relacionados a um Tipo de Entidade e com o mesmo tipo de gancho, e o pedido de execução é importante, podes definir uma propriedade `publicstatic$order` num valor inteiro.

Ordem ascendente - o gancho com o número de ordem mais pequeno é executado primeiro.

## Exemplo
Este exemplo define o nome da conta para novos leads, se não estiver configurado.

`custom/Espo/Custom/Hooks/Lead/AccountName.php`

```php
namespace Espo\Custom\Hooks\Lead;

usa Espo\ORM\Entity;

class AccountName extends \Espo\Core\Hooks\Base
{    
    public function beforeSave(Entity $entity, array $options = array())
    {
        if ($entity->isNew() && !$entity->get('accountName')) { 
            $entity->set("accountName", "No Account");
        }
    }
}
```

## Ganchos Globais
Se precisares de aplicar um gancho para todas as entidades, podes usar ganchos comuns. Para fazer isto, coloca a tua sua classe de gancho no diretório Comum, por exemplo: `custom/Espo/Custom/Hooks/Common/{HookName}.php`.
