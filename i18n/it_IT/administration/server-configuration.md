# Configurazione del server per EspoCRM

EspoCRM può essere installato su Apache ([istruzioni](apache-server-configuration.md)), Nginx ([istruzioni](nginx-server-configuration.md)), o server IIS con supporto PHP versione 5.6 o superiore e la versione di MySQL 5.1 o superiore.

## Consigli per la configurazione

### Requisiti PHP

EspoCRM richiede PHP 5.6 o superiore con le seguenti estensioni abilitato:

* [DOP](http://php.net/manual/en/book.pdo.php) - per accedere a MySQL in PHP;
* [JSON](http://php.net/manual/en/book.json.php) - risorse utilizzano questo formato (metadati, layout, lingue e altri);
* [gd](http://php.net/manual/en/book.image.php) - per manipolare le immagini;
* [OpenSSL](http://php.net/manual/en/book.openssl.php) - per garantire la massima protezione;
* [zip](http://php.net/manual/en/book.zip.php) - per essere in grado di aggiornare EspoCRM e installare le estensioni;
* [IMAP](http://php.net/manual/en/book.imap.php) - monitore cassette postali in EspoCRM;
* [mbstring](http://php.net/manual/en/book.mbstring.php);
* [cURL](http://php.net/manual/en/book.curl.php).

Si raccomanda inoltre di avere [mailparse](https://pecl.php.net/package/mailparse) estensione pecl installato. È necessario per il corretto funzionamento del recupero di posta elettronica funzione.

php.ini impostazioni:

'''
max_execution_time = 180
max_input_time = 180
memory_limit = 256M
post_max_size = 50M di
upload_max_filesize = 50M
'''


### Requisiti MySQL

EspoCRM supporta la versione di MySQL 5.1 o superiore.
Queste sono senza particolari peculiarità. Tutte le impostazioni di default sono buone per EspoCRM.

## Le autorizzazioni necessarie per i sistemi basati su Unix

i file e le directory devono disporre delle autorizzazioni seguenti:

* '/data', '/custom', '/client/custom' - deve essere scrivibile tutti i file, directory e sottodirectory (664 per file, 775 per directory, incluse tutte le sottodirectory e file);
* '/applicazione/Espo/modules', '/client/modules' - deve essere scrivibile la directory corrente (775 per la directory corrente, 644 per i file, 755 per le directory e sottodirectory);
* Tutti gli altri file e directory dovrebbe essere leggibile (644 per file, 755 per le directory).

Per impostare le autorizzazioni, eseguire questi comandi in Terminale:

'''
cd <percorso-verso-il-ESPOCRM DIRECTORY>
Trova . -Type d -exec chmod 755 {} && find . -Tipo f -exec chmod 644 {} ;
trovare dati personalizzata - tipo d -exec chmod 775 {} && trovare dati personalizzata - tipo f -exec chmod 664 {} ;
'''

tutti i file devono essere di proprietà del gruppo e controllata dal webserver processo. Essa può essere "www-data", "daemon", "Apache", "www", ecc.
Nota: su Bitnami Stack, i file devono essere di proprietà del gruppo e di proprietà di "daemon" utente.
Nota: su host condiviso, i file devono essere di proprietà del gruppo e controllata dal tuo account utente.

Per impostare il proprietario e il gruppo-proprietario, eseguire questi comandi in Terminale:

'''
cd <percorso-verso-il-ESPOCRM DIRECTORY>
chown -R <proprietario>:<GRUPPO-proprietario> .;
'''

## Setup di un crontab

per impostare un crontab su un sistema UNIX, segui i passaggi seguenti:

* 1. Login come amministratore nel tuo EspoCRM istanza.
* 2. Vai all'area Lavori pianificati sezione nel pannello amministratore (Menu > Amministrazione > Lavori pianificati) e copiare la stringa per il crontab. Sembra che questo: uno
'''
* * * * * /usr/bin/php -f /var/www/html/espocrm/cron.php > /dev/null 2>&1
'''
* 3. Aprire un terminale ed eseguire questo comando:
'''
crontab -e -u serverweb_utente
'''
serverweb_utente può essere di uno dei seguenti "www.", "www-data", "Apache", etc (dipende dal vostro webserver).
* 4. Incolla la stringa (dal passo 2) e salvare il file crontab (Ctrl O, quindi Ctrl X per l'editor nano).

## Istruzioni di configurazione basati sul tuo server:

* [server Apache configuration](apache-server-configuration.md).
* [Nginx server configuration](nginx-server-configuration.md).