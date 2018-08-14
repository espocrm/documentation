# Dynamic Forms

Note: Since version 4.3.0 it's possible to define dynamic form through admin's UI in Entity Manager.

There is an ability to define a form behavior in EspoCRM. 

## Example

> Need to show _nextStep_ field on an Opportunity detail view only if stage is 'Closed Won'.
>

Create file `custom/Espo/Custom/Resources/metadata/clientDefs/Opportunity.json`.
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

That means that _nextStep_ field will be hidden by default and shown if stage equals to 'Closed Won'.

The list of available actions: `show`, `hide`, `setRequired`, `setNotRequired`.

There is also ability to hide/show panels. Specify panel names in `panels`, attribute the same way as `fields`.
