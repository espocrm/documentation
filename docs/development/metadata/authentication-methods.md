# authenticationMethods

Path: authenticationMethods > {MethodName}.

## api

*boolean*

Defines that the method is to be used for pure API request, not from the front-end.

## credentialsHeader

*string*

*As of v7.3.*

A header that is supposed to contain credentials. Actual only for API methods.

## login

*As of v7.3.*

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

## portalDefault

*boolean*

*As of v7.4.*

If true, the method will be applied for portals when the method is selected as the default in the settings and the portal does not have a specific authentication provider.

## settings

Defines config parameters and a form on the admin UI. See `application/Espo\Resources/metadata/authenticationMethods/Oidc.json` for an example.

### isAvailable

*boolean*

Whether the method is available in the settings.

## provider

*As of v7.4.*

Parameters for the Authentication Provider entity. Same as in the *settings*. If omitted, then a corresponding parameter from the *settings* is used.

### isAvailable

*boolean*

Whether is available in the Authentication Provider entity.
