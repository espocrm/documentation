# Custom calculations for Quote totals

Note: The same mechanism is also available for Sales Orders and Invoices.

## Problem

You have added custom fields to quote items or/and quote entity types. You want Total Amount field and other totals to be calculated considering new custom fields.

## Resolution

### Server-side calculation

You need to create a custom Hook for the Quote entity type.

Create a new file:

`custom/Espo/Custom/Hooks/Quote/CalculateItems.php`

```php
namespace Espo\Custom\Hooks\Quote;

use Espo\ORM\Entity;

class CalculateItems
{    
    public static int $order = 10;

    public function __construct(
        // Define needed dependencies.
    ) {}

    public function beforeSave(Entity $entity, array $options): void
    {
        if (!$entity->has('itemList')) {
             $entity->loadItemListField();
        }

        $itemList = $entity->get('itemList');

        $amount = 0.0;
        foreach ($itemList as $item) {
            $amount +=  $item->quantity * $item->unitPrice * $item->factor;
        }
        $entity->set('amount', $amount);
    }
}​
```

Note: For other entity types, e.g. SalesOrder, do the same but use *SalesOrder* namespace and file location instead of *Quote*.

### Client-side calculation

In Quote's clientDefs you need to specify custom calculation handler:

File: `custom/Espo/Custom/Resources/metadata/clientDefs/Quote.json`

```json
{
    "calculationHandler": "custom:quote-calculation-handler"
}
```

Note: For Sales Orders use `SalesOrder.json` file names.  For Invoices use `Invoice.json` file names.

Create a new file:

`client/custom/src/quote-calculation-handler.js`

```js
define(['sales:quote-calculation-handler'], (Dep) => {

    return class extends Dep {
	
        // Define custom calculations here.
        // Use client/modules/sales/quote-calculation-handler.js as an example.
    }
});
```

It's also possible to make certain product fields copied to a quote item on product selection. The logic is determined in selectProduct method.

