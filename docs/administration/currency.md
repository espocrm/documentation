# Currency

In this article:

* [Settings & rates](#settings-rates)
* [Currency conversion](#currency-conversion)
* [Currency rates API](#currency-rates-api)
* [Adding missing currency](#adding-missing-currency)
* [Conversion via formula](#conversion-via-formula)
* [Decimal data type](#decimal-data-type)

## Settings & rates

Administrator can configure currency-related parameters and rates at Administration > Currency.

You can specify which currencies will be available in the system in *Currency List* parameter.

*Default Currency* – which currency will be set by default when creating a new record. A currency to which all currency fields will be converted to when filtering, sorting, reporting.

*Base Currency* – which currency to use as a base to specify rates.

![BPM example](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/currency-settings.png)

### Default currency for specific field

It's possible to specify an exclusive default currency for a specific field.

Example for *amount* field of *Opportunity*. Set *Default* value at Administration > Entity Manager > Opportunity > fields > amountCurrency.

## Currency conversion

### Currency Converted field

All fields of *Currency* type are paired with a special read-only field of *Currency Converted* type. When you create a new Currency field, Converted field is created automatically. This field represents a value converted to *Default Currency* based on current currency rates. This field is used for sorting by currency field, filtering, comparison, reporting.

Note, that when currency rates are changed, the value of Currency Converted field is also changed. Technically the value is not stored, but calculated on-fly. This can cause an issue that your reports get changed every time currency rates are changed.

To store a converted value based on current rates you can:

1. Convert currency manually. With mass action from the list view or action on the detail view.
2. Convert currency automatically with Workflows tool. Convert Currency service action is available for Opportunities, Quotes, Sales Orders, Invoices. E.g. you can setup a workflow that will update currencies for all closed opportunities each week.
3. Utilize formula to store a current converted value in a separate read-only field. You can use either a regular Before Save Script or Workflow tool.

### Storing current converted value (locked)

Let's assume that you have a currency field named *amount*, and the default currency is *USD*.

Create a new field of *Currency* type, name it *amountConvertedLocked*, make it read-only,

Add a formula script to Before Save Script at Entity Manager. You can also use this formula in Workflow rule.

```
amountConvertedLocked = amountConverted;
amountConvertedLockedCurruncy = 'USD';
```

You can re-calculate formula for all existing records with mass action on the list view.

### Convert currency manually

It's possible to convert manually all currency fields of a record.

1. Mass action on the list view. Select which records you want to update (you can select all results). In *Actions* dropdown, click *Convert Currency*.
2. Action on the detail view. Available in the dropdown next to *Edit* button.

### Convert currency with Workflow

*Convert Currency* service action is available for Opportunity, Quote, Sales Order, Invoice. E.g. you can set up a workflow that will update currencies for all closed opportunities each week.

## Currency rates API

API User needs to have *Currency* scope enabled in roles.

Request to get all rates: `GET api/v1/CurrencyRate`.

Request to update specific rates: `PUT api/v1/CurrencyRate`, with JSON payload.

Payload example:

```
{
    "EUR": 1.11,
    "UAH": 0.037
}
```

Rate values are related to *Base Currency* specified in Settings.

## Adding missing currency

If a currency that you need is missing, you can add it manually.

Create a file: `custom/Espo/Custom/Resources/metadata/app/currency.json`

```json
{
    "list": [
        "__APPEND__",
        "COD"
    ]
}

```

where *COD* is a 3-letter currency code in [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) standard.

Clear cache at Administration.

## Conversion via formula

Example (conversion from Default Currency to EUR, for the field named *amount*):

```
amountEur = amountConverted * record\attribute('Currency', 'EUR', 'rate');
```

The field *amountConverted* contains an automatically calculated value in the default currency. Such fields are automatically created for all currency fields.

## Decimal data type

*As of v7.4.*

When precision is necessary for a specific currency field, it's recommended to use a Decimal data type this field. When creating a new currency field, check a corresponding checkbox.


For existing fields can be enabled manually in metadata > entityDefs:

```json
{
    "fields": {
        "myCurrencyField": {
            "decimal": true,
            "precision": 13,
            "scale": 4 
        }
    }
}
```
Rebuild is required after modifying an existing field. Can take long if the table is big. Run from CLI in this case.

If the parameters *precision* and *scale* are not defined, values 13, 4 are used.

In app, amount values will be represented as strings (rather than floats). 

In templates (PDF, email), need to use the *numberFormat* helper to print currency values.
