# app > authentication2FAMethods

Path: metadata > app > authentication2FAMethods.

Definitions for 2-factor authentication methods. A method-name => Object map.

```json
{
    "Totp": {
        "settings": {
            "isAvailable": true
        },
        "userApplyView": "views/user-security/modals/totp",
        "loginClassName": "Espo\\Core\\Authentication\\TwoFactor\\Totp\\TotpLogin",
        "userSetupClassName": "Espo\\Core\\Authentication\\TwoFactor\\Totp\\TotpUserSetup"
    }
}

```

## settings

*Object*

### isAvailable

*bool*

Whether the method should be available as an option at Administration > Authentication > Available 2FA methods.

## userApplyView

*string*

A front-end view for a user when they apply the 2FA method to their account.

## loginClassName

*class-string<Espo\Core\Authentication\TwoFactor\Login>*

A login class. Processes the second step of the login process.

## userSetupClassName

*class-string<Espo\Core\Authentication\TwoFactor\UserSetup>*

A user-setup class.

* Provides needed data for a front-end for a user when they setup the 2FA method.
* Verifies entered user data before establishing the 2FA method for a user.
