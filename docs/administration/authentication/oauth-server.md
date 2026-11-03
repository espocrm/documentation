# OAuth 2.0 authentication

*As of v10.1.*

EspoCRM provides OAuth 2.0 server capabilities.

An admin can register client applications. Then clients can connect to Espo's API with regular user accounts. Upon connecting, user interaction is required: the user needs to log in to Espo and approve the authorization. Only Regular and Admin users can use OAuth.

To be supported:

- Confidential and Public clients
- Refresh Token grant
- Token revocation endpoint
- Opaque access tokens
- Scopes

## Scopes

Scopes allows to:

- narrow down user access
- strip an admin user of administrative capabilities

OAuth scopes mirror Espo's ACL scopes. Only top level scopes are supported. Scopes example: `Account`, `Lead`, `GlobalStream`.

Scopes cannot broaden user's access – they can only narrow down the access the user already has. The effective access is the intersection of the user's access levels and the OAuth scopes.

For example, if a user does not have access to Accounts, adding the Account scope to a registered OAuth client will not grant the user access to Accounts. While if the user already has access to Contacts but the Contact scope is missing in the registered client, they won't receive access to Contacts.

Special scopes:

- `Global` – Having this scope is the same as adding all possible scopes (except `Admin`).
- `Admin` – Administrative capabilities. Applicable only for admin users. If an admin user does not have this scope, their admin capabilities will be removed, while their access levels will be still maxed out (the way if a regular user had a role with max access levels, or, in other words, the way it already works for admins in Espo) and intersected with other OAuth scopes. If the Admin scope is present for an admin user, the access levels will be maxed out and the administrative capabilities will be granted.

## Client registration

An admin can register OAuth Clients under: Administration > OAuth Clients. When creating a client, define type, scopes, and allowed redirect URIs.

Client types:

- Confidential
- Public

For security, it is recommended to use confidential clients.

The redirect URL and scopes you need to copy from your client application.

The client ID will be automatically generated for the registered client. You need to copy it and set in your client application.

If you registered a confidential client, you need to create a secret for it. Once created, the generated secret value will be displayed. You need to copy the secret value and store it in your client application. The value won't be available after you refresh the page or return to the page later. The value is not possible to extract from the database. You can create multiple secrets for a client. You can set an expiration date for secrets.

## Endpoints

- Authorization: `/oauth/authorize`
- Token: `/oauth/token`
- Token revocation: `/oauth/token/revoke`

You need to prepend your site URL.

## Connected apps

A user can see connected client apps under: User page > top-right menu > Connected Apps. It displays all clients that have active access token or refresh token. The user can disconnect specific clients.

## Web server configuration

You need to define rewrite rules in your web server.

### Nginx

```
location /oauth/ {
    if (!-e $request_filename){
        rewrite ^/oauth/(.*)$ /oauth/index.php last; break;
    }
}

location /.well-known/ {
    if (!-e $request_filename){
        rewrite ^/.well-known/(.*)$ /.well-known/index.php last; break;
    }
}
```

### Apache

```
RewriteBase /oauth/
RewriteBase /.well-known/
```

If *mod_rewrite* is enabled, rewrite rules will be automatically applied from the `.htaccess` configuration.

## Console commands

### revoke-tokens

Revoke all tokens:

```
oauth-server:revoke-tokens revoke-tokens
```

Revoke all tokens for admin users:

```
oauth-server:revoke-tokens --admin-only
```

Revoke all tokens for a specific user:

```
oauth-server:revoke-tokens --username={username}
```