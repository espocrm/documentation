# Passwords

## New users

When an administrator creates a new user, there are two options for password generation:

* Let the user to set the password by leaving the password field empty. The user must have a valid email address. Upon creation, an email with a unique link will be sent to the user.
* Specify the password for the user. In this case, checking 'Send Email with Access Info to User' will send the password in an email to the user. This method is not recommended due to security concerns.

## Existing users

An admininstrator can send a password change link to an existing user. The user will receive an email with a link where they can specify a new password. Note that this option is not available for users without email address.

![Menu](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/passwords/user-menu.png)

The admininstrator can also generate a new password for the user from the menu. The new password will be send in an email. This way is not recommended as it's not secure.

## Password recovery

Users can reset their password from the login form by clicking 'Forgot Password?' link. They will be promted to enter their username and email address. If the credentials are correct, they will receive an email with a unique link. By following the link, they will be able to specify a new password. Note that the link will be active only for 3 hours and the user is not permitted to send new password change requests during that period.

![Menu](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/passwords/login-form.png)

An admininstrator can disable the ability to recover passwords at Administration > Authentications > Passwords. It can be disabled for all users, for admin users or for internal users.

## Password strength

An admininstrator can configure password strength settings at Administration > Authentications > Passwords. Available parameters:

* Minimum password length;
* Number of letters required in password;
* Password must contain letters of both upper and lower case;
* Number of digits required in password.

## See also

* [Password config parameters](config-params.md#passwords)
