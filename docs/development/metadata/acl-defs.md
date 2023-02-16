# aclDefs

Path: metadata > aclDefs > {ScopeName}.

Defines access control parameters for a specific scope (or entity type).

## accessCheckerClassName

An access checking class. Should implement `Espo\Core\Acl\AccessChecker` interface.

Can optionally impelement more interfaces that define what actions can be checked.

Interfaces for access checking:

* `Espo\Core\Acl\AccessChecker` – access to a scope;
* `Espo\Core\Acl\AccessCreateChecker` – access to a create operation for a scope;
* `Espo\Core\Acl\AccessReadChecker` – access to a read operation for a scope;
* `Espo\Core\Acl\AccessEditChecker` – access to an edit operation for a scope;
* `Espo\Core\Acl\AccessDeleteChecker` – access to a delete operation for a scope;
* `Espo\Core\Acl\AccessStreamChecker` – access to the stream for a scope;
* `Espo\Core\Acl\AccessEntityCreateChecker` – access to a create operation for an entity;
* `Espo\Core\Acl\AccessEntityReadChecker` – access to a read operation for an entity;
* `Espo\Core\Acl\AccessEntityEditChecker` – access to an edit operation for an entity;
* `Espo\Core\Acl\AccessEntityDeleteChecker` – access to a delete operation for an entity;
* `Espo\Core\Acl\AccessEntityStreamChecker` – access to the stream of an entity.

Combined interfaces:

* `Espo\Core\Acl\AccessEntityCREDChecker` – access to create/read/edit/delete of an entity (combined);
* `Espo\Core\Acl\AccessEntityCREDSChecker` – access to create/read/edit/delete/stream of an entity (combined).


Default class: `Espo\Core\Acl\DefaultAccessChecker`.


## ownershipCheckerClassName

An ownership checking class.

Should implement one of the following intefaces:

* `Espo\Core\Acl\OwnershipOwnChecker`  – whether a user is an owner of an entity;
* `Espo\Core\Acl\OwnershipTeamChecker` – whether an entity belongs to a user team.

Default class: `Espo\Core\Acl\DefaultOwnershipChecker`.

## portalAccessCheckerClassName

The same as `accessCheckerClassName` but for the portal.

## portalOwnershipCheckerClassName

The same as `ownershipCheckerClassName` but for the portal.

Can implement additional interfaces:

* `Espo\Core\Portal\AclOwnershipAccountChecker`
* `Espo\Core\Portal\AclOwnershipContactChecker`

## assignmentCheckerClassName

An assignment checking class.

Should implement `Espo\Core\Acl\AssignmentChecker` interface.

Default class: `Espo\Core\Acl\DefaultAssignmentChecker`.

## readOwnerUserField

Indicates what field is used for ownership checking. If an entity uses a field other than *assignedUser* or *assignedUsers*, you need to specify that field.

## linkCheckerClassNameMap 

*Object.<string, class-string<Espo\Core\Acl\LinkChecker\>\>*

*As of v7.4.*

Linking/unlinking checking classes for specific links. A link-name => class-string map. The class receives two entities and should determine whether a user is allowed to link/unlink these records.
