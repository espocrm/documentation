# Котировки

Функция котировок доступна в [Advanced Pack](https://www.espocrm.com/extensions/advanced-pack/).

Котировки представляют собой определенную группу продуктов или услуг с их количеством и ценами, которые вы указываете клиентам.

Котировки связаны с возможностями. Вы можете добавить «Котировки» в панель «Возможностей». Например вот так: «Администрирование» > «Менеджер компоновки» > «Возможности» > «Отношения». При создании новой котировки, связанной с возможностью, она передает элементы возможности в котировку.

Вы можете добавить панель котировок в свой аккаунт, чтобы иметь возможность видеть связанные котировки. Это можно сделать: Администрирование > менеджер компоновки > аккаунты > отношения.

## Котировки товаров

Котировка имеет список предметов. Каждый элемент может представлять определенный продукт или услугу с указанием количества, налоговой ставки, списка цен и цену за единицу. Можно сортировать элементы вручную.

Существует возможность добавлять поля custon для объекта Quote Item с помощью Entity Manager.

## Templates

By default there are two available templates: Quote and Invoice. You can create new templates (Quotes list view > top-right dropdown menu > Templates) as well as edit existing ones.

For more precise editing it's recommended to use Code View mode.

You can print fields of Quote record as well as fields of related records by utilizing placeholders in your template.

Examples:
`{{accountName}}` – Account name,

`{{{billingAddressStreet}}}` – street,

`{{account.type}}` – type of related Account,

`{{assignedUser.lastName}}` – last name of the assigned user.

If your line item is a product you can print product’s fields. 

Examples:
`{{product.length}}`, 

`{{product.color}}`.

Length and color are custom fields of Product entity in examples.

Looping through quote items:

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

It's possible to print image fields: 

```
<img src="{{file imageId}}">
```
where `imageId` – the name of custom image field, concatenated with the suffix `Id`.

For product line item:
```
<img src="{{file product.photoId}}">
```

To display float numbers (like quantity, unitPrice etc.) w/o fractional part (as integer) use the following expression (since version 4.8.3):
```
{{numberFormat quantity_RAW decimals=0}}
```

Custom formatting for currency values (since version 4.8.3):
```
{{numberFormat unitPrice_RAW decimals=2 decimalPoint=',' thousandsSeparator=' '}}
```
Value `10000.5` will be printer as `10 000,50`. 

To display text fileds (multiline) use triple braces: `{{{description}}}`.

## Print to PDF

Quotes can be printed to PDF. This action is available in dropdown next to Edit button on the quote’s detail view. Then you will be prompted to select Template.

## Email Quote

Quote PDF can be send in email as an attachment. Open quote record, click dropdown next to Edit button and the click Email PDF.

## Automatic numbering

You can create a Number field via Entity Manager for Quote entity type. Administration > Entity Manager > Quote > Fields > Add Filed > Number. Then you need to place it in on detail view using Layout Manager.

The value will be incremented by every new quote. There is an ability to specify the next number as well as prefix.

## Default tax

Available since EspoCRM 4.8.0.

1. Specify default Tax record at Administration > Entity Manager > Quotes > fields > Tax > Default.
2. Specify default tax rate at Administration > Entity Manager > Quotes > fields > Tax Rate > Default.

## Invoices

Quote can be treated as an invoice if its status became `Approved`. Then _Date Invoiced_, _Invoice Number_ fields show up. You can use different template for invoices for printing.
