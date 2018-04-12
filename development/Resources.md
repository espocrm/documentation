# Resources

```
PATH is one of 
  1) CUSTOM_PATH - custom/Espo/Custom;
  2) MODULE_PATH - application/Espo/Modules/{ModuleName};
  3) BASE_PATH - application/Espo

```
In Resources folder you can find such items:
## i18n 
{language_name} - [language code](https://en.wikipedia.org/wiki/ISO_639-1)_[country code](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)

`{PATH}/Resources/i18n/{language_name}/{EntityName}.json`
 
## layouts

`{PATH}/Resources/layouts/{EntityName}/{layoutName}.json`

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
`{PATH}/Resources/metadata/clientDefs/{EntityName}.json`
Contains data, related with view only. More Information is here

    
### dashlet
### entityDefs - contains data, related to entity definition like fields definition, links definition (relationships), indexes, collection. In general data related with database
### fields
### integrations
### scopes
contains scope definition
`{PATH}/Resources/metadata/scopes/{EntityName}.json`
- `entity` (true|false),
- `layouts` (true|false) - has layouts,
- `tab` (true|false) - could be dispalayed,
- `acl` (true|false),
- `customizable` (true|false)

### themes
### templates
    
## routes 
`{PATH}/Resources/routes.json`
