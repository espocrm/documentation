# Security recommendations

## Password strength

❗ Important.

Configure password strength parameters (at Administration > Authentication). The minimum recommended password length is at least 10 characters (or 8 if 2FA is mandatory). Require digits, and both upper case and lower case letters.

## 2-factor authentication

❗ Important.

Enable 2FA for users. Require regular users to set up 2FA with the corresponding parameter. Can be enabled at Administration > Authentication.

## Don't use admin user

Don't use an admin user for everyday work. Use a regular user instead.

## Disable password recovery for admins

Can be done at Administration > Authentication. If you lost admin access and want to recover your password, set 'passwordRecoveryForAdminDisabled' to *false* in `data/config.php`.

## Auth token expiration

Consider decreasing *Auth Token Max Idle Time*. Additionally, you can also specify *Auth Token Lifetime*.

## Restrict upgrade via UI

Restrict the ability to upgrade and upload extensions via the UI. Set `'adminUpgradeDisabled' => true` in `data/config-internal.php`.

## IP address whitelist

Consider specifying an IP address whitelist. Parameters are available at: Administration > Authentication > Access.
