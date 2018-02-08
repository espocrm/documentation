# Informes

La función Informes está disponible en [Paquete avanzado](https://www.espocrm.com/extensions/advanced-pack/).

Hay dos tipos de informes: Lista y Cuadrícula.

## Informes de Lista

Enumere los resultados del informe en la lista de registros que cumplen los criterios especificados.

Para crear un nuevo informe de lista, haga clic en la pestaña Informes y luego haga clic en el botón Crear Informe. Elija el tipo de Entidad necesaria y luego haga clic en el botón Crear en la sección Informe de Lista.

En el campo _Columnas_, seleccione los campos que le gustaría que se muestren. A continuación puede especificar los parámetros de visualización para cada columna, p.e. ancho y alinear.

Elija la clasificación necesaria en el campo de _Orden de Lista_.

En la sección _Filtros_, puede especificar criterios que determinen qué registros se enumerarán en su informe. Puede usar los operadores lógicos 'OR' y 'AND' aquí.

Los _Filtros de Tiempo de Ejecución_ le permiten especificar diferentes filtros antes de ejecutar el informe.

Puede __exportar__ los resultados del informe de lista a los formatos excel y csv.

## Informes de Cuadrícula

La cuadrícula informa los valores resumidos agrupados por campos especificados. Estos informes se pueden mostrar como un gráfico.

![Informes de cuadrícula](https://github.com/espocrm/documentation/raw/master/_static/images/user-guide/reports/grid.png)

Para crear un nuevo informe de cuadrícula, haga clic en la pestaña Informes y luego haga clic en el botón Crear Informe. Elija el Tipo de Entidad necesario y luego haga clic en el botón Crear en la sección Informe de Cuadrícula.

En el campo _Grupo Por_ elija uno o dos campos para los que desea agrupar los datos de su informe. Es posible agrupar por año, mes, día para los campos de fecha. Si agrupa por dos campos, su informe se considerará tridimensional.

En el campo _Columnas_, seleccione una o más funciones agregadas, como COUNT, SUM (suma), MIN, MAX, AVG (promedio).

El campo _Ordenar Por_ define cómo se ordenarán los datos del informe.

En la sección _Filtros_, puede especificar los criterios que determinan qué registros se usarán en su informe. Puede usar los operadores lógicos 'OR' y 'AND' aquí.

Los _Filtros de Tiempo de Ejecución_ le permiten especificar diferentes filtros antes de ejecutar el informe.

El informe de cuadrícula permite mostrar resultados en forma de gráfico. Existen los siguientes _tipos de cuadros_: Barra (Horizontal), Barra (Vertical), Pie, Línea.

Es posible __exportar__ los resultados del informe de cuadrícula a los formatos excel y csv.

## Filtros

### Filtro de Campo

Es simple usar tipos de filtros. También puede elegir los campos de la entidad objetivo, así como las entidades relacionadas.

![Filtro de Campo](https://github.com/espocrm/documentation/raw/master/_static/images/user-guide/reports/filter-field.png)


### Grupo OR

OR significa que se debe cumplir al menos una condición del grupo.

![Grupo OR](https://github.com/espocrm/documentation/raw/master/_static/images/user-guide/reports/filter-or.png)

### Grupo AND

AND significa que se deben cumplir todas las condiciones del grupo.

### Grupo NOT

Ofrece la capacidad de filtrar registros que no cumplen los criterios especificados. P.ej. listar cuentas que no tienen ninguna oportunidad con los estados Cerrado Ganado o Cerrado Perdido.

![Grupo NOT](https://github.com/espocrm/documentation/raw/master/_static/images/user-guide/reports/filter-not.png)

### Expresión Compleja

Para un uso más avanzado. Puede aplicar la función para cierta columna de base de datos y compararla con el resultado de la expresión [fórmula](../ administration / formula.md).

Nota: si necesita comparar solo con un valor de cadena simple, debe ponerlo entre comillas simples `'alguna cadena'`.

Nota: Las funciones destinadas a interactuar con el registro de entidad no funcionarán aquí porque la fórmula no se aplica al registro específico.

![Filtro Expresión Compleja](https://github.com/espocrm/documentation/raw/master/_static/images/user-guide/reports/filter-complex.png)

## Mostrando en el Tablero

Puede mostrar cualquier informe en el tablero. Para esto, necesita añadir un Informe de dashlet y luego elegir el informe necesario en las opciones del dashlet.

## Envío de Correo Electrónico

Es posible hacer que el sistema envíe los resultados de los informes a ciertos usuarios de manera regular en el tiempo especificado. Esto debe configurarse para ciertos informes individualmente.

## Sincronización con Listas de Objetivos

Es posible tener listas de objetivos sincronizadas con resultados de informes de listas. Es conveniente para el correo electrónico masivo cuando desea enviar correos electrónicos solo a contactos que cumplen con algunos criterios al momento del envío. Esta función está disponible en la vista de detalles de cualquier lista de objetivos en el panel 'Sincronización con Informes'.
