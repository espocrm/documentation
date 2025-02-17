# Run by code

In addition to the CLI, the commands can be executed by a code.

## Import

The `ExportImport` service can be injected as a constructor parameter.

```php
namespace Espo\Custom\Tools;

use Espo\Modules\ExportImport\Tools\ExportImport;

class MyImportTest
{
    public function __construct(private ExportImport $exportImportTool)
    {}

    public function runImport()
    {
        $this->exportImportTool->runImport([
            'path' => 'custom/Espo/Custom/MyData',
            'skipInternalConfig' => true,
            'userPassword' => 1,
            'userActiveList' => [
                'admin'
            ],
            'updateCurrency' => true,
            'updateCreatedAt' => true,
            'entityHardList' => [
                'ScheduledJob'
            ],
        ]);
    }
}
```

## Export

To export data, you can use the `runExport` method of the `ExportImport` service.

```php
namespace Espo\Custom\Tools;

use Espo\Modules\ExportImport\Tools\ExportImport;

class MyExportTest
{
    public function __construct(private ExportImport $exportImportTool)
    {}

    public function runExport()
    {
        $this->exportImportTool->runExport([
            'path' => 'custom/Espo/Custom/MyData',
            'entityList' => ['Account', 'Contact'],
            'skipConfig' => true,
            'skipCustomization' => true,
            'skipRelatedEntities' => true,
        ]);
    }
}
```
