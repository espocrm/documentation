# Maps

EspoCRM supports Google Maps out of the box.

## Google Maps

### Api Key

You need to specify Api Key to use Google Maps (Administration > Integration > Google Maps).

Geocoding API, Maps JavaScript API, Maps Static API must be enabled in Google Maps Platform.


## Showing map for address field

### As a field on detail view

Every Address field has its corresponding Map field. All you need is to put it on Detail layout. It uses Google Maps service.

Administration > Layout Manager > Select entity type > Detail > Drag & Drop Map field.

Make the cell wide using the minus sign.

You can also configure the height of your field.

Administration > Entity Manager > Choose entity > Fields > find the map field and click on it > edit the height and save.

### In modal dialog

*As of v5.8.*

Administration > Entity Manager > Click on the needed entity type > Click on the needed address field (e.g. *Billing Address*) > Check *View Map Button* and save.

*View Map* button should appear under the address field on the detail view. Note, that the address should contain either a city or postal code.

## Printing in PDF

*As of v5.9.2.*

*googleMapsImage* helper is availabe for printing Google Maps in PDF.

Usage (in PDF Template):

```
{{googleMapsImage}}
```

Printing a specific address field:

```
{{googleMapsImage field='shippingAddress'}}
```

Printing a specific address:

```
{{googleMapsImage city='New York' country='United States'}}
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
{{googleMapsImage size='400x400'}}
```
