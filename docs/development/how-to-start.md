# How to get started

*(for developers)*

* [Option A. Using git repository](#option-a-using-git-repository)
* [Option B. Extension development](#option-b-extension-development)
* [Configuration for development](#configuration-for-development)
* [Where to put customizations](#where-to-put-customizations)

## Option A. Using git repository

Using the main EspoCRM repository.

1. Clone [https://github.com/espocrm/espocrm](https://github.com/espocrm/espocrm) repository to your local computer.
2. Change to the project's root directory: `cd path/to/espocrm`.
3. Install [Composer](https://getcomposer.org/doc/00-intro.md) (v2.0 or greater).
4. Install npm (v8.0 or greater).
5. Install [Grunt](https://gruntjs.com/installing-grunt).
6. Run `composer install` if Composer is installed globally (or, `php composer.phar install`, if locally).
7. Run `npm ci`.

Then you can build by running `grunt`.

To build a proper *config.php* file and populate database you can run installation. Open `http(s)://{YOUR_CRM_URL}/install` location in the browser. It's assumed that your webserver is properly [configured](../administration/server-configuration.md).

!!! note

    Some dependencies require php extensions that you might not have installed. You can skip these requirements by installing with a flag *--ignore-platform-reqs*: `composer install --ignore-platform-reqs`.

You also need to enable [developer mode](#configuration-for-development).

After building you will be able to run the instance in your browser right from the project root directory, considering that your web server is properly configured.

### Building

1. Change to the project's root directory.
2. Run Grunt with `grunt`.

The build will be created in the `build` directory.

!!! note

    By default, grunt installs composer dependencies. You can skip it by running `grunt offline`.


#### Javascript transpiling

Building with *grunt* includes the transpiling step. Though you can run it manually with the following commands.

Transpile all:

```
node js/transpile
```

Transpile a specific file (can be useful for a file watcher in the IDE):

```
node js/transpile -f $FilePathRelativeToProjectRoot$
```

### Branches

* *fix* – upcoming maintenance release; fixes should be pushed to this branch;
* *master* – develop branch; new features should be pushed to this branch;
* *stable* – last stable release.

### Upgrade packages

Preparation:

1. Fetch tags to your git repository from the remote: `git fetch --tags`.
2. Checkout to a needed version tag (or don't if you want to test upgrade to the most recent commit).
3. Build EspoCRM with grunt (see above how to build).

Build the upgrade package with the command:

```
node diff {version_from}
```

The package will be created in the `build` directory.

## Option B. Extension development

By utilizing [ext-template](https://github.com/espocrm/ext-template) repository, you can develop an installable extension for EspoCRM. Your repository will contain only your custom files. Template tools allows you to run your extension in Espo instance for testing.

You can [install](autoload.md) additional composer libraries in your extension.

## Configuration for development

EspoCRM instance configuration for development. Config parameters should be set in `data/config.php`.

A developer mode, disables cache.

```php
'isDeveloperMode' => true,
```

!!! note

    The developr mode won't work on a release instance. It requires the *frontend* folder from the repository and *client/lib/transpiled* which should contain all JS files separately and transpiled.

You can force using some additional cache in the developer mode. Can be reasonable as the application can run very slow w/o cache.

```php
'useCacheInDeveloperMode' => true,
```


## Where to put customizations

### Option A. Custom dirs

* `custom/Espo/Custom/` – for metadata and all files pertaining to backend
* `client/custom/` – for client files

### Option B. Module dirs

* `custom/Espo/Modules/{YourModuleName}/` – for metadata and all files pertaining to backend
* `client/custom/modules/{your-module-name}/` – for client files

