# Formula > Functions > Language

* [language\translate](#languagetranslate)
* [language\translateOption](#languagetranslateOption)

## language\translate

`language\translate(LABEL, [CATEGORY, SCOPE])`

Translates a label to the language set as default. (as of v6.0)

!!! example

    ```
    language\translate('passwordWillBeSent', 'messages', 'User')
    ```

## language\translateOption

`language\translateOption(OPTION, FIELD, [SCOPE])`

Translates an option of a specific field to the language set as default. The field can be of the following types: Enum, Multi-enum, Checklist, 
Array, Varchar. (as of v6.0)

!!! example

    ```
    language\translateOption('Customer', 'type', 'Account')
    ```
