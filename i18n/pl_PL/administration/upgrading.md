# Jak zaktualizować EspoCRM

EspoCRM można zaktualizować do najnowszej wersji w następujący sposób:

### Krok 1. Sprawdź swoją aktualną wersję

Aby sprawdzić aktualną wersję idź do  Administracja > Aktualizacje.

### Krok 2. Pobierz wymaganą aktualizację

Idź do strony aktualizacyjnej https://www.espocrm.com/download/upgrades/ i bazując na twojej aktualnej wersji pobierz wymagane paczki.

### Krok 3. Stwórz kopię zastępczą (opcjonalne)

Zanim zaktualizujesz EspoCRM stwórz kopię zapasową swoich plików oraz danych. Podążaj [za tą instrukcją](https://github.com/espocrm/documentation/blob/master/i18n/pl_PL/administration/backup-and-restore.md) aby to wykonać.

### Krok 4. Aktualizacja

Idź do Administracja > Aktualizuj. Wysyłaj i instaluj wszystkie pobrane paczki jedna po drugiej.

Możesz sprawdzić, czy masz najnowszą wersję w Menu> O mnie.

## Aktualizacja przez CLI

Możesz również uruchomić aktualizację za pomocą interfejsu wiersza poleceń. Musisz wykonać następujące polecenie z katalogu głównego EspoCRM:

```
php upgrade.php /path/to/upgrade/package.zip
```
