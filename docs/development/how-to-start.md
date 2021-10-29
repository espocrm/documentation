# How to get started

## Option A. Using git repository

1. Clone [https://github.com/espocrm/espocrm](https://github.com/espocrm/espocrm) repository to your local computer.
2. Change to the project's root directory: `cd path/to/espocrm`.
3. Install [Composer](https://getcomposer.org/doc/00-intro.md) (v2.0 or greater).
4. Install npm.
5. Install [Grunt](https://gruntjs.com/installing-grunt).
6. Run `composer install` if Composer is installed globally (or `php composer.phar install` if locally).
7. Run `npm install`.

Then you can build by running `grunt`.

To build a proper *config.php* file and populate database you can run installation. Open `http(s)://{YOUR_CRM_URL}/install` location in the browser. It's assumed that your webserver is properly [configured](../administration/server-configuration.md).

Then open `data/config.php` file and add:

```php
'isDeveloperMode' => true,
```

Note: Some dependencies require php extensions that you might don't have installed. You can skip these requirements by installing with a flag *--ignore-platform-reqs*: `composer install --ignore-platform-reqs`.

### Building

1. Change to the project's root directory.
2. Run Grunt with `grunt`.

The build will be created in the `build` directory.

Note: By default grunt installs composer dependencies. You can skip it by running `grunt offline`.

### Branches

* *hotfix/** – upcoming maintenance release; fixes should be pushed to this branch;
* *master* – develop branch; new features should be pushed to this branch;
* *stable* – last stable release.

### Upgrade packages

Preperation:

1. Fetch tags to your git repository from the remote: `git fetch --tags`.
2. Checkout to a needed version tag (or don't if you want to test upgrade to the most recent commit).
3. Build EspoCRM with grunt (see above how to build).

Build the upgrade package with the command:

```
node diff {version_from}
```

The package will be created in the `build` directory.

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

### Option C. Module dirs in custom

As of v7.0.

* `custom/Espo/Modules/{YourModuleName}/` – for metadata and all files pertaining to backend
* `client/custom/modules/{your_module_name}/` – for client files
