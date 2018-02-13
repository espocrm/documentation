# Kako nadgraditi EspoCRM

EspoCRM lahko nadgradite na najnovejšo verzijo z upoštevanjem naslednjih korakov:

### 1. korak: Preverite trenutno verzijo

Da bi preverili trenutno verzijo, obiščite stran Administration > Upgrade.

### 2. korak: Prenesite potrebne pakete za nadgradnjo

Obiščite stran za nadgradnjo https://www.espocrm.com/download/upgrades/ in glede na vašo trenutno verzijo prenesite potrebne pakete.

### 3. korak: Ustvarite varnostno kopijo (po želji)

Pred nadgradnjo ustvarite varnostno kopijo svojih EspoCRM datotek in podatkov. Pri tem upoštevajte [ta navodila](https://github.com/espocrm/documentation/blob/master/administration/backup-and-restore.md).

### 4. korak: Postopek nadgradnje

Obiščite stran Administration > Upgrade. Drugega za drugim naložite in namestite pakete za nadgradnjo.

To, ali imate najnovejšo verzijo, lahko preverite na Menu > About.

## Nadgradnja prek ukazne vrstice

Nadgradnjo lahko zaženete tudi z uporabo ukazne vrstice. V EspoCRM glavnem direktoriju zaženite naslednji ukaz:

```
php upgrade.php /path/to/upgrade/package.zip
```
