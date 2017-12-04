# Dashlet

## How to create a dashlet

Create a file `custom/Espo/Custom/Resources/metadata/dashlets/{DASHLET_NAME}.json` with your dashlet configuration.

Here you need to define `"view"`, and you could set `"aclScope"`, `"entityType"`, and `"options"`.

If it's typical list dashlet, use `"view":"views/dashlets/abstract/record-list"`, if not, create own view (https://github.com/espocrm/documentation/blob/master/development/custom-views.md). 

### Options
By default in dashlet options you can set _Title_ and _Auto-refresh Interval_.

Additional option fields you can set in `"options"` > `"fields"`.

To define fields position set the layout in in `"options"` > `"layout"` > `"rows"`

Also you can define other options, if your view needs more data.

## Example

`application/Espo/Modules/Crm/Resources/metadata/dashlets/Cases.json`

```
{
  "view":"views/dashlets/abstract/record-list",
  "aclScope": "Case",
  "entityType": "Case",
  "options": {
    "fields": {
      "title": {
        "type": "varchar",
        "required": true
      },
      "autorefreshInterval": {
        "type": "enumFloat",
        "options": [0, 0.5, 1, 2, 5, 10]
      },
      "displayRecords": {
        "type": "enumInt",
        "options": [3,4,5,10,15]
      },
      "expandedLayout": {
        "type": "base",
        "view": "views/dashlets/fields/records/expanded-layout"
      }
    },
    "defaults": {
      "sortBy": "createdAt",
      "asc": false,
      "displayRecords": 5,
      "expandedLayout": {
        "rows": [
          [
            {
              "name": "number"
            },
            {
              "name": "name",
              "link": true
            },
            {
              "name": "type"
            }
          ],
          [
            {
              "name": "status"
            },
            {
              "name": "priority"
            }
          ]
        ]
      },
            "searchData": {
                "bool": {
                    "onlyMy": true
                },
                "primary": "open"
            }
        },
        "layout": [
            {
                "rows": [
                    [
                        {"name": "title"}
                    ],
                    [
                        {"name": "displayRecords"},
                        {"name": "autorefreshInterval"}
                    ],
                    [
                        {"name": "expandedLayout"},
                        false
                    ]
                ]
            }
        ]
    }
}
```
There you can see some examples `application/Espo/Modules/Crm/Resources/metadata/dashlets`.

Translation to dashlet is in `Global` scope, in `"dashlets"` section.

__After all don't forget to Clear Cache in Administration.__
