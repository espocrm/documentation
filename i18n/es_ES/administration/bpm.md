# Business Process Management

La herramienta Business Process Management (BPM) brinda la capacidad de modelar y automatizar procesos comerciales en EspoCRM. Es un motor que ejecuta procesos comerciales descritos en el estándar BPMN 2.0. La herramienta BPM está disponible en la extensión 
![BPM example](../_static/images/administration/bpm/bpm-1.png)

### Diferencia de la herramienta de flujos de trabajo

La herramienta Flujos de trabajo está diseñada para la automatización de reglas comerciales simples, sin elementos de flujo secuencial, cuando no es necesario mostrar el flujo de forma gráfica.

La herramienta BPM está diseñada para flujos de negocios más complejos, donde puede haber flujos divergentes y convergentes, retrasos en la ejecución e interacciones del usuario. Una vista del diagrama de flujo hace que el proceso comercial sea más comprensible para un ser humano, un registro permite ver cómo se llevó a cabo el proceso.

## Diagramas de flujo de proceso

El enlace para procesar diagramas de flujo está disponible desde el panel de administración. También se puede agregar como una pestaña en el panel de navegación.

Los diagramas de flujo están destinados al modelado de procesos de negocio. El administrador puede crear y editar diagramas de flujo. Los usuarios normales solo pueden ver diagramas de flujo.

Cada diagrama de flujo tiene su tipo de entidad específica (campo Tipo de objetivo). El diagrama de flujo determina la ejecución de instancias de proceso futuras. Comprende elementos de diagrama de flujo y conexiones entre elementos.

Si el diagrama de flujo del proceso tiene desactivado el campo "Está activo", no iniciará las instancias del proceso.

Para mostrar detalles y parámetros de un cierto elemento del diagrama de flujo, debe hacer clic en él. En el modo de edición, podrá editar los parámetros.

## Procesos

Los procesos están disponibles desde el panel de administración. El enlace también se puede agregar como una pestaña en el panel de navegación.

El proceso representa la instancia del proceso empresarial. Cuando se inicia, obtiene el estado 'Iniciado'. Cuando el proceso finaliza, obtiene el estado 'Terminado'. El proceso también puede ser detenido manualmente por un usuario que tiene acceso para editar el proceso. Si se detiene manualmente, obtiene el estado 'Detenido'.

El proceso se ejecuta de acuerdo con el diagrama de flujo. El diagrama de flujo del proceso no se puede cambiar después de iniciar el proceso.

El proceso está relacionado obligatoriamente con un solo registro objetivo.

Los procesos se pueden iniciar automáticamente (en condiciones específicas o por programación) o manualmente (cuando hay al menos un evento de inicio en el diagrama de flujo). Para iniciar el proceso manualmente, el usuario debe hacer clic en el botón "Iniciar proceso" en la vista de lista de procesos.

## Elementos del diagrama de flujo

### Eventos

Los eventos se muestran en un diagrama de flujo como círculos.

#### Evento de inicio

No tiene parámetros Es un punto de partida del proceso. El evento de inicio puede iniciarse manualmente por un usuario que tenga acceso para crear procesos. El usuario debe hacer clic en el botón 'Iniciar proceso' en la vista de lista de procesos.

#### Evento de inicio condicional

Un punto de partida del proceso. Se supone que debe activarse automáticamente cuando se cumplen las condiciones especificadas. Hay dos tipos de activador: 'Después de crear el registro', 'Después de guardar el registro'.

#### Evento de inicio del temporizador

Un punto de partida del proceso. Inicia procesos por programación. Debe especificar el informe de lista que devuelve registros para iniciar procesos y programar en notación crontab.

#### Evento intermedio condicional

Este evento detiene el flujo hasta que se cumplan los criterios especificados.

#### Evento intermedio del temporizador

Este evento detiene el flujo y espera mientras esté especificado por los parámetros del evento.

Para configuraciones de temporizador más complejas, puede utilizar [fórmula](formula.md). Los scripts de fórmulas deben devolver el valor de Fecha y hora (en la zona horaria UTC). Una vez que llegue este momento, el flujo pasará al siguiente elemento.

Al utilizar la función de fórmulas datetime \ más cercana, es posible establecer el temporizador en un momento específico en el futuro, p. el comienzo del siguiente día hábil.

#### Fin del evento

Termina el flujo actual. No finaliza los flujos que se ejecutan en paralelo. Cuando el flujo llega al evento final y no hay nada en ejecución en paralelo, el proceso finaliza.

#### Terminar evento final

Finaliza todos los flujos. El proceso se terminó posteriormente.

### Puertas de enlace

Las puertas de enlace se muestran como diamantes.

#### Puerta de enlace exclusiva

Puede divergir o converger flujos.

En caso de divergencia, define un único flujo (camino) que se elegirá según los criterios especificados. La primera condición cumplida determina el flujo, las siguientes condiciones se omiten. Existe la posibilidad de especificar el flujo predeterminado. El flujo predeterminado se elige si no hay ninguna condición cumplida. El flujo predeterminado está marcado con un signo de barra inclinada.

