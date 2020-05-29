# Kon unsaon paghimo og dashlet

Paghimo og file nga `custom/Espo/Custom/Resources/metadata/dashlets/{DASHLET_NAME}.json` uban sa konpigurasyon sa imong dashlet.

Dinhi kinahanglan nimo ipasabut ang `"view"`, ug mahimo nimo nga itakda ang `"aclScope"`, `"entityType"`, ug `"options"`.

Kung kini tipikal nga listahan dashlet, gamita ang `"view":"views/dashlets/abstract/record-list"`, kung dili, paghimo og kaugalingon nga [view](https://github.com/espocrm/documentation/blob/master/docs/development/custom-views.md).

## Mga Opsyon
Pinaagi sa default sa mga opsyon sa dashlet mahimo nimong itakda ang  _Titulo_ ug _Auto-refresh Interval_.

Ang dugang nga mga option field mahimo nimung itakda sa `"options"` > `"fields"`.

Aron matino ang mga posisyon sa field, itakda ang layout sa `"options"` > `"layout"` > `"rows"`

Mahimo usab nimo matino ang ubang mga kapilian, kung ang imong view nagkinahanglan og dugang nga impormasyon.

## Pananglitan

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
Didto makita nimo ang pipila ka mga ehemplo `application/Espo/Modules/Crm/Resources/metadata/dashlets`.

## Paghubad

Ang paghubad sa dashlet anaa na sa `Global` nga scope, sa sekyon sa `"dashlets"`.

__Human sa tanan ayaw kalimot sa Paglimpyo sa Cache sa Administrasyon.__
