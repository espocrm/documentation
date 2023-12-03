# Autoload

Sometimes when developing a module for Espo, you need to include 3rd party libraries via composer. 
As Espo extensions are not installed via composer and even don't require CLI access to be installed, we needed a mechanism to let Espo know about additional libraries.

You need to create an *autoload* configuration file `custom/Espo/Modules/{Module}/Resources/autoload.json`:

Example:

```json
{
    "psr-4": {
        "SomeLib\\": "custom/Espo/Modules/MyModule/vendor/some-lib/src"
    },
    "psr-0": {},
    "autoloadFileList": [
        "custom/Espo/Modules/MyModule/vendor/some-lib/src/functions.php"
    ],
    "classmap": {
        "SomeClass": "custom/Espo/Modules/MyModule/vendor/some-lib/src/SomeClass.php"
    }
}
```


This assumes that you installed composer dependencies in your extension's repository. When using an [ext-template](https://github.com/espocrm/ext-template), it will be the directory `src/files/custom/Espo/Modules/MyModule`.
