# Dynamic na mga form

Tandaan: Mula sa bersyon na 4.3.0 posible ng tukuyin ang dynamic na form sa pamamagitan ng UI ng admin sa Entity Manager.

Mayroon itong kakayahan na tukuyin ang form behavior sa EspoCRM. 

## Halimbawa

> Kailangan ipakita ang _nextStep_ field sa isang Opportunity detail view lamang kung ang yugto ay 'Closed Won'.
>

Pag-likha ng file `custom/Espo/Custom/Resources/metadata/clientDefs/Opportunity.json`.
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

Ito ay nangangahulugang ang _nextStep_ na field ay itatago batay sa default at ipapakita kung ang yugto ay katumbas na ng 'Closed Won'.

Ang listahan ng mga magagamit na mga aksyon: `show`, `hide`, `setRequired`, `setNotRequired`.

Mayroon itong kakayahan na itago/ipakita ang mga panel. Tukuyin ang pangalan ng mga panel sa `panels`, ipagpalagay ito sa parehong paraan ng `fields`.
