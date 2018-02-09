# Extension Packages

Extensions allow you to add extra functionality to EspoCRM. They can be installed by Administrator panel under `Customization` section.

## How to create extension package

A File structure of package:

* `/manifest.json` – a file that contains extension properties;
* `/files` – a directory that contains the extension files;
* `/scripts` – contains the extension scripts.

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

* Syntax of `version` and `acceptableVersions` is described by the v2.0.0 specification found at http://semver.org.
* `delete` - is the list of core files that need to be deleted. This parameter is not recommended to use. You can omit it.

### Files

All extension files should be placed in `files` directory. They will be copied to EspoCRM core directory.

### Scripts

For different purposes EspoCRM supports the following types of scripts. All of them should be  placed in `scripts` directory.

* `BeforeInstall.php` – a script executed before an installation process;
* `AfterInstall.php` – executed once the installation process is finished;
* `BeforeUninstall.php` – executed before uninstallation process;
* `AfterUninstall.php` – executed once the uninstallation process is finished.

Example:

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

### Package

At the end, we need to pack all these files into a .zip archive.
