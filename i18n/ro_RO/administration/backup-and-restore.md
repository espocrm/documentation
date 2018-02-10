# Restabilire și Copie de rezervă

## Cum să faci manual o copie de rezervă a EspoCRM

EspoCRM conține fișiere și date din baze de date. Toate aceste date sunt necesare pentru a se creea o copie de rezervă completă a EspoCRM. Mai jos sunt instrucțiunile pentru un server Ubuntu cu MySQL.

### Pasul 1. Copie de rezervă a fișierelor

Creează o arhivă a conținutului directorului instalat EspoCRM. Pentru Ubuntu calea implicită este `/var/www/html`. Poți folosi următoarea comandă:

```bash
tar -czf "files.tar.gz" -C /var/www/html .
```

### Pasul 2. Copie de rezervă a bazei de date

Pentru a face o copie de rezervă a tuturor datelor, trebuie să știi numele bazei de date și să accesezi acreditările. Poți găsi numele bazei de date în fișierul de configurare  `/ESPOCRM_DIRECTORY/data/config.php` în secțiunea `database` Poți folosi această comandă pentru a face o copie de rezervă a bazei tale de date: 

```bash
mysqldump --user=YOUR_USER --password=YOUR_PASSWORD YOUR_DATABASE_NAME > "db.sql"
```

### Pasul 3. Copiază copia de rezervă

Asta este tot. Acum trebuie să copiezi copia de rezervă într-un loc sigur.


## Cum să faci o copie de rezervă EspoCRM cu un script

Poți folosi un script pentru a face o copie de rezervă a tuturor datelor necesare. Autentificare prin SSH și rularea comenzilor (testate pe serverul Ubuntu).

### Descarcă un script

```bash
wget https://raw.githubusercontent.com/espocrm/documentation/master/_static/scripts/backup.sh
```

### Rulează scriptul

```bash
bash ./backup.sh PATH_TO_ESPOCRM BACKUP_PATH
```
uned
 * `PATH_TO_ESPOCRM` is a path to installed EspoCRM directory.
 * `BACKUP_PATH` is a path to backup directory.

Pentru serverul Ubuntu este:

```bash
bash ./backup.sh /var/www/html /opt/backups
```
Rețineți: Dacă utilizatorul MySQL nu are drepturile să sa acceseze baza de date dump, va trebui să introduci acreditările unui alt utilizator MySQL.

După creeara cu succes, vei primi o cale către copia de rezervă creată.

## Restabiliește EspoCRM dintr-o copie de rezervă.

Poți să îți restabilești EspoCRM din copia de rezervă, așa cum este descris mai sus.

### Pasul 1. Dezarhivează fișierle cu copiile de rezervă.

Pentru a dezarhiva fișierele, poți folosi Archive Manager sau să rulezi comanda de mai jos. Fișierele trebuie să fie plasate în directorul web-server.

```bash
tar -xzf "files.tar.gz" -C /var/www/html
```
unde:
 * `/var/www/html` is a web-server directory.

### Pasul 2. Setează permisiunile necesare

Fișierele are trebuie deținute de un utilizator web-server și să aibe permisiunile corecte. Vă rugăm să setați permisiunile necesare prin urmarea instrucțiunilor de mai jos: [www.espocrm.com/documentation/administration/server-configuration/#user-content-required-permissions-for-unix-based-systems](https://www.espocrm.com/documentation/administration/server-configuration/#user-content-required-permissions-for-unix-based-systems).

### Pasul 3. Importă baza de date dump

Baza de date dump ar trebuie să fie importată în aceași bază de date cu acreditările utilizatorului, altfel corecția are trebui făcută în fișierul de configurare `ESPOCRM_DIRECTORY/data/config.php`. Pantru a importa baza de date din dump, rulează comada de mai jos într-un terminal:

```bash
mysql --user=YOUR_DATABASE_USER --password=YOUR_DATABASE_PASSWORD YOUR_DATABASE_NAME < db.sql
```

### Pasul 4. Verifică/configurează crontab

Verifică dacă crontab este configurat corect. Rulează comanda de mai jos și verifică dacă calea către EspoCRM este corectă:

```bash
sudo crontab -l -u www-data
```
unde:
 * `www-data` is your web-server user.

Dacă trebuie să faci schimbări, folosește această comandă:

```bash
sudo crontab -l -u www-data
```

Mai multe detalii despre configurarea crontab pentru EspoCRM găsiți aici [www.espocrm.com/documentation/administration/server-configuration/#user-content-setup-a-crontab](https://www.espocrm.com/documentation/administration/server-configuration/#user-content-setup-a-crontab).
