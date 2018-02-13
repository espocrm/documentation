# Dynamiczne Formularze

Uwaga: Od wersji 4.3.0 możliwe jest tworzenie dynamicznych formularzy poprzez UI administratora w Menadżerze Jednostek.

W EspoCRM istnieje możliwość definiowania zachowania formularza. 

## Przykład

> Pokaż pole _nextStep_ w szczegółowym widoku Okazji, jeśli etap jest 'Closed Won'.
>

Stwórz plik `custom/Espo/Custom/Resources/metadata/clientDefs/Opportunity.json`.
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

Oznacza to, że pole _nextStep_ domyślnie zostanie schowane i pokażę się, gdy etap będzie równy 'Closed Won'.

Lista dostępnych akcji: `show`, `hide`, `setRequired`, `setNotRequired`.

Istnieje również możliwość ukrycia/pokazania paneli. Określi nazwę paneli w `panels`, atrybuty w ten sam sposób jak `fields`.
