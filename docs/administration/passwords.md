# Passwords

## New users

When an admin is creating a new user, they has two options:

* Let the user set their password (by leaving the password field empty). The user should have an email address filled. An email with a unique link will be sent to the user.
* Specify a password for a user. In this case, checking 'Send Email with Access Info to User' will send the password in an email to the user (not recommended to do because of security concerns).

## Existing users

The admin can send a password change link to an existing user. The user will receive an email with a link where they can specify a new password. Note that this option is not available for user without an email address.

![Menu](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/passwords/user-menu.png)

The admin can also generate a new password for a user from the menu. The new password will be send in an email. It's not recommended to do as it's not secure.

## Password recovery

Users can reset their password from the login form by clicking the 'Forgot Password?' link. They will be promted to enter their username and email address. If the credentials are correct, they will receive an email with a unique link. By following the link they will be able to specify a new password. Note that the link will be active only for 3 hours and the user is not permitted to send new password change requests during that period.

![Menu](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/passwords/login-form.png)

The admin can disable the ability to recover passwords at Administration > Authentications > Passwords. It can be disabled for all users, for admin users or for internal users.

## Password strength

The admin can configure password strength settings at Administration > Authentications > Passwords. Available parameters:

* Minimum password length;
* Number of letters required in password;
* Password must contain letters of both upper and lower case;
* Number of digits required in password.

## See also

* [Password config parameters](config-params.md#passwords)
