# Hooks

Hooks framework provides the ability to catch some actions in the system in order to call custom logic.

Common hooks for all entity types (called from the ORM repository class):

- beforeSave
- afterSave
- beforeRemove
- afterRemove
- afterRelate
- afterUnrelate
- afterMassRelate

## Creating hook

* create a file `custom/Espo/Custom/Hooks/{EntityName}/{HookName}.php` (you can also use a module directory);
* declare a hook action method with a name the same as a hook name (e.g. *beforeSave*);
* clear Cache in Administration.

## Hook order

If you have several hooks, related to one Entity Type and with the same hook type, and running order is important, you can set a `public static $order` property with an integer value.

Ascending order is applied – a hook with the smallest order number runs first.

## Example

This example sets an Account Name for new Leads, if it's not set.

`custom/Espo/Custom/Hooks/Lead/MyHook.php`

```php
<?php
namespace Espo\Custom\Hooks\Lead;

use Espo\ORM\Entity;

class MyHook
{    
    // An optional parameter, defines in which order hooks will be processed.
    // Lesser value means sooner.
    public static $order = 5; 
    
    public function __construct(
        // Define needed dependencies.
    ) {}
    
    public function beforeSave(Entity $entity, array $options): void
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
* *afterOptIn* - when a target opts-in through Lead Capture, data are passed in the 3rd $data argument

#### Meeting / Call

* *afterConfirmation* - when an event attendee clicks on accept/decline/tentative link; details are passed in the 3rd $data argument

#### Contact

* *afterLeadCapture* - when a contact (existing in crm) opts-in through Lead Capture, leadCaptureId is passed in the 3rd $data argument
* *afterOptOut*
* *afterCancelOptOut*

#### Lead

* *afterLeadCapture* - when a lead opts-in through Lead Capture, leadCaptureId is passed in the 3rd $data argument
* *afterOptOut*
* *afterCancelOptOut*

#### LeadCapture

* *afterLeadCapture* - when a target (lead or contact) opts-in through Lead Capture, target data are passed in the 3rd $data argument

#### CampaignTrackingUrl

* *afterClick* - when a target (lead/contact/account) opened a tracking url in email

#### Examples

`custom/Espo/Custom/Hooks/TargetList/MyHook.php`
```php
<?php
namespace Espo\Custom\Hooks\TargetList;

use Espo\ORM\Entity;

class MyHook
{    
    public function afterOptOut(Entity $targetList, array $options, array $data): void
    {
        $targetId = $data['targetId'];
        $targetType = $data['targetType'];
        $link = $data['link'];
    }
}
```

`custom/Espo/Custom/Hooks/Meeting/MyHook.php`
```php
<?php
namespace Espo\Custom\Hooks\Meeting;

use Espo\ORM\Entity;

class MyHook
{    
    public function afterConfirmation(Entity $meeting, array $options, array $data): void
    {
        $status = $data['status'];
        $inviteeType = $data['inviteeType'];
        $inviteeId = $data['inviteeId'];
        
        if ($status === 'Accepted') {
        
        }
    }
}
```



### Triggering hook

Inject the hook manager `Espo\Core\HookManager` to your class. Use the `process` method.

```php
$this->hookManager->process($entityType, $hookType, $entity, $options);
```

Note: A hook name can't start with `set`. It's reserved for a dependency injection.
