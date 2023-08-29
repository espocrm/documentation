# REST API

EspoCRM is a single page application so the frontend uses REST API to connect with the backend. 
All operations you perform using the UI, you can implement via API calls using your programing language. 
You can learn how the API works if you trace what's going in the network tab in your browser console (press F12 key to open the console).

Most of API functions return JSON. POST and PUT requests usually need some data passed in the payload in JSON format. Whenever you send the JSON payload, add the header: `Content-Type: application/json`.

The path to the API in EspoCRM is: `api/v1/`.

!!! example "Example of GET API request"

    ```
    GET https://address_of_your_crm/api/v1/Contact/55643ca033f7ab4c5
    ```

In this documentation we omit the site URL and `api/v1/` path when we show examples of API functions. If you utilize any our client implementation, it will prepend these URL parts automatically.

!!! note

    API client implementations (available below) do most of work for you: add needed headers, handle autentication, parameters, etc.

It's recommended to create a **separate API user** with specific rights (roles) and use this user for API calls.

See in [tutorial](api-tutorial.md) **how to get started**.

In this article:

* [Client implementations](#client-implementations)
* [Authentication](#authentication)
* [Error codes](#error-codes)

API functions:

* [CRUD operations](api/crud.md) – create, read, update, delete
* [Related records](api/relationships.md)
* [Stream](api/stream.md)
* [CurrencyRate](api/currency-rate.md)
* [Attachment](api/attachment.md)
* [I18n](api/i18n.md)
* [Account](api/account.md)

See also:

* [Search parameters](api-search-params.md)
* [Usage tutorial](api-tutorial.md)

## Client implementations

* [PHP](api-client-php.md)
* [Javascript (Nodejs)](api-client-js.md)
* [Python](api-client-python.md)
* [Rust](api-client-rust.md)
* [Java](api-client-java.md)

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

For regular (non-API) users the EspoCRM front-end uses the [Basic Authentication](http://en.wikipedia.org/wiki/Basic_access_authentication). A username and password (or token) are passed through the `Authorization` header encoded with Base64.

```
"Authorization: Basic " + base64Encode(username  + ':' + password)
```

It's better to use an auth token instead of a password. In this case you will need to provide the username and the password/token in the `Espo-Authorization` header.
```
"Espo-Authorization: " + base64Encode(username + ':' + passwordOrToken)
```

1. Obtain an access token by `GET App/user` request with the username and password passed in `Espo-Authorization` header.
2. Use this token instead of a password in `Espo-Authorization` header for all further requests.
3. If the request returns 401 error that means either that the username/password is wrong or the token is not valid anymore.

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
