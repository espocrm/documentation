# Cotizaciones

La función de Cotizaciones está disponible en [Paquete avanzado](https://www.espocrm.com/extensions/advanced-pack/).

Las cotizaciones son un grupo específico de productos o servicios con sus cantidades y precios que usted cotiza a los clientes.

La cotización tienen una relación con Oportunidad. Puede agregar el panel Cotizaciones a la vista detallada de Oportunidad en Administración > Administrador de Diseño > Oportunidades > Relaciones. Al crear una nueva cotización vinculada a una oportunidad, transfiere artículos de oportunidad a la cotización.

Puede agregar el panel Cotizaciones a la vista detallada de la cuenta para poder ver las cotizaciones relacionadas. Puede hacerlo en Administración > Administrador de Diseño > Cuentas > Relaciones.

## Cotización de Artículos

La cotización tiene una lista de artículos. Cada artículo puede representar un determinado producto o servicio con campos de descripción, cantidad, tasa de impuesto, precio de lista y precio unitario. Es posible ordenar los artículos manualmente.

Existe la posibilidad de agregar campos personalizados para la entidad Cotizar Artículo usando Gerente de la Entidad.

## Plantillas

Por defecto hay dos plantillas disponibles: Cotización y Factura. Puede crear nuevas plantillas (vista por lista de Cotizaciones > menú desplegable en la parte superior derecha > Plantillas) así como también editar las existentes.

Para una edición más precisa, se recomienda usar el modo de Visualización de Código.

Puede imprimir los campos del registro de Cotizaciones, así como los campos de los registros relacionados mediante el uso de contenedores de posición en su plantilla.

Ejemplos:

`{{accountName}}` – Nombre de la cuenta,

`{{{billingAddressStreet}}}` – calle,

`{{account.type}}` – tipo de Cuenta relacionada,

`{{assignedUser.lastName}}` – apellido del usuario asignado.

Si su elemento en línea es un producto, puede imprimir los campos del producto.


Ejemplos:

`{{product.length}}`, 

`{{product.color}}`.

La longitud y el color son campos personalizados de la entidad Producto en ejemplos.

Haciendo loop a través de artículos de cotización:

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
Es posible imprimir campos de imagen:

```
<img src="{{file imageId}}">
```
donde `imageId` - el nombre del campo de imagen personalizado en la entidad de Cotización concatenada con el sufijo `Id`.

Para la línea de productos:
```
<img src="{{file product.photoId}}">
```

Para mostrar números flotantes (como cantidad, precio unitario, etc.) sin partes fraccionarias (como número entero), use las siguientes expresiones (desde la versión 4.8.3):
```
{{numberFormat quantity_RAW decimals=0}}
```

Formateo personalizado para valores de moneda (desde la versión 4.8.3):
```
{{numberFormat unitPrice_RAW decimals=2 decimalPoint=',' thousandsSeparator=' '}}
```
El valor `10000.5` se imprimirá como `10 000,50`.

Para mostrar campos de texto (líneas múltiples) use llaves triples: `{{{description}}}`.

## Imprimir en PDF

Las cotizaciones se pueden imprimir en PDF. Esta acción está disponible en el menú desplegable al lado del botón Editar en la vista detallada de la cotización. Luego se le pedirá que seleccione Plantilla.

## Cotización de Correo Electrónico

El PDF de la cotización se puede enviar por correo electrónico como archivo adjunto. Abra el registro de cotización, haga clic en el menú desplegable al lado del botón Editar y luego haga clic en Correo Electrónico PDF.

## Numeración Automática

Puede crear un campo Número a través del Administrador de Entidades para el tipo de entidad Cotización. Administración > Administrador de Entidades > Cotizar > Campos > Agregar Campo > Número. Luego debe colocarlo en la vista de detalles usando el Administrador de Diseños.

El valor se incrementará con cada nueva cotización. Existe la posibilidad de especificar el siguiente número y el prefijo.

## Impuesto Predeterminado

Disponible desde EspoCRM 4.8.0.

1. Especifique el registro de Impuestos predeterminado en Administración > Administrador de Entidades > Cotizaciones > Campos > Impuestos > Predeterminado.
 2. Especifique la tasa de impuesto predeterminada en Administración > Administrador Entidades > Cotizaciones > Campos > Tasa de Impuestos > Predeterminado.

## Facturas

La cotización puede tratarse como una factura si su estado se convierte en `Aprobado`. Luego aparecen los campos _Fecha Facturada_, _Número de Factura_. Puede usar diferentes plantillas para facturas para impresión.
