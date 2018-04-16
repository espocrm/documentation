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

Layouts of enities.

`{PATH}/layouts/{EntityName}/{layoutName}.json`


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
    
### dashlet


### entityDefs - contains data, related to entity definition like fields definition, links definition (relationships), indexes, collection. In general data related with database


### fields
fields.md link


### integrations


### scopes
scopes.md link

### themes


### templates
    

## routes 
`{PATH}/Resources/routes.json`
