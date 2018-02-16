# Hooks

## Creați un Hook
Pentru a creea un hook, trebui să:
- creați un fișier `custom/Espo/Custom/Hooks/{EntityName}/{HookName}.php`;
- declarați tipul acțiunii hook;
- șterge Cache din Administrare.

## Tipuri de Hook

Tipurile principale de hook sunt:

- beforeSave;
- afterSave;
- beforeRemove;
- afterRemove;
- afterRelate;
- afterUnrelate;
- afterMassRelate.

### Un nou tip de Hook
Puteți să îl folosiți propriul tip de hook și să îl declanșați

`$this->getEntityManager()->getHookManager()->process($entityType, $hookType, $entity, $options);`.

## Ordinea Hook
Dacă aveți mai multe hook, legate de Tipul Entității și cu același tip de hook, și ordinea rulării este importantă, puteți seta o proprietate `public static $order` într-o valoare de tip integer.

Ordine ascendentă - Hook-ul cu cea numărul de orinde cel mai mic, va rula primul.

## Exemplu
Acest exemplu setează Numele Contului pentru noi Leads, dacă nu a fost setat încă.

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

##  Hook Globale
Dacă trebuie să aplicați un hook pentru toate entitățile, puteți folosi hooks obișnuite. Pentru a face acest lucru, puneți clasa hook-ului în directorul Common, ex. `custom/Espo/Custom/Hooks/Common/{HookName}.php`.
