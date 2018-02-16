# Criando tipo de campo personalizado

### Definição de campo

Criar um arquivo `/custom/Espo/Custom/Resources/metadata/fields/{field-type}.json` com os parâmetros necessários.
```
{
   "visão": "personalizado:visão/campos/{campo-tipo}"`
}
```

Utilize os tipos de campo fora da caixa como exemplos: `/aplicação/Espo/Recursos/metadata/campos`.
 
### Tradução

O rótulo é usado no Gerenciador de Entidade pode ser configurado em `personalizado/Espo/personalizado/Recursos/i18n/en_US/Admin.json` na seção `camposTipos
Se você precisar adicionar tradução para outro idioma, use o idioma necessário [código de idioma](https://en.wikipedia.org/wiki/ISO_639-1)_[código do país](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) ao invés de`en_US`. Na `data/config.php` Na seção `languageList` você pode encontrar a lista de idiomas incluídos.

### Visão

Crie a vista para o campo `cliente/personalizado/src/visão/campos/{campo-tipo}.js` e define seus modelos
```
Espo.define('personalizado:visão/campos/[campo-tipo]', 'visão/campos/base', função (Dep) {
    
    retorna Dep.extend({
        
    });
});
```

Use exemplos de tipos de campo excluídos:
- `/cliente/src/visão/campos` - visão;
- `/cliente/res/modelos/campos` - modelos.

Então você precisa executar a reconstrução no painel de administração.
