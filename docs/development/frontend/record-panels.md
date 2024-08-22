# Custom panel on record (detail & edit) view

An example for *Account* entity type.

Create a file `custom/Espo/Custom/Resources/metadata/clientDefs/Account.json`:

```json
{
    "sidePanels": {
        "detail": [
            "__APPEND__",
            {
                "name": "myTestPanel",
                "label": "My Test Panel",
                "view": "custom:views/account/panels/my-test-panel",
                "aclScope": "Account",
                "acl": "edit"
            }
        ]
    }
}
```

We have defined a side panel for *detail* view. The following views are available:

* detail
* edit
* detailSmall
* editSmall

You can also define a bottom panel. Use *bottomPanels* key instead.


The values of parameters *aclScope* and *acl* mean, that the panel will be visible only if the user has *edit* access to *Account* entity type. You can omit both parameters.

Create a file `client/custom/src/views/account/panels/my-test-panel.js`:

```js
define(['views/record/panels/side'], (SidePanelView) => {

    return class extends SidePanelView {

        templateContent = '<div>{{viewObject.someKey}}</div>'

        setup() {
            this.someKey = 'Hello';
        }
    }
});

```

Note, that if you define a bottom panel, you need to extend from `views/record/panels/bottom`.

See more [information](../view.md) about views.

