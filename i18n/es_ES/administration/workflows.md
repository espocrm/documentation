# Flujos de Trabajo

La función de flujos de trabajo está disponible en [Paquete avanzado](https://www.espocrm.com/extensions/advanced-pack/).

Los flujos de trabajo automatizan su proceso comercial de una manera fácil. Puede encontrarlo en el panel de Administración. Para crear una regla de flujo de trabajo, debe definir:

* Entidad Objetivo: a qué tipo de flujo de trabajo de la entidad se aplica;
* Tipo Disparador: cuando se activará el flujo de trabajo;
* Condiciones: se deben cumplir las condiciones para activar el flujo de trabajo;
* Acciones: qué hacer si se activa el flujo de trabajo.


## Tipos de Disparadores

### Después de crear el registro

Disparado solo cuando se crea un nuevo registro. Si se cumplen las condiciones especificadas, se ejecutarán las acciones.

### Después de guardar el registro

Se activa cuando se crea un nuevo registro o se actualiza un registro existente. Si se cumplen las condiciones especificadas, se ejecutarán las acciones.

Para las reglas de flujo de trabajo con este tipo de desencadenador, es una práctica común tener una condición que verifique si algún campo se 'cambió'. P.ej. Si el estado de Case cambia, entonces ejecuta algunas acciones.

### Programado

Activado según la programación definida. Puede configurarlo para que se ejecute todos los días, todas las semanas, etc. Las acciones se aplicarán a los registros devueltos por un informe de lista especificado. Entonces también necesita crear un informe de lista.

La programación se especifica en una notación crontab.

```
* * * * * *
| | | | | | 
| | | | | +-- Año               (rango: 1900-3000)
| | | | +---- Día de la Semana  (rango: 1-7, siendo 1 para Lunes)
| | | +------ Mes del Año       (rango: 1-12)
| | +-------- Día del Mes       (rango: 1-31)
| +---------- Hora              (rango: 0-23)
+------------ Minuto            (rango: 0-59)
```

### Secuencial

Usado raramente. Se supone que debe ser ejecutado por otro flujo de trabajo. Brinda la capacidad de hacer una lógica compleja.

Nota: Para flujos de trabajo secuenciales, se recomienda utilizar [herramienta BPM] (bpm.md) en lugar de una función de Flujos de trabajo.

## Condiciones

Puede especificar las condiciones que se deben cumplir para activar el flujo de trabajo. Hay dos formas de especificar condiciones: con el constructor de condiciones de UI y con la fórmula.

### Constructor de condiciones de IU

Algunos tipos de condiciones disponibles:

* _equals_ - el campo es igual a un valor específico o un valor de otro campo;
* _was equal_ - el campo era igual a un valor específico antes de que se activara el flujo de trabajo;
* _not equals_ - el campo no es igual a un valor específico o un valor de otro campo;
* _was not equal_ - el campo no era igual al valor específico antes de que se activara el flujo de trabajo;
* _empty_ - el valor del campo está vacío;
* _not empty_ - el valor del campo no está vacío;
* _changed_ - el campo fue cambiado;
* _not changed_ - el campo no fue cambiado.

### Condiciones de la fórmula

La fórmula proporciona la capacidad de definir condiciones de cualquier complejidad. Para leer acerca de la sintaxis de fórmulas siga [este artículo] (formula.md).

Nota: No debe haber ningún delimitador `;` utilizado en el código de fórmula cuando determina una condición.

## Acciones

### Enviar correo electrónico

El sistema enviará un correo electrónico usando una plantilla de correo electrónico especificada. La dirección de correo electrónico de un destinatario puede tomarse del registro objetivo, cualquier registro relacionado, el usuario actual, los seguidores, los usuarios del equipo o especificados. El correo electrónico puede enviarse de inmediato o retrasarse por un intervalo específico.

### Crear registro

El sistema creará el nuevo registro de cualquier tipo de entidad. Si existe una relación entre el registro objetivo y la creación de registros, es posible relacionar los registros.

Existe la capacidad de definir fórmulas para calcular campos.

### Crear registro relacionado

El sistema creará el registro relacionado con el registro objetivo. Es posible definir una fórmula para calcular campos.

### Actualizar registro de destino

Permite el cambio de campos específicos del registro objetivo. Es posible definir una fórmula para calcular campos.

Si necesita agregar nuevos elementos al campo Múltiple de enlace sin perder los datos existentes (por ejemplo, Equipos), necesita utilizar la función de fórmula entity\addLinkMultipleId. Ejemplo: `entity\addLinkMultipleId('teams', 'teamId')`.

### Actualizar registro relacionados

Permite el cambio de campos específicos del registro o registros relacionados. Es posible definir una fórmula para calcular campos.

### Enlace con otro registro

Relaciona la entidad objetivo con otra entidad específica. P.ej. agrega equipo específico al registro.

### Desvincular con otro registro

Desrelaciona la entidad objetivo de otra entidad específica. P.ej. elimina un equipo específico del registro.

### Aplicar Regla de Asignación

Asigne el registro objetivo al usuario por regla de distribución. Hay dos reglas disponibles: Round-Robin y Least-Busy.

* Round-Robin: los usuarios son elegidos desde la parte superior a la parte inferior de una lista (equipo) y luego comienzan de nuevo.
* Menos ocupado: el usuario que tenga menos registros asignados será elegido para la asignación.

_List Report_ - Para la distribución Least-Busy determina qué registros se tendrán en cuenta para calcular el número de registros asignados. P.ej. para Cases, necesitamos tomar solo registros con estado activo.

### Crear Notificación

Notificar a usuarios específicos con el mensaje. Es posible utilizar marcadores de posición en la plantilla de mensaje: {entidad} - registro de destino, {usuario} - usuario actual.

### Hacer Seguidores

Obliga a usuarios específicos a seguir a la entidad objetivo o a una entidad relacionada específica.

### Activa Otro Flujo de Trabajo

Permite hacer flujos de trabajo secuenciales. Es posible derivar el flujo de trabajo por condición: puede configurar el flujo de trabajo para desencadenar dos flujos de trabajo con diferentes condiciones definidas en esos flujos de trabajo.

Es posible retrasar la ejecución del flujo de trabajo secuencial. En el flujo e trabajo secuencial, puede definir la condición que verifica si los campos específicos se cambiaron desde que se desencadenó el flujo de trabajo primario mediante los tipos de condición _Changed_ y _Was Equal_.

Nota: Para flujos de trabajo secuenciales, se recomienda utilizar [herramienta BPM] (bpm.md) en lugar de una función de Flujos de trabajo.

### Ejecutar Acción de Servicio

Permite ejecutar scripts de servicio específicos. Por defecto hay las siguientes acciones disponibles:

* Enviar Invitaciones: para Reuniones/Llamadas;
* Agregar Elementos de Ccotización - para Cotizaciones.

Los desarrolladores pueden escribir sus propias acciones de servicio. Ver [más detalles](../development/workflow-service-actions.md).

## Usar Fórmula en Acciones

Es posible definir la fórmula para calcular campos para Crear registro, Actualizar registro objetivo, Crear registro relacionado, Actualizar registro relacionado. Para los dos últimos, para acceder a los atributos de la entidad objetivo, debe usar la función `targetEntity\attribute`. Para acceder a los atributos de la entidad objetivo que se estableció antes de que se activara el flujo de trabajo, use la función `targetEntity\attributeFetched`.

Nota: Para flujos de trabajo secuenciales, se recomienda utilizar [herramienta BPM] (bpm.md) en lugar de una función de Flujos de trabajo.

### Ejecutar Acción de Servicio

Permite ejecutar scripts de servicio específicos. Por defecto hay las siguientes acciones disponibles:

* Enviar invitaciones: para Reuniones/Llamadas;
* Agregar Elementos de Cotización - para Cotizaciones.

Los desarrolladores pueden escribir sus propias acciones de servicio. Ver [más detalles] (../development/workflow-service-actions.md).

## Usar Fórmula en Acciones

Es posible definir la fórmula para calcular campos para Crear registro, Actualizar registro objetivo, Crear registro relacionado, Actualizar registro relacionado. Para los dos últimos, para acceder a los atributos de la entidad objetivo, debe usar la función `targetEntity\attribute`. Para acceder a los atributos de la entidad objetivo que se estableció antes de que se activara el flujo de trabajo, use la función `targetEntity\attributeFetched`.

Ejemplo:
```
name = string\concatenate(targetEntity\attribute('name'), ' ', datetime\today());
```
