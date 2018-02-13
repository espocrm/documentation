# Citações

O recurso Citações está disponível em [Pacote Avançado](https://www.espocrm.com/extensions/advanced-pack/).

As citações são um grupo específico de produtos ou de serviços com suas quantidades e preços que tu citas aos teus clientes.

As citações têm um relacionamento com a Oportunidade. Podes adicionar o painel de Citações à visualização detalhada da Oportunidade em Administração > Gestor de Layout > Oportunidades > Relacionamentos. Ao criar uma nova citação ligada a uma oportunidade, ela transfere os itens de oportunidade para a citação.

Podes adicionar o painel de Citações à visualização detalhada da Conta para poderes ver as cotações relacionadas. Podes fazê-lo em Administração > Gestor de Layout > Contas > Relacionamentos.

## Itens de Citações

A citação possui uma lista de itens. Cada item pode representar um determinado produto ou um serviço com a sua descrição, quantidade, taxa de imposto, preço de tabela e campos de preço unitário. É possível ordenar os itens manualmente.

Existe a capacidade de adicionar campos personalizados para a entidade Item de Citação usando para o efeito o Gestor de Entidades.

## Modelos

Por defeito, existem dois tipos de modelos disponíveis: Citação e Fatura. Podes então criar novos modelos (Exibição da lista de Citações > menu suspenso superior direito > Modelos), bem como editar os existentes.

Para uma edição mais precisa é recomendável usar o modo de Visualização de código.

Podes imprimir os campos do registro de Citações, bem como os campos de registros relacionados, utilizando espaços reservados par efeito no teu modelo.

Exemplos:
`{{accountName}}` – Nome da conta,

`{{{billingAddressStreet}}}` – Rua,

`{{account.type}}` – Tipo de Conta relacionada,

`{{assignedUser.lastName}}` – ultimo nome do utilizador signatário.

Se o teu item de linha for um produto, podes imprimir os campos do produto.

Exemplos:
`{{product.length}}`, 

`{{product.color}}`.

Comprimento e a cor são campos personalizaveis de Produtos de entidade que se encontram em exemplos.

Repetição automática através de itens de citação:

```
<!-- {{#each itemList}} -->
  <td>{{order}}</td>
  <td>{{name}}</td>
  <td>{{quantity}}</td>
  <td>{{product.weight}}</td>
  <td align="right">{{listPrice}}</td>
  <td align="right">{{unitPrice}}</td>
  <td align="right">{{amount}}</td>
<!-- {{/each}} -->
```

É possível imprimir campos de imagem: 

```
<img src="{{file imageId}}">
```
onde `imageId` – o nome do campo de imagem personalizado na entidade de Citação concatenada com o sufixo `Id`.

Para o item de linha do produto:
```
<img src="{{file product.photoId}}">
```

Para exibir números de flutuação (como quantidade, preço unitário etc.) sem parte fracionadas (como número inteiro) usa as seuintes expressões (desde a versão 4.8.3):
```
{{numberFormat quantity_RAW decimals=0}}
```

Formatação personalizada para valores de moeda (desde a versão 4.8.3):
```
{{numberFormat unitPrice_RAW decimals=2 decimalPoint=',' thousandsSeparator=' '}}
```
Valor `10000.5` será impresso como `10 000,50`. 

Para exibir campos de texto (multilinha) usa aparelhos triplos: `{{{description}}}`.

## Imprimir em PDF

As citações podem ser impressas em PDF. Esta ação está disponível no menu suspenso ao lado do botão Editar na visualização detalhada da citação. Depois será solicitado para selecionar o Modelo.

## Citação de Email

O PDF de citação pode ser enviado via email como anexo. Abre o registro de citação, clica na lista suspensa ao lado do botão Editar e clica em Email PDF.

## Numeração automática

Podes criar um campo de Número através do Gestor de Entidade por tipo de Citação de entidade. Administração > Gestor de Entidade > Citação > Campos > Adicionar Campo > Número. Depois precisas colocá-lo na visualização detalhada usando o Gestor de Layout.

O valor será incrementado por cada nova citação. Existe a capacidade de especificar o próximo número, bem como o prefixo.

## Imposto Padrão

Disponivel desde EspoCRM 4.8.0.

Especifique o registro de Imposto padrão em Administração> Entity Manager> Quotes> fields> Tax> Default.

1. Especifique o registro de Imposto padrão na Administração > Gestor de Entidade > Citações > campos > Impostos > Padrão.
2. Especifique taxa de imposto padrão na Administração > Gestor de Entidade > Citações > campos > Impostos > Padrão.

## Faturas

A citação pode ser tratada como uma fatura se o teu estado for `Aprovado`. Então os campos _Data da Fatura_, _Número da Fatura_ aparecem. Podes usar um modelo diferente para a impressão das faturas.
