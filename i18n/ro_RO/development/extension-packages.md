# Pachete de Extensie

Extensiile permit adăugarea extra funcționalitățiilor în EspoCRM. Pot fi instalate din panoul de Administrare sub secțiunea `Customization`.

## Cum se crează pachetele de extensie

Structura unui fișier din pachet:

* `/manifest.json` – un fișier care conține proprietăți de extensie;
* `/files` – un director care conține fișierele de extensie;
* `/scripts` – conține spripturile de extensie.

### Manifest
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

* Sintaxa din `version` și `acceptableVersions` este descrisă de specificațile v2.0.0 găsite la http://semver.org.
* `delete` - este lista fișierelor de bază care trebuie șterse. Folosirea acestui parametru nu este recomandată. Îl puteți omite.

### Fișiere

Toate extensile fișierelor ar trebui puse în directorul `files`. Acestea o să fie copiate în directorul de bază EspoCRM.

### Scripturi

Pentru diferite scopuri EspoCRM acceptă următoarele tipuri de scripturi. Toate ar trebui să fie puse în directorul `scripts`.

* `BeforeInstall.php` – un script executat înainte de procesul de instalare;
* `AfterInstall.php` – executat odată ce procesul de instalare s-a terminat;
* `BeforeUninstall.php` – executat înainte de procesul de dezinstalare;
* `AfterUninstall.php` – executat odată ce procesul de dezinstalare s-a terminat.

Exemplu:

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

### Pachet

La sfârșit, trebuie să arhivăm toate fișierele într-un arhivă .zip.
