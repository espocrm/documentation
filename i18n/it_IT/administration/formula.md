# I campi calcolati (Formula)

Nel gestore di entità è possibile definire script (formula) specifico per il tipo di entità. Questo script viene eseguito ogni volta che il record è stato salvato.
Esso fornisce una capacità di impostare automaticamente i campi specifici (attributi) con valori derivati da un calcolo.

Per modificare la formula seguire Administration > Entity Manager > menu a discesa a destra sulla riga della entità necessaria > Formula.

È possibile anche la necessità di impostare i campi, che dovrebbero essere calcolati, di sola lettura tramite Entity Manager.


## Sintassi

EspoCRM formula è scritta in un linguaggio semplice progettato specificamente per questa funzione.

Ci sono operatori, funzioni di attributi e valori che possono essere utilizzati nella formula. Le espressioni separate devono essere delimitati dal carattere ';'.

### Gli operatori

* '=' - assegnazione.
* '||' - logiche o,
* '&&' - logica e,
* '!' - non logica,
* ' '- sommatoria numerico,
* '-' - sottrazione numerico,
* '*' - moltiplicazione numerico,
* '/' - divisione numerico,
* '%' - modulo numerico,
* '==' - Confronto è uguale a,
* '!=' - confronto non uguale a,
* '>' - confronto maggiore,
* '<' - confronto inferiore
* '>=' - confronto maggiore di o uguale a,
* '<=' - confronto a meno di o uguale a.

Priorità degli operatori:
* '=';
* '||', '&&";
* '==', '!=', '>', '<', '>=', '<=";
* ' ', '-';
* '*', '/', '%'.

### funzioni

Gli attributi gli attributi rappresentano i valori di campo delle entità bersaglio. È possibile inserire gli attributi disponibili facendo clic sul pulsante più (+).

È possibile accedere a attributi di entità correlate con il seguente formato "linkName.NOMEATTRIBUTO'.
### Il

Formato delle funzioni della funzione utilizzare: `nomegruppo\functionName(argomento1, argomento2, ..., argumentN)`.

Out-of-the-box le funzioni sono elencate di seguito.

#### IfThenElse
`ifThenElse(condizione, conseguente, alternativa)`

Se la condizione è soddisfatta allora fare conseguente. Se non -- quindi fare alternativa.

#### IfThen
`ifThen(condizione, conseguente)`

Se la condizione è soddisfatta allora fare conseguente. Se non -- non fare nulla.

#### La stringa\concatenare
`string\concatenate(stringa_1, stringa_2)`

Concatena due o più stringhe.

#### La stringa\sottostringa
`string\substring(String, START, lunghezza)`

Estrae i caratteri di una stringa da posizione iniziale e la lunghezza.

Se la lunghezza è omesso, la sottostringa a partire dall'inizio fino alla fine della stringa sarà restituito.

Se la lunghezza è negativo, allora, che molti caratteri verranno omesse dalla fine della stringa.

#### String\\rivestimento
`string\trim(STRING)`

Strisce degli spazi dall'inizio e dalla fine della stringa.

#### String\\minuscolo
`string\lowerCase(STRING)`

Converte le lettere in minuscolo. (Sin dalla versione 5.0.0)

#### string\\lettere maiuscole
`string\upperCase(STRING)`

Converte le lettere in maiuscolo. (Sin dalla versione 5.0.0)

#### datetime\\oggi
`datetime\today()`

Restituisce la data odierna.

#### Datetime\ora
`datetime\now()`

Ritorna datetime corrente.

#### Datetime formato\
`datetime\format(VALUE, [TIMEZONE], [FORMAT])`

Converte la data o un valore datetime in una stringa formattata in base alle impostazioni dell'applicazione. Il fuso orario e il formato può essere omesso. Se il fuso orario viene omesso allora fuso orario predefinito verrà utilizzato. Se format è omesso allora formato predefinito verrà utilizzato.

Esempi:

`datetime\format(closeDate, 'America/New_York', 'MM/DD/YYYY')`

`datetime\format(dateStart, 'America/New_York', 'MM/DD/YYYY hh:mma')`

`datetime\format(dateStart, 'Europe/Amsterdam', 'DD/MM/YYYY HH:mm')`

#### Datetime\data
`atetime\data(VALORE, [TIMEZONE]))`

Restituisce la data del mese (1-31). "0" se il valore è vuoto. Se il fuso orario viene omesso allora il fuso orario del sistema è utilizzato. (Sin dalla versione 4.7.0)

#### datetime\mese
`datetime\month(VALORE, [TIMEZONE])`

