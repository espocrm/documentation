# How to get started

## Option A. Using git repository

1. Clone [https://github.com/espocrm/espocrm](https://github.com/espocrm/espocrm) repository to your local computer.
2. Change to the project's root directory: `cd path/to/espocrm`.
3. Install [composer](https://getcomposer.org/doc/00-intro.md).
4. Run `composer install` if composer is installed globally or `php composer.phar install` if locally.

Note: Some dependencies require php extensions that you might don't have installed (e.g. zmq, ldap) and don't need to use. You can skip these requirements by installing with a flag *--ignore-platform-reqs*: `composer install --ignore-platform-reqs`.

To compose a proper *config.php* and populate database you can run install by opening `http(s)://{YOUR_CRM_URL}/install` location in a browser.

Then open `data/config.php` file and add:

```php
'isDeveloperMode' => true,
```

Branches:

* *hotfix/** – upcoming maintenance release; fixes should be pushed to this branch;
* *master* – develop branch; new features should be pushed to this branch;
* *stable* – last stable release.

### Building

You need to have nodejs and Grunt CLI installed.

1. Change to the project's root directory.
2. Install project dependencies with `npm install`.
3. Run Grunt with `grunt`.

The build will be created in the `build` directory.

Note: By default grunt installs composer dependencies. You can skip it by running `grunt offline`.

Upgrade packages can be built with `grunt upgrade`. Note: You need to fetch tags to your git repository.

## Option B. Using installed instance

You can develop and make customizitions right on a regular installed EspoCRM instance.

## Configuration for development

Edit the config file `data/config.php`, add the parameter:

```php
'isDeveloperMode' => true,
```

You can also add the parameter:

```php
'useCacheInDeveloperMode' => true,
```
That will force using a backend cache (metadata, langauge etc.).

## Where to put customizations

### Option A. Custom dirs

* `custom/Espo/Custom/` – for metadata and all files pertaining to backend
* `client/custom/` – for client files

### Option B. Module dirs

* `application/Espo/Modules/{YourModuleName}/` – for metadata and all files pertaining to backend
* `client/modules/{your_module_name}/` – for client files
