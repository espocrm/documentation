# authenticationMethods

Path: authenticationMethods > {MethodName}.

## api

*booean*

Defines that the method is to be used for pure API request, not from the front-end.

## login

*as of v7.3*

A framework providing the ability to call custom code on *Sign-In* button click on the login page.

```json
{
    "login": {
        "handler": "my-module:handlers/login",
        "fallback": true,
        "data": {
            "someKey": "someValue"
        }
    }
}
```

Parameters:

* *handler* – a front-end class (should extend the abstract class `handlers/login`).
* *fallback* – defines that a regular username/password login method is also available on the login page.
* *fallbackConfigParam* – a config parameter name to be used to check whether fallback login is allowed.
* *portal* – whether the handler will be available for portals, (bool).
* *portalConfigParam* – a config parameter name to be used to check whether the handler will be available for portals.
* *data* – arbitrary data to be passed to the handler. Can be actual as application metadata is not yet available on the login page.

The handler class should have a method *process* that returns a promise that resolves with HTTP headers. These headers will be sent to the back-end to the `App/user` endpoint.

The label for the Sign-In button can be defined in the language at `signInLabels` > {MethodName}.

Compatible with 2FA.

On the login page only global config parameters are available. When implementing a custom login, consider having some global config parameters to access in the handler.

## settings

Defines config parameters and a form on the admin UI. See `application/Espo\Resources/metadata/authenticationMethods/LDAP.json` as an example.
