# Izračunana polja (Formula)

V Upravljalniku entitet je možno definirati skript (formulo) za določen tip entitete. Ta skript se bo izvršil vsakič, preden bo zapis shranjen.
To omogoča, da se določenim poljem (atributom) samodejno nastavijo vrednosti, pridobljene iz izračuna.

Za urejanje formule pojdite na Administracija > Upravljalnik entitet > padajoči meni na desni pri vrstici izbrane entitete > Formula.

Prav tako bi bilo dobro, da poljem, ki bodo prejela izračunane vrednosti, nastavite atribut Samo branje v Upravljalniku entitet.


## Sintaksa

EspoCRM formula se piše v preprostem jeziku, oblikovanem posebej za ta namen.

V formuli lahko uporabite operatorje ter atribute in vrednosti funkcij. Ločene izraze morate ločiti z znakom `;`.

### Operatorji

* `=` - prireditev,
* `||` - logični ALI,
* `&&` - logični IN,
* `!` - logični NE,
* `+`- numerično seštevanje,
* `-` - numerično odštevanje,
* `*` - numerično množenje,
* `/` - numerično deljenje,
* `%` - numerični modul (preostanek po deljenju),
* `==` - primerjava: je enako,
* `!=` - primerjava: ni enako,
* `>` - primerjava: večje kot,
* `<` - primerjava: manjše kot,
* `>=` - primerjava: večje ali enako,
* `<=` - primerjava: manjše ali enako.

Prioriteta operatorjev:
* `=`;
* `||`, `&&`;
* `==`, `!=`, `>`, `<`, `>=`, `<=`;
* `+`, `-`;
* `*`, `/`, `%`.

### Atributi

Atributi predstavljajo vrednosti polj ciljne entitete. Atribute, ki so na voljo, lahko dodate s klikom na gumb plus.

Do atributov povezanih entitet lahko dostopate z zapisom v naslednji obliki: `imePovezave.imeAtributa`.


### Funkcije

Funkcije se uporablja v naslednji obliki: `imeSkupine\imeFunkcije(argument1, argument2, ..., argumentN)`.

V nadaljevanju so navedene privzete funkcije.

#### ifThenElse
`ifThenElse(POGOJ, POSLEDICA, ALTERNATIVA)` Če je POGOJ izpolnjen, potem naredi POSLEDICO. Če ni, potem naredi ALTERNATIVO.

#### ifThen
`ifThen(POGOJ, POSLEDICA)` Če je POGOJ izpolnjen, potem naredi POSLEDICO. Če ni, potem ne naredi nič.

#### string\concatenate
`string\concatenate(NIZ_1, NIZ_2)` Spoji oziroma združi dva ali več nizov.

#### string\substring
`string\substring(NIZ, ZAČETEK, DOLŽINA)` Izlušči znake iz NIZA od pozicije ZAČETEK in z določeno DOLŽINO.

Če je DOLŽINA izpuščena, potem bo rezultat funkcije podniz od pozicije ZAČETEK do konca NIZA.

Če je DOLŽINA negativna, potem bo tolikšno število znakov izpuščenih od konca NIZA.

#### string\\trim
`string\trim(NIZ)` Odstrani prazen prostor (znake za presledek) na začetku in na koncu NIZA.

#### string\\lowerCase
`string\lowerCase(NIZ)` Vse znake niza pretvori v male črke. (od verzije 5.0.0)

#### string\\upperCase
`string\upperCase(NIZ)` Vse znake niza pretvori v velike črke. (od verzije 5.0.0)

#### datetime\\today
`datetime\today()` Vrne današnji datum.

#### datetime\now
`datetime\now()` Vrne trenutni datum in čas.

#### datetime\format
`datetime\format(VREDNOST, [ČASOVNI PAS], [FORMAT])` Pretvori VREDNOST datum ali datum-čas v niz, formatiran glede na nastavitve aplikacije. Argumenta ČASOVNI PAS in FORMAT se lahko izpusti. Če je ČASOVNI PAS izpuščen, potem bo uporabljen privzeti časovni pas. Če je FORMAT izpuščen, potem bo uporabljen privzeti format.

#### datetime\date
`datetime\date(VREDNOST, [ČASOVNI PAS])` Vrne datum v mesecu (1-31).  Če VREDNOST ni določena, vrne `0`. Če je ČASOVNI PAS izpuščen, potem se uporabi sistemski časovni pas. (od verzije 4.7.0)

