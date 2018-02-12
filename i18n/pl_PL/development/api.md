# REST API

EspoCRM jest aplikacją typu SPA - Single Page Application, Część klienta komunikuje sięz częścią serwerową za pomocą REST API. 
Wszystkie operacje, które wykonujesz korzystając z UI możesz zaimplementować poprzez odwoływanie się za pomocą swojego języka programowania do API.
Możesz nauczyć się jak działa API, jeśli będziesz śledził co się dzieje w zakładce Sieć w konsoli swojej przeglądarki internetowej.

Większość funkcji API zwraca JSON. POST, PATCH wywołania zazwyczaj wymagają danych w formacie JSON w ładunku zapytania.

Bazowym adresem URL EspoCRM API jest: `api/v1/`. Musisz przełożyć to przed wyrażeniem w odwołaniu. Przykład: 

`GET http://your_domain/api/v1/Contact/55643ca033f7ab4c5`.

## Autentykacja

EspoCRM API uses [Basic Authentication](http://en.wikipedia.org/wiki/Basic_access_authentication). Username and password/token are passed through `Authorization` header encoded in base64.

`"Authorization: Basic " + base64Encode(username  + ':' + password)`


Kiedy pracuje się z API, dużo lepiej jest wykorzystać tokeny zamiast haseł do autoryzacji. W tym przypadku, musisz dostarczyć nazwe użytkownika oraz hasło/token w nagłówku `Espo-Authorization`.
```
"Espo-Authorization: " + base64Encode(username  + ':' + passwordOrToken)
```

1. Uzyskaj token dostępu przez `GET App/user` żadanie z nazwą użytkownika oraz hasłem przekazne w nagłówku `Espo-Authorization`.
2. Wykorzystaj ten token zamiast hasła w nagłówku `Espo-Authorization` w każdych kolejnych żądaniach.
3. Jeśli żądanie zwróci błąd 403, oznacza to, że nazwa użytkownika/hasło jest błędne lub token nie jest już ważny.

#### Authentication Token / User Specific Data

`GET App/user`

Zwracane dane:

* `token` - token dostępu;
* `acl` - informacje o dostępie użytkownika;
* `preferences` - preferencje użytkownika;
* `user` - user record attributes.


## Operacje CRUD

#### Elementy Listy

`GET {entityType}`

Parametry żądania GET:

* `offset` - (liczba całkowita) offset;
* `maxSize` - (liczba całkowita) maksymalny rozmiar;
* `where` - (tablica) filtry;
* `sortBy` - (ciąg znaków) field to sort by;
* `asc` - (wartość binarna) kierunek sortowania.

_Example_

`GET Account?offset=0&maxSize=20`

Zwracane wartości:
```
{
  "list": [... tablica rekordów...],
  "total": {totalCountOfRecords}
}
```

#### Read Entity

`GET {entityType}/{id}`

Zwraca atrybuty jako obiekt JSON.

_Example_

`GET Account/5564764442a6d024c`

#### Stwórz Obiekt

`POST {entityType}`

Payload: Object of entity attributes.

Zwraca entity attributes in JSON object.

_Example_

`POST Account`

Payload:
```
{
  "name": "Test",
  "assignedUserId": "1"
}
```

#### Aktualizuj Obiekt

`PATCH {entityType}/{id}`

lub

`PUT {entityType}/{id}`

Payload: Object of entity attributes needed to be changed.

Zwraca atrybuty jako obiekt JSON.

_Example_

`PATCH Account/5564764442a6d024c`

Payload:
```
{
  "assignedUserId": "1"
}
```

#### Usuń obiekt

`DELETE {entityType}/{id}`

_Example_

`DELETE Account/5564764442a6d024c`


## Related Entities

#### List Related Entities

`GET {entityType}/{id}/{link}`

* `offset` - (int) offset;
* `maxSize` - (int) max size;
* `where` - (array) filters;
* `sortBy` - (string) field to sort by;
* `asc` - (bool) sort direction.

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

1. `id` attribute.
2. `ids` array attribute.
3. `"massRelate": true` and `"where": {...}` to relate multiple records by search criterias.

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



