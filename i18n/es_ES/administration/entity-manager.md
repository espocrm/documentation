# Entity Manager

Entity Manager está disponible en el panel de administración. Proporciona la capacidad de personalizar al máximo tu instancia de EspoCRM. Usted puede hacer lo siguiente:

* Agregue nuevos tipos de entidades.
* Personalice los tipos existentes de entidades: cambie las etiquetas, el orden predeterminado en la vista de lista, active o desactive la transmisión.
* Configurar campos: agregar nuevo, personalizar los existentes.
* Configure las relaciones: agregue nuevas, cambie las etiquetas de las existentes.

## Creando nueva entidad

Haga clic en el botón `Crear entidad` en la página Administrador de la entidad. Especifique el nombre, las etiquetas y el tipo. Si selecciona `Persona`, su entidad tendrá los campos Correo electrónico, Teléfono, Nombre, Apellido y Saludo. Marque `Stream` si desea que su entidad tenga un panel de flujo y que los usuarios puedan Seguir entidades de este tipo.
Types:

* Base: entidad vacía solo con campos básicos como Nombre, Usuario asignado, Equipos, Descripción.
* Base Plus - como Base pero con paneles de Actividades, Historial, Tareas (disponible desde 4.3.0).
* Evento: fecha de inicio, fecha de finalización, duración, padre, campos de estado. Disponible en el panel Calendario y Actividades (desde 4.3.0, debe estar habilitado en Administration > Settings).
* Persona: correo electrónico, teléfono, nombre, apellido, saludo, campos de dirección. Actividades, historia, paneles de tareas.
* Empresa: correo electrónico, teléfono, dirección de facturación, campos de dirección de envío. Actividades, historia, paneles de tareas.

## Actualizar la entidad existente

Si hace clic en el enlace `Editar` en una entidad determinada, podrá cambiar algunos parámetros de esa entidad.

* Etiquetas - nombre singular y plural de la entidad.
* Los registros de pedidos predeterminados están ordenados por vistas de lista.
* Stream - si la función Stream está habilitada para esta entidad.
* Deshabilitado - compruebe si no necesita esta entidad en su sistema.
* Campos de filtro de texto - en qué campos buscar el filtro de texto principal y la búsqueda global.


## Campos

Al hacer clic en el enlace `Campos` , se moverá a una página separada. Allí podrá crear nuevos campos o actualizar los existentes. Los siguientes tipos de campos están disponibles en Entity Manager:

* Dirección - dirección con calle, ciudad, estado, código postal y país;
* Matriz - lista de valores, con la capacidad de seleccionar valores múltiples (no es una buena opción si necesita buscar por este campo); los usuarios pueden agregar sus propios valores si las opciones no están especificadas.
* Archivo Adjunto Múltiple - archivos adjuntos múltiples;
* Aumento automático - solo lectura generada;
* Booleano - casilla de verificación, verdadero o falso;
* Moneda - para valores de moneda;
* Fecha;
* Fecha y hora;
* Enum - seleccione el cuadro, con la capacidad de seleccionar solo un valor;
* Archivo - cargando un archivo;
* Flotante - número con una parte decimal;
* Extranjero - un campo de entidad relacionada;
* Imagen - carga del archivo de imagen con una vista previa;
* Entero - número entero;
* Número - número de autoincremento del tipo de cadena con un posible prefijo y una longitud específica;
* Multi-enumeración - lista de valores, con la capacidad de seleccionar valores múltiples (no es una buena opción si necesita buscar en este campo), similar a Matriz pero más agradable.
* Texto - área de texto, para textos largos de líneas múltiples;
* Url - para enlaces;
* Varchar - texto corto;
* Wysiwyg - similar al campo de texto, con la capacidad de formatear texto.

Parámetros:
* Obligatorio - si el llenado del campo es obligatorio.
* Valor predeterminado - valor del campo establecido al crear un nuevo registro.
* Auditado - las actualizaciones del campo se registrarán en Stream.

**Nota**: Después de haber agregado el nuevo campo, debe poner este campo en [diseños](layout-manager.md) (Administration > Layout Manager).

### Lógica Dinámica

Brinda la capacidad de hacer formas dinámicas. Es posible definir las condiciones que hacen que ciertos campos sean visibles, obligatorios o de solo lectura. Las condiciones se verificarán automáticamente cuando se cambien los datos en el formulario.

Para los campos Enum, Array y Multi Enum, es posible definir diferentes conjuntos de opciones que estarán disponibles para el campo dependiendo de qué condición se cumpla.

## Relaciones

Puede crear nuevas relaciones entre entidades personalizadas y listas para usar. Hay 3 tipos de relaciones disponibles:

* Uno a muchos: después de haber creado esta relación, puede colocar un campo de enlace en el diseño detallado de la entidad correcta y agregar el panel de relaciones a la entidad izquierda;
* Muchos-a-Uno: lo mismo que Uno-a-Muchos, pero viceversa;
* Muchos a muchos: paneles de relaciones en ambos lados.

El parámetro `Link Multiple Field` implica que el campo del tipo `linkMultiple` se creará junto con la relación. Puedes poner un campo así en el diseño. Es conveniente para la recolección rápida de registros relacionados. No es una buena opción si su relación está destinada a tener muchos registros vinculados que pueden ralentizar la carga de la pantalla de vista detallada.

Si el parámetro 'Auditado' está marcado, las actualizaciones de la relación se registrarán en Stream.
