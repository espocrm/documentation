# EspoCRM mobile a un altro server

Seguire questi passi per spostare EspoCRM a un altro server:

### Passo 1. I file di backup

consente di aprire un file manager o il login via SSH per archiviare tutti i file dalla directory EspoCRM. Maggiori dettagli: https://github.com/espocrm/documentation/blob/master/administration/backup-and-restore.md#step-1-backup-files.

### Passo 2. Eseguire il backup del database

i dati memorizzati nel database (MySQL, MariaDB) dovrebbe essere eseguito il backup. Si prega di seguire questa raccomandazione: https://github.com/espocrm/documentation/blob/master/administration/backup-and-restore.md#step-2-backup-database.

### Passo 3. Copia di file e backup di database a un altro server di

backup di copia dei file e dei database in un nuovo server.

### Passo 4. Unarchive file di backup

per unarchive file di backup, è possibile utilizzare Archive Manager o questa istruzione: https://github.com/espocrm/documentation/blob/master/administration/backup-and-restore.md#step-1-unarchive-backup-files.
Nota: i file devono essere inseriti nel server web directory.

### Passo 5. Configurare un server di

configurazione di un nuovo server basato sulle raccomandazioni qui: https://www.espocrm.com/documentation/administration/server-configuration/.

### Passo 6. Correggere le autorizzazioni

impostate le autorizzazioni necessarie e i file proprietario, https://www.espocrm.com/documentation/administration/server-configuration/#user-content-required-permissions-for-unix-based-systems.

### Passo 7. Importare il backup del database

prima di tutto è necessario creare un nuovo database con un utente in MySQL. Per importare il database dal backup, seguire le instuction: https://github.com/espocrm/documentation/blob/master/administration/backup-and-restore.md#step-3-import-database-dump.

### Passo 8. Correggere le configurazioni EspoCRM

dopo aver completato l'importazione e la configurazione del server, si prega di correggere EspoCRM configurazioni nel file 'ESPOCRM_DIRECTORY/dati/config.php':

* Impostazioni di connessione al database:

'''Php
'database' => [
'driver' => 'pdo_mysql',
'dbname' => 'IL VOSTRO_database_name',
'Utente' => 'IL VOSTRO_utente',
'password' => 'IL VOSTRO_database_password',
'host' => 'localhost',
'porta' => ''
],
'''

* "SiteUrl" - se il vostro nome di dominio (URL) è cambiato:

'''Php
'siteUrl' => 'https://new-link.com',
'''

* I file predefiniti proprietario (solo se diverso):

'''Php
'defaultPermissions' => [
'utente' => 'www-dati',
'Gruppo' => 'www-dati'
]
'''

Dove 'www-dati' è il vostro web-server user.

### Passo 9. Impostazione di una

configurazione di crontab di un crontab, https://www.espocrm.com/documentation/administration/server-configuration/#user-content-setup-a-crontab.
Nota: deve essere configurata sotto il vostro web-server user.

Questo è tutto. Ora, la vostra EspoCRM istanza è in esecuzione su un nuovo server.