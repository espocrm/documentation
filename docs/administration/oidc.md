# OpenID Connect (OIDC) Authentication

*As of v7.3*

EspoCRM supports authentication over OIDC protocol. A user can log in to multiple systems (your business uses) with a single account. In other words, users can authenticate to Espo with identity providers that support OpenID Connect.

Note: EspoCRM is not supported to be used as an identity provider.

Additional features:

* User creation. Optional.
* Team mapping. Espo teams against groups/teams/roles of the identity provider.
* User profile and user teams sync. Optional, on every login.
* Ability to choose a claim that will be used for a username.
* Fallback login. Only for admins or for regular users too.
* For admins OIDC can be disabled, so that only the fallback method  allowed.
* Logout redirect. To clear an identity provider session when a user is logging out from Espo.
* Backchannel logout. The ability to forcibly log out a user from Espo. `api/v1/backchannelLogout` endpoint.

Details:

* No portal support.
* Espo 2FA may not work with some identity providers (where an authorization code can't be used twice).
* The *userName* field length may need to be increased up to 255 in some cases (by default Espo has the limit 50).
* Supported signing algorithms: RS256, RS384. RS512, HS256, HS384, HS512. Developers can add implementations of other algorithms in an upgrade-safe manner.


## Setting up

1. Create an application in your identity provider.
2. In EspoCRM at Administration > Authentication, select the *OIDC* method. Below, on the same form, a *OIDC* panel will appear.
  * Copy the *Client ID* and the *Client Secret* from the identity provider to Espo.
  * Copy the *Authorization Redirect URI* from Espo and add it to a corresponding field on the identity provider.
  * Copy required endpoints (URLs) from the identity provider to Espo.
  * Save the form in Espo.

## Debuggin

Set the debug mode for the [log](log.md). More information will be printed to the log. It can be useful to see what values is sent in JWT tokens (printed to the log), especially when configuring the team mapping.
