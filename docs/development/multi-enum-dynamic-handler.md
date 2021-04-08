# Multi-enum field Dynamic Handler

[Official Documentation](https://docs.espocrm.com/development/dynamic-handler/)

1. Create or open a file `/custom/Espo/Custom/Resources/metadata/clientDefs/Your-entity.json` and add this link:
```
{
	"dynamicHandler": "custom:my-dynamic-handler"
}
```

2. Create a file `/client/custom/src/my-dynamic-handler.js` with this logic:
```
define('custom:my-dynamic-handler', ['dynamic-handler'], function (Dep) {

    return Dep.extend({

        init: function () {
            this.controlFields();

            this.recordView.listenTo(
                this.model, 'change:continent', this.controlFields.bind(this),
            );
        },

        controlFields: function () {
            var continent = this.recordView.model.get('continent');

            if (continent.includes('Africa') && continent.includes('Asia') && continent.includes('Oceania')) {
                this.recordView.setFieldOptionList('tradeLane', [
                    'India',
                    'Pakistan',
                    'Nigeria',
                    'Ethiopia',
                    'Australia',
                    'Papua New Guinea'
                ]);
            } else if (continent.includes('Africa') && continent.includes('Asia')) {
                this.recordView.setFieldOptionList('tradeLane', [
                    'India',
                    'Pakistan',
                    'Nigeria',
                    'Ethiopia'
                ]);
            } else if (continent.includes('Africa') && continent.includes('Oceania')) {
                this.recordView.setFieldOptionList('tradeLane', [
                    'Nigeria',
                    'Ethiopia',
                    'Australia',
                    'Papua New Guinea'
                ]);
            } else if (continent.includes('Asia') && continent.includes('Oceania')) {
                this.recordView.setFieldOptionList('tradeLane', [
                    'India',
                    'Pakistan',
                    'Australia',
                    'Papua New Guinea'
                ]);
            } else if (continent.includes('Africa')) {
                this.recordView.setFieldOptionList('tradeLane', [
                    'Nigeria',
                    'Ethiopia'
                ]);
            } else if (continent.includes('Asia')) {
                this.recordView.setFieldOptionList('tradeLane', [
                    'India',
                    'Pakistan'
                ]);
            } else if (continent.includes('Oceania')) {
                this.recordView.setFieldOptionList('tradeLane', [
                    'Australia',
                    'Papua New Guinea'
                ]);
            }
        }
    });
});
```

3. Administration > Clear Cache.
4. Refresh a web page.