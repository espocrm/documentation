# Impressão em PDF

Nota: Este recurso está disponível desde a versão 5.0.5. do EspoCRM.

A impressão em PDF oferece a capacidade de criar documentos em PDF com dados de registro. O conteúdo do documento é definido pelo modelo.

1. Você precisa de ter pelo menos um Modelo para o tipo de entidade de gravação que deseja imprimir.
2. 'Imprimir em PDF' estará disponível na vista de detalhes no menu suspenso ao lado do botão 'Editar'.

## Modelos

A aba de Modelos está oculta por padrão. O administrador pode adicioná-lo na Administração > Interface de utilizador.

Para uma edição mais precisa, é recomendável usar o modo de exibição de código.

Podes imprimir os campos do registro, bem como os campos de registros relacionados, utilizando os espaços reservados no seu modelo.

Exemplos: 

* `{{name}}` – Nome do registro;
* `{{assignedUserName}}` – Utilização atribuído;
* `{{account.name}}` – Nome da conta relacionada.

É possível imprimir os campos de imagem:
```
<img src="{{file imageId}}">
```

onde `imageId` - o nome do campo de imagem personalizado, concatenado com o sufixo `Id`.

Para exibir os números de flutuação sem a parte fracionada (como número inteiro) usa a seguinte expressão:
```
{{numberFormat quantity_RAW decimals=0}}
```

Formatação personalizada para valores de moeda:
```
{{numberFormat unitPrice_RAW decimals=2 decimalPoint=',' thousandsSeparator=' '}}
```

O valor `10000.5` será imprimido como `10 000,50`.

Para exibir os arquivos de texto (multilinha), use os aparelhos triplos:```{{{description}}}```.
