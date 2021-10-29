# 2-Factor Authentication

EspoCRM supports the following 2-factor authentication methods: 

* TOTP (as of v5.7)
* Email (as of v7.0)
* SMS (as of v7.0)

Administrator needs to enable 2FA at Administration > Authentication and select allowed methods. Then users can enable 2FA for their accounts.

## TOTP

[Time-based One-time Password](https://en.wikipedia.org/wiki/Time-based_One-time_Password_algorithm) is a algorithm that generates a one-time password which uses the current time as a source of uniqueness.

**Important**: The server time must be correct. Otherwisy authentication won't work.

### Enabling for user

You need to have an authenticator application installed on your mobile phone (e.g. [Google Authenticator](https://en.wikipedia.org/wiki/Google_Authenticator)).

Go to your user profile (from the menu at the top-right corner) and then click *Security* button. Then, enable 2FA, select the *TOTP* method. After that scan QR-code with your mobile application.

Next time, when you login to EspoCRM, you will need to enter your username & password, then enter a code from your mobile application.

### If you lost your TOTP key

If you are not an administrator, you need to contact the administrator to ask them to disable 2FA for your user account.

If you are an administrator, the only option is to disable 2FA globally by setting `'auth2FA' => false` in `data/config.php`.

## Authentication via email

When the Email 2FA is used, after a user entered valid username and password a code is sent to their email address. Then the user needs to enter that code to log in to Espo.

It's highly recommended for users to use a non-primary email address for 2FA. A user should have at least two email addresses (set by admin).

### Enabling for user

Go to your user profile (from the menu at the top-right corner) and then click *Security* button. Then, enable 2FA and select the *Email* method. Choose an email address (it's highly recommended to choose non-primary one) and then send a code. Then you will need to confirm the code.

## Authentication via SMS

Requires having an implementation for your SMS provider. EspoCRM is not shipped with implementations.

### Enabling for user

Go to your user profile (from the menu at the top-right corner) and then click *Security* button. Then, enable 2FA and select the *SMS* method. Choose a phone number and then send a code. Then you will need to confirm the code.
