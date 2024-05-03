# Users management

In this article:

* [User types](#user-types)
* [Sending access info](#sending-access-info)
* [Password recovery](#password-recovery)
* [User inactivating](#user-inactivating)
* [Logging in as another user](#logging-in-as-another-user)

## User types

Types of users:

* Admin
* Regular
* Portal
* API
* System

### Admin

Admin has full access to the system. Admin users can create and remove other users, manage access roles, teams, portals, etc.

There can be multiple admin users in the system. The admin can create another admin users at Administration > Users.

### Regular

Regular users have access only to scopes allowed by [Roles](roles-management.md). Regular users can edit their own user (if allowed by roles) except the following fields: User Name, Emails, Teams, Roles, Is Active.

The admin can manage regular users at Administration > Users.

### Portal

Portal users can access only the [portal](portal.md) (or multiple portals). A portal user usually is linked with a specific Contact and Account. Access perimissions are defined by Portal Roles.

Portal users can by managed at Administration > Portal Users.

### API

API users serve for accessing the system via [API](../development/api.md). Access perimissions are defined by [Roles](roles-management.md).

API users can by managed at Administration > API Users.

### System

The system user serves for system purposes. It's not possible to log in under the system user.

## Sending access info

When a user (regular, admin or portal) is being created by the admin it's possible to send an access info email for the user. On the create form you need to fill in the email address field, then the checkbox 'Send access info' will show up. It will initiate the access email sending after user creation. The access info email contains the link to the system and the username.

If the admin does not specify a **password** for the new user, it will prompt the user to specify their password once they follow the link in the access email. If the password is specified by the admin, it will be sent plain in the email. It's not recommended that the password is specified by the admin because of security reasons.

The email **template** for access info emails can be changed at Administration > Template Manager > Access info.

## Password recovery

Users can recover their access if they forgot their password by clicking the link/button *Forgot Password?* on the login screen. The user needs to enter their email address and the password. If the entered data is correct, an email with a unique link will be sent to the user. This link has an expiration period.

Password recovery (for all, regular or admin users) can be disabled at Administration > Authentication.

For security reasons it's recommended to check 'Prevent email address exposure on password recovery form' at Administration > Authentication.

See the [config parameters](config-params.md#passwords) for password recovery.

The email **template** for password recovery can be changed at Administration > Template Manager > Password Change Link.

The admin can send the password change link for a specific user at the user detail view > the dropdown next to the Edit button > Send Password Change Link.

See more in the [separate article](passwords.md).

## User inactivating

To disable access for a specific user w/o deleting the record, the admin needs to uncheck the field *Is Active*.

## Logging in as another user

*As of v7.3.*

The admin can log in as another regular user. The user detail view > the dropdown next to the *Edit* > Log In.

Limitations:

* WebSocket is disabled when logged in as another user.
* Requires re-entering admin password to log in as another user.
* Recommended to open the login link in an incognito/private window to avoid losing a current login session.


The functionality can be disabled in the config: `'authAnotherUserDisabled' => true`.
