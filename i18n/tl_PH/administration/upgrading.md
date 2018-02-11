# Paano mag-upgrade ng EspoCRM

Ang EspoCRM ay maaaring ma-upgrade sa pinakabagong bersyon sa pamamagitan ng sumusunod na hakbang:

### Unang Hakbang. I-check ang kasalukuyang bersyon

Upang i-check ang iyong kasalukuyang bersyon, pumunta sa Administration > Upgrade na page.

### Pangalawang Hakbang. I-download ang mga kinakailangang upgrade package

Pumunta sa upgrade page https://www.espocrm.com/download/upgrades/ at base sa iyong kasalukuyang bersyon, i-download ang kinakailangang mga package. 

### Pangatlong Hakbang. Lumikha ng backup (optional)

Lumikha ng backup ng iyong mga EspoCRM file at data bago mag-upgrade. Sundin [ang mga instruksiyon na ito](https://github.com/espocrm/documentation/blob/master/administration/backup-and-restore.md) upang magawa ito.

### Pang-apat na Hakbang. I-upgrade ang proseso

Pumunta sa Administration > Upgrade. I-upload at i-install isa-isa ang mga upgrade package.

Pwede mong i-check kung mayroon kang pinakabagong bersyon sa Menu > About.

## Pag-upgrade sa Pamamagitan ng CLI

Pwede ka rin mag-upgrade sa pamamagitan ng command line interface. Kailangan mong isagawa ang mga sumusunod na command mula sa ESpoCRM root directory: 

```
php upgrade.php /path/to/upgrade/package.zip
```
