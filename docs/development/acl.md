# ACL · Access control level

## Access checking

There are two [container services](di.md/#container-services) that provide the ability to check access to records, scopes and fields:

* AclManager – `Espo\Core\AclManager` – to check access for any user; the user is passed as a method parameter;
* Acl – `Espo\Core\Acl` – an *AclManager* wrapper to check access for the current user.

AclManager usage examples:

```php
<?php
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

// Check access to a specific field.
$hasAccess = $aclManager->checkField($user, $scope, $field, Table::ACTION_EDIT);
```

The methods of the *Acl* service class are mostly the same as in *AclManager* but without the *$user* parameter, as the current user is used.

## Custom ACL

### Access checker

An access checker implements access checking against an entity instance and/or a scope name for a giver user. The *data* object is passed to checking method – this object contain role table data for the user.

For example, it check whether a user: has access to the Account, can edit Accounts, or has access to a specific Account record. 

You can define a custom [access checker](metadata/acl-defs.md#accesscheckerclassname) class for a specific scope.

### Ownership checker

An ownership checker checks how the given user is related to the given entity – whether the user is an owner, the user is in the same team the record is related to, or the portal user belongs to the account the record is related to.

You can define a custom [ownership checker](metadata/acl-defs.md#ownershipcheckerclassname) class for a specific scope.

### Access control filters

You may also need to define custom [access control filters](metadata/select-defs.md#accesscontrolfilterclassnamemap). These filters belong to the [Select framework](select-builder.md), not to the ACL framework.

When the framework build a database query in order to display a record list for the user, it applies an access control filter to the query. Which exactly filter is applied – depends on the user's roles. It's also possible to customize the filter application rules with a custom [resolver](metadata/select-defs.md##accesscontrolfilterresolverclassname).

