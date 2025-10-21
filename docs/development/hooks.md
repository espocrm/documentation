# Hooks

The Hooks framework provides the ability to catch some actions in the system in order to call custom logic.

Common hooks for all entity types (called from the ORM Repository class):

- *beforeSave* – just before a record is saved;
- *afterSave* – after a record is saved;
- *beforeRemove* – before a record is removed;
- *afterRemove* – after a record is removed;
- *afterRelate* – when two records are related through a many-to-many relationship;
- *afterUnrelate* – when two records are unrelated through a many-to-many relationship;
- *afterMassRelate*

## Creating hook

* create a file `custom/Espo/Custom/Hooks/{EntityType}/{HookName}.php` (you can also use a module directory);
* declare a hook action method with a name the same as a hook name (e.g. *beforeSave*);
* clear cache in Administration.

!!! warning

    {HookName} must be unique within {EntityType}. If there are two hooks (in different modules) with the same name
    for the same entity type, only one will be applied (honoring module order).

## Hook order

If you have several hooks related to the same entity type, you can set the order property with an integer value.

```
public static int $order = 10;
```

Ascending order is applied – a hook with the smallest order number runs first.

If the *order* property is omitted, the value *9* is applied for the hook.

Order values of existing hooks:

* Before-Save formula script: *11*
* After-Save workflow actions: *99* (in Advanced Pack)

### Interfaces

*As of v7.4.*

There are interfaces for built-in hooks. It's recommended that your hooks implement these interfaces. This makes it easier for a developer to obtain needed data (passed to the hook) as each interface has a unique method signature. The list of interfaces:

* `Espo\Core\Hook\Hook\BeforeSave`
* `Espo\Core\Hook\Hook\AfterSave`
* `Espo\Core\Hook\Hook\BeforeRemove`
* `Espo\Core\Hook\Hook\AfterRemove`
* `Espo\Core\Hook\Hook\AfterRelate`
* `Espo\Core\Hook\Hook\AfterUnrelate`
* `Espo\Core\Hook\Hook\AfterMassRelate`

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
    public static int $order = 5; 
    
    public function __construct(
        // Define needed dependencies.
    ) {}

    /**
     * @param array<string, mixed> $options
     */
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

* *afterOptOut* – when a target clicks an opt-out link, data are passed in the 3rd $data argument
* *afterCancelOptOut* – when a target subscribes again
* *afterOptIn* – when a target opts-in through Lead Capture, data are passed in the 3rd $data argument

#### Meeting / Call

* *afterConfirmation* – when an event attendee clicks on accept/decline/tentative link; details are passed in the 3rd $data argument

#### Contact

* *afterLeadCapture* – when a contact (existing in crm) opts-in through Lead Capture, leadCaptureId is passed in the 3rd $data argument
* *afterOptOut*
* *afterCancelOptOut*

#### Lead

* *afterLeadCapture* – when a lead opts-in through Lead Capture, leadCaptureId is passed in the 3rd $data argument
* *afterOptOut*
* *afterCancelOptOut*

#### LeadCapture

* *afterLeadCapture* – when a target (lead or contact) opts-in through Lead Capture, target data are passed in the 3rd $data argument

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
<?php
$this->hookManager->process($entityType, $hookType, $entity, $options);
```

!!! note

    A hook name can't start with `set`. It's reserved for a dependency injection.

## Tips

Avoid saving the same record in beforeSave hooks.

In afterSave hooks, re-saving the same record usually should be avoided as it can disrupt following hooks. If saving is needed, consider passing SKIP_ALL, KEEP_NEW and KEEP_DIRTY save options to the *saveEntity* method or run an update query instead (using the query builder).
