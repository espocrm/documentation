# Roles Management

## Overview

In order to restrict access for some users you need to use Roles. Administrator can manage roles in Administration panel. Each role defines an access to certain areas (scopes) which is applied to users who own that role.

One user can have multiple roles. Those roles can be selected for a specific user (*Roles* field of User record) and/or be inherited from the teams that user belongs to.

If a user has multiple roles, then they will be merged so that permissive rule will have a higher priority. That allows administrator to manage access level control easily and flexibly.

It's possible to see what permissions are applied to a certain user by clicking *Access* button on the user's detail view.

![1](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/roles-management/scope-level.png)

Note: By default users can **delete self-assigned records** that they have created during a specific period of time. There is an ability to disable this ability at Administration > Settings > Allow to remove created records.

## Permissions by default

By default (since 5.6.10) users have a minimal access. You need to assign roles to grant users a specific access levels.

There is an ability to grant users with full access by default by disabling 'ACL Strict Mode' in `data/config.php`:

```
'aclStrictMode' => false,
```

## Actions

* Create – the ability to create records
* Read – the ability to view records (on list views and detail view)
* Edit – the ability to update records
* Delete – the ability to remove records
* Stream – the ability to see a record's stream

## Example

For example, user belongs to team 'Sales'. That team has single role 'Salesman'. So, all users from this team will obtain 'Salesman' role.

'Salesman' role is defined the following way:

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

Users will be able to read only those leads and opportunities which belong to 'Sales Department' team (*Teams* field).
User will be able to edit only those leads and opportunities which they are assigned to or those they have created.
Users won't be able to remove any leads or opportunities.

We want to give more rights to a certain user who holds sales manager position in the company. This employee must have an ability to read/edit/delete all records from 'Sales' team. The user should belong to our 'Sales' team. But we need to create the new role 'Sales Manager' and select this role for that user in *Roles* field.

'Sales Manager' role is defined the following way:

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

Our user will be able to manager all leads and opportunities from the 'Sales' team.

## Special Permissions

### Assignment Permission

Set this parameter to restrict the ability to re-assign records to another user and/or teams. If you set `team` - then it will be possible to assign only to users from own team(s). If `no` - users won't be able to re-assign at all.

It also defines whether user is able to post to stream of another users/teams.

### User Permission

Allows to restrict the ability for users to view activities, calendar and stream of other users.

### Portal Permission

Defines an access to portal information, the ability to post messages to portal users.

### Group Email Account Permission

Defines an access to group email accounts, the ability to send emails from group SMTP.

### Export Permission

Defines whether user have the ability to export records. (since version 4.9.0)

## Field Level Security

Allows to control access for a specific fields.

By default user can read all fields if one can read the record. User can edit any field if one can edit the record. You can restrict access to specific fields using Field Level Security.

In edit view  of a role record in Field Level section click plus icon next to the specific scope then select needed field. Then you will be able to specify the access level for `read` and `edit` actions. There are to options: `yes` and `no`.

![2](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/roles-management/field-level-secutiry.png)

## See also

* [Security roles management in EspoCRM](https://www.espocrm.com/tips/security-roles/)
* [Multiple assigned users](multiple-assigned-users.md)
