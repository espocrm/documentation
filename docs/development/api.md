# REST API

EspoCRM is a single page application so the frontend uses REST API to connect with the backend. 
All operations you perform using the UI, you can implement via API calls using your programming language. 
You can learn how the API works if you trace what's going in the network tab in your browser console (press F12 key to open the console).

Most of API functions return JSON. POST and PUT requests usually need some data passed in the payload in JSON format. Whenever you send a JSON payload, add the header: `Content-Type: application/json`.

The root API path is: `api/v1/`.

!!! example "Example of GET API request"

    ```
    GET https://address_of_your_crm/api/v1/Contact/55643ca033f7ab4c5
    ```

In this documentation we omit the site URL and `api/v1/` path when we show examples of API endpoints. If you utilize any of our client implementations, it will prepend these URL parts automatically.

!!! note

    The API client implementations (available below) automatically adds needed headers and handles authentication.

In this article:

* [API reference](#api-reference)
* [Setting up](#setting-up)
* [Client implementations](#client-implementations)
* [Authentication](#authentication)
* [Error codes](#error-codes)
* [Date and time values](#date-and-time-values)

See also:

* [Search parameters](api-search-params.md)
* [Usage tutorial](api-tutorial.md)

## API reference

* [API reference](../api/index.html) – a separate API reference documentation covering CRUD operations for main entity types;
* [CRUD operations](api/crud.md) – an article on create, read, update, delete operations;
* [Related records](api/relationships.md) – working with links;
* [Stream](api/stream.md) – working with the Stream;
* [CurrencyRate](api/currency-rate.md) – currency conversion rates;
* [Attachment](api/attachment.md) – working with file attachments;
* [I18n](api/i18n.md) – internationalization;
* [Metadata](api/metadata.md) – working with application metadata;
* [Account](api/account.md) – (to be removed in favor of the API reference)

### OpenAPI specification

*As of v9.3.*

The OpenAPI specification for your Espo instance (including custom entity types and fields) covering the main CRUD operations can be obtained from the `/api/v1/OpenAPI` endpoint. The endpoint is available for admin users and API users with the *OpenAPI* scope enabled in roles.

## Client implementations

* [PHP](api-client-php.md)
* [Javascript (Nodejs)](api-client-js.md)
* [Python](api-client-python.md)
* [Rust](api-client-rust.md)
* [Java](api-client-java.md)
* [Go](api-client-go.md)
* [Zig](api-client-zig.md)

## Setting up

It's recommended to create a separate **API User** with specific permissions (defined by Roles) and use this user for API calls. You can have multiple API Users for different purposes, give each user specific permissions.

See in the [tutorial](api-tutorial.md) **how to get started**.

Client implementations require specifying the Site URL. It's an URL that you open in the browser to use EspoCRM.

## Authentication

### Authentication by API Key

The simplest method of authentication. You need to create an API User (Administration > API Users) with the *API Key* authentication method. Apply a needed role to the user to grant access to specific scopes.

Authentication header:

```
X-Api-Key: API_KEY_COPIED_FROM_THE_USER_DETAIL_VIEW
```

### HMAC Authentication

The most secure method. You need to create an API User (Administration > API Users) with the *HMAC authentication* method. Apply a needed role to the user to grant access to specific scopes.

Authentication header:

```
"X-Hmac-Authorization: " + base64Encode(apiKey  + ':' + hashHmacSha256(method + ' /' + uri , secretKey))
```
where

* `method` – GET, POST, PUT, DELETE;
* `uri` – a request path, e.g. `Lead/action/convert`.

### Basic Authentication

!!! warning

    This method is not recommended.

For regular users, the EspoCRM front-end uses the [Basic Authentication](http://en.wikipedia.org/wiki/Basic_access_authentication). A username and password (or token) are passed through the `Authorization` header encoded with Base64.

```
"Authorization: Basic " + base64Encode(username  + ':' + password)
```

It's better to use an auth token instead of a password. In this case, you need to provide the username and the password/token in the `Espo-Authorization` header.
```
"Espo-Authorization: " + base64Encode(username + ':' + passwordOrToken)
```

1. Obtain an access token with `GET App/user` request with the username and password passed in `Espo-Authorization` header.
2. Use this token instead of the password in `Espo-Authorization` header for all further requests.
3. If the request returns 401 error, that means either the username or password are wrong, or the token is not valid anymore.

#### Authentication Token / User Specific Data

`GET App/user`

Make this request to retrieve an access token.

Returns:

* `token` – access token to use
* `acl` – information about user access
* `preferences` – user preferences
* `user` – user record attributes

## Error codes

### 400 Bad request

When you create or update a record, this error can mean that you didn't pass a **required field** or it has an empty value. Check the response message or see `data/log` for more details.

### 403 Forbidden

Usually occurs when you **don't have access** to a specific record or action. See `data/log` for more details.

### 404 Not found

Usually occurs when a requested **record doesn't exist**.

## Date and time values

Date format: *YYYY-MM-DD*. Datetime format: *YYYY-MM-DD HH:mm:ss*.

All datetime values are represented in UTC timezone, regardless of the settings.
