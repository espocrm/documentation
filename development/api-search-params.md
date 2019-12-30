## API search parameters

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

### equals

```json
  {
      "type": "equals",
      "attribute": "status",
      "value": "New"
  }
```

### linkedWith

For link-multiple fields.

```json

   {
        "type": "linkedWith",
        "attribute": "teams",
        "value": ["someTeamId"]
   }
```
