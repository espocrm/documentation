# Custom ACL (access control level) for entity type

How to customize ACL rules for a specific entity type. In this example will will customize Task entity type.

1. Create a file `custom/Espo/Custom/Acl/Task.php`:

```php
<?php
namespace Espo\Custom\Acl;

class Task extends \Espo\Core\Acl\Base
{
    // checks whether user is an owner for entity
    // used for 'own' access level
    // omit if you don't need a custom logic for this
    public function checkIsOwner(\Espo\Entities\User $user, \Espo\ORM\Entity $entity)
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


2. Create a file `custom/Espo/Custom/SelectManagers/Task.php`:

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
