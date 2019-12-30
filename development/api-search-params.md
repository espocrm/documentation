# API search parameters

Filters and other search parameters can be used with API functions that returns a list of records.

## Example


Example (in PHP):


```php
$url = 'Lead';

$where = [
    'value' => [
        [
            'type' => 'isNotNull',
            'attribute' => 'assignedUserId',
        ],
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

$url .= '?' . http_build_query($params);

$response = $client->request('GET', $url);

```

## where

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
    "type": "arrayAnyOf",
    "attribute": "fieldName",
    "value": ["Value 1", "Value 2"]
}
```

