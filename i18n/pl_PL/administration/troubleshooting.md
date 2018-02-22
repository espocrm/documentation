# Rozwiązywanie problemów

## Sprawdzanie logów

Aby odnaleźć problem, musisz sprawdzić plik z logami błędów.

#### Logi błędów EspoCRM

Logi błędów EspoCRM znajdują się w `<ESPOCRM_DIRECTORY>/logs/*.log` i zawierają pewne informację o błędach.

#### Logi błędów serwera Apache

Logi błędów dla Ubuntu oraz serwera Apache znajdują się w `/var/log/apache2/error.log` i zawierają pewne informację o błędach. Lokalizacja logów może się różnić na innych systemach. 

## Włączenie tryby debugowania

Aby włączyć tryb debugowania, idź do katalogu z zainstalowanym EspoCRM, otwórz plik `data/config.php` i zmień wartość:

```
'logger' => [
    ...
    'level' => 'WARNING',
    ...
]
```
na
```
'logger' => [
    ...
    'level' => 'DEBUG',
    ...
]
```

## Planowane Zadania nie działają

#### Problem #1: Twój crontab nie jest skonfigurowany

1. Zaloguj się przez SSH na swój serwer.

2. Skonfiguruj swój crontab podążając za tą instrukcją: https://www.espocrm.com/documentation/administration/server-configuration/#user-content-setup-a-crontab.

Uwaga: Crontab powinien być konfigurowany przez użytkownika web-servera, np. `crontab -e -u www-data`.

3. Poczekaj chwilę i sprawdź czy jakieś zaplanowane zadania zostały wykonane (zobacz w panelu logowania zdarzeń).

#### Problem #2. Crontab jest skonfigurowany, ale Planowane Zadanie nie działają

Aby mieć pewność, że nie występują żadne błędy podczas działania crona, spróbuj uruchomić komendy crona z wiersza poleceń:

1. Zaloguj się przez SSH na swój serwer.

2. Idźdo katalogu gdzie zainstalowany jest EspoCRM. Np. dla katalogu `/var/www/html/espocrm` komenda wygląda następująco:

```bash
cd /var/www/html/espocrm
```

3. Uruchom komendę crontab:

```bash
php cron.php
```

Uwaga: Komenda powinna być wywoływana jako użytkownik web-server. Jeśli jesteś zalogowany jako root, komenda powinna wyglądać (np. dla Ubuntu):

```bash
sudo -u www-data php cron.php
```

gdzie `www-data` jest użytkownikiem.

4. Jeśli nie występują tam błędy, sprawdź Planowane Zadania aby zobaczyć czy żadne zadanie się nie wywołało (zobacz w panelu logowania zdarzeń).

## EspoCRM nie ładuje się po aktualizacji

Czasami się to zdaża przy współdzielonych hostingach.

Sprawdź uprawnienia dla pliku:
/index.php
/api/v1/index.php

Muszą wynosić 644. Jeśli któryś z plików ma zezwolenie 664 musisz je zamienić na 644. Użyj do tego swojego panelu hostingowego lub komendy chmod.

```
chmod 644 /path/to/file
```
Więcej informacji o zezwoleniach dla plików: [tutaj](server-configuration.md#required-permissions-for-unix-based-systems).
