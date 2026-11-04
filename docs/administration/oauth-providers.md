# OAuth Providers

*As of v9.1.*

OAuth providers allow you to connect Espo to external systems that require OAuth 2.0 authorization. Once an account is connected, Espo can obtain an access token and use it in server-side requests to the external system, e.g. in Workflows or Formula scripts. Refreshing of tokens is handled automatically.

To access, go to: Administration > OAuth Providers. Available only for admin users.

## Setting up

1. Create an OAuth Provider record. Specify the authorization and token endpoints, the client ID and client secret obtained from the external system, and the needed scopes.
2. Copy the *Authorization Redirect URI* from the provider record and specify it in the OAuth application settings on the external system's side.
3. Create an OAuth Account under the provider (in the *Accounts* panel).
4. Open the account and click *Connect*. Complete the authorization in the popup window.

!!! note

    The *Site URL* parameter should be configured properly (Administration > Settings). Otherwise, the redirect URI will not match.

## Account ID

Access tokens are obtained for a specific OAuth Account. To reference an account, you need its ID. The ID can be obtained from the URL of the OAuth Account record.

Example:

```
https://my-espo-instance/#OAuthAccount/view/67f0e4a1b2c3d4e5f
```

Here, the ID is `67f0e4a1b2c3d4e5f`.

## Accessing in Formula

The function `ext\oauth\getAccessToken` returns an access token for a specific OAuth Account. If the token is expired, it will be refreshed automatically. If the token cannot be obtained, an error is thrown.

Example:

```
$accessToken = ext\oauth\getAccessToken('67f0e4a1b2c3d4e5f');
```

See the [function reference](formula/ext.md#extoauthgetaccesstoken).

## Using in Workflows

To pass an access token in a header of the *Send HTTP Request* action:

1. Add an *Execute Formula Script* action before the *Send HTTP Request* action. Obtain the token and store it in a variable:

    ```
    $accessToken = ext\oauth\getAccessToken('67f0e4a1b2c3d4e5f');
    ```

2. In the *Send HTTP Request* action, add a header with the variable placeholder:

    ```
    Authorization: Bearer {$$accessToken}
    ```

Variables defined in an *Execute Formula Script* action are available in the following actions of the same Workflow rule. See more about [Send HTTP Request](workflows.md#send-http-request).

The same approach can be used in BPM processes.