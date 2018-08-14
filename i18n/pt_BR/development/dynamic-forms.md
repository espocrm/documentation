# Formulários Dinâmicos

Nota: desde a versão 4.3.0, é possível definir a forma dinâmica através da UI do administrador no Entity Manager.

Existe a capacidade de definir um comportamento de formulário no EspoCRM.

## Exemplo

> Precisa mostrar o campo _nextStep_ numa visualização de detalhes da Oportunidade somente se o estágio for 'Fechado Vencido'.
>

Criar ficheiro `custom/Espo/Custom/Resources/metadata/clientDefs/Opportunity.json`.
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

Isso significa que o campo _nextStep_ será escondido por padrão e mostrado se o palco igual a 'Ganho Fechado'.

A lista de ações disponíveis: `show`,` hide`, `setRequired`,` setNotRequired`.

Existe também a capacidade de ocultar/mostrar painéis. Especifica ps nomes do painel em `painéis', atribui o mesmo modo como `campos'.