Restituisce il mese (1-12). "0" se il valore è vuoto. Se il fuso orario viene omesso allora il fuso orario del sistema è utilizzato. (Sin dalla versione 4.7.0)

#### datetime\anno
`datetime\year(VALORE, [TIMEZONE])`

Restituisce l'anno. "0" se il valore è vuoto. Se il fuso orario viene omesso allora il fuso orario del sistema è utilizzato. (Sin dalla versione 4.7.0)

#### datetime\ora
`datetime\hour(VALORE, [TIMEZONE])`

Restituisce ora (0-23). '-1' se il valore è vuoto. Se il fuso orario viene omesso allora il fuso orario del sistema è utilizzato. (Sin dalla versione 4.7.0)

#### datetime\minuto

`datetime\minute(VALORE, [TIMEZONE])`

Restituisce minuto (0-59). '-1' se il valore è vuoto. Se il fuso orario viene omesso allora il fuso orario del sistema è utilizzato. (Sin dalla versione 4.7.0)

#### datetime\dayOfWeek
`datetime\dayOfWeek(VALORE, [TIMEZONE])`

Restituisce il giorno della settimana (0-6). '-1' se il valore è vuoto. '0' - per la domenica. Se il fuso orario viene omesso allora il fuso orario del sistema è utilizzato. (Sin dalla versione 4.7.3)

#### datetime\diff
`datetime\diff(VALORE_1, VALORE_2, Intervallo_Tipo)`

Restituisce la differenza tra due date o datetime. Intervallo_Tipo può essere 'Anni', 'months', 'giorni', 'ore', 'Minuti'. Restituisce null' se guasto. Il risultato sarà negativo se il valore_1 < valore_2.

#### Datetime\addMinutes
`datetime\addMinutes(VALORE, MINUTI)`

Aggiunge minuti al valore datetime. Minuti può essere negativo.

#### Datetime\addHours
`datetime\addHours(VALORE, ORE)`

Aggiunge ore di valore datetime. Ore può essere negativo.

#### Datetime\addDays
`datetime\addDays(VALORE, GIORINI)`

Aggiunge giorni per data o un valore datetime. Giorni può essere negativo.

#### Datetime\addWeeks
`datetime\addWeeks(VALORE, SETTIMANE)`

Aggiunge settimane alla data o un valore datetime. Settimane può essere negativo.

#### Datetime\addMonths
`datetime\addMonths(VALORE, MESI)`

Aggiunge mesi alla data o un valore datetime. Mesi può essere negativo.

#### Datetime\addYears
`datetime\addYears(VALORE, ANNI)`

Aggiunge anni alla data o un valore datetime. Anni può essere negativo.

#### Datetime\closest
`datetime\closest(VALORE, TIPO, TARGET, [è_passato], [TIMEZONE])`

Restituisce la data più vicina o datetime in valore basato su argomenti passati. (Sin dalla versione 5.0.0)

Tipo può essere uno dei seguenti valori: 'tempo', 'minute', 'Ora', 'date', 'Mese', 'dayOfWeek'. Il bersaglio è un valore intero o un valore di stringa. È_passato significa per trovare il più vicino in passato. Se il fuso orario viene omesso allora fuso orario predefinito è utilizzato.

Esempi:

`datetime\closest(datetime\now(), 'time', '20:00')` restituirà il più vicino valore datetime in futuro con 20:00 tempo.

`datetime\closest('2017-11-20', 'date', 1, true)` restituirà '2017-11-01', il primo giorno del mese.

