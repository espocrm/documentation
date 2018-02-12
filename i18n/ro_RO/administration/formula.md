# Câmpuri calculate (Formulă)

În managerul de entități este posibil să definești scriptul (formula) pentru un tip specific de entitate. Acest script va fi executat de fiecare dată înaintea ce înregistrarea este salvată. 
Oferă posibilitatea de a seta automat câmpuri specifice (atribute) cu valori derivate din calcule.

Pentru a edit formula urmărește Administrare > Manager Entități > meniu jos la dreapta pe rândul necesar entitate > Formulă.

Va trebui să setezi câmpuri, care trebuie calculate, Doar-Citire prin Manager Entități.


## Sintaxă

Formula EspoCRM este scrisă în limbajul simplu conceput special pentru această caracteristică.

Există operatori, atribute de funcții și valori care pot fi utilizate în formulă. Expresiile separate trebuie să fie delimitate de caracter `;`.

### Operatori

* `=` - atribuire.
* `||` - logic OR,
* `&&` - logic AND,
* `!` - logic NOT,
* `+`- sumă numerică,
* `-` - scădere numerică,
* `*` - înmulțire numerică,
* `/` - împărțire numerică,
* `%` - numeric modulo,
* `==` - egal comparative,
* `!=` - nu sunt egale,
* `>` - comparație mai mare ca,
* `<` - comparație mai mică ca,
* `>=` - omparație mai mare sau egală ca,
* `<=` - omparație mai mic sau egal ca.

Prioritatea operatorilor:
* `=`;
* `||`, `&&`;
* `==`, `!=`, `>`, `<`, `>=`, `<=`;
* `+`, `-`;
* `*`, `/`, `%`.

### Atribute

Atributele reprezintă valorile câmpului entității țintă. Puteți insera atributele disponibile apăsând pe butonul plus.

Este posibil să accesați atribute ale entităților legate cu formatul următor `linkName.attributeName`.


### Funcții

Formatul funcției folosește: `groupName\functionName(argument1, argument2, ..., argumentN)`.

Funcții Out-of-the-box  sunt listate mai jos.

#### ifThenElse
`ifThenElse(CONDIȚIA, CONSECVENT, ALTERNATIV)` Dacă CONDIȚIA este îndeplinită efectuează CONSECVENT. Dacă nu -- atunci ALTERNATIV.

#### ifThen
`ifThen(CONDIȚIA, CONSECVENT)` Dacă CONDIȚIA este îndeplinită efectuează CONSECVENT. Dacă nu -- atunci nu efectua nimic.

#### string\concatenate(
`string\concatenate(STRING_1, STRING_2)` Concatecnare două sau mai multe șiruri.

#### string\substring
`string\substring(ȘIR, START, LUNGIME)`  Extrage caracterele din ȘIR începând cu poziția START și LUNGIME.

Dacă LUNGIME este omisă, sub-șirul care începe de la START până la sfârșitul ȘIR va fi returnat.

Dacă LUNGIME este negativă, atunci atât de mulre caractere vor fi omise de la sfârșitul ȘIR.

#### string\\trim
`string\trim(Șir)` înlătură spațiul de la începutul sfârșitului ȘIR

#### string\\lowerCase
`string\lowerCase(ȘIR)` Convertește literele în litere mici. (începând cu versiunea 5.0.0)

#### string\\upperCase
`string\upperCase(ȘIR)` Convertește literele în majuscule. (începând cu versiunea 5.0.0)

#### datetime\\today
`datetime\today()` Returnează data de astăzi.

#### datetime\now
`datetime\now()` Returnează fusul orar actual.

#### datetime\format
`datetime\format(VALOARE, [TIMP DATĂ], [FORMAT])` Convertește  data sau fusul orar VALOARE Într-un șir formatat în concordanță cu setările aplicației. TIMP DATĂ și FORMAT pot fi omise. Dacă TIMP DATĂ este omis, atunci va fi setată data implicită . DAcă FORMAT este omis atunci formatul implicit o să fie folosit.

#### datetime\date
`datetime\date(VALOARE, [TIMP DATĂ])` Returnează ziua din lună (1-31). `0` dacă VALOARE este necompletată. Dacă TIMP DATĂ este omis atunci TIMP DATĂ al sistemului este folosit. (începând cu versiunea 4.7.0)

#### datetime\month
`datetime\month(VALOARE, [TIMP DATĂ])` Returnează luna (1-12). `0` dacă VALOARE este necompletată. Dacă TIMP DATĂ este omis atunci TIMP DATĂ al sistemului este folosit. (începând cu versiunea 4.7.0)

