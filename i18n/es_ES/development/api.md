# REST API

EspoCRM es una aplicación de una sóla página para que una interfaz utilice REST API para conectarse con un motor.
Todas las operaciones que realice utilizando UI, las puede implementar a través de llamadas a API utilizando su lenguaje de programación.
Puede aprender sobre cómo funciona el API si rastrea lo que ocurre en la pestaña de red en la cónsola de su buscador.

La mayoría de las funciones api arrojan JSON. Las llamadas POST, PATCH suelen necesitar algunos datos JSON en carga útil.

El URL base de EspoCRM es: `api/v1/`. Necesita insertarlo al principio de las expresiones en esta referencia. Ejemplo;

`GET http://your_domain/api/v1/Contact/55643ca033f7ab4c5`.

## Autenticación

El API de EspoCRM utiliza [Autenticación Básica](https://es.wikipedia.org/wiki/Autenticación_de_acceso_básica). El nombre de usuario y la contraseña/token son pasados por el encabezado `Authorization` codificado en base64.

`"Authorization: Basic " + base64Encode(username  + ':' + password)`


Es mucho mejor utilizar el token de autenticación en lugar de la contraseña cuando se trabaja con api. En este caso usted necesitará proporcionar el nombre de usuario y la contraseña/token en el encabezado `Espo-Authorization`. 
```
"Espo-Authorization: " + base64Encode(username  + ':' + passwordOrToken)
```

1. Obtenga el token de acceso pidiendo `GET App/user` con el nombre de usuario y la contraseña pasada en el encabezado `Espo-Authorization`.
2. Utilice este token en lugar de la contraseña en el encabezado `Espo-Authorization` para todos los siguientes pedidos.
3. Si el pedido arroja un error 403, eso significa que el nombre de usuario/contraseña es incorrecto o que el token ya no es valido.

#### Token de Autenticación / Datos Específicos de Usuario

`GET App/user`

Arroja:

* `token` - el token de acceso a utilizar;
* `acl` - información sobre el acceso del usuario;
* `preferences` - preferencias del usuario;
* `user` - historial de atributos del usuario.


## Operaciones CRUD

#### Listar Entidades

`GET {entityType}`

Obtenga parametros:

* `offset` - (int) compensar;
* `maxSize` - (int) tamaño máximo;
* `where` - (array) filtros;
* `sortBy` - (string) campo a clasificar por;
* `asc` - (bool) dirección de clasificación.

_Ejemplo_

`GET Account?offset=0&maxSize=20`

Arroja:
```
{
  "list": [... array of records...],
  "total": {totalCountOfRecords}
}
```

#### Leer Entidad

`GET {entityType}/{id}`

Arroja atributos en un objeto JSON.

_Ejemplo_

`GET Account/5564764442a6d024c`

#### Crear Entidad

`POST {entityType}`

Carga útil: Objeto de los atributos de entidad

Arroja atributos de entidad en un objeto JSON.

_Ejemplo_

`POST Account`

Carga útil:
```
{
  "name": "Test",
  "assignedUserId": "1"
}
```

#### Actualizar Entidad

`PATCH {entityType}/{id}`

o

`PUT {entityType}/{id}`

Carga útil: Objeto de los atributos de entidad que se necesitan para ser cambiados.

Arroja atributos en objeto JSON.

_Ejemplo_

`PATCH Account/5564764442a6d024c`

Carga útil:
```
{
  "assignedUserId": "1"
}
```

#### Eliminar Entidad

`DELETE {entityType}/{id}`

_Ejemplo_

`DELETE Account/5564764442a6d024c`


## Entidades Relacionadas

#### Listar Entidades Relacionadas

`GET {entityType}/{id}/{link}`

* `offset` - (int) compensar;
* `maxSize` - (int) tamaño máximo;
* `where` - (array) filtros;
* `sortBy` - (string) campo a clasificar;
* `asc` - (bool) dirección de clasificación.

_Ejemplo_

`GET Account/5564764442a6d024c/opportunities`

Arroja:
```
{
  "list": [... array of records...],
  "total": {totalCountOfRecords}
}
```

#### Vincular Entidad

`POST {entityType}/{id}/{link}`

Carga útil:

1. `id` atributo.
2. `ids` formar atributo.
3. `"massRelate": true` y `"where": {...}` para relacionar varios historiales por criterios de búsqueda.

_Ejemplo_

`POST Account/5564764442a6d024c/opportunities`

Carga útil:
```
{
  "id": "55646fd85955c28c5"
}
```

#### Desvincular Entidad

`DELETE {entityType}/{id}/{link}`

Carga útil

1. JSON con `id` atributo.
2. JSON con `ids` formar atributo.

_Ejemplo_

`DELETE Account/5564764442a6d024c/opportunities`

Carga útil:
```
{
  "id": "55646fd85955c28c5"
}
```


## Transmisión

#### List stream entries for the current user

#### Listar entradas de transmisión para el usuario actual

`GET Stream`

Obtener parametros:

* `offset` - (int) compensar;
* `maxSize` - (int) tamaño máximo;

#### Listar entradas de transmisión relaciondas a un historial específico

`GET {entityType}/{id}/stream`

Obtener parametros:

* `offset` - (int) compensar;
* `maxSize` - (int) tamaño máximo;

#### Seguir al historial

`PUT {entityType}/{id}/subscription`

#### Dejar de al seguir hitorial

`DELETE {entityType}/{id}/subscription`


