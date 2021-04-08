# Example: Dynamic handler for multi-enum fields

See [the dynamic handler documentation](../dynamic-handler.md).

In this example we have two multi-enum fields *continents* and *countries*. We will make that depending on selected continents we will have different counties
available as options.

1\. Create (or open if exists) a file `custom/Espo/Custom/Resources/metadata/clientDefs/YourEntityType.json` (`YourEntityType` is the name of your entity type):

```json
{
    "dynamicHandler": "custom:my-dynamic-handler"
}
```

2\. Create a file `client/custom/src/my-dynamic-handler.js`:

```js
define('custom:my-dynamic-handler', ['dynamic-handler'], function (Dep) {

    return Dep.extend({

        init: function () {
            this.controlFields();

            this.recordView.listenTo(
                this.model,
                'change:continents',
                this.controlFields.bind(this),
            );
        },

        controlFields: function () {
            var selectedContinentList = this.recordView.model.get('continents') || [];

            var continentList = ['Africa', 'Asia'];

            var countryMap = {
                'Africa': ['Nigeria', 'Ethiopia'],
                'Asia': ['India', 'Pakistan'],
            };

            var countryList = [];

            for (let continent of selectedContinentList) {
                countryList = countryList.concat(
                    countryMap[continent] || []
                );
            }

            this.recordView.setFieldOptionList('countries', countryList);
        },
    });
});
```

3\. Clear cache at Administration > Clear Cache.

4\. You need to refresh a page in your browser.
