# Security recommendations

## Don't use admin user

Don't use an admin user for everyday work. Use a regular user instead.

## 2-factor authentication

Enable 2FA for CRM users. Force regular users to set up 2FA. Can be done at Administration > Authentication.

## Disable password recovery for admins

Can be done at Administration > Authentication. If you lost admin access and want to recover your password, set 'passwordRecoveryForAdminDisabled' to *false* in `data/config.php`.

## Password strength

Consider configuring password strength parameters (at Administration > Authentication).

## Auth token expiration

Consider decreasing *Auth Token Max Idle Time*. Additionally, you can also specify *Auth Token Lifetime*.

## Restrict upgrade via UI

Restrict the ability to upgrade and upload extensions via the UI. Set `'adminUpgradeDisabled' => true` in `data/config-internal.php`.

## IP address whitelist

Consider specifying an IP address whitelist. Parameters are available at: Administration > Authentication > Access.
