# ACL (access control level)

## Checking access

There are two [container services](di.md/#container-services) that allow to check access to records, scopes and fields:

* AclManager – `Espo\Core\AclManager` – checks access for any user,
* Acl – `Espo\Core\Acl` – a wrapper for the *AclManager* for a current user.


AclManager:

```php
use Espo\Core\Acl\Table;

// Available actions: create, read, edit, delete, stream.

// Check read access.
$hasAccess = $aclManager->check($user, $entity, Table::ACTION_READ);

// Check access to a scope.
$hasAccess = $aclManager->check($user, 'Account');

// Get an access level.
$level = $aclManager->check($user, 'Account', Table::ACTION_EDIT);

// Get a permission level (e.g. assignment, portal).
$assignmentPermission = $aclManager->getPermissionLevel($user, 'assignmentPermission');

// Check the user is owned of a record (through assigned user).
$isOwner =  $aclManager->checkOwnershipOwn($user, $entity);

// Check a user teams set intersects with record's teams.
$inTeam =  $aclManager->checkOwnershipTeam($user, $entity);

// Attributes/fields/links the user does not have access to.
$attributeList = $aclManager->getScopeForbiddenAttributeList($user, 'Account', Table::ACTION_READ);
$fieldList = $aclManager->getScopeForbiddenFieldList($user, 'Account', Table::ACTION_READ);
$linkList = $aclManager->getScopeForbiddenLinkList($user, 'Account', Table::ACTION_READ);

// Check access to a specific field. As of v7.3.
$hasAccess = $aclManager->checkField($user, $scope, $field, Table::ACTION_EDIT);
```

Methods of the *Acl* is the same but w/o the *$user* parameter, as the current user is used.

## Custom ACL for entity type

You can define a custom [access checker](metadata/acl-defs.md#accesscheckerclassname) and [ownership checker](metadata/acl-defs.md#ownershipcheckerclassname) classes in metadata. They are used for checking access against a specific record (or a scope).

You may also need to define custom [access control filters](metadata/select-defs.md#accesscontrolfilterclassnamemap) for the [Select framework](select-builder.md). They are used for applying filtering when generating a select query for fetching records from DB.
