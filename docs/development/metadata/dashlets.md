# dashlets

Path: metadata > dashlets > {DashletName}.

Defines a dashlet.

## view

*string*

A front-end view for a dashlet.

## aclScope

*string*

A scope access to which is required to have access to the dashlet.

## accessDataList

*module:utils~AccessDefs[]*

Access data list defining access to the dashlet for a user in the frontend (additionally to *aclScope*).

```
/**
 * @typedef {Object} module:utils~AccessDefs
 *
 * @property {'create'|'read'|'edit'|'stream'|'delete'|null} action An ACL action to check.
 * @property {string|null} [scope] A scope to check.
 * @property {string[]} [portalIdList] A portal ID list. To check whether a user in one of portals.
 * @property {string[]} [teamIdList] A team ID list. To check whether a user in one of teams.
 * @property {boolean} [isPortalOnly=false] Allow for portal users only.
 * @property {boolean} [inPortalDisabled=false] Disable for portal users.
 * @property {boolean} [isAdminOnly=false] Allow for admin users only.
 */
```

Example:

```json
{
    "accessDataList": [
        {
            "inPortalDisabled": true
        }
    ]
}
```

## options

*Object*

Dashlet options definitions.

### view

An options view. Can be omitted.

### fields

*Object*

Definitions of dashlet options fields. The format is the same as in entityDefs > {EntityType} > fields.

### defaults

*Object*

Default options values.

### layout

An options layout.

Example:

```json
{
    "options": {
        "layout": [
            {
                "rows": [
                    [
                        {"name": "title"},
                        false
                    ]
                ]
            }
        ]
    }
}
```
