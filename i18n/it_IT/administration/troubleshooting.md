Risoluzione dei problemi di #

## i registri di controllo

per scoprire il problema, è necessario verificare i file di registro degli errori.

#### EspoCRM error logs

EspoCRM registri si trovano in '<ESPOCRM_DIRECTORY>/Logs/*.log' e contengono alcune informazioni sull'errore.

#### Apache log di errore

per Ubuntu server un registro errori Apache si trova in '/var/log/apache2/error.log' e contiene tutte le informazioni sull'errore. La posizione dei file di registro può essere diverso su altri sistemi.

## Abilita la modalità di debug

per attivare la modalità di debug, andare a installato EspoCRM directory, aprire il file 'data/config.php" e modificare il valore:

'''
'logger' => [
...
'Livello' => 'avviso',
...
]
'''
A
'''
'logger' => [
...
'Livello' => 'ebug',
...
]
'''

## I processi pianificati non funzionano

#### Problema n. 1: il crontab non è configurato

1. Login via SSH al server.

2. Configurare il proprio crontab seguendo questi passaggi: https://www.espocrm.com/documentation/administration/server-configuration/#user-content-setup-a-crontab.

Nota: il comando crontab dovrebbe essere configurata sotto web-server user, ad es. 'Crontab -e -u www-dati'.

3. Attendere per un pò e controllare i processi pianificati per vedere se tutti i lavori sono stati eseguiti (vedere un registro centrale).

#### Problema #2. Crontab è configurato, ma i processi pianificati non sono

al lavoro per accertarsi che non vi siano errori di cron è in esecuzione, provare a eseguire il comando cron in un terminale:

1. Login via SSH al server.

2. Andare nella directory dove EspoCRM è installato. Ad esempio per '/var/www/html/espocrm' directory il comando è:

'''bash
cd /var/www/html/espocrm
'''

3. Eseguire il comando crontab:

'''bash
php cron.php
'''

Nota: deve essere eseguito sotto web-server user. Se si è effettuato il login come utente root, il comando deve essere (per esempio per Ubuntu):

'''bash
sudo -u www-dati php cron.php
'''

dove 'www-dati' è un web-server user.

4. Se non ci sono errori, controllare i processi pianificati per vedere se un lavoro è stato eseguito (vedere un registro centrale).

## EspoCRM non è carico dopo updgare

questo può accadere a volte su alcuni hostings condivisa.

Controllare le autorizzazioni del file:
/index.php
/api/v1/index.php

devono essere 644. Se uno qualsiasi di questi file ha permesso 664 Hai bisogno di cambiare di 644. Utilizzare il tuo hosting del pannello di controllo o comando chmod .

'''
Chmod 644 /percorso/al/file
'''
ulteriori informazioni sulle autorizzazioni per i file: [qui](server-configuration.md#richieste autorizzazioni--per-unix-based-sistemi).