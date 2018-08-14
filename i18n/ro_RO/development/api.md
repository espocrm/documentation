# API REST

EspoCRM este o aplicație de o pagină, astfel frontend folosește API REST pentru a se conecta cu un backend. 
Toate operațiile pe care le performați folosind UI le puteți implementa prin apeluri API calls folosind limbajul de programare. 
Puteți învăța cum funcționează API dacă urmăriți ce se întâmplă în fila de rețea din conosla browser.

Majoritatea funcțiilor api returnează JSON. Apeluri POST, PATCH necesită de obicei niște date JSON în payload.

Baza URL a API EspoCRM este: `api/v1/`. Trebuie să o puneți în așteptare în expresii în această referință. Exemplu: 

`GET http://your_domain/api/v1/Contact/55643ca033f7ab4c5`.

## Autentificare

API EspoCRM folosește [Autentificare de Bază](http://en.wikipedia.org/wiki/Basic_access_authentication). Numele utilizatorului și parola/token sunt trecute prin header-ul codificat `Autorizație` în base64.

`"Authorization: Basic " + base64Encode(username  + ':' + password)`


Este mai bine să folosiți token de autentificare în loc de parolă, atunci când lucrați cu api. În acest caz, va trebui să oferiți numele de utilizator și parola/token în header-ul`Espo-Authorization`.
```
"Espo-Authorization: " + base64Encode(username  + ':' + passwordOrToken)
```

1. Obține accesul token-ului prin`GET App/user`, cerere pentru numele de utilizator și parola/token în header-ul`Espo-Authorization`.
2. Folosiți acest token în loc de parola în header-ul`Espo-Authorization`, pentru toate viitoarele cereri.
3. Dacă cererea returnează eroarea 403, asta însemnă cu fie numele de utilizator/parola sunt greșite sau token-ul nu mai este valid.

#### Token de Autentificare/ Date Specifice ale Utilizatorului

`GET App/user`

Returnează:

* `token` - acces token pentru folosință;
* `acl` - informații despre accesul utilizatorului;
* `preferences` - preferințele utilizatorului;
* `user` - atributul înregistrării utiliztorului.


## Operații CRUD

#### Listă Entități

`GET {entityType}`

GET parameters:

* `offset` - (int) offset;
* `maxSize` - (int) mărime max;
* `where` - (array) filtere;
* `sortBy` - (string) câmp pentru sortare;
* `asc` - (bool) sortare direcție.

_Example_

`GET Account?offset=0&maxSize=20`

Returnează:
```
{
  "list": [... array of records...],
  "total": {totalCountOfRecords}
}
```

#### Citește Entitate

`GET {entityType}/{id}`

Returnează atributele în obiectul JSON.

_Example_

`GET Account/5564764442a6d024c`

#### Creează Entitatea

`POST {entityType}`

Payload: Obiect al atributelor entității.

Returnează atributele în obiectul JSON.

_Example_

`POST Account`

Payload:
```
{
  "name": "Test",
  "assignedUserId": "1"
}
```

#### Actualizează Entitatea

`PATCH {entityType}/{id}`

sau

`PUT {entityType}/{id}`

Payload: Obiectul sau atributele entității trebuie schimbate.

Returnează atributele în obiectul JSON.

_Example_

`PATCH Account/5564764442a6d024c`

Payload:
```
{
  "assignedUserId": "1"
}
```

#### Șterge Entitatea

`DELETE {entityType}/{id}`

_Example_

`DELETE Account/5564764442a6d024c`


## Entitități asemănătoare

#### Lista Entităților Asemănătoare

`GET {entityType}/{id}/{link}`

* `offset` - (int) offset;
* `maxSize` - (int) mărime max;
* `where` - (array) filtere;
* `sortBy` - (string) câmp pentru sortare;
* `asc` - (bool) sortare direcție.

_Example_

`GET Account/5564764442a6d024c/opportunities`

Returnează:
```
{
  "list": [... array of records...],
  "total": {totalCountOfRecords}
}
```

#### Link Entitate

`POST {entityType}/{id}/{link}`

Payload:

1. `id` atribut.
2. `ids` array atribut.
3. `"massRelate": true` și `"where": {...}` pentru a raporta mai multe înregistrări pe criterii de căutare.

_Example_

`POST Account/5564764442a6d024c/opportunities`

Payload:
```
{
  "id": "55646fd85955c28c5"
}
```

#### Unlink Entitate

`DELETE {entityType}/{id}/{link}`

Payload:

1. JSON cu atribut `id`.
2. JSON cu atribut array `ids`.

_Example_

`DELETE Account/5564764442a6d024c/opportunities`

Payload:
```
{
  "id": "55646fd85955c28c5"
}
```

## Stream

#### Listă intrări stream pentru utilizatorul actual.

`GET Stream`

Get parameters:

* `offset` - (int) offset;
* `maxSize` - (int) mărime max;

#### Listă intrări stream raportate la o înregistrare specifică

`GET {entityType}/{id}/stream`

Get parameters:

* `offset` - (int) offset;
* `maxSize` - (int) mărime max;

#### Urmărește înregistrarea

`PUT {entityType}/{id}/subscription`

#### Nu mai urmări înregistrarea

`DELETE {entityType}/{id}/subscription`



