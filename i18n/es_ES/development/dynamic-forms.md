# Formas Dinámicas

Nota: Desde la versión 4.3.0 es posible definir formas dinámicas a través del UI del admin en el Administrador de Entidades.

Existe una habilidad para definir un comportamiento de forma en EspoCRM.

## Ejemplo

> Necesita mostrar el campo _nextStep_ en una vista de detalle de Oportunidad sólo si la etapa es 'Closed Won'.
>

Cree el archivo `custom/Espo/Custom/Resources/metadata/clientDefs/Opportunity.json`.
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

Eso significa que el campo _nextStep_ estará escondido por defecto y se mostrará si la estapa es igual a 'Closed Won'.

La lista de acciones disponibles: `show`, `hide`, `setRequired`, `setNotRequired`.

También existe la habilidad de esconder/mostrar paneles. Especifique los nombres de panel en `panels`, atribuya de la misma manera que `fields`.
