# Roles Management

## Overview

In order to restrict access for some users, you need to use Roles. Administrator can manage roles in Administration panel. Each role defines access to certain areas (scopes) which is applied to users who own that role.

One user can have multiple roles. Those roles can be selected for a specific user (*Roles* field of User record) and/or be inherited from teams that the user belongs to.

If a user has multiple roles, then they will be merged so that the permissive rule will have a higher priority. That allows administrator to manage access level control easily and flexibly.

It's possible to see what permissions are applied to a certain user by clicking *Access* button on the user's detail view.

![1](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/roles-management/scope-level.png)

!!! note

    By default, users can **delete self-assigned records** that they have created during a specific period of time. It is possible to disable this ability at Administration > Settings > Allow to remove created records.

## Permissions by default

By default, users have minimal access. You need to assign roles to grant users specific access levels.

## Actions

* Create – the ability to create records
* Read – the ability to view records (on the list and detail views)
* Edit – the ability to update records
* Delete – the ability to remove records
* Stream – the ability to see a record's stream

## Levels

Listed from more permissive to less permissive.

* yes
* all
* team
* own
* no

## Example

We have a team 'Sales'. That team has a single role 'Salesman' (the *Roles* field of the Team). All users from this team will obtain the 'Salesman' role (as all team roles are automatically applied to users of the team).

The 'Salesman' role is defined in the following way:

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

Users of the 'Sales' team:

* Can create new leads/opportunities.
* Are able to read only those leads/opportunities that are related to the 'Sales' team (through the *Teams* field of a record).
* Are able to edit only those leads/opportunities that they are assigned to.
* Can't remove any lead/opportunity.
* Have access to the stream of leads/opportunities that are related to the 'Sales' team.

We want to give more rights to a certain user who holds a sales manager position in the company. This employee needs to have the ability to read/edit/delete all records related to the 'Sales' team. We need to add that user to the 'Sales' team. We also need to create a new role 'Sales Manager' and select this role for that user (the *Roles* field of the User).

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

Our sales manager user will be able to manage all leads/opportunities related to the 'Sales' team. Under the hood this user have two roles ('Salesman' and 'Sales Manager') merged into one in a way that a more permissive level suppresses less permissive.

## Special Permissions

### Assignment Permission

Set this parameter to restrict the ability to re-assign records to another user and/or teams. If you set `team`, then it will be possible to assign only to users from own team(s). If `no`, users won't be able to re-assign at all.

It also defines whether a user is able to post to stream of other users/teams.

### User Permission

Allows to restrict the ability for users to view activities, calendar and stream of other users.

### Portal Permission

Defines access to portal information, the ability to post messages to portal users.

Users with the Portal Permission can manage followers of a specific record (as of v7.0). Only portal users can be managed.

### Group Email Account Permission

Defines access to group email accounts, the ability to send emails from group SMTP.

### Export Permission

Defines whether user have the ability to export records.

### Mass Update Permission

Defines whether users have the ability to mass-update records.

### Data Privacy Permission

Allows to erase personal data.

### Follower Management Permission

Allows to manage followers of specific records. Users will be able to add and remove followers. Can be restricted to users of own teams. (as of v7.0)

### Message Permission

Allows to send stream messages to other users. (as of v8.0)

### Audit Permission

Allows to view the audit log. (as of v8.2)

## Field Level Security

Allows to control access for specific fields.

By default, user can read all fields if one can read the record. A user can edit any field if one can edit the record. You can restrict access to specific fields using Field Level Security.

In the edit view of a role record in Field Level section, click plus icon next to the specific scope, then select the needed field. Then, you will be able to specify the access level for `read` and `edit` actions. There are two options: `yes` and `no`.

![2](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/roles-management/field-level-secutiry.png)

## See also

* [Security roles management in EspoCRM](https://www.espocrm.com/tips/security-roles/)
* [Multiple assigned users](multiple-assigned-users.md)
