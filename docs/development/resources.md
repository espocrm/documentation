# Resources

>PATH is one of
>1. CUSTOM_PATH - custom/Espo/Custom/Resources;
>2. MODULE_PATH - application/Espo/Modules/{ModuleName}/Resources;
>3. BASE_PATH - application/Espo/Resources

In Resources folder you can find such items:

## i18n

Translation.

{language_name} - [language code in ISO 639-1](https://en.wikipedia.org/wiki/ISO_639-1)_[country code in ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)

`{PATH}/i18n/{language_name}/{EntityName}.json`


## layouts

Layouts of entities.

`{PATH}/layouts/{EntityName}/{layoutName}.json`

[Layout Manager](../administration/layout-manager.md)


## metadata

Metadata.

## templates

Here contains templates, are using for emailing.

`{PATH}/templates/{templateGroup}/{language_code}/{templateName}.tpl`


## routes

`{PATH}/routes.json`
