# API search parameters

Filters and other search parameters can be used with API functions that returns a list of records.

* [Examples](#examples)
  * [PHP](#php)
  * [Javacript](#javascript-nodejs)
  * [Python](#python)
* [Params](#params)
* [Where items](#where-items)
* [Attribute names](#attribute-names)

## Examples

### PHP

```php
$url = 'Lead';

$where = [
    [
        'type' => 'isNotNull',
        'attribute' => 'assignedUserId',
    ],
    [
        'type' => 'or',
        'value' => [
            [
                'type' => 'equals',
                'attribute' => 'status',
                'value' => 'New',
            ],
            [
                'type' => 'equals',
                'attribute' => 'status',
                'value' => 'Assigned',
            ],
        ],
    ],
];

$boolFilterList = [
    // 'onlyMy',
    // 'followed',
];

// the list of available primary filters can obtained in a select manager class
$primaryFilter = 'primaryFilter';

// every param is optional
$params = [
    'offset' => 0,
    'maxSize' => 20,
    'where' => $where,
    'primaryFilter' => $primaryFilter,
    'boolFilterList' => $boolFilterList,
    'select' => 'id,name,assignedUserId,status', 
    'orderBy' => 'createdAt',
    'order' => 'desc',
];

$response = $client->request('GET', $url, $params);
```

### Javascript (Nodejs)

```js
// every param is optional
var params = {
    maxSize: 5,
    primaryFilter: 'open',
    where: [
        {
            type: 'equals',
            attribute: 'priority',
            value: 'Urgent',
        }
    ],
    select: 'id,name,assignedUserId,assignedUserName',
};

client.request('GET', 'Case', params)
    .then(
        (response) => {
            console.log(response);
        }
    )
```

### Python

```python
params = {
    "select": "id,phoneNumber",
    "where": [
        {
            "type": "equals",
            "attribute": "phoneNumber",
            "value": '+1',
        },
    ],
}
result = client.request('GET', 'Account', params)
```

## Params

Parameters are passed as query parameters (in GET request).

As of v7.0.0 it's possible to pass all parameters in JSON format in one query parameter `searchParams`.

### offset

*Integer*

An offset for pagination.

### maxSize

*Integer*

How much records to return.

### select

*String* (or *Array* of strings if search params passed in JSON)

What record [attributes](../administration/terms-and-naming.md#attribute) to return. Separated by comma. Whitespaces are not allowed. Specify only attributes that you need, it can improve performance.

Example: `id,name,status,assignedUserId`.

Example in JSON: `["id", "name"]`.

### where

*Array*

Search criteria. Can contain nested arrays and objects. See more [below](#where-items) more detail.

### primaryFilter

*String*

A primary filter. Primary filters are usually defined in *Select Manager* class.

### boolFilterList

*Array*

Bool filters. E.g. *onlyMy*, *followed*.

### orderBy

*String*

An attribute to order by.

### order

*String*

A direction of order: 'desc' or 'asc'.


## Where items

*Where* parameter is an array if items, that can contain nested items. The data should be URL-encoded. API clients provided in the documentation handle encoding.

Examples below are given in JSON format for readability. 

### equals, notEquals

```json
{
    "type": "equals",
    "attribute": "status",
    "value": "New"
}
```

### greaterThan, lessThan, greaterThanOrEquals, lessThanOrEquals

```json
{
    "type": "greaterThan",
    "attribute": "amountConverted",
    "value": 1000.00
}
```

### isNull, isNotNull

```json
{
    "type": "isNull",
    "attribute": "assignedUserId"
}
```

### isTrue, isFalse

```json
{
    "type": "isTrue",
    "attribute": "someBoolField"
}
```

### linkedWith, notLinkedWith

For link-multiple fields.

```json
{
    "type": "linkedWith",
    "attribute": "teams",
    "value": ["someTeamId"]
}
```

### isLinked, isNotLinked

For link-multiple fields. Whether is linked or not linked with any record.

```json

{
    "type": "isLinked",
    "attribute": "teams"
}
```

### in, notIn

```json
{
    "type": "in",
    "attribute": "status",
    "value": ["New", "Assigned"]
}
```

### contains, notContains, startsWith, endsWith, like, notLike

```json
{
    "type": "contains",
    "attribute": "someTextOrVarcharField",
    "value": "text"
}
```

### or, and

```json
{
    "type": "or",
    "value": [
        {
            "type": "equals",
            "attribute": "status",
            "value": "New"
        },
        {
            "type": "equals",
            "attribute": "status",
            "value": "Assigned"
        }
    ]
}
```

### today, past, future, lastSevenDays, currentMonth, lastMonth, nextMonth, currentQuarter, lastQuarter, currentYear, lastYear, currentFiscalYear, lastFiscalYear, currentFiscalQuarter, lastFiscalQuarter

```json
{
    "type": "today",
    "attribute": "someDateField"
}
```

### lastXDays, nextXDays, olderThanXDays, afterXDays, 

```json
{
    "type": "lastXDays",
    "attribute": "someDateField",
    "value": 2
}
```

### between

```json
{
    "type": "between",
    "attribute": "someNumberOrDateField",
    "value": [100, 200]
}
```

### arrayAnyOf, arrayNoneOf, arrayAllOf

For array, multi-enum, checkbox fields.

```json
{
    "type": "arrayAnyOf",
    "attribute": "fieldName",
    "value": ["Value 1", "Value 2"]
}
```
### arrayIsEmpty, arrayIsNotEmpty

For array, multi-enum, checkbox fields.

```json
{
    "type": "arrayIsEmpty",
    "attribute": "fieldName"
}
```

## Attribute names

Attribute names usually are same as a system field names. Fields are listed at Administration > Entity Manager > ... > Fields.

Attribute names should be in lowerCamelCase.

More info about attributes [here](../administration/terms-and-naming.md#attribute).
