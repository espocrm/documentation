# Maps

EspoCRM supports Google Maps out of the box.

## Google Maps

### Api Key

You need to specify Api Key to use Google Maps (Administration > Integration > Google Maps).


## Showing map for address field

### As a field on detail view

Every Address field has its corresponding Map field. All you need is to put it on Detail layout. It uses Google Maps service.

Administration > Layout Manager > Select entity type > Detail > Drag & Drop Map field.

Make the cell wide using the minus sign.

You can also configure the height of your field.

Administration > Entity Manager > Choose entity > Fields > find the map field and click on it > edit the height and save.

### In modal dialog

Available since v 5.8.0.

Administration > Entity Manager > Click on needed entity type > Click on needed address field (e.g. *Billing Address*) > Check *View Map Button* and save.

*View Map* button should appear under the address field on the detail view. Note, that the address should contain either a city or portal code.

## Printing in PDF

Available since v5.9.2.

*_googleMapsImage* helper is availabe for printing Google Maps in PDF. Y

Usage (in PDF Template):

```
{{_googleMapsImage}}
```

Printing specific address field:

```
{{_googleMapsImage field='shippingAddress'}}
```

Printing specific address:

```
{{_googleMapsImage city='New York' country='United States'}}
```

Available options:

* field
* size - `300x300`
* zoom - integer value
* language
* street
* city
* state
* postalCode
* country

Example:

```
{{_googleMapsImage size='400x400'}}
```
