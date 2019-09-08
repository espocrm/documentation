# How to get started

## Option A. Using git repository

1. Clone [https://github.com/espocrm/espocrm](https://github.com/espocrm/espocrm) repository to your local computer.
2. Change to the project's root directory: `cd path/to/espocrm`.
3. Install [composer](https://getcomposer.org/doc/00-intro.md).
4. Run `composer install` if composer is installed globally or `php composer.phar install` if locally.

Use branch *stable* to get the latest stable version.

## Option B. Using installed instance

You can develop and make customizitions right on a regular installed EspoCRM instance.

## Configuration for development

Edit the config file `data/config.php`, add the parameter:

```php
'isDeveloperMode' => true,
```

You can also add the parameter:

```php
'useCacheInDeveloperMode' => true`,
```
That will force using a backend cache (metadata, langauge etc.).

## Where to put customizations

### Option A. Custom dirs

* `custom/Espo/Custom/` – for metadata and all files pertaining to backend
* `client/custom/` – for client files

### Option B. Module dirs

* `application/Espo/Modules/{YourModuleName}/` – for metadata and all files pertaining to backend
* `client/modules/{your_module_name}/` – for client files
