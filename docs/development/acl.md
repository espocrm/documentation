# ACL (access control level)

## Checking access

There are two objects that allow to check access:

* AclManager – `Espo\Core\AclManager`
* Acl – `Espo\Core\Acl`

With the *AclManager* you can check access for any user. The *Acl* is a wrapper for the *AclManager* for a current user.


```php
use Espo\Core\Acl\Table;

// available actions: create, read, edit, delete, stream

// check read access to entity for specific user
$hasAccess = $aclManager->check($user, $entity, Table::ACTION_READ);

// check read access to entity for current user
$hasAccess = $acl->check($entity, Table::ACTION_READ);

// check access to scope for specific user
$hasAccess = $aclManager->check($user, 'Account');

// check create access to scope for current user
$hasAccess = $acl->check('Account', Table::ACTION_CREATE);

// get access level 
$level = $aclManager->check($user, 'Account', Table::ACTION_EDIT);
$level = $acl->check('Account', Table::ACTION_EDIT);

// get permission level (e.g. assignmentPermission, portalPermission)
$assignmentPermission = $aclManager->getPermissionLevel($user, 'assignmentPermission');
$assignmentPermission = $acl->getPermissionLevel('assignmentPermission');

// check user is owned of record (by assigned user)
$isOwner =  $aclManager->checkOwnershipOwn($user, $entity);
$isOwner =  $acl->checkOwnershipOwn($entity);

// check user teams set intersects with record teams
$inTeam =  $aclManager->checkOwnershipTeam($user, $entity);
$inTeam =  $acl->checkOwnershipTeam($entity);

// attributes user doesn't have access to
$attributeList = $aclManager->getScopeForbiddenAttributeList($user, 'Account', Table::ACTION_READ);
$attributeList = $acl->getScopeForbiddenAttributeList('Account', Table::ACTION_READ);

$fieldList = $acl->getScopeForbiddenFieldList('Account', Table::ACTION_READ);
$linkList = $acl->getScopeForbiddenLinkList('Account', Table::ACTION_READ);
```

## Custom ACL for entity type

You can define a custom [access checker](metadata/acl-defs.md#accesscheckerclassname) and [ownership checker](metadata/acl-defs.md#ownershipcheckerclassname) classes in metadata. They are used for checking access against a specific record (or a scope).

You may also need to define custom [access control filters](metadata/select-defs.md#accesscontrolfilterclassnamemap) for the [Select framework](select-builder.md). They are used when generating a select query for fetching records from DB.
