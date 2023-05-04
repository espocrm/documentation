# Autoload

Sometimes when developing a module for Espo, you need to include 3rd party libraries via composer. 
To let Espo know about these libraries, you need to define an *autoload* configuration file `custom/Espo/Modules/{Module}/Resources/autoload.json`.

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
