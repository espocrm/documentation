# Mga Hook

## Pagbuhat ug usa ka Hook
Aron makahimo ka usa ka hook, kinahanglan nimo:
- maghimo ug file `custom/Espo/Custom/Hooks/{EntityName}/{HookName}.php`;
- ideklarar ang hook type action;
- limpyohan ang Cache sa Administrasyon..

## Mga Tipo sa mga Hook

Ang nag-unang mga tipikal nga hook mao:

- beforeSave;
- afterSave;
- beforeRemove;
- afterRemove;
- afterRelate;
- afterUnrelate;
- afterMassRelate.

### Bag-ong Tipo sa Hook
Mahimo nimong gamiton ang imong kaugalingong tipo nga hook ug sugdan kini uban sa

`$this->getEntityManager()->getHookManager()->process($entityType, $hookType, $entity, $options);`.

## Ang Order sa Hook
Kon aduna kay daghang mga hook, nga may kalabutan sa usa ka Entity Type ug uban sa parehas nga hook type, ug ang running order importante, mahimo ka magtakda sa `public static $order` nga property sa usa ka integer value.

Pataas nga han-ay - nga may pinakagamay nga numero sa han-ay runs modagan ug una.

## Pananglitan
Kini nga ehemplo nagtakda sa ngalan sa account alang sa mga bag-ong Lead, kon wala kini gitakda.

`custom/Espo/Custom/Hooks/Lead/AccountName.php`

```php
namespace Espo\Custom\Hooks\Lead;

use Espo\ORM\Entity;

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

## Mga Global Hook
Kung kinahanglan nimo nga gamiton ang usa ka hook alang sa tanan nga mga entity, mahimo nimo gamiton ang mga common nga hook. Sa pagbuhat niini, ibutang ang imong hook class sa Common nga direktoryo, e.g. `custom/Espo/Custom/Hooks/Common/{HookName}.php`.
