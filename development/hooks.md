# Hooks

## Create a hook
To create a hook, you need to:
- create a file `custom/Espo/Custom/Hooks/{EntityName}/{HookName}.php`;
- declare hook type action;
- clear Cache in Administration.

## Hook types

The main hook types are:

- beforeSave;
- afterSave;
- beforeRemove;
- afterRemove;
- afterRelate;
- afterUnrelate;
- afterMassRelate.

### New hook type
You can use your own hook type and trigger it with

`$this->getEntityManager()->getHookManager()->process($entityType, $hookType, $entity, $options);`.

## Hook order
If you have several hooks, related to one Entity Type and with the same hook type, and running order is important, you can set a `public static $order` property in an integer value.

Ascending order - the hook with the smallest order number runs first.

## Example
This example sets Account Name for new Leads, if it is not set.

`custom/Espo/Custom/Hooks/Lead/AccountName.php`

```php
namespace Espo\Custom\Hooks\Lead;

use Espo\ORM\Entity;

class AccountName extends \Espo\Core\Hooks\Base
{    
    public function beforeSave(Entity $entity, array $options = [])
    {
        if ($entity->isNew() && !$entity->get('accountName')) { 
            $entity->set('accountName', 'No Account');
        }
    }
}
```

## Global hooks
If you need to apply a hook for all entities, you can use common hooks. To do this, put your hook class in Common directory, e.g. `custom/Espo/Custom/Hooks/Common/{HookName}.php`.

## Additional default hooks

#### Target List

* afterOptOut - when a target clicks an opt-out link, data passed in the 3rd $data argument
* afterCancelOptOut - when a target subscribes again

#### Meeting/Call

* afterConfirmation - when an event attendee clicks on accept/decline/tentative link; details are passed in the 3rd $data argument

#### Examples

`custom/Espo/Custom/Hooks/TargetList/MyHook.php`

```
namespace Espo\Custom\Hooks\TargetList;

class MyHook extends \Espo\Core\Hooks\Base
{    
    public function afterOptOut(\Espo\ORM\Entity $targetList, array $options, array $data)
    {
        $targetId = $data['targetId'];
        $targetType = $data['targetType'];
        $link = $data['link'];
    }
}
```

`custom/Espo/Custom/Hooks/Meeting/MyHook.php`
```
namespace Espo\Custom\Hooks\Meeting;

class MyHook extends \Espo\Core\Hooks\Base
{    
    public function afterConfirmation(\Espo\ORM\Entity $meeting, array $options, array $data)
    {
        $status = $data['status'];
        $inviteeType = $data['inviteeType'];
        $inviteeId = $data['inviteeId'];
        
        if ($status == 'Accepted') {
        
        }
    }
}
```

