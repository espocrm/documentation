# Hooks

Common hooks:

- beforeSave
- afterSave
- beforeRemove
- afterRemove
- afterRelate
- afterUnrelate
- afterMassRelate

## Creating hook

* create a file `custom/Espo/Custom/Hooks/{EntityName}/{HookName}.php`;
* declare hook type action;
- clear Cache in Administration.

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

#### TargetList

* *afterOptOut* - when a target clicks an opt-out link, data are passed in the 3rd $data argument
* *afterCancelOptOut* - when a target subscribes again
* *afterOptIn* - when a target opts-in through Lead Capture, data are passed in the 3rd $data argument (since 5.6.9)

#### Meeting / Call

* *afterConfirmation* - when an event attendee clicks on accept/decline/tentative link; details are passed in the 3rd $data argument

#### Contact

* *afterLeadCapture* - when a contact (existing in crm) opts-in through Lead Capture, leadCaptureId is passed in the 3rd $data argument (since 5.6.9)
* *afterOptOut* (since 5.7.0)
* *afterCancelOptOut* (since 5.7.0)

#### Lead

* *afterLeadCapture* - when a lead opts-in through Lead Capture, leadCaptureId is passed in the 3rd $data argument (since 5.6.9)
* *afterOptOut* (since 5.7.0)
* *afterCancelOptOut* (since 5.7.0)

#### LeadCapture

* *afterLeadCapture* - when a target (lead or contact) opts-in through Lead Capture, target data are passed in the 3rd $data argument (since 5.6.9)

#### CampaignTrackingUrl

* *afterClick* - when a target (lead/contact/account) opened a tracking url in email (since 5.7.0)

#### Examples

`custom/Espo/Custom/Hooks/TargetList/MyHook.php`
```php
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
```php
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



### Triggering hook

```php
$this->getEntityManager()->getHookManager()->process($entityType, $hookType, $entity, $options);
```


