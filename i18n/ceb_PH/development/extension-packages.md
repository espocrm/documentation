# Mga Ekstensyon nga Pakete

Ang mga ekstenyon motugot kanimo pagdungag ug dugang nga katuyoan ngadto sa EspoCRM. Mahimo kini i-instolar gumikan sa Administrator panel ubos sa seksyon sa `Kustomisasyon`.

## Unsaon Paghimo ug Ekstensyon nga Pakete

Usa ka istruktura sa pakete:

* `/manifest.json` – usa ka file nga naglangkob sa mga kabtangan sa ekstensyon;
* `/files` – usa ka direktoryo nga naglangkob sa ekstensyon nga mga file;
* `/scripts` – naglangkob sa mga script sa ekstensyon.

### Manipesto
```json
{
 "name": "Pangalan sa Ekstensyon",
 "version": "1.0.0",
 "acceptableVersions": [
   ">=3.7.2"
 ],
 "releaseDate": "2015-10-15",
 "author": "Imohang Pangalan",
 "description": "Deskripsyon sa Ekstensyon",
 "delete": []
}
```

* Ang syntax sa `version` ug `acceptableVersions` gihulagway sa v2.0.0 espesipikasyon nga makita sa http://semver.org.
* `delete` - ang listahan sa mga core nga mga file nga kinahanglan nga papason. Kini nga parametro wala girekomendar nga gamiton. Mahimo nimo kini sal-angan.

### Mga File

Ang tanan nga ekstensiyon nga mga file kinahanglan ibutang sa `files` nga direktory. Sila kopyahon ngadto sa EspoCRM core nga direktory.

### Mga Script

Alang sa lainlaing mga katuyoan ang EspoCRM nagsuporta sa mosunod nga mga matang sa mga script. Ang tanan niini kinahanglan ibutang sa direktoryo sa `scripts`.

* `BeforeInstall.php` – usa ka script nga gipatuman sa dili pa ang proseso sa pag-instalar;
* `AfterInstall.php` – buhaton sa dihang nahuman na ang proseso sa pag-instalar;
* `BeforeUninstall.php` – buhaton sa wala pa ang proseso sa pag-uninstall;
* `AfterUninstall.php` – buhaton sa diha nga ang proseso sa pag-instalar nahuman na.

Pananglitan:

```php
class AfterInstall
{
  public function run($conatiner)
  {
    $config = $conatiner->get('config');
 
    $tabList = $config->get('tabList');
    if (!in_array('My Custom Entity', $tabList)) {
      $tabList[] = 'My Custom Entity';
      $config->set('tabList', $tabList);
    }
 
    $config->save();
  }
}
```

### Pakete

Sa katapusan, gikinahanglan nato nga ibutang ang tanan nga mga file ngadto sa .zip archive.
