# Troubleshooting

## Verifică jurnal

Pentru a găsi problema, trebuie să verifici fișierele de eroare.

#### Jurnal Erori EspoCRM

Jurnalul se găsește în EspoCRM `<ESPOCRM_DIRECTORY>/logs/*.log` și conține mai multe informații.

#### Jurnal Erori Apache

Pentru server Ubuntu, o eroare apache din jurnal se găsește `/var/log/apache2/error.log` și conține toate informațiile despre eroare. Locația fișierelor din jurnal poate fi diferită pe alte sisteme.

## Activează modul reparare

Pentru a activa modul de reparare, mergi la directorul instalat EspoCRM, deschide fișierul `data/config.php` și schimbă valoarea:

``` 
'logger' => [
    ...
    'level' => 'WARNING',
    ...
]
```
to
```
'logger' => [
    ...
    'level' => 'DEBUG',
    ...
]
```

## Activitățiile planificate nu funcționează

#### Problema #1: crontab nu este configurat

1. Autentifică-te prin SSH pe serverul tău.

2. Configurează crontab urmând pașii: https://www.espocrm.com/documentation/administration/server-configuration/#user-content-setup-a-crontab.

Rețineți: Crontab ar trebui configurat pe utilizator web-server, ex. `crontab -e -u www-data`.

3. Așteaptă pentru un timp și verifică Activitățiile Planificate pentru a vedea dacă vreo problema a fost executată(vezi panoul Jurnal).

#### Problema #2. Crontab este configurat, dar Activitățiile Planificate nu funcționează

Pentru a te asigura ca nu există erori atunci când cron rulează, încearcă să rulezi comanda cron într-un terminal:

1. Autentifică-te prin SSH pe serverul tău.

2. Du-te în directorul unde EspoCRM este instalat. Ex. pentru directorul `/var/www/html/espocrm` comanda este:

```bash
cd /var/www/html/espocrm
```

3. Rulează comanda crontab:

```bash
php cron.php
```

Rețineți: Ar trebui executat pe utilizator web-server. Dacă ești autentificat ca și root, comanda ar trebui să fie (ex. pentru Ubuntu):

```bash
sudo -u www-data php cron.php
```

unde `www-data` este utilizator web-server.

4. Dacă nu sunt erori, verifică Activitățiile Planificate pentru a vedea dacă activitatea a fost executată (vezi panoul Jurnal).

## EspoCRM nu se încarcă după actualizare

Acest lucru se poate întâmpla uneori pe unele gazde comune.

Verificați permisiunile fișierelor:
/index.php
/api/v1/index.php

Trebuie să fie 644. Dacă vreunul dintre aceste fișiere are permisiunea 664, trebuie să îl schimbați la 644. Utilizați panoul de control al gazdei sau comanda chmod.

```
chmod 644 /path/to/file
```
Mai multe informații găsești: [aici](server-configuration.md#required-permissions-for-unix-based-systems).