En caso de convergencia, solo dirige el flujo hacia el elemento saliente. No se bloquea después del flujo, por lo que los flujos paralelos no se fusionarán en un solo flujo.

![exclusive gateway divergent](../_static/images/administration/bpm/gateway-exclusive-divergent.png)

![exclusive gateway convergent](../_static/images/administration/bpm/gateway-exclusive-convergent.png)

#### Puertas de enlace inclusivos

Puede divergir o converger flujos.

En caso de divergencia, puede dirigir a uno o múltiples flujos paralelos (rutas), dependiendo del cumplimiento de los criterios de cada flujo. El flujo predeterminado se elige si no hay ninguna condición cumplida. El flujo predeterminado está marcado con un signo de barra inclinada.

Si es necesario fusionar los flujos paralelos producidos por una puerta de enlace inclusiva divergente, debe utilizar una puerta de enlace inclusiva convergente. Esperará todos los flujos entrantes y luego continuará hacia el elemento saliente.

![inclusive gateway](../_static/images/administration/bpm/gateway-inclusive.png)

Nota: Las pasarelas divergentes y convergentes deben estar equilibradas.

Nota: Si uno de los flujos paralelos se ha terminado por algún motivo, la puerta de enlace divergente nunca se procesará. El proceso será bloqueado. Evite un diseño de diagrama de flujo que pueda provocar tal situación.

#### Parallel Gateway

Can diverge or converge flows.

In case of diverging it splits flow into multiple parallel flows. There are no parameters for this gateway type.

In case of converging it waits until all incoming flows come and then continues to the next outgoing element.

![parallel gateway](../_static/images/administration/bpm/gateway-parallel.png)

Note: Diverging and converging gateways must be balanced.

Note: If one of parallel flows has been ended for some reason then diverging gateway will never be processed. The process will be blocked. Avoid a flowchart design that can bring about such a situation.

#### Event Based Gateway

Can only diverge flows.

It stops the flow until any of outgoing events gets triggered. Triggered event determines the single flow. Other outgoing events get rejected.

Only intermediate events can be on the other end of outgoing sequence flows.

![event based gateway](../_static/images/administration/bpm/gateway-event-based.png)

### Activities

Activities are displayed as rounded rectangles.

#### Task

Task can execute following the actions:

* Create Record - creates new record of any entity type;
* Create Related Record - creates new record related to the target record;
* Update Target Record;
* Update Related Record - updates the record or records related to the target record;
* Update Created Record - updates specific field of any record created in the current process;
* Update Process Record - can be used to assign the process to specific user or team;
* Link to Another Record - links the target record with a specified record;
* Unlink from Another Record - unlinks the target record from the specified record;
* Apply Assignment Rule - assigns the target record, the process record or any record created by the process according to the specific rule;
* Create Notification - creates in-app notification for specific users;
* Make Followed - makes specific users follow the target record, the process record or any record created by the process;
* Run Service Action - runs custom service actions implemented by developers.

Actions available for task are almost the same as in Workflow feature. See more details about [workflow's actions](workflows.md#actions).

#### Send Message Task

Sends email message to specific recipient.

#### User Task

Provides a flexible ability of user interaction. It stops execution until the user (specified explicitly or by assignment rule) resolves the task. Process User Task record will be created in the system. By default there are three action types: Approve, Review, Accomplish.

* Approve type requires the user to chose between 'Approved' and 'Declined'.
* Review type gives only one option: 'Reviewed'.
* Accomplish type has two options: 'Completed' and 'Failed'.


The user assigned to the created Process User Task record will receive in-app notification. Administrator can also enable email notifications.

Users can also add Process User Tasks dashlet on their dashboard to see their actual process user tasks.

It's possible to read the resolution of the passed user task within diverging gateways or conditional events, making ramification in the process flow.

#### Script Task

Executes the script in [espo-formula](formula.md) language. All set variables (`$variableName`) will be stored and available within the process.

### Flows

#### Sequence Flow

Represented as a solid arrow. Indicates the order in which process elements will be executed.

## Conditions

Conditional events, exclusive and inclusive diverging gateways have conditions that determine the flow of the process.

Through UI there is an ability to check conditions for the following records:

* Target record;
* Records related to the target through many-to-one and children-to-parent relationships;
* Records created by the process via tasks;
* User task records, which allows checking the resolution.

It's also possible to define conditions in [Espo-formula](formula.md) language.

Conditions in BPM tool are the same as in Workflow feature. See more details about [workflow's conditions](workflows.md#conditions).

## Examples

### Example 1

![Example 1](../_static/images/administration/bpm/example-1.png)

### Example 2

![Example 2](../_static/images/administration/bpm/example-2.png)

### Example 3

![Example 3](../_static/images/administration/bpm/example-3.png)
