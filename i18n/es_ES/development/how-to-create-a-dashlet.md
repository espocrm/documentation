# Cómo crear un dashlet

Cree un archivo `custom/Espo/Custom/Resources/metadata/dashlets/{DASHLET_NAME}.json` con su configuración de dashlet.

Aquí necesita definir `"view"`, y podría configurar `"aclScope"`, `"entityType"`, y `"options"`.

Si es una lista de dashlet típica, utilice `"view":"views/dashlets/abstract/record-list"`, si no, cree su propia vista (../../../development/custom-views.md). 

## Opciones
Por defecto, en las opciones de dashlet puede configurar _Title_ y _Auto-refresh Interval_.

Puede configurar los campos de opciones adiconales en `"options"` > `"fields"`.

Para definir la posición de los campos, configure la disposición en `"options"` > `"layout"` > `"rows"`.

También puede definir otras opciones, si su vista necesita más datos.

## Ejemplo 

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

Ahí puede ver algunos ejemplos `application/Espo/Modules/Crm/Resources/metadata/dashlets`.

## Traducción 

La traducción a dashlet está en el rango `Global`, en la sección `"dashlets"`.

__Después de todo no olvide limpiar el Caché en Administración.__