#### datetime\year
`datetime\year(VALOARE, [TIMP DATĂ])` Returnează anul. `0` dacă VALOARE este necompletată. Dacă TIMP DATĂ este omis atunci TIMP DATĂ al sistemului este folosit. (începând cu versiunea 4.7.0)

#### datetime\hour
`datetime\hour(VALOARE, [TIMP DATĂ])` Returnează ora (0-23). `-1` dacă VALOARE este necompletată. Dacă TIMP DATĂ este omis atunci TIMP DATĂ al sistemului este folosit. (începând cu versiunea 4.7.0)

#### datetime\minute
`datetime\minute(VALOARE, [TIMP DATĂ])` Returnează minutul (0-59). `-1` dacă VALOARE este necompletată. Dacă TIMP DATĂ este omis atunci TIMP DATĂ al sistemului este folosit. (începând cu versiunea 4.7.0)

#### datetime\dayOfWeek
`datetime\dayOfWeek(VALOARE, [TIMP DATĂ])` Returnează ziua săptămânii (0-6). `-1` dacă VALOARE este necompletată. `0` - pentru duminică. Dacă TIMP DATĂ este omis atunci TIMP DATĂ al sistemului este folosit.(începând cu versiunea 4.7.3)

#### datetime\diff
`datetime\diff(VALOARE_1, VALOARE_2, INTERVAL_TIP)` Returnează diferența între două date sau două fuse orare. INTERVAL_TIP poate fi 'ani', 'luni', 'zile', 'ore', 'minute'. Returns `null` if failure. Result will be negative if VALOARE_1 < VALOARE_2.

#### datetime\addMinutes
`datetime\addMinutes(VALOARE, MINUTE)` Adaugă MINUTE la timp dată VALOARE. MINUTE pot fi negative.

#### datetime\addHours
`datetime\addHours(VALOARE, ORE)` Adaugă ORE la timp dată VALOARE. ORE pot fi negative.

#### datetime\addDays
`datetime\addDays(VALOARE, ZILE)` Adaugă ZILE la data sau timp dată VALOARE. ZILE pot fi negative.

#### datetime\addWeeks
`datetime\addWeeks(VALOARE, SĂPTĂMÂNI)` Adaugă SĂPTĂMÂNI la data sau timp dată VALOARE. SĂPTĂMÂNI pot fi negative.

#### datetime\addMonths
`datetime\addMonths(VALOARE, LUNI)` Adaugă LUNI la data sau timp dată VALOARE. LUNI pot fi negative.

#### datetime\addYears
`datetime\addYears(VALOARE, ANI)` Adaugă ANI la dată sau TIMP DATĂ VALOARE. ANI pot fi negativi.

#### datetime\closest
`datetime\closest(VALOARE, TIP, ȚINTĂ, [A_TRECUT], [TIMP DATĂ])` Returează cea mai apropiată VALOARE în funcție de argumente. (începând cu versiunea 5.0.0)

TIP poate fi una dintre următoarele VALOAREi: 'timp', 'minut', 'oră', 'dată', 'lună', 'ziASăptămânii'. ȚINTA este integer VALOARE sau un șir VALOARE. A_TRECUT înseamnă să găsească cea mai aproape din trecut. Dacă TIMP DATĂ este omisă atunci TIMP DATĂ implcită este folosită.

Exemple:

`datetime\closest(datetime\now(), 'time', '20:00')` O să returneze cea mai apropiată VALOARE din viitor cu ora 20:00.

`datetime\closest('2017-11-20', 'date', 1, true)` O să returneze `2017-11-01`, prima zi a lunii. 

`datetime\closest(datetime\now(), 'dayOfWeek', 1)` O să returneze următoarea zi de Luni (începutul zilei). 

#### number\format
`number\format(VALOARE, [ZECIMALE], [ZECIMALE_MARCĂ], [MII_SEPARATOR])` Convertește VALOARE numerică în șir în funcție de formatul specific sau setările implicite ale aplicației. Dacă ZECIMALE, ZECIMALE_MARCĂ_MARK sau MII_SEPARATOR atunci setările sistemului o să fie folosite.

Exemple:

`number\format(2.666667, 2)` - rezultă 2.67;

`number\format(1000, 2)` - rezultă 1,000.00;

`number\format(10.1, 0)` - rezultă 10.


