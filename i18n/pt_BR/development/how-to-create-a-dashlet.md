# Como criar um dashlet

Criar um arquivo `custom/Espo/Custom/Resources/metadata/dashlets/{DASHLET_NAME}.json` com a tua configuração do dashlet.

Aqui precisas definir `"visão "`, e podes configurar `"aclScope"`, `"entityType"`, e `"opções"`.

Se é uma lista típica dashlet, usa `"view":"views/dashlets/abstract/record-list"`, se não, crie uma visão própria (https://github.com/espocrm/documentation/blob/master/development/custom-views.md). 

## Opções
Por padrão, nas opções do dashlet podes configurar _Title_ e _Auto-refresh Interval_.

Campos de opção adicionais que podes definir em `"opções"` > `"campos"`.

Para definir a posição dos campos, defina o layout em`"opções"` > `"layout"` > `"linhas"`

Além disso, podes definir outras opções, se a tus visão precisar de mais dados.

## Exemplo

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
Lá podes ver alguns exemplos `application/Espo/Modules/Crm/Resources/metadata/dashlets`.

## Tradução

A tradução para dashlet está no escopo `Global`, na seção `"dashlets"`.

__Depois de tudo, não te esqueças de Limpar Cache na Administração.__
