# Mutarea EspoCRM în alt server

Pentru a muta EspoCRM  în alt server, urmează următorii pași:

### Pasul 1. Salvează o copie de rezervă a fișierelor

Deschide un manager de fișiere sau autentifică-te prin SSH pentru a arhiva toate fișierelor disponibile din directorul EspoCRM. Mai multe detalii: https://github.com/espocrm/documentation/blob/master/administration/backup-and-restore.md#step-1-backup-files.

### Pasul 2. Salvează o copie de rezervă a bazei de date

Pentru datele stocate în baza de date,(MySQL, MariaDB) ar trebui făcută o copie de rezervă. Vă rugăm, urmați această recomandare: https://github.com/espocrm/documentation/blob/master/administration/backup-and-restore.md#step-2-backup-database.

### Pasul 3. Copiază copile de rezervă ale fișierele și a bazei de date, în alt server

Copiază copile de rezervă ale fișierele și a bazei de date, în alt server nou.

### Pasul 4. Dezarhivează fișierele copiilor de rezervă

Pentru a dezarhiva fișierele copiilor de rezervă, poți folosi Managerul de Archivare sau aceste instrucțiuni: https://github.com/espocrm/documentation/blob/master/administration/backup-and-restore.md#step-1-unarchive-backup-files. 
Rețineți: Fișierele trebuie plasate în dierectorul web-server.

### Pasul 5. Configurează un server

Configurează un server nou bazat pe recomandările de aici: https://www.espocrm.com/documentation/administration/server-configuration/.

### Pasul 6. Permisiuni corecte

Setează permisiunile necesare și fișerele proprietarului, https://www.espocrm.com/documentation/administration/server-configuration/#user-content-required-permissions-for-unix-based-systems.

### Pasul 7. Importă copia de rezervă a bazei tale de date

Va trebui să creezi o bază de date cu utilizator în MySQL. Pentru a importa baza de date din copia de rezervă, urmează intrucțiunile: https://github.com/espocrm/documentation/blob/master/administration/backup-and-restore.md#step-3-import-database-dump.

### Pasul 8. Configurări EspoCRM Corecte

După importarea și configurarea cu succes a severului, vă rugăm corectați configurările EspoCRM din fișierul `ESPOCRM_DIRECTORY/data/config.php`:

 * setări conexiune bază de date:
  
  ```php
  'database' => [
        'driver' => 'pdo_mysql',
        'dbname' => 'YOUR_DATABASE_NAME',
        'user' => 'YOUR_USER',
        'password' => 'YOUR_DATABASE_PASSWORD',
        'host' => 'localhost',
        'port' => ''
    ],
  ```
   
   * "siteUrl" - dacă numele domeniului tău a fost schimbat (URL):
  
  ```php
  'siteUrl' => 'https://new-link.com',
  ```
  
  * fișiere implicite proprietar (doar dacă sunt diferite):
  
  ```php
  'defaultPermissions' => [
        'user' => 'www-data',
        'group' => 'www-data'
    ]
  ```

  unde `www-data` este utilizator web-server.

### Pasul 9. Setează un crontab

Setează un crontab, https://www.espocrm.com/documentation/administration/server-configuration/#user-content-setup-a-crontab.
Rețineți: ar trebui să fie configurat în utilizatorul web-server.

Asta este tot. Acum instanța EspoCRM rulează pe un server nou.