`datetime\closest(datetime\now(), 'dayOfWeek', 1)` restituirà il prossimo lunedì (l'inizio del giorno).

#### Numero\formato
`number\format(VALORE, [DECIMALI], [VALORE DECIMAL_MARK], [MILLE_SEPARATORE])`

Converte il valore numerico in una stringa formattata in base a un formato specifico o le impostazioni predefinite dell'applicazione. Se i decimali, decimale_mark o mille_SEPARATOR quindi i valori di default del sistema sono utilizzati.

Esempi:

`number\format(2.666667, 2)` - risultati 2,67;

`number\format(1000, 2)` - risultati 1,000.00;

`number\format(10.1, 0)` - risultati 10.


#### Numero\abs
`number\abs(VALORE)`

Valore assoluto. Restituisce Null se non è un valore numerico.

#### Numero\round
`number\round(VALORE, PRECISIONE)`

Restituisce il valore arrotondato di valore alla precisione specificata (numero di cifre dopo il punto decimale). Precisione può anche essere negativo o zero (predefinito).

#### Numero\piano
`number\floor(VALORE)`

Restituisce il prossimo valore intero più basso arrotondando il valore se necessario. (Sin dalla versione 4.9.0)

#### numero\ceil
`number\ceil(VALORE)`

Restituisce il successivo più alto valore integer con arrotondamento valore se necessario. (Sin dalla versione 4.9.0)

#### entità\isNew
`entity\isNew()`

Restituisce TRUE se l'entità è nuovo (essendo creato) e False se non (aggiornato).

#### Entità\\isAttributeChanged
`entity\isAttributeChanged(ATTRIBUTO)`

Restituisce TRUE se un attributo di entità è stata modificata.

Esempio:

`entity\isAttributeChanged('Status')`

#### entità\isAttributeNotChanged
`entity\isAttributeNotChanged(ATTRIBUTO)`

Restituirà TRUE se un attributo di entità non è cambiato.

#### Entità\attributeFetched
`entity\attributeFetched(ATTRIBUTO)`

Attributo che è stata impostata quando entità bersaglio è stato recuperato dal database. Prima che esso è stato modificato.

Esempio:

`entity\attributeFetched('assignedUserId')`

#### entità\addLinkMultipleId
`entity\addLinkMultipleId(LINK, ID)`

ID aggiunge al collegamento del campo multiplo. Per esempio, aggiungere "omeTeamId' a 'teams' campo.

`entity\addLinkMultipleId(LINK, ID_LIST)`

Aggiunge l'elenco di ID. (Sin dalla versione 4.8.3)

#### entità\hasLinkMultipleId
`entity\hasLinkMultipleId(LINK, ID)`

Controlla se il collegamento di più ha il campo ID specifico.

#### Entità\removeLinkMultipleId
`entity\removeLinkMultipleId(LINK, ID)`

Rimuove un ID specifico dal collegamento del campo multiplo.

#### Entità\isRelated
`entity\isRelated(LINK, ID)`

controlla se entità bersaglio è correlato con un altro soggetto rappresentato da LINK E ID.

#### Env\userAttribute
`env\userAttribute(ATTRIBUTO)`

Restituisce un attributo di utente corrente.

#### Lista
`elenco(valore-1, ... Il valore N)` restituisce array. (Sin dalla versione 4.7.0)

#### schiera\include
`array\includes(LISTA, VALORE)`

Restituisce VERO se l'elenco contiene il valore. Può essere utilizzato per array e Multi-Enum campi. (Sin dalla versione 4.7.0)

#### schiera\push
`array\push(LISTA, VALORE1 [, VALORE2 ...])`

Aggiunge uno o più elementi al fine di una matrice e restituisce il nuovo array. (Sin dalla versione 5.0.0)

#### Schiera\lunghezza
`array\length(elenco)`

Restituisce il conteggio degli elementi nell'elenco. (Sin dalla versione 4.8.1)


### Valore

* i valori delle stringhe. Ad esempio 'Some stringa';
* numeri interi. Ad esempio 1, 100, 40300.
* I numeri con la virgola. Ad esempio 5.2.

### Variabili

è possibile definire le variabili personalizzate in formula.

```
$someVariableName = 'Test';
descrizione = $prova;
```

## esempi

```
ifThen(
entità\isNew() && assignedUserId == null,
assignedUserId = 'managerId'
);

ifThen(
entità\isNew() && closeDate == null && stage == 'Closed Won",
datetime\oggi()
);
```

```
IMPORTO = prodotto.listPrice - (prodotto.listPriceConverted * Sconto / 100,0);
amountCurrency = "USD";
```

```
someField = stringa\CONCATENA(FirstName, "'", middleName, """, Cognome);
```

```
ifThenElse(
entità\isNew() && status == 'PIANIFICATO' && dateStart == null,
dateStart = datetime\addDays(datetime\ADESSO(), 10),
ifThen(
stato = 'In attesa' && dateStart == null,
dateStart = datetime\ADESSO()
)
);

```

## usando la formula nei flussi di lavoro

<<<<<<< HEAD
è possibile utilizzare la formula in condizioni di flusso di lavoro e le azioni. Vedere i flussi di lavoro [documentazione](workflows.md#usando-la-formula-nelle-azioni) per ulteriori informazioni.
=======
è possibile utilizzare la formula in condizioni di flusso di lavoro e le azioni. Vedere [i flussi di lavoro documentazione](workflows.md#usando-la-formula-nelle-azioni) per ulteriori informazioni.
>>>>>>> upstream/master
