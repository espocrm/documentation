
# How to upgrade EspoCRM
# Paano i-upgrade ang EspoCRM

EspoCRM can be upgraded to the latest version by the following steps:
Ang EspoCRM ay maaring i-upgrade sa pinakamabagong bersyon sa pamamagitan ng mga sumusunod na hakbang:

### Step 1. Check your current version
### Unang hakbang. Suriin ang iyong kasulukuyang bersyon

To check your current version go to Administration > Upgrade page.
Upanng suriin ang iuong kasulukuyang bersyon pumunta sa Pangangasiwa > Pag-upgrade ng pahina 

### Step 2. Download needed upgrade packages
### Pangalawang Hakbang. I-download ang kinakailangan na i-upgrade sa package

Go to the upgrade page https://www.espocrm.com/download/upgrades/ and based on your currect version download needed packages.
Pumunta sa pag-upgrade ng pahina https://www.espocrm.com/download/upgrades/  at ibatay sa iyong kasulukuyang bersyon download na kinakailangan sa mga package

### Step 3. Create a backup (optional)
### Pangatlong Hakbang. Lumikha ng backup (opsyonal)

Create a backup of your EspoCRM files and data before upgrading. Follow [these instructions](https://github.com/espocrm/documentation/blob/master/administration/backup-and-restore.md) to get it done.
Lumikha ng backup sa iyong mga EspoCRM file at data bago ito i-upgrade. Sundin ang [sumusunod sa mga tagubilin ito]

(htts://github.com/espocrm/documentation/blob/master/administration/backup-and-restore.md) 

### Step 4. Upgrade process
### Pang-apat na hakbang, Proseso sa pag-upgrade

Go to Administration > Upgrade. Upload and install one by one upgrade packages.
Pumunta sa pangangasiwa > Pag-upgrade. I-upload at i-install na isa't isa sa pag-upgrade ng mga package.

You can check whether you have the latest version at Menu > About.
Maari mong suriin kung meron ka nang pinakabagong bersyon at Pagpipilian > Tungkol sa.

## Upgrade via CLI
## I-upgrade sa pamamagitan ng CLI

You can also run upgrade via command line interface. You need to execute the following command from EspoCRM root directory:
Maari mo rin ito patakbuhin ang pag-upgrade sa pamamagitan ng command line interface. Kailangan mong isatuparan ang sumumusunod na command mula sa ugat ng direktoryong EspoCRM

```
php upgrade.php /path/to/upgrade/package.zip
```
```
php upgrade.php /path/to/upgrade/package.zip
``
