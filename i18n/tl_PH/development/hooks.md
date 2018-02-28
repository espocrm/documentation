# Mga Hook

## Gumawa ng Hook
Upang lumikha ng hook, kailangan mo:
- lumikha ng isang file `custom/Espo/Custom/Hooks/{EntityName}/{HookName}.php`;
- ideklara ang hook type action;
- burahin ang Cache sa Administrasyon.

## Mga Uri ng Hook

Ang mga pangunahing uri ng hook ay:

- beforeSave;
- afterSave;
- beforeRemove;
- afterRemove;
- afterRelate;
- afterUnrelate;
- afterMassRelate.

### Panibagong Uri ng Hook
Maaari mong gamitin ang iyong sariling uri ng hook at simulan ito sa pamamagitan ng

`$this->getEntityManager()->getHookManager()->process($entityType, $hookType, $entity, $options);`.

## Pagkakasunud-sunod ng Hook
Kung mayroon kang ilang mga hook, na may kaugnayan sa isang Entity Type at at may parehong uri ng hook, at ang pagpapatakbo ng order ay mahalaga, maaari kang magtakda ng isang `public static $order` na katangian sa isang integer value.

Pataas na order - ang hook na may pinakamaliit na numero ng order ang unang tatakbo.

## Halimbawa
Ang halimbawa na ito ay nagtatakda ng pangalan ng Account para sa mga bagong Lead, kung hindi ito naka-set.

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
Kung kailangan mong mag-apply ng hook para sa lahat nga mga entity, maaari mong gamitin ang karaniwang mga hook. Upang gawin ito, ilagay ang klase ng iyong hook sa Karaniwang direktoryo, e.g. `custom/Espo/Custom/Hooks/Common/{HookName}.php`.
