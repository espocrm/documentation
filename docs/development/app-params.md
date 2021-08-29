# App Params

Since EspoCRM 5.8.0.

App params are returned by backend once a user logged in. You can use this params in frontend. For example, the list of entity types available for printing to PDF.

## Custom app params

You can make the system to return custom parameters. This params can be unique for a current user (different user have different values in params).

Create a file: `custom/Espo/Custom/Resources/metadata/app/appParams.json`

```json
{
    "myParam": {
        "className": "Espo\\Custom\\Core\\AppParams\\MyParam"
    }
}
```

Create a file `custom/Espo/Custom/Core/AppParams/MyParam.php`

```php
<?php
namespace Espo\Custom\Core\AppParams;

class MyParam extends \Espo\Core\Injectable
{
    protected function init()
    {
        // define needed dependencies
        $this->addDependency('acl');
        $this->addDependency('entityManager');
    }
    
    public function get()
    {
        $acl = $this->getInjection('acl');
        $em = $this->getInjection('entityManager');
        
        $value = null;
        
        // here some logic

        return $value;
    }
```

Clear cache.

In frontend in *view* you can access your parameter the following way:

```js
    this.getHelper().getAppParam('myParam');

```
