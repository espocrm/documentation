# Mga Pakete ng Ekstensiyon

Ang mga ekstensiyon ay nagbibigay ng karagdagang kakayahan para sa EspoCRM. Maaari itong ma-install sa pamamagitan ng Administration panel sa ilalim ng seksyon ng `Customization`.

## Kung Paano Gumawa ng Isang Pakete ng Ektensiyon

Isang Istraktura ng file ng pakete:

* `/manifest.json` – isang file na naglalaman ng mga katangian ng ekstensiyon;
* `/files` – isang direktoryo na naglalaman ng mga file ng ekstensiyon;
* `/scripts` – naglalaman ng mga script ng ekstensiyon.

### Manipesto
```json
{
 "name": "Extension Name",
 "version": "1.0.0",
 "acceptableVersions": [
   ">=3.7.2"
 ],
 "releaseDate": "2015-10-15",
 "author": "Your Name",
 "description": "Description of your extension",
 "delete": []
}
```

* Syntax ng `version` at `acceptableVersions` ay inilalarawan ng v2.0.0 espesipikasyon na makikita sa http://semver.org.
* `delete` - ay ang listahan ng mga core file na kailangang tanggalin. Ang parameter na ito ay hindi inirerekomendang gamitin. Maaari mo itong laktawan.

### Mga File

Ang lahat ng file ng ekstensiyon ay dapat ilagay sa direktoryo ng mga `files`. Sila ay makokopya sa EspoCRM core na direktoryo.

### Mga Script

Para sa iba't ibang mga layunin, ang EspoCRM ay sumusuporta sa mga sumusunod na uri ng mga script. Ang lahat ng mga ito ay dapat ilagay sa direktoryo ng mga `scripts`.

* `BeforeInstall.php` – isang script na dapat isinasagawa bago pa ang proseso ng pag-install;
* `AfterInstall.php` – isinasagawa kapag ang proseso ng pag-install ay natapos na;
* `BeforeUninstall.php` – isinasagawa bago pa ang proseso ng pag-uninstall;
* `AfterUninstall.php` – isinasagawa kapag ang proseso ng pag-uninstall ay natapos na.

Halimbawa:

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

### Packete

Sa dulo, kailangan nating i-pack ang lahat ng mga file na ito sa archive na .zip.
