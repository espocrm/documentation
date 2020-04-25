# REST API

EspoCRM is a single page application so a frontend uses REST API to connect with a backend. 
All operations you perform using UI, you can implement via API calls using your programing language. 
You can learn how API works if you trace what's going in the network tab in your **browser console** (press F12 key to open the console).

Most of API functions return JSON. POST and PUT requests usually need some data passed in the payload in JSON format.

Requests needs to have the header: `Content-Type: application/json`.

The path to the API in EspoCRM is: `api/v1/`. 

Example of GET API request: 

```
GET https://address_of_your_crm/api/v1/Contact/55643ca033f7ab4c5
```

In this documentation we omit the site URL and `api/v1/` path when we show examples of API functions. If you utilize any our client implementation, it will prepend these parts automatically.

Note: API client implementations (available below) do most of work for you: add needed headers, handle autentication, parameters, etc.

It's recommended to create a **separate API user** with specific rights (roles) and use this user for API calls.

See in [tutorial](api-tutorial.md) **how to get started**.

In this article:

* [Client implementations](#client-implementations)
* [Authentication](#authentication)
* [Error codes](#error-codes)

API functions:

* [CRUD operations](api/crud.md) - create, read, update, delete
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


## Authentication

### Authentication by Api Key

Available since 5.5.0 version.

The easiest method of authentication. You need to create API User (Administration > API Users) with Api Key authentication method. Apply the needed role to the user to grant needed access.

Authentication header:

`X-Api-Key: API_KEY_COPIED_FROM_THE_USER_DETAIL_VIEW`


### HMAC Authentication

Available since 5.5.0 version.

The most secure method. You need to create API User (Administration > API Users) with HMAC authentication method. Apply needed role to the user to grant needed access.

Authentication header:

```
"X-Hmac-Authorization: " + base64Encode(apiKey  + ':' + hashHmacSha256(method + ' /' + uri , secretKey))
```
where

* `method` - GET, POST, PUT, DELETE;
* `uri` - request path, e.g. `Lead/action/convert`.

### Basic Authentication

Note: This method is not recommended.

For regular users EspoCRM uses [Basic Authentication](http://en.wikipedia.org/wiki/Basic_access_authentication). Username and password (or token) are passed through `Authorization` header encoded in base64.

`"Authorization: Basic " + base64Encode(username  + ':' + password)`


It's better to use auth token instead of password when you work with API. In this case you will need to provide username and password/token in `Espo-Authorization` header.
```
"Espo-Authorization: " + base64Encode(username  + ':' + passwordOrToken)
```

1. Obtain an access token by `GET App/user` request with the username and password passed in `Espo-Authorization` header.
2. Use this token instead of password in `Espo-Authorization` header for all further request.
3. If the request returns 401 error that means either username/password is wrong or token is not valid anymore.

#### Authentication Token / User Specific Data

`GET App/user`

Make this request to retrieve an access token.

Returns:

* `token` - access token to use
* `acl` - information about user access
* `preferences` - user preferences
* `user` - user record attributes

## Error codes

### 400 Bad request

When you create or update a recod, this error can mean that you didn't pass a **required field** or it has an empty value. Check the response message or see `data/log` for more details.

### 403 Forbidden

Usually occurs when you **don't have an access** to a specific record or action. See `data/log` for more details.

### 404 Not found

Usually occurs when a requested **record doesn't exist**.
