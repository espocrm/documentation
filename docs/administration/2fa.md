# 2-Factor Authentication

EspoCRM supports the following 2-factor authentication methods: 

* [TOTP](https://en.wikipedia.org/wiki/Time-based_One-time_Password_algorithm) (as of 5.7.0)
* Email (as of 7.0.0)

Administrator needs to enable 2FA at Administration > Authentication. Then users can enable 2FA for their accounts.

## Enabling for user

You need to have an authenticator application installed on your mobile phone (e.g. Google Authenticator).

Go to your user profile (from the menu at the top-right corner) and then click *Security* button. Then, enable 2FA, enter your current password and after that scan QR-code with your mobile application.

Next time, when you login to EspoCRM, you will need to enter your username & password, then enter a code from your mobile application.

## If you lost your TOTP key

If you are not an administrator, you need to contact the administrator to ask them to disable 2FA for your user account.

If you are an administrator, the only option is to disable 2FA globally by setting `'auth2FA' => false` in `data/config.php`.
