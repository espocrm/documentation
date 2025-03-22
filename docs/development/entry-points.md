# Entry Points

Entry points offer distinct access routes to the application, each serving different functions apart from the REST API.

Entry points are accessed by the following URL: `https://your-site-url?entryPoint={entryPointName}`. Note than *entryPointName* must start with a lower case letter.

Usage examples:

* file downloading;
* rendering a web form that does not require authentication.

Entry point classes are located in `Espo\Module\{ModuleName}\EntryPoint` namespace.

## Creating entry point

Assuming that our module is named *ModuleName*.

Create a file `custom/Espo/Custom/Modules/ModuleName/EntryPoints/MyEntryPoint.php`:

```php
<?php
namespace Espo\Modules\ModuleName\EntryPoints;

use Espo\Core\Api\Request;
use Espo\Core\Api\Response;
use Espo\Core\EntryPoint\EntryPoint;
use Espo\Core\EntryPoint\Traits\NoAuth;

class MyEntryPoint implements EntryPoint
{
    // Allows access without authentication.
    use NoAuth;

    public function __construct(
        // Pass needed dependencies.
    ) {}

    public function run(Request $request, Response $response): void
    {
        // Entry point logic.
    }
}
```

Then, clear cache.

The entry point will run on calling `https://your-site-url?entryPoint=myEntryPoint`.

## Frontend rendering

It's possible to render the frontend and call a specific controller action from an entry point.

```php
<?php
namespace Espo\Modules\ModuleName\EntryPoints;

use Espo\Core\Api\Request;
use Espo\Core\Api\Response;
use Espo\Core\EntryPoint\EntryPoint;
use Espo\Core\EntryPoint\Traits\NoAuth;
use Espo\Core\Utils\Client\ActionRenderer;

class MyEntryPoint implements EntryPoint
{
    use NoAuth;

    public function __construct(
        private ActionRenderer $actionRenderer,
    ) {}

    public function run(Request $request, Response $response): void
    {
        $params = ActionRenderer\Params
            ::create('modules/my-module/controllers/my-controller', 'myAction')
            ->withData(['key' => 'value']);

        $this->actionRenderer->write($response, $params);
    }
}
```
