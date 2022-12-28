# integrations

Path: metadata > integrations > {IntegrationName}.

Integration definitinos.

## fields

*Object.<string, Object>*

Field definitions for the integration (to be available at Administration > Integrations).

Example:

```json
{
    "fields": {
        "clientId": {
            "type": "varchar",
            "maxLength": 255,
            "required": true
        },
        "clientSecret": {
            "type": "varchar",
            "maxLength": 255,
            "required": true
        },
        "tenant": {
            "type": "enum",
            "options": ["common", "organizations", "consumers"],
            "tooltip": "myIntegrationTenant"
        }
    },
}
```

## allowUserAccounts

*boolean*

Whether the integration supposes that users have their own accounts (at User > External Accounts).

## userAccountAclScope

*?string*

A scope name, a user should have access to to be able to use the integration.

## view

*string*

A front-end view for the integration page (at Administration > Integrations).

## userView

*string*

A front-end view for the external account page (at User > External Accounts).

## params

*Object*

Define any params needed for the integration.

## externalAccountSecretAttributeList

*string[]*

External account attributes to be hidden from the front-end.
