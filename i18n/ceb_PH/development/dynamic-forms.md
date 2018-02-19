# Mga Dynamic Form

Timan-e: Gikan sa bersiyon 4.3.0, posible na nga mudefine og dynamic nga form pinaagi sa UI sa admin sa Entity Manager.

Naay abilidad nga mu-define og linihokan sa form sa EspoCRM. 

## Pananglitan

> Gikinahanglang ipakita ang _nextStep_ field ngadto sa Opportunity detail view kung ang stage kay 'Closed Won'.
>

Himo og file nga `custom/Espo/Custom/Resources/metadata/clientDefs/Opportunity.json`.
```json
{
  "formDependency": {
    "stage": {
      "map": {
        "Closed Won" : [
          {
            "action": "show",
            "fields": ["nextStep"]
          }
        ]
      }, 
      "default": [
         {
             "action": "hide", 
             "fields": ["nextStep"] 
         }
       ]
    }
  }
}
```

Nagpasabot to nga ang _nextStep_ nga field kay itago (kung wala ray usbon) ug ipakita kung ang stage kay 'Closed Won'.

Ang lista sa mga pwedeng buhaton nga mga aksyon: `show`, `hide`, `setRequired`, `setNotRequired`.

Naay puy abilidad nga mutago/mupakita ug mga panel. Ispecify ang pangalan sa panel sa `panels`, attribute nga parehas sa `fields`.
