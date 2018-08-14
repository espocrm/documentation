# Cum să creați un dashlet

Creați un fișier `custom/Espo/Custom/Resources/metadata/dashlets/{DASHLET_NAME}.json` cu configurările dashlet.

Aici va trebui să definiți `"view"`, și ai putea să setezi `"aclScope"`, `"entityType"`, și `"options"`.

Dacă este o listă tipică de dashlet, use `"view":"views/dashlets/abstract/record-list"`, dacă nu, creațipropria vizualizare (https://github.com/espocrm/documentation/blob/master/development/custom-views.md). 

## Opțiuni
În mod implicit în opțiunile dashlet poți seta _Title_ and _Auto-refresh Interval_.

Opțiuni adiționale ale câmpurilor pot fi setate `"options"` > `"fields"`.

Pentru a deini poziția câmpurilor, setați aspectul în `"options"` > `"layout"` > `"rows"`

De asemenea, dacă vizulaizarea necesită mai multe date, puteți defini și alte opțiuni.

## Exemplu

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
Aici puteți găsi exemple `application/Espo/Modules/Crm/Resources/metadata/dashlets`.

## Traduceri

Traduceri la dashlet se găsesc în domeniul `Global`, în secțiunea `"dashlets"`.

__Nu uitați să ștergți Cache-ul din Administrare.__