#### datetime\month
`datetime\month(VREDNOST, [ČASOVNI PAS])` Vrne mesec (1-12). Če VREDNOST ni določena, vrne `0`. Če je ČASOVNI PAS izpuščen, potem se uporabi sistemski časovni pas. (od verzije 4.7.0)

#### datetime\year
`datetime\year(VREDNOST, [ČASOVNI PAS])` Vrne leto. `0` Če VREDNOST ni določena, vrne `0`. Če je ČASOVNI PAS izpuščen, potem se uporabi sistemski časovni pas. (od verzije 4.7.0)

#### datetime\hour
`datetime\hour(VREDNOST, [ČASOVNI PAS])` Vrne uro (0-23). Če VREDNOST ni določena, vrne `-1`. Če je ČASOVNI PAS izpuščen, potem se uporabi sistemski časovni pas. (od verzije 4.7.0)

#### datetime\minute
`datetime\minute(VREDNOST, [ČASOVNI PAS])` Vrne minuto (0-59). Če VREDNOST ni določena, vrne `-1`. Če je ČASOVNI PAS izpuščen, potem se uporabi sistemski časovni pas. (od verzije 4.7.0)

#### datetime\dayOfWeek
`datetime\dayOfWeek(VREDNOST, [ČASOVNI PAS])` Vrne dan v tednu (0-6). Če VREDNOST ni določena, vrne `-1`. Za nedeljo vrne `0`. Če je ČASOVNI PAS izpuščen, potem se uporabi sistemski časovni pas. (od verzije 4.7.3)

#### datetime\diff
`datetime\diff(VREDNOST_1, VREDNOST_2, VRSTA INTERVALA)` Vrne razliko med dvema datumoma ali poljema datum-čas. VRSTA INTERVALA je lahko 'years', 'months', 'days', 'hours', 'minutes'. Če izračun ne uspe, vrne `null`. Če je VREDNOST_1 < VREDNOST_2, je rezultat negativen.

#### datetime\addMinutes
`datetime\addMinutes(VREDNOST, MINUTE)` Doda MINUTE k VREDNOSTI polja datum-čas. MINUTE so lahko negativne.

#### datetime\addHours
`datetime\addHours(VREDNOST, URE)` Doda URE k VREDNOSTI polja datum-čas. URE so lahko negativne.

#### datetime\addDays
`datetime\addDays(VREDNOST, DNEVI)` Doda DNEVE k VREDNOSTI polja datum-čas. DNEVI so lahko negativni.

#### datetime\addWeeks
`datetime\addWeeks(VREDNOST, TEDNI)` Doda TEDNE k VREDNOSTI polja datum-čas. TEDNI so lahko negativni.

#### datetime\addMonths
`datetime\addMonths(VREDNOST, MESECI)` Doda MESECE k VREDNOSTI polja datum-čas. MESECI so lahko negativni.

#### datetime\addYears
`datetime\addYears(VREDNOST, LETA)` Doda LETA k VREDNOSTI polja datum-čas. LETA so lahko negativna.

#### datetime\closest
`datetime\closest(VREDNOST, VRSTA, CILJ, [V_PRETEKLOSTI], [ČASOVNI PAS])` Vrne datum ali datum-čas, ki je najbližje VREDNOSTI upoštevajoč posredovane argumente. (od verzije 5.0.0)

VRSTA je lahko ena od naslednjih vrednosti: 'time', 'minute', 'hour', 'date', 'month', 'dayOfWeek'. CILJ je celo število ali niz. V_PRETEKLOSTI pomeni, da poišče najbližjo vrednost v preteklosti. Če je ČASOVNI PAS izpuščen, potem se uporabi privzeti časovni pas.

Primeri:

`datetime\closest(datetime\now(), 'time', '20:00')` Vrne najbližjo vrednost datum-čas v prihodnosti s časom 20:00.

`datetime\closest('2017-11-20', 'date', 1, true)` Vrne `2017-11-01`, prvi dan v mesecu.

`datetime\closest(datetime\now(), 'dayOfWeek', 1)` Vrne naslednji ponedeljek (na začetku dneva).

#### number\format
`number\format(VREDNOST, [DECIMALKE], [DECIMALNA VEJICA], [LOČEVANJE TISOČIC])` Pretvori numerično VREDNOST v niz, formatiran glede na navedeni format ali glede na privzete nastavitve aplikacije. Če je argument DECIMALKE, DECIMALNA VEJICA ali LOČEVANJE TISOČIC izpuščen, potem se uporabijo sistemske privzete nastavitve.

