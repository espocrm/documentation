# Custom ACL (access control level) for entity type

How to customize ACL rules for a specific entity type. In this example, we will customize Task entity type.

1\. Create a file `custom/Espo/Custom/Acl/Task.php`:

```php
<?php
namespace Espo\Custom\Acl;

use Espo\Entities\User;
use Espo\ORM\Entity;

class Task extends \Espo\Core\Acl\Base
{
    // checks whether user is an owner for entity
    // used for 'own' access level
    // omit if you don't need a custom logic for this
    public function checkIsOwner(User $user, Entity $entity)
    {
         // here we make records create by user treated as own
         return $entity->get('assignedUserId') === $user->id || 
                    $entity->get('createdById') === $user->id;
    }
    
    // checks whether entity is 'in team' for user
    // used for 'team' access level
    // omit if you don't need a custom logic for this
    public function checkInTeam(User $user, Entity $entity)
    {
        // it's a copy of the original method
        $userTeamIdList = $user->getLinkMultipleIdList('teams');
        if (!$entity->hasRelation('teams') || !$entity->hasAttribute('teamsIds')) {
            return false;
        }
        $entityTeamIdList = $entity->getLinkMultipleIdList('teams');
        if (empty($entityTeamIdList)) {
            return false;
        }
        foreach ($userTeamIdList as $id) {
            if (in_array($id, $entityTeamIdList)) {
                return true;
            }
        }
        return false;
    }

    // checks whether entity can be deleted by user
    // omit if you don't need a custom logic for this
    public function checkEntityDelete(User $user, Entity $entity, $data)
    {
        if ($user->isAdmin()) 
            return true;

        // here we call a default logic checking 'delete' access
        if ($this->checkEntity($user, $entity, $data, 'delete'))
            return true;

        if (is_object($data)) {
        	// here we allow to delete records created by user, if the user has 'create' access and specific 'edit' access
            if ($data->create === 'yes' && $data->edit === 'all') {
                if ($entity->get('createdById') == $user->id) {
                    return true;
                }
            }
        }

        return false;
    }

    // checks whether entity can be edited by user
    // omit if you don't need a custom logic for this
    public function checkEntityEdit(User $user, Entity $entity, $data)
    {
        // custom logic here

        if ($this->checkEntity($user, $entity, $data, 'edit'))
            return true;

        // custom logic here
    }

    // checks whether entity can be read by user
    // omit if you don't need a custom logic for this
    public function checkEntityRead(User $user, Entity $entity, $data)
    {
        // custom logic here

        if ($this->checkEntity($user, $entity, $data, 'read'))
            return true;

        // custom logic here

        return false;
    }

    // checks whether entity can be created by user
    // omit if you don't need a custom logic for this
    public function checkEntityCreate(User $user, Entity $entity, $data)
    {
        // custom logic here

        if ($this->checkEntity($user, $entity, $data, 'create'))
            return true;

        // custom logic here
    }
}
```


2\. Create a file `custom/Espo/Custom/SelectManagers/Task.php`:

```php
<?php
namespace Espo\Custom\SelectManagers;

class Task extends \Espo\Modules\Crm\SelectManagers\Task
{
    
    // apply coditions for select query when 'read' access is set to 'own'
    protected function accessOnlyOwn(&$result)
    {
        $result['whereClause'][] = [
            'OR' => [
                'assignedUserId' => $this->getUser()->id,
                'createdById' => $this->getUser()->id,
            ]
        ];
    }

    // apply coditions for select query when 'read' access is set to 'team'
    protected function accessOnlyTeam(&$result)
    {
        $this->setDistinct(true, $result);
        $this->addLeftJoin(['teams', 'teamsAccess'], $result);

        $orGroup = [
            'teamsAccess.id' => $this->getUser()->getLinkMultipleIdList('teams'),
            'assignedUserId' => $this->getUser()->id,
            'createdById' =>  $this->getUser()->id,
        ];

        $result['whereClause'][] = [
            'OR' => $orGroup 
        ];
    }
}

```


## Portal ACL

1\. Create a file `custom/Espo/Custom/AclPortal/Task.php`:

```php
<?php
namespace Espo\Custom\AclPortal;

use Espo\Entities\User;
use Espo\ORM\Entity;

class Task extends \Espo\Core\AclPortal\Base
{
    public function checkIsOwner(User $user, Entity $entity)
    {
        if ($entity->hasAttribute('createdById')) {
            if ($entity->has('createdById')) {
                if ($user->id === $entity->get('createdById')) {
                    return true;
                }
            }
        }
        return false;
    }
    
    public function checkInAccount(User $user, Entity $entity)
    {
        return in_array($entity->get('accountId'), $user->getLinkMultipleIdList('accounts'));
    }
    
    public function checkIsOwnContact(User $user, Entity $entity)
    {
        if ($contactId = $user->get('contactId')) { 
            $repository = $this->getEntityManager()->getRepository('Task');
            if ($repository->isRelated($entity, 'contacts', $contactId)) {
                return true;
            }
	}
	return false;
    }
}
```

2\. Create a file `custom/Espo/Custom/SelectManagers/Task.php`:

```php
<?php
namespace Espo\Custom\SelectManagers;

class Task extends \Espo\Modules\Crm\SelectManagers\Task
{
    protected function accessPortalOnlyOwn(&$result)
    {
        if ($this->getSeed()->hasAttribute('createdById')) {
            $result['whereClause'][] = [
                'createdById' => $this->getUser()->id
            ];
        } else {
            $result['whereClause'][] = [
                'id' => null
            ];
        }
    }
    
    protected function accessPortalOnlyAccount(&$result)
    {
	$result['whereClause'] = [
	    'accountId' => $this->getUser()->getLinkMultipleIdList('accounts'),
	];
    }
    
    protected function accessPortalOnlyContact(&$result)
    {
        $this->setDistinct(true, $result);
	$this->addLeftJoin(['contacts', 'contactsAccess'], $result);
	$result['whereClause'] = [
	    'contactsAccess.id' => $this->getUser()->get('contactId'),
	];
    }
}
```
