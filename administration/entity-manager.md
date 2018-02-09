# Gestor de Entidad

El Gestor de Entidad está disponible en el panel de Administración. Provee una habilidad para personalizar al máximo su instancia de EspoCRM. Usted puede hacer lo siguiente. 

* Agregar nuevos tipos de entidades.
* Personalizar los tipos existentes de entidades: cambiar etiquetas, ordernar por defecto la vista de la lista, habilitar o deshabilitar stream. 
* Configurar campos: agregar uno nuevo, personalizar los existentes.
* Configurar las relaciones: agregar una nuevo, cambiar etiquetas de las existentes.

## Creando una nueva entidad

Haga click en el botón `Create Entity` en la página del Gestor de la Entidad. Especifique el nombre, etiqueta y tipo. Si selecciona el tipo `Person`, su entidad tendrá Correo Electrónico, Teléfono, Primer Nombre, Apellido, y  campos de Saludo. Chequee `Stream` si desea que su identidad tenga un panel de stream y que los usuarios puedan seguir a entidades de este tipo.    

Tipos:

* Base - entidad vacìa con solo los campos básicos como Nombre, Usuario Asignado, Equipos, Descripción.
* Base Plus - igual que Base pero con paneles de Actividades, Historia, Tareas (disponible desde 4.3.0).
* Evento - Fecha de inicio, Fecha de Finalización, Duración, Padre, campo de Status. Disponible en el panel de Calendario y Actividades (desde 4.3.0, debe ser habilitado en Administración > Configuraciones).
* Persona - Correo electrónico, Teléfono, Primer Nombre, Primer Apellido, Saludo, campo de Dirección. Paneles de Actividades, Historia, Tareas.
* Compañía - campos de Correo Electrónico, Teléfono, Dirección de Facturación, Dirección de Envio. Paneles de Actividades, Historia, Tareas. 

## Actualizar una entidad existente

Si pulsa click en el enlace `Edit` de una determinada entidad usted será capaz de cambiar los parámetros de dicha entidad. 

* Etiquetas - nombre singular y plurar de la entidad
* Los registros de órdenes predeterminado son ordenados en la vista de las listas.
* Stream - si la característica Stream está habilitada para esta entidad.
* Deshabilitado - chequee si no necesita a esta entidad en su sistema
* Campos de Filtro de Texto - en cuales campos buscar por el filtro de texto principal y la búsqueda global. 

## Campos

Al darle click en el enlace `Fields` usted será movido a una página sepadada. Allí usted será capaz de crear nuevos campos o actualizar los existentes. Los siguientes tipos de campo están disponibles en el Gestor de Entidad:

* Dirección - direccióon con calle, ciudad, estado, código postal y país;
* Formación - lista de valores, con la habilidad para seleccionar múltiples valores (no es una buena opción si usted necesita buscar en este campo) los usuarios pueden agregar sus propios valores si las opciones no son específicadas.  
* Múltiples adjuntos - múltiples archivos adjuntos;
* Incremento automático - lea solo números generados;
* Booleano - lista de chequeo, verdadero o falso; 
* Moneda - para los valores de las monedas;
* Fecha; 
* Hora del día;
* Enumeración - opción para seleccionar, con la capacidad para solo seleccionar un valor;
* Archivo - subiendo un archivo;
* Flotar - número con una parte decimal; 
* Extranjero - un campo de una entidad relacionada;
* Imágen - subir una imágen con una vista previa;
* Entero - número completo;
* Número - número que se incrementa automáticamente;
* Enumeración múltiple - lista de valores, con la habilidad para seleccionar múltiples valores (no es una buena opción si usted necesitabuscar en este campo), similar a formación pero más agradable;
* Texto - área de texto, para largos y múltiples textos;
* URL - para enlaces;
* Varchar - texto corto;
* Wysiwyg - similar al campo Texto, con la habilidad de darle formato al texto

Parámetros:
* Requerido - si llenar el campo es obligatorio.
* Valor Predeterminado - Valor del campo fijado al crear el nuevo registro.
* Auditado - actualizaciones del campo serán logueadas en Stream. 

**Nota**: Después de que haya agregado el nuevo campo usted necesita poner este campo en [layouts](layout-manager.md) (Administración Gestor de Diseño).

### Lógica Dinamica

Provee la habilidad para hacer formas dinámicas. Es posible definir las condiciones haciendo a ciertos campos visibles, requeridos o de solo lectura. Las condiciones serán chequeadas automáticamente cuando los datos en la forma estén cambiados.

Para los campos Enumerar, Formación y Enumeración Múltiple es posble definir diferentes conjuntos de opciones que estarán disponibles para el campo dependiendo si la condición es satisfecha.

## Relaciones

Usted puede crear nuevas relaciones entre entidades fuera de la caja y personalizadas. Hay 3 tipos de relaciones: 

* Uno-para-Varios: después de que haya creado esta relación, usted puede poner un enlace de campo para el diseño detallado a la derecha de la entidad correta y agregar un panel de relaciones a la izquierda de la entidad; 
* Varios-para-Uno: igual que Uno-para-Varios solo que viceversa;
* Varios-para-Varios: panel de relaciones en ambos lados

El parámetro 'Enlazar múltiples campos' implica que el campo tipo `linkMultiple`será creado junto con la relación. Usted puede poner dicho campo en el diseño. Es conveniente para elegir rapidamente o registros relacionados. No es una buena opción si su relación tiene como intensión tener muchos registros enlazados que pueden ralentizar la carga de la vista de la pantalla de los detalles. 

Si el parámetro 'Auditado' está elegido entonces las actualizaciones de la relación serán logueadas en Stream


