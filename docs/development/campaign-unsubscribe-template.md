# Custom template for mass email unsubscribe page

Available since the version 5.6.4.

1. Create a file `custom/Espo/Custom/Resources/metadata/clientDefs/Campaign.json`

```json
{
    "unsubscribeTemplate": "custom:campaign/unsubscribe"
}
```

2. Create a file `client/custom/res/templates/campaign/unsubscribe.tpl`

```html
<div class="container content">
    <div class="col-md-6 col-md-offset-2 col-sm-8 col-sm-offset-2">
        <div class="panel panel-default">
            <div class="panel-body">
                <p>
                    Custom text
                </p>
                <p>
                    {{translate 'unsubscribed' category='messages' scope='Campaign'}}
                </p>
                <p>
                    <a
                       class="btn btn-default btn-sm"
                       href="?entryPoint=subscribeAgain&id={{actionData.queueItemId}}"
                   >{{translate 'Subscribe again' scope='Campaign'}}</a>
                </p>
            </div>
        </div>
    </div>
</div>

```

Original content can be copied from the file `client/modules/crm/res/templates/campaign/unsubscribe.tpl`.

The same logic is available for Subsrive Again template. Use `subscribeTemplate` parameter to define a custom template.
