# I flussi di lavoro

dei flussi di lavoro è disponibile in [Advanced Pack](https://www.espocrm.com/extensions/advanced-pack/).

Flussi di lavoro per automatizzare il processo aziendale di un modo semplice. Lo si può trovare nel pannello di amministrazione. Per creare una regola del flusso di lavoro è necessario definire:

* entità bersaglio - che cosa il tipo di entità del flusso di lavoro è applicato a;
* Tipo di Trigger - quando il flusso di lavoro verrà attivato;
* condizioni - le condizioni devono essere soddisfatte per attivare un flusso di lavoro;
* Azioni - che cosa fare se il flusso di lavoro viene attivato.


## Tipi di trigger

### dopo record creato

scatterà solo quando viene creato un nuovo record. Se specificate le condizioni sono soddisfatte quindi azioni verranno eseguite.

### Dopo record salvato

attivato quando viene creato un nuovo record o un record esistente viene aggiornato. Se specificate le condizioni sono soddisfatte quindi azioni verranno eseguite.

Per le regole di flusso di lavoro con questo tipo di trigger è una pratica comune per avere una condizione che controlla se qualche campo era "cambiato". Ad esempio Nel caso in cui lo stato è cambiato poi di eseguire alcune azioni.

### Programmato

attivato secondo la pianificazione definita. È possibile impostare la funzione per eseguire ogni giorno, ogni settimana, ecc. Le azioni saranno applicati per i record restituiti da una lista specifica relazione. Pertanto è necessario anche per la creazione di un report ad elenco.

La pianificazione è specificato in una notazione crontab.

'''
* * * * * *
| | | | | |
| | | | | -- Anno (intervallo: 1900-3000)
| | | | ---- il giorno della settimana (intervallo: da 1 a 7, 1 in piedi per lunedì)
| | | ------ mese dell'anno (intervallo: 1-12)
| | -------- giorno del mese (intervallo: 1-31)
| ---------- Ora (intervallo: 0-23)
------------ minuto (intervallo: 0-59)
'''

### sequenziale

raramente usato. Dovrebbe essere gestito da un altro flusso di lavoro. Fornisce la capacità di rendere una logica complessa.

Nota: per i flussi di lavoro sequenziali si consiglia di utilizzare [BPM strumento](bpm.md) piuttosto che una funzione di flussi di lavoro.

## Condizioni

è possibile specificare le condizioni che devono essere soddisfatte per attivare il flusso di lavoro. Ci sono due modi di come le condizioni possono essere specificati: con la condizione di UI builder e con formula.

### Condizione UI builder

sono disponibili alcuni tipi di condizione:

* _equivale a_ - il campo è uguale a un valore specifico o di un valore di un altro campo;
* _era pari_ - il campo era uguale a un determinato valore prima del flusso di lavoro è stato attivato;
* _non equivale a_ - il campo non è uguale a un valore specifico o di un valore di un altro campo;
* _non era uguale_ - il campo non era uguale al valore di specifica prima che il flusso di lavoro è stato attivato;
* _vuoto_ - il valore del campo è vuoto;
* _non_ vuoto - il valore del campo non è vuoto;
* _cambiato_ - il campo è stato cambiato;
* _non_ è cambiato - il campo non è stato modificato.

### In condizioni di Formula

Formula fornisce una capacità di definire le condizioni di qualsiasi complessità. Per saperne di più su la sintassi della formula seguire [questo articolo](Formula.md).

Nota: non ci deve essere alcun ';' delimitatore utilizzato nella formula del codice quando si determina una condizione.

## Azioni

### Invio di messaggi di posta elettronica

Il sistema invierà un messaggio di posta elettronica utilizzando un determinato modello di posta elettronica. Un indirizzo di posta elettronica del destinatario può essere preso dal record di destinazione, qualsiasi record correlato, l'utente corrente, seguaci, team di utenti o specificato. I messaggi di posta elettronica possono essere inviati immediatamente o ritardato di un intervallo specifico.

### Crea Record

System consentirà di creare il nuovo record di qualsiasi tipo di entità. Se non vi è una relazione tra il record di destinazione e la creazione di record che è possibile correlare i record.

Vi è una possibilità di definire la formula per calcolare i campi.

### Di creare record correlati

sistema crea il record correlati al record di destinazione. È possibile definire la formula per calcolare i campi.

### Aggiornamento record di destinazione

consente il cambiamento di specifici campi del record di destinazione. È possibile definire la formula per calcolare i campi.

Se avete bisogno di aggiungere nuovi elementi al campo Link-Multiple w/o perdere i dati esistenti (es. I team) è necessario utilizzare le funzione di formula entità\addLinkMultipleId. Esempio: 'entità\addLinkMultipleId('squadre', 'teamId')'.

### Aggiornamento record correlati

consente la modifica di campi specifici del record correlato o record. È possibile definire la formula per calcolare i campi.

### Link con un altro record

si riferisce l'entità bersaglio con un altro ente specifico. Ad esempio aggiunge team specifico per il record.

### Scollega con un altro record
Unrelates l'entità bersaglio da un altro ente specifico. Ad esempio rimuove un team specifico dal record.

### Di applicare la regola di assegnazione

assegnare il record di destinazione per l'utente dalla regola di distribuzione. Vi sono due regole disponibili: il round robin e Least-Busy.

* Il Round Robin - gli utenti vengono scelte dalla parte superiore alla parte inferiore di un elenco (team) e quindi avviare di nuovo.
* Least-Busy - utente che dispone di un minor numero di record assegnati saranno scelti per l'assegnazione.

_Elenco Report_ - per la distribuzione Least-Busy determina quali record saranno presi in considerazione per calcolare il numero di record assegnati. Ad esempio per i casi di cui abbiamo bisogno per prendere solo i record con stato attivo.

### Creare Notifica

Notifica utenti specifici con il messaggio. È possibile utilizzare i segnaposto nel modello di messaggio: {entità} - record di destinazione, {user} - Utente corrente.

### Make seguito

costringe gli utenti specifici per seguire l'entità bersaglio o un specificied entità correlate.

### Trigger un altro flusso di lavoro

consente di realizzare flussi di lavoro sequenziali. È possibile per il flusso di lavoro di diramazione dalla condizione: è possibile configurare il flusso di lavoro per attivare due flussi di lavoro con diverse condizioni definite per il fatto che i flussi di lavoro.

È possibile ritardare l'esecuzione del flusso di lavoro sequenziale. In wokflow sequenziale è possibile definire la condizione che verifica se i campi specifiec sono state modificate poiché il flusso di lavoro principale sono state innescate dall utilizzo di _cambiato_ e _era pari_ tipi di condizione.

Nota: per i flussi di lavoro sequenziali si consiglia di utilizzare [BPM strumento](bpm.md) piuttosto che una funzione di flussi di lavoro.

### Esegui azione di servizio

consente di eseguire il servizio specifico di script. Per impostazione predefinita non ci sono le seguenti azioni disponibili:

* Invia gli inviti - per riunioni/chiamate;
* aggiungere voci del preventivo - per citazioni.

Gli sviluppatori possono scrivere i propri interventi di manutenzione. Vedere [dettaglio](../sviluppo/flusso di lavoro-service-azioni.md).

## Usando la formula nelle azioni

è possibile definire la formula per calcolare i campi per creare record, aggiornare il record di destinazione, creare record correlati e aggiornare i record correlati. Per gli ultimi due, per accedere a attributi di entità di destinazione è necessario utilizzare la funzione 'targetEntity\attribute'. Per accedere a attributi di entità bersaglio che è stato impostato prima del flusso di lavoro è stato attivato la funzione uso 'targetEntity\attributeFetched'.

Esempio:
'''
nome = stringa\CONCATENA(targetEntity\attribute('nome'), ' ', datetime\oggi());
'''

