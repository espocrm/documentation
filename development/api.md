# REST API

EspoCRM is a single page application so a frontend uses REST API to connect with a backend. 
All operations you perform using UI, you can implement via API calls using your programing language. 
You can learn how API works if you trace what's going in the network tab in your browser console.

Most of API functions return JSON. POST, PATCH calls usually need some JSON data in payload.

Base URL of EspoCRM API is: `api/v1/`. You need to prepend it to expressions in this reference. Example: 

`GET http://your_domain/api/v1/Contact/55643ca033f7ab4c5`.

It's recommended to create a separate user with restricted rights and use this user for API calls.

In this article:

* [Authentication](#authentication)
* [Client Implementations](#client-implementations)
* [CRUD operations](#crud-operations)
* [Relatioships](#relatioships)
* [Stream](#stream)


## Authentication

### Authentication by Api Key

Available since 5.5.0 version.

The easiest method of authentication. You need to create API User (Administration > API Users) with Api Key authentication method. Apply the needed role to the user to restrict or grant access.

Authentication header:

`X-Api-Key: API_KEY_COPIED_FROM_THE_USER_DETAIL_VIEW`


### HMAC Authentication

Available since 5.5.0 version.

The most secure method. You need to create API User (Administration > API Users) with HMAC authentication method. Apply needed role to the user to restrict or grant access.

Authentication header:

```
"X-Hmac-Authorization: " + base64Encode(apiKey  + ':' + hashHmacSha256(method + ' /' + uri , secretKey))
```
where

* `method` - GET, POST, PUT, DELETE;
* `uri` - request path, e.g. `Lead/action/convert`.


### Basic Authentication

For refular users EspoCRM uses [Basic Authentication](http://en.wikipedia.org/wiki/Basic_access_authentication). Username and password/token are passed through `Authorization` header encoded in base64.

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

Returns:

* `token` - access token to use;
* `acl` - information about user access;
* `preferences` - user preferences;
* `user` - user record attributes.

## Client Implementations

* [Implementation in PHP](api-client-php.md)
* [Implementation in Python](api-client-python.md)

## CRUD Operations

Note: You can obtain the list of *entity types* at Administration > Entity Manager > the left column.

#### List Entities

`GET {entityType}`

GET parameters:

* `maxSize` - (int) max size
* `offset` - (int) offset
* `where` - (array) filters
* `orderBy` - (string) field to sort by
* `order` - (string: 'asc' | 'desc') sort direction
* `select` - (string) list of fields to be returned sepratated by comma; if not specified, then all fields will be returned

_Example_

`GET Account?offset=0&maxSize=20`

Returns:
```
{
  "list": [... array of records...],
  "total": {totalCountOfRecords}
}
```

#### Read Entity

`GET {entityType}/{id}`

Returns attributes in JSON object.

_Example_

`GET Account/5564764442a6d024c`

#### Create Entity

`POST {entityType}`

Payload: Object of entity attributes.

Returns entity attributes in JSON object.

_Example_

`POST Account`

Payload:
```
{
  "name": "Test",
  "assignedUserId": "1"
}
```

#### Update Entity

`PUT {entityType}/{id}`

Payload: Object of entity attributes needed to be changed.

Returns attributes in JSON object.

_Example_

`PUT Account/5564764442a6d024c`

Payload:
```
{
  "assignedUserId": "1"
}
```

#### Delete Entity

`DELETE {entityType}/{id}`

_Example_

`DELETE Account/5564764442a6d024c`


## Relatinships

Note: You can obtain the list of *relationship* names at Administration > Entity Manager > click relationships of a specific entity type.

#### List Related Entities

`GET {entityType}/{id}/{link}`

GET parameters:

* `maxSize` - (int) max size
* `offset` - (int) offset
* `where` - (array) filters
* `orderBy` - (string) field to sort by
* `order` - (string: 'asc' | 'desc') sort direction
* `select` - (string) list of fields to be returned sepratated by comma; if not specified, then all fields will be returned

_Example_

`GET Account/5564764442a6d024c/opportunities`

Returns:
```
{
  "list": [... array of records...],
  "total": {totalCountOfRecords}
}
```

#### Link Entity

`POST {entityType}/{id}/{link}`

Payload:

* `id` attribute.
* `ids` array attribute.
* `massRelate` false or true, whether to use search criteria that will be used instead of specific ids
* `where` optional search criteria

_Example_

`POST Account/5564764442a6d024c/opportunities`

Payload:
```
{
  "id": "55646fd85955c28c5"
}
```

#### Unlink Entity

`DELETE {entityType}/{id}/{link}`

Payload:

1. JSON with `id` attribute.
2. JSON with `ids` array attribute.

_Example_

`DELETE Account/5564764442a6d024c/opportunities`

Payload:
```
{
  "id": "55646fd85955c28c5"
}
```

## Stream

#### List stream entries for the current user

`GET Stream`

Get parameters:

* `offset` - (int) offset;
* `maxSize` - (int) max size;

#### List stream entries related to a specific record

`GET {entityType}/{id}/stream`

Get parameters:

* `offset` - (int) offset;
* `maxSize` - (int) max size;

#### Follow record

`PUT {entityType}/{id}/subscription`

#### Unfollow record

`DELETE {entityType}/{id}/subscription`


