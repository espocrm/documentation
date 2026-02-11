---
search:
  boost: 2
tags:
  - roles
---

# Role Management

In this article:

* [Overview](#overview)
* [Permissions by default](#permissions-by-default)
* [Actions](#actions)
* [Levels](#levels)
* [Example](#example)
* [Special Permissions](#special-permissions)
* [Collaborators](#collaborators)

## Overview

Roles are used to grant or restrict access for users. An administrator can manage Roles under Administration > Roles. Each Role defines access to specific areas (scopes).

One User can have multiple Roles applied. Roles can be set in the User record (the *Roles* field) and/or be inherited from the User's Teams.

When a User has multiple Roles, these Roles will be merged in a way that a more permissive rule will have a higher priority over a less permissive. This allows to flexibly manage access level control.

It's possible to see what permissions are applied to a certain User by clicking the *Access* button on the user's detail view.

![1](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/roles-management/scope-level.png)

!!! note

    By default, users can **delete self-assigned records** that they have created during a specific period of time. It is possible to disable this ability at Administration > Settings > Allow to remove created records.

## Permissions by default

By default, Users have minimal access levels restricting almost everything. You need to assign Roles to grant Users specific access levels.

### Baseline role

*As of v9.2.*

It's possible to designate one role as a baseline. This role will be applied for all internal users. Other roles assigned to a user will grant permissions on top of the baseline.

The baseline role can be set under: Administration > Settings > Access.

## Actions

* Create – ability to create records;
* Read – ability to view records (on the list and detail views);
* Edit – ability to update records;
* Delete – ability to remove records;
* Stream – ability to see a record's stream.

## Levels

Listed from more permissive to less permissive.

* yes
* all
* team
* own
* no

## Example

We have a Team 'Sales'. That Team has a single Role 'Salesperson' (the *Roles* field of the Team). All Users from this Team will obtain the 'Salesperson' Role (as all team roles are automatically applied to users of the team).

The 'Salesperson' Role is defined in the following way:

Lead:

```
create – yes
read – team
edit – own
delete – no
stream – team
```

Opportunity:

```
create – yes
read – team
edit – own
delete – no
stream – team
```

Users of the 'Sales' Team:

* Can create new Leads/Opportunities.
* Are able to read only those Leads/Opportunities that are related to the 'Sales' Team (through the *Teams* field of a record).
* Are able to edit only those Leads/Opportunities that they are assigned to.
* Can't remove any Lead/Opportunity.
* Have access to the Stream of Leads/Opportunities that are related to the 'Sales' Team.

We want to give more rights to a certain User who holds a Sales Manager position in the company. This employee needs to have the ability to read/edit/delete all records related to the 'Sales' Team. We need to add that user to the 'Sales' Team. We also need to create a new role 'Sales Manager' and select this Role for that User (the *Roles* field of the User).

The 'Sales Manager' role is defined in the following way:

Lead:

```
create - yes
read – team
edit – team
delete – team
stream - team
```

Opportunity:

```
create – yes
read – team
edit – team
delete – team
stream – team
```

Our sales manager User will be able to manage all Leads/Opportunities related to the 'Sales' Team. Under the hood this User have two roles ('Salesperson' and 'Sales Manager') merged into one in a way that a more permissive level suppresses less permissive.

## Special Permissions

### Assignment Permission

Set this parameter to restrict the ability to re-assign records to another User and/or Teams. If you set the parameter to *team*, users will be able to assign record only to Users from their own Teams. If you set it to *no*, users won't be able to assign at all.

This parameter also defines whether the User is able to post to the Stream of other Users and other Teams.

### User Permission

Allows to view:

* Stream of other Users;
* which access to a specific record other Users have.

!!! note

    Allow this permission only for privileged users.

### User Calendar Permission

*As of v9.0.*

Allows to view Calendars of other users.

### Portal Permission

Defines access to portal information, the ability to post messages to Portal Users.

Users with the Portal Permission can manage followers of a specific record. Only Portal Users can be managed.

### Group Email Account Permission

Defines access to Group Email Accounts, the ability to send emails from a group SMTP.

### Export Permission

Defines whether a User have the ability to export records.

### Mass Update Permission

Defines whether users have the ability to mass-update records.

### Data Privacy Permission

Allows to erase personal data.

### Follower Management Permission

Allows to manage followers of specific records. Users will be able to add and remove followers. Can be restricted to Users of own Teams.

### Message Permission

Allows to send stream messages to other Users. (as of v8.0)

### Audit Permission

Allows to view the Audit Log. (as of v8.2)

### Mention Permission

Allows to mention other Users in the Stream. (as of v8.3)

## Field Level Security

Allows to control access for specific fields.

By default, a User can read all fields if they can read the record. A User can edit any field if one can edit the record. You can restrict access to specific fields using the Field Level Security.

In the edit view of a Role record in the Field Level section, click plus icon next to a specific scope, then select a needed field. Then, you will be able to specify the access level for *read* and *edit* actions. There are two options: *yes* and *no*.

![2](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/roles-management/field-level-secutiry.png)

## Collaborators

*As of v9.0.*

The Collaborators feature can be enabled for an entity type in the Entity Manager. Once enabled:

* A link-multiple field *Collaborators* will be automatically created.
* A bool filter *Shared* will be added.

The administrator needs to add the *Collaborators* to the layout: Administration > Entity Manager > {Entity Type} > Layouts > Side Panel Fields.

Users added as collaborators to a record will have *read* and *stream* access, provided their access level, as defined by Roles, is other than *no*.

Assignees are automatically added to collaborators. This ensures that when a record is reassigned to another user, the previous assignee remains a collaborator unless explicitly removed.

A user who creates a record is automatically pre-filled as a collaborator. This ensures that a user with 'own' read access will still have access to a record after assigning it to another user.

Access:

* Assignment Permission is required to be able to add a user to collaborators. 
* Edit access to a record is required to be able to add collaborators.

Limitations:

* Portal users cannot be added as collaborators.

The Collaborators parameter is available for custom entities created via the Entity Manager and for the standard following entity types: Task, Case, Account, Contact, Lead, Opportunity, Document, Knowledge Base Article and Target List.

## See also

* [Security roles management in EspoCRM](https://www.espocrm.com/tips/security-roles/)
* [Multiple assigned users](multiple-assigned-users.md)
