# Custom API action

Example for Account scope.


Create a file (or modify if it already exists) `custom/Espo/Custom/Controllers/Account.php`.

```php
<?php

namespace Espo\Custom\Controllers;

class Account extends \Espo\Modules\Crm\Controllers\Account
{
    /**
     *  POST api/v1/Account/action/test
     */
    public function postActionTest($params, $data, $request, $response)
    {
        // $data - payload

        $response->setStatus(201); // this is optional, example how to set custom response status code
        
        // $someData = $this->getContainer()->get('serviceFactory')->create('MyService')
        //    ->doSomething($data);

        return $someData; // can be true, false, array or object.
    }

    /**
     *  GET api/v1/Account/action/test
     */
    public function getActionTest($params, $data, $request)
    {
        $myUriParam = $request->get('myUriParam');

        return $someData; // can be true, false, array or object.
    }
}
```

### Custom Controller

#### In Custom folder

Create a file  `custom/Espo/Custom/Controllers/MyController.php`.

```php
<?php

namespace Espo\Custom\Controllers;

class MyController extends \Espo\Core\Controllers\Base
{

}
```

Clear Cache.

#### In Module folder

Create a file `custom/Espo/Modules/MyModule/Resources/metadata/scopes/MyController.json`.

```json
{
    "module": "MyModule"
}
```

Create a file `custom/Espo/Modules/MyModule/Controllers/MyController.php`.

```php
<?php

namespace Espo\Modules\MyModule\Controllers;

class MyController extends \Espo\Core\Controllers\Base
{

}
```

Clear Cache.
