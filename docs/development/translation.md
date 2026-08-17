# Translation

## PO file

### Generating PO file

You need to have node installed and installed project dependencies with `npm install`.

Build po file with the following command:

```
node po.js en_EN
```

(specify the needed language instead of en_EN)

The file will be created in the `build` directory.

After that you can translate the generated po file. You can use some utilities or service for PO file translating. 

### Building language files from PO file

Build json files from the translated po file:

1. Put your po file espocrm-en_EN.po into `build` directory
2. Run `node lang.js en_EN`

(use your language instead of en_EN)

Json files will be created in `build` directory grouped by folders.

You can test your translation by copying generated JSON files into your EspoCRM directory.

## Adding new language

The available language list is specified in metadata > app > language.

To add a new language create a file `custom/Espo/Custom/Resources/metadata/app/language.json`:

```json
{
    "list": [
        "__APPEND__",
        "lg_CN"
    ]
}
```

Where *lg_LG* is a IETF language tag. 'lg' is the language code specified by ISO 639, 'CN' is a country code specified by ISO 3166.

Clear cache after that (Administration > Clear Cache). The language will be available at Administration > Settings and user's preferences.

## Language files

In a module, language files (JSON files) are defined in the following directory: `custom/Espo/Modules/{ModuleName}/Resources/i18n`.

Every scope (and entity type) usually has its language file named the same as the scope. Labels related to that scope are stored in that file.

The file `Global.json` is used for globally available labels. Scope name translations are defined there.

## Accessing labels from code

In backend, use the [service](container-services.md/#language) `Espo\Core\Utils\Language`. 3 separate services are available:

- `language`
- `defaultLanguage`
- `baseLanguage`

In frontend, use the [service](frontend/dependency-injection.md#language) `language`.
