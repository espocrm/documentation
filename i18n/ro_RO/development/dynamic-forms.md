# Formulare Dinamice

Rețineți: Încă de la veriunea 4.3.0 este posibilă definirea formularelor dinamice prin UI a adminului în Managerul de Entități.

Există o posibilitate de a defini comportamentul unui formular în EspoCRM. 

## Exemplu

> Trebui să arătăm show _nextStep_ field pe vizualizarea detaliată a Oportunității dacă etapa este 'Closed Won'.
>

Creați fișier `custom/Espo/Custom/Resources/metadata/clientDefs/Opportunity.json`.
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

Aceasta însemnă cu _nextStep_ field o să fie ascuns în mod implicit și vizibil dacă etapa este 'Closed Won'.

Lista acțiuniilor disponibile: `show`, `hide`, `setRequired`, `setNotRequired`.

Există, de asemenea, abilitatea de a ascunde/afișa panouri. Specifică numele panoului în `panels`, atribuit în același fel ca `fields`.
