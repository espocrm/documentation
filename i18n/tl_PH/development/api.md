# Ang REST API

Ang EspoCRM ay isang solong page application kaya ang isang frontend ay gagamit ng REST API upang kumonekta sa isang backend.

Lahat ng mga operasyon na iyong isasagawa gamit ang UI ay maaari mong gawin sa pamamagitan ng mga API call gamit ang iyong lengguwahe ng iyong programa. 
Maaari mong matutunan kung paano gumagana ang API kung susubaybayan mo kung ano ang nangyayari sa network tab sa iyong browser console.

Karamihan sa mga function ng API ay bumabalik bilang JSON. Ang mga POST, PATCH call ay kadalasang nangangailang ng ilang datos ng JSON sa payload.

Ang base URL ng EspoCRM API ay: `api/v1/`. Kailangan mo itong i-prepend sa mga ekspresyon sa reference na ito. Halimbawa: 

`GET http://your_domain/api/v1/Contact/55643ca033f7ab4c5`.

## Pagpapatunay

Ang EspoCRM API ay gumagamit ng [Basic Authentication](http://en.wikipedia.org/wiki/Basic_access_authentication). Ang username at password/token ay dumadaan sa `Authorization` header na naka-encode sa base64.

`"Authorization: Basic " + base64Encode(username  + ':' + password)`


Mas mabuting gamitin ang auth token sa halip na password kapag nagtatrabaho ka sa api. Sa kasong ito, kailangan mong magbigay ng username at password/token sa `Espo-Authorization` header.
```
"Espo-Authorization: " + base64Encode(username  + ':' + passwordOrToken)
```

1. Kumuha ng access token sa pamamagitan ng `GET App/user` request kasama ang username at password na dumadaan sa `Espo-Authorization` header.
2. Gamitin ang token na ito sa halip na password sa `Espo-Authorization` header sa lahat ng mga karagdagang mga request.
3. Kung ang request ay bumabalik bilang 403 error, ito ay nangangahulugang ang alinman sa username/password ay mali o ang token ay hindi na balido.

#### Ang Token ng Authentication / User Specific Data

`GET App/user`

Nababalik bilang:

* `token` - access token na gagamitin;
* `acl` - impormasyon tungkol sa acccess ng user;
* `preferences` - mga kagustuhan ng user;
* `user` - mga katangian ng user record.


## Mga Operasyon ng CRUD

#### Mga List Entity

`GET {entityType}`

Mga parameter ng GET:

* `offset` - (int) offset;
* `maxSize` - (int) maximum na sukat;
* `where` - (array) mga filter;
* `sortBy` - (string) ang field na pwedeng mag-sort ayon sa;
* `asc` - (bool) direksyon ng sort.

_Halimbawa_

`GET Account?offset=0&maxSize=20`

Nagbabalik bilang:
```
{
  "list": [... array of records...],
  "total": {totalCountOfRecords}
}
```

#### Ang Read Entity

`GET {entityType}/{id}`

Nagbabalik ng mga katangian sa JSON object.

_Halimbawa_

`GET Account/5564764442a6d024c`

#### Paglikha ng Entity

`POST {entityType}`

Payload: Ang object ng katangian ng mga entity.

Nagbabalik ng mga katangian ng entity sa JSON object.

_Halimbawa_

`POST Account`

Payload:
```
{
  "name": "Test",
  "assignedUserId": "1"
}
```

#### Ang Pag-update ng Entity

`PATCH {entityType}/{id}`

o

`PUT {entityType}/{id}`

Payload: Ang object ng mga katangian ng entity ay kailangang baguhin.

Nagbabalik ng mga katangian sa JSON object.

_Halimbawa_

`PATCH Account/5564764442a6d024c`

Payload:
```
{
  "assignedUserId": "1"
}
```

#### Ang Pag-tanggal ng Entity

`DELETE {entityType}/{id}`

_Halimbawa_

`DELETE Account/5564764442a6d024c`


## Mga Kaugnay na Entity

#### Pag-lista nga mga Entity

`GET {entityType}/{id}/{link}`

* `offset` - (int) offset;
* `maxSize` - (int) maximum na sukat;
* `where` - (array) mga filter;
* `sortBy` - (string) ang field na pwedeng mag-sort ayon sa;
* `asc` - (bool) ang direksyon ng sort.

_Halimbawa_

`GET Account/5564764442a6d024c/opportunities`

Nagbabalik bilang:
```
{
  "list": [... array of records...],
  "total": {totalCountOfRecords}
}
```

#### Pag-link ng Entity

`POST {entityType}/{id}/{link}`

Ang Payload:

1. `id` katangian.
2. `ids` array na katangian.
3. `"massRelate": true` at `"where": {...}` nag-uugnay ng mga maraming rekord ayon sa mga search criteria.

_Halimbawa_

`POST Account/5564764442a6d024c/opportunities`

Payload:
```
{
  "id": "55646fd85955c28c5"
}
```

#### Ang Pag-unlink ng Entity

`DELETE {entityType}/{id}/{link}`

Ang Payload:

1. JSON na may `id` na katangian.
2. JSON na may `ids` array na katangian.

_Halimbawa_

`DELETE Account/5564764442a6d024c/opportunities`

Ang Payload:
```
{
  "id": "55646fd85955c28c5"
}
```

## Pag-stream

#### Pag-lista nga mga entry ng stream para sa kasalukuyang user

`GET Stream`

Kumuha ng mga parameter:

* `offset` - (int) offset;
* `maxSize` - (int) maximum na sukat;

#### Pag-lista ng mga entry ng stream na may kaugnayan sa isang partickular na rekord

`GET {entityType}/{id}/stream`

Kumuha ng mga parameter:

* `offset` - (int) offset;
* `maxSize` - (int) maximum na sukat;

#### Pag-follow ng rekord

`PUT {entityType}/{id}/subscription`

#### Pag-unfollow ng rekord

`DELETE {entityType}/{id}/subscription`



