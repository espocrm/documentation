# Making extension package

Extensions allow you to add extra functionality to EspoCRM. They can be installed at Administrator panel.

The file structure of the package:

* `manifest.json` – a file that contains extension properties;
* `files/` – a directory that contains extension files;
* `scripts/` – a directory that contains extension scripts.

### Manifest

```json
{
  "name": "Extension Name",
  "version": "1.0.0",
  "acceptableVersions": [
     ">=7.0.0"
  ],
  "php": [
     ">=8.1"
  ],
  "releaseDate": "2019-10-22",
  "author": "Your name",
  "description": "Description of your extension"
}
```

Syntax of `version` and `acceptableVersions` is described by the v2.0.0 specification found at http://semver.org.

### Files

All extension files should be placed in `files` directory. They will be copied to EspoCRM core directory.

### Scripts

For different purposes EspoCRM supports the following types of scripts. All of them should be  placed in `scripts` directory.

* `BeforeInstall.php` – a script executed before an installation process
* `AfterInstall.php` – executed once the installation process is finished
* `BeforeUninstall.php` – executed before uninstallation process
* `AfterUninstall.php` – executed once the uninstallation process is finished

Example:

```php
<?php
use Espo\Core\Container;

class AfterInstall
{
    public function run(Container $container)
    {
        /** @var \Espo\Core\Utils\Config */
        $config = $container->get('config');
 
        $tabList = $config->get('tabList');
       
        if (!in_array('MyCustomEntity', $tabList)) {
            $tabList[] = 'MyCustomEntity';
           
            $config->set('tabList', $tabList);
        }
  
        $config->save();
    }
}
```

### Package

At the end, we need to pack all these files into a .zip archive.

## Template repository

You can use [this template repository](https://github.com/espocrm/ext-template) to create a git repository for your extension.
