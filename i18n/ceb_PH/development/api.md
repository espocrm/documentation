# Ang REST API

Ang EspoCRM kay usa ka single page nga aplikasyon mao ang frontend mugamit og REST API para mukonektar sa backend.

Ang tanan nga mga operasyon nga imong gihimo gamit ang UI mahimo nimung ipadagan pinaagi sa mga tawag sa API gamit ang imong programming nga pinulongan. 
Mahimo nimu nga mahibal-an kon sa unsang paagi naglihok ang API kung imong subayon kung unsay nahitabo sa network tab sa console sa imung browser. 

Kadaghanan sa mga gimbuhaton sa API mubalik ug JSON. Ang mga tawag sa POST, PATCH kasagaran nagkinahanglan sa pipila ka datos sa JSON sa payload.

Ang Base URL sa EspoCRM API mao ang: `api/v1/`. Kinahanglan ni nimu i-prepend sa mga ekspresyon niining reperensya. Pananglitan: 

`GET http://your_domain/api/v1/Contact/55643ca033f7ab4c5`.

## Pagpamatuod

EspoCRM API gagamit ug [Basic Authentication](http://en.wikipedia.org/wiki/Basic_access_authentication). Ang username o password/token nagaagi sa `Authorization` header nga naka-encode sa base64.

`"Authorization: Basic " + base64Encode(username  + ':' + password)`


Mas maayo nga gamiton ang auth token imbis nga password kon magtrabaho ka sa api. Sa kini nga kaso gikinahanglan nimo ang paghatag ug username ug password / token sa header sa `Espo-Authorization`.
```
"Espo-Authorization: " + base64Encode(username  + ':' + passwordOrToken)
```

1. Pagkuha ug access token pinaagi sa `GET App/user` nga request uban ang username ug password nga gipasa sa header sa `Espo-Authorization`.
2. Gamita kini nga token imbis ang password isa `Espo-Authorization` header alang sa dugang pa nga request.
3. Kung ang request mubalik ug 403 nga sayop kana nagpasabot nga bisan asa sa username/password sayup o ang token kay dili na balido.

#### Pamatuod sa Pag-ila / Tukma nga Datos sa User

`GET App/user`

Ang mga ibalik:

* `token` - access token nga gamiton;
* `acl` - impormasyon bahin sa pag-access sa user;
* `preferences` - mga gusto sa tiggamit;
* `user` - mga user rekord nga attribute.


## Mga Operasyon sa CRUD

#### Paglista sa mga Entity

`GET {entityType}`

Pagkuha ug mga parametro:

* `offset` - (int) offset;
* `maxSize` - (int) max nga gidak-on;
* `where` - (array) mga filter;
* `sortBy` - (string) field nga pwede han-ayan;
* `asc` - (bool) matang nga direksyon.

_Pananglitan_

`GET Account?offset=0&maxSize=20`

Mobalik:
```
{
  "list": [... array of records...],
  "total": {totalCountOfRecords}
}
```

#### Pagbasa sa Entity

`GET {entityType}/{id}`

Nagbalik sa mga attribute sa JSON object.

_Pananglitan_

`GET Account/5564764442a6d024c`

#### Paghimo sa Entity

`POST {entityType}`

Payload: Object sa mga entity attribute.

Mubalik og mga entity attribute nga JSON object.

_Pananglitan_

`POST Account`

Payload:
```
{
  "name": "Test",
  "assignedUserId": "1"
}
```

#### Pag-Update sa Entity

`PATCH {entityType}/{id}`

o

`PUT {entityType}/{id}`

Payload: Ang object sa mga entity attribute kinahanglan nga usbon.

Mobalik sa mga attribute nga JSON object.

_Pananglitan_

`PATCH Account/5564764442a6d024c`

Payload:
```
{
  "assignedUserId": "1"
}
```

#### Pagtangtang sa Entity

`DELETE {entityType}/{id}`

_Pananglitan_

`DELETE Account/5564764442a6d024c`


## Mga Entity nga may Kalabutan

#### Paglista sa Entity nga may Kalabutan

`GET {entityType}/{id}/{link}`

* `offset` - (int) offset;
* `maxSize` - (int) kinadak-an nga gidak-on;
* `where` - (array) mga filter;
* `sortBy` - (string) field nga pwede han-ayan;
* `asc` - (bool) matang nga direksyon.

_Pananglitan_

`GET Account/5564764442a6d024c/opportunities`

Ang ibalik:
```
{
  "list": [... array of records...],
  "total": {totalCountOfRecords}
}
```

#### Pag-Link sa Entity

`POST {entityType}/{id}/{link}`

Payload:

1. `id` attribute.
2. `ids` attribute array.
3. `"massRelate": true` ug `"where": {...}` pag-asoy sa daghang mga rekord pinaagi sa mga search criteria.

_Pananglitan_

`POST Account/5564764442a6d024c/opportunities`

Payload:
```
{
  "id": "55646fd85955c28c5"
}
```

#### Pag-unlink sa Entity

`DELETE {entityType}/{id}/{link}`

Payload:

1. JSON nga naay `id` attribute.
2. JSON nga naay `ids` array nga attribute.

_Pananglitan_

`DELETE Account/5564764442a6d024c/opportunities`

Payload:
```
{
  "id": "55646fd85955c28c5"
}
```

## Pag-stream

#### Paglista sa mga entry sa stream alang sa kasamtangan nga tiggamit

`GET Stream`

Pagkuha ug mga parametro:

* `offset` - (int) offset;
* `maxSize` - (int) kinadak-an nga gidak-on;

#### Paglista sa mga entry sa stream nga may kalabutan sa usa ka espesipiko nga rekord

`GET {entityType}/{id}/stream`

Pagkuha uga mga parametro:

* `offset` - (int) offset;
* `maxSize` - (int) kinadak-an nga gidak-on;

#### Pagsunod sa Rekord

`PUT {entityType}/{id}/subscription`

#### Pag-unfollow sa Rekord

`DELETE {entityType}/{id}/subscription`



