# Paano Gumawa ng Dashlet

Lumikha ng isang file `custom/Espo/Custom/Resources/metadata/dashlets/{DASHLET_NAME}.json` gamit ang conpigyurasyon ng iyong dashlet.

Dito ay kailangan mong tukuyin ang `"view"`, at maaari mong itakda ang `"aclScope"`, `"entityType"`, at `"options"`.

Kung ito ay karaniwang listahan ng dashlet, gamitin ang `"view":"views/dashlets/abstract/record-list"`, kung hindi, lumikha ng sariing view (https://github.com/espocrm/documentation/blob/master/development/custom-views.md). 

## Mga Opsyon
Batay sa default sa mga opsyon ng dashlet,  maaari mong itakda ang _Title_ at _Auto-refresh Interval_.

Ang mga karagdagang opsyon ng mga field ay maaari mong itakda sa `"options"` > `"fields"`.

Upang tukuyin ang posisyon ng ng mga field, itakda ang layout sa `"options"` > `"layout"` > `"rows"`

Maaari mo ring tukuyin ang iba pang mga opsyon, kung ang iyong view ay nangangailangan pa ng mas maraming datos.

## Halimbawa

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
May makikita kang ilang halimbawa dito `application/Espo/Modules/Crm/Resources/metadata/dashlets`.

## Ang Pagsasalin

Ang pagsasalin sa dashlet ay nasa `Global` na scope, sa seksyon ng `"dashlets"`.

__Pagkatapos ng lahat, huwag kalimutan na burahin ang Cache sa Administrasyon.__
