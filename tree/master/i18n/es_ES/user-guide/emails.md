# Lineamientos sobre el Uso de Correos Electrónicos

EspoCRM proporciona la capacidad de buscar correos electrónicos desde el cuadro IMAP. Esto hace posible usar EspoCRM como un cliente de correo electrónico junto con características específicas de CRM.

## Cuentas IMAP

*Nota: Debe tener [cron](https://github.com/espocrm/documentation/blob/master/administration/server-configuration.md#setup-a-crontab) configurado correctamente en su sistema para tener correos electrónicos entrantes trabajando.*

El usuario puede configurar la cuenta IMAP en la página Cuentas de Correo Electrónico personales (pestaña de Correo Electrónico > menú superior derecho > Cuentas de Correo Electrónico Personales).

Especifique qué carpetas supervisar en el campo Carpetas Supervisadas. Por defecto está configurado en INBOX. Si utiliza un cliente de correo electrónico externo para enviar correos electrónicos, puede agregar la carpeta Enviados para archivar esos correos electrónicos.

*Buscar desde* le permite elegir la fecha desde la cual se deben archivar los correos electrónicos. Configúrelo para una fecha anterior a hoy si necesita archivar correos electrónicos antiguos.

Existe la posibilidad de especificar * Carpeta * en la Cuenta de Correo Electrónico Personal. Los correos entrantes se colocarán en esa carpeta.

## Cuentas SMTP

Los usuarios pueden configurar los ajustes de SMTP en Preferencias así como también en sus Cuentas de Correo Electrónico Personales. El administrador también puede permitir el uso del sistema SMTP (hazlo Compartido).

Los usuarios pueden tener múltiples cuentas SMTP (desde la versión 4.2.0). Pero las direcciones de correo electrónico que el usuario puede usar para enviar correos electrónicos están definidas por las direcciones de correo electrónico del registro *Usuario*.

## Trabajando con Correos Electrónicos

Los correos electrónicos son captados por cron (en segundo plano) cada pocos minutos (el período puede ser especificado por el Administrador).
Puede ver todos sus correos electrónicos en la pestaña Correos Electrónicos. Hay carpetas estándar de Bandeja de entrada, Enviados, Borradores de correos electrónicos en el lado izquierdo.

Campo de *Estado*. `Enviado` significa que fue enviado desde CRM, `Archivado` - extraído de la cuenta IMAP o archivado manualmente, `Borrador` - significa que el correo electrónico se creó como un borrador.

Cuando llega el nuevo correo electrónico, el sistema intenta reconocer a qué registro pertenece este correo electrónico. Puede vincularlo con Cuenta, Cliente Potencial, Oportunidad, Caso (y Contacto en modo B2C) etc. Si no fue reconocido, el usuario puede vincularlo manualmente al completar el campo *Padre*.

Si un correo electrónico proviene de un nuevo cliente potencial, el usuario puede **convertirlo a Cliente Potencial**. Abra la entrada de Correo electrónico y haga clic en Crear Cliente Potencial en el menú superior derecho.

También es posible **crear Tarea o Caso** a partir de un registro de correo electrónico.

Si las direcciones de correo electrónico (de, a, cc) en un registro de correo electrónico son conocidas por el sistema se mostrará a la persona con la que están relacionadas (Contacto, Cliente Potencial, Usuario etc.). Si alguna dirección de correo electrónico es nueva, puede **crear contacto** justo desde allí.

Todos los correos electrónicos relacionados con un registro específico se muestran en el panel Historial de ese registro. Si algún correo electrónico está relacionado, por ejemplo, con oportunidad, pero oportunidad está relacionada con la cuenta, se mostrará tanto en oportunidad como en cuenta.

## Mandando Correos Electrónicos

Puede redactar un nuevo correo electrónico de varias maneras: 
* Botón de *Escribir Correo Electrónico* en la vista de lista de Correos Electrónicos; 
* respondiendo en otro correo electrónico; 
* haciendo clic en una dirección de correo electrónico de algún registro; 
* acción *Escribir Correo Electrónico* del panel de Actividades.

Existe la posibilidad de **seleccionar la plantilla** de su correo electrónico.

Puede configurar la **firma del correo electrónico** en Preferencias.

## Carpetas de Correo Electrónico

Los usuarios pueden crear sus propias carpetas de correo electrónico para colocar algunos de los correos electrónicos para su conveniencia. La lista de carpetas disponibles está disponible en la página de Correos Electrónicos en el lado izquierdo. Para crear o editar carpetas, siga Correos Electrónicos > menú desplegable en la esquina superior derecha > Carpetas. `Omitir Notificación` significa que no se le notificará acerca de los correos electrónicos entrantes que pertenecen a la carpeta determinada. Al utilizar los Filtros de Correo Electrónico es posible colocar los correos electrónicos en carpetas automáticamente según criterios específicos.

## Filtros de Correo Electrónico

El administrador puede crear filtros de correo electrónico globales para omitir correos electrónicos no deseados. Están disponibles en Administración > Filtros de correo electrónico.

El usuario habitual puede crear filtros de correo electrónico para sus Cuentas de Correo Electrónico Personales o para su bandeja de entrada completa. Están disponibles en Correos Electrónicos > menú desplegable en la esquina superior derecha > Filtros.

Hay dos tipos de filtros: 
* Omitir - el correo electrónico se colocará en *Papelera* o no se importará si el filtro está relacionado con la Cuenta de Correo Electrónico Personal; 
* Poner en carpeta - los correos electrónicos importados se colocarán automáticamente en la carpeta de usuario especificada.

## Plantillas de Correo Electrónico

Las plantillas de Correo Electrónico están disponibles en Correo Electrónico > menú desplegable en la esquina superior derecha > Plantillas de Correo Electrónico. Se pueden usar tanto para envíos masivos de correos electrónicos como para correos electrónicos regulares. La casilla de verificación `One-off` significa que la plantilla de correo electrónico se utilizará solo una vez, lo que es habitual para el marketing por correo electrónico.

Es posible usar colocadores de carpeta en el cuerpo de la plantilla del correo electrónico y el sujeto por ejemplo. {Account.name}, {Person.emailAddress}. Serán reemplazados por valores de registros relacionados.

Puede utilizar colocadores de carpetas reservados adicionales en el cuerpo de la plantilla: {optOutUrl} y {optOutLink}.
```

<a href="{optOutUrl}">Cancelar subscripción</a>
```

Este es un enlace para cancelar la suscripción al correo electrónico masivo.