#### number\abs
`number\abs(VALOARE)` VALOARE Absolută. Returnează nul dacă VALOARE nu este numerică.

#### number\round
`number\round(VALOARE, PRECIZIA)` Returnează VALOARE rotunjită a VALOARE pentru PRECIZIA specificată (număr de zecimale după punctul zecimal). PRECIZIA poate fi negativă sau zero (implicit).

#### number\floor
`number\floor(VALOARE)` Returnează cea mai mică următoare VALOARE integer rotunjind în jos VALOARE dacă este necesar. (începând cu versiunea 4.9.0)

#### number\ceil
`number\ceil(VALOARE)` Returnează cea mai mare următoare VALOARE integer rotunjind în jos VALOARE dacă este necesar. (începând cu versiunea 4.9.0)

#### entity\isNew
`entity\isNew()` Returnează ADEVĂRAT dacă entitatea este nouă (fiind creeată) și FALS dacă nu (fiind creeată).

#### entity\\isAttributeChanged
`entity\isAttributeChanged(ATRIBUT)` Returnează ADEVĂRAT dacă ATRIBUT entității a fost schimbat.

Exemple:

`entity\isAttributeChanged('status')`

#### entity\isAttributeNotChanged
`entity\isAttributeNotChanged(ATRIBUT)` Returnează ADEVĂRAT dacă ATRIBUT entității nu a fost schimbat.

#### entity\attributeFetched
`entity\attributeFetched(ATRIBUT)` Atributul stabilit atunci când entitatea țintă a fost extrasă din baza de date. Înainte de a fi modificat.

Exemple:

`entity\isAttributeChanged('assignedUserId')`

#### entity\addLinkMultipleId
`entity\addLinkMultipleId(LINK, ID)` Adaugă ID la câmpul Link Multipu. De exemplu, adaugă 'someTeamId' la câmpul 'teams'. 

`entity\addLinkMultipleId(LINK, ID_LIST)` Adaugă lisa id-urilor. (începând cu versiunea 4.8.3)

#### entity\hasLinkMultipleId
`entity\hasLinkMultipleId(LINK, ID)` Verifică dacă câmpul Link Multipu are ID specific.

#### entity\removeLinkMultipleId
`entity\removeLinkMultipleId(LINK, ID)` Înlătură ID-ul specific din câmpul Link Multipu.

#### entity\isRelated
`entity\isRelated(LINK, ID)` Verifică dacă entitatea țintă este legată de o altă entitate reprezentată prin LINK și ID

#### env\userAttribute
`env\userAttribute(ATRIBUT)` Returnează ATRIBUT al utilizatorului actual.

#### list
`list(VALOARE-1, ... VALOARE-N)` Returnează array. (începând cu versiunea 4.7.0)

#### array\includes
`array\includes(LISTĂ, VALOARE)` Returnează adevărat dacă LISTA conține VALOARE. Poate fi folosită pentru câmpurile Array și Multi-Enum. (începând cu versiunea 4.7.0)

#### array\push
`array\push(LISTĂ, VALOARE1 [, VALOARE2 ...])` Adaugă unul sau mai multe elemente la sfârșitul unui array și returnează noul array. (începând cu versiunea 5.0.0)

#### array\length
`array\length(LISTĂ)` Returnează numărul elementelor din LISTA. (începând cu versiunea 4.8.1)


### Valori

* Șiruri. Ex. 'some string';
* Numere Integer. Ex. 1, 100, 40300.
* Numere Float. E.g. 5.2.

### Variabile

Este posibil să definești variabile personalizate în formulă.
```
$someVariableName = 'Test';
description = $test;
```


## Exemple

```
ifThen(
  entity\isNew() && assignedUserId == null,
  assignedUserId = 'managerId'
);

ifThen(
  entity\isNew() && closeDate == null && stage == 'Closed Won',
  datetime\today()
);
```

```
amount = product.listPrice - (product.listPriceConverted * discount / 100.0);
amountCurrency = 'USD';
```

```
someField = string\concatenate(firstName, " '", middleName, "' ", lastName);
```

```
ifThenElse(
  entity\isNew() && status == 'Planned' && dateStart == null,
  dateStart = datetime\addDays(datetime\now(), 10),
  ifThen(
    status == 'Held' && dateStart == null,
    dateStart = datetime\now()
  )
);

```

## Folosind formula în Fluxul de Lucru

Poți folosi formula în condițile și acțiunile din Fluxul de lucru. Vezi [documentele fluxului de lucru](workflows.md) pentru mai multe informații.
