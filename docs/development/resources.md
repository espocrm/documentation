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

### app

`{PATH}/Resources/metadata/app/`

There are could be such `.json` files:
- `acl`
- `aclPortal`
- `adminPanel`
- `model`,
- `currency`
- `defaultDashboardLayouts`
- `defaultDashboardOptions`
- `deprecatedControllerActions`
- `emailNotifications`
- `entityTemplateList`
- `export`
- `fileStorage`
- `formula`
- `jsLibs`


### clientDefs

`{PATH}/metadata/clientDefs/{EntityName}.json`

Contains data, related with view only. More Information is here
clientDefs.md

### dashlets

Dashlet definition.

`{PATH}/metadata/dashlets/{DashletName}.json`

[How to create a dashlet](how-to-create-a-dashlet.md)


### entityDefs

Contains data, related to entity definition like fields definition, links definition (relationships), indexes, collection. In general data related with database.


### fields

Field types definition.

fields.md link


### integrations

Integration definition. Options:

- `fields` - definition of the fields, which are available on Integration configuration view;

- `params` - parameters of integrations, like `endpoint` and `scope`;

- `clientClassName` - class name of Client of External Account, by default is ;

- `authMethod` - the method of authorization; in Client Manager has to be defined a method `create` + this value;

- `view` - a view of the Integration configuration;

- `allowUserAccounts` - could users configure own External Account of this integration,

- `userView` - if `"allowUserAccounts": true"`, here you need to set a view of this configuring page.

 You can also define own options, you will use in your integration.


`{PATH}/metadata/integrations/{IntegartionName}.json`


### scopes

Scope definition. scopes.md link


### themes

Theme definition.

`{PATH}/metadata/themes/{ThemeName}.json`

#### Example

```
{
    "stylesheet": "client/css/espo/espo-vertical.css",
    "stylesheetIframe": "client/css/espo/espo-vertical-iframe.css",
    "navbarIsVertical": true,
    "navbarStaticItemsHeight": 65,
    "recordTopButtonsStickTop": 61,
    "recordTopButtonsBlockHeight": 21,
    "dashboardCellHeight": 155,
    "dashboardCellMargin": 19,
    "modalFooterAtTheTop": true,
    "modalFullHeight": true,
    "fontSize": 14,
    "textColor": "#333",
    "chartGridColor": "#ddd",
    "chartTickColor": "#e8eced",
    "chartSuccessColor": "#87C956",
    "chartColorList": ["#6FA8D6", "#4E6CAD", "#EDC555", "#ED8F42", "#DE6666", "#7CC4A4", "#8A7CC2", "#D4729B"],
    "chartColorAlternativeList": ["#6FA8D6", "#EDC555", "#ED8F42", "#7CC4A4", "#D4729B"]
}
```
>Used `application/Espo/Resources/metadata/themes/EspoVertical.json`


## templates

Here contains templates, are using for emailing.

`{PATH}/templates/{templateGroup}/{language_code}/{templateName}.tpl`


## routes

`{PATH}/routes.json`
