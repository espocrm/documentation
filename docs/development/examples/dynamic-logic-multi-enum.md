# Example: Dynamic handler for multi-enum fields

See [the dynamic handler documentation](../dynamic-handler.md).

In this example we have two multi-enum fields `continents` and `countries`. We will make the logic that depending on selected continents only countries of those continents will be available for selection.

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
            let selectedContinentList = this.recordView.model.get('continents') || [];

            let continentList = ['Africa', 'Asia', 'Europe', 'America'];

            let countryMap = {
                'Africa': ['Nigeria', 'Ethiopia'],
                'Asia': ['India', 'Pakistan'],
                'Europe': ['United Kingdom', 'France'],
                'America': ['United States', 'Canada', 'Brazil'],
            };

            let countryList = [];

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