Primeri:

`number\format(2.666667, 2)` - rezultat je 2.67;

`number\format(1000, 2)` - rezultat je 1,000.00;

`number\format(10.1, 0)` - rezultat je 10.


#### number\abs
`number\abs(VREDNOST)` Absolutna vrednost. Če VREDNOST ni numerična, vrne null.

#### number\round
`number\round(VREDNOST, NATANČNOST)` Vrne zaokroženo vrednost VREDNOSTI z navedeno NATANČNOSTJO (število decimalk). NATANČNOST je lahko tudi negativna ali enaka nič (privzeto).

#### number\floor
`number\floor(VREDNOST)` Vrne naslednje najnižje celo število, tako da zaokroži vrednost navzdol, če je potrebno. (od verzije 4.9.0)

#### number\ceil
`number\ceil(VREDNOST)` Vrne naslednje najvišje celo število, tako da zaokroži vrednost navzgor, če je potrebno. (od verzije 4.9.0)

#### entity\isNew
`entity\isNew()` Vrne TRUE, če je entiteta nova (je bila ustvarjena) in FALSE, če ni (je bila posodobljena).

#### entity\\isAttributeChanged
`entity\isAttributeChanged(ATRIBUT)` Vrne TRUE, če se je ATRIBUT entitete spremenil.

Primer:

`entity\isAttributeChanged('status')`

#### entity\isAttributeNotChanged
`entity\isAttributeNotChanged(ATRIBUT)` Vrne TRUE, če se ATRIBUT entitete ni spremenil.

#### entity\attributeFetched
`entity\attributeFetched(ATRIBUT)` Atribut, ki je bil določen, ko je bila ciljna entiteta naložena iz baze podatkov. Preden je bil spremenjen.

Primer:

`entity\isAttributeChanged('assignedUserId')`

#### entity\addLinkMultipleId
`entity\addLinkMultipleId(POVEZAVA, ID)` Doda ID polju Poveži več. Na primer, polju 'timi' doda 'nekiTimId'.

`entity\addLinkMultipleId(POVEZAVA, ID_SEZNAM)` Doda seznam id-jev. (od verzije 4.8.3)

#### entity\hasLinkMultipleId
`entity\hasLinkMultipleId(POVEZAVA, ID)` Preveri, ali ima polje Poveži več določen ID.

#### entity\removeLinkMultipleId
`entity\removeLinkMultipleId(POVEZAVA, ID)` Odstrani določen ID polju Poveži več.

#### entity\isRelated
`entity\isRelated(POVEZAVA, ID)` Preveri, ali je ciljna entiteta povezana z drugo entiteto, predstavljeno s POVEZAVO in ID-jem.

#### env\userAttribute
`env\userAttribute(ATRIBUT)` Vrne ATRIBUT trenutnega uporabnika.

#### list
`list(VREDNOST-1, ... VREDNOST-N)` Vrne tabel. (od verzije 4.7.0)

#### array\includes
`array\includes(SEZNAM, VREDNOST)` Vrne true, če SEZNAM vsebuje VREDNOST. Uporabi se lahko za polji Tabela in Multi-Enum. (od verzije 4.7.0)

#### array\push
`array\push(SEZNAM, VREDNOST1 [, VREDNOST2 ...])` Doda en ali več elementov na konec tabele in vrne novo tabelo. (od verzije 5.0.0)

#### array\length
`array\length(SEZNAM)` Vrne število elementov v SEZNAMU. (od verzije 4.8.1)


### Vrednosti

* Nizi. Na primer 'neki niz';
* Cela števila. Na primer 1, 100, 40300.
* Decimalna števila. Na primer 5.2.

### Spremenljivke

V formuli je možno definirati lastne spremenljivke.
```
$imeNekeSpremenljivke = 'Test';
opis = $test;
```


## Primeri

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
znesek = produkt.navedenaCena - (produkt.navedenaCenaPretvorjena * popust / 100.0);
valutaZneska = 'EUR';
```

```
nekoPolje = string\concatenate(ime, " '", srednjeIme, "' ", priimek);
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

## Uporaba formule v Delovnih tokovih

Formulo lahko uporabite v pogojih in akcijah Delovnih tokov. Za več informacij si poglejte [dokumentacijo za delovne tokove](workflows.md).
