# Correos electrónicos

Importante. [Cron](https://github.com/espocrm/documentation/blob/master/administration/server-configuration.md#setup-a-crontab) debería ser configurado en su sistema para que sirva la opción que permite obtener nuevos correos electrónicos. Usted puede encontrar la información en su EspoCRM en Administración > Trabajos Planeados.

## Vista general

EspoCRM tiene la habilidad de monitorear los buzones de correo IMAP. Los correos electrónicos pueden ser archivados en 2 maneras: en Cuentas Grupales de correo Electrónico de Gmail y Cuentas Personales de Correos Electrónicos. Cuentas de Grupos Entrantes están pensadas para los buzones de correo electrónico grupales: el caso más común es un buzón de soporte. Las Cuentas de Correo Electrónico personales son pensadas para el uso de los buzones de correo electrónico personales. 

Cuando un correo electrónico viene en camino, el sistema trata de enlazarlo con el registro apropiado (Cuentas, Pista, Oportunidad, Caso,). Los usuarios que sigan ese registro recibirán una notificación sobre un nuevo correo electrónico en el sistema, incluso  si ellos no están en las opciones Para o CC. 

## Cuentas de Correo Electrónico Grupales 

Solo el Adminsitrador puede configurar las Cuentas de Correo Electrónico Grupales. Las Cuentas de Correo Electrónico grupales pueden ser usadas tanto para recibir como para enviar correos electrónicos. Enviar correos electrónicos desde cuentas grupales ha estado disponible desde la versión 4.9.0.

El campo de los equipos va a determinar a cual equipo se le asigna los correos electrónicos que vienen llegando. 

Si la cuenta de correo electrónico grupal tiene un SMTP y está chequeado como compartido entonces un acceso va a ser controlaso por Roles por medio del permiso de la Cuenta de Correo Electrónico grupal. El campo de los equipos será usado si el nivel de permiso es fijado en 'equipo'.

Hay una habilidad para hacer que el sistema envía un respuesta automática para correos electrónicos que vienen llegando. 

## Correo-Electrónico-para-el-Caso 

Hay una opción para hacer que el sistema cree casos de los correos electrónicos que vienen llegando.
Está característica está pensada para los equipos de soporte.
Los casos pueden ser distribuidos a los usuarios desde un equipo específico, según estas maneras:
`direct assignment`, `round-robin` and `less-busy`.
Solo el primer correo electrónico en el hilo puede crear un nuevo caso.
Cualquier correo electrónico subsequente, será enlazado al registro existente del caso y será mostrado en su panel de Stream. 

Cuando los usuarios quieran enviar una respuesta al cliente ellos necesitan asegurarseque el caso es seleccionado como un padre del correo electrónico que está siendo enviado. Esto hará  que el cliente responda al dirección de correo electrónico del grupo en vez de a la dirección del propio usuario.  

## Cuentas de Correo Electrónico Personales

Los usuarios pueden configurar sus propias cuentas de correo electrónico que necesiten ser monitoreadas. Correos electrónicos > 
Menú Desplegable Arriba a la Derecha > Cuentas de Correo Electrónico Personales. El administrador también puede gestionar las cuentas de correo electrónico de los usuarios.

## Filtros para Correo Electrónico

Estos ayudan a filtrar la llegada de correos electrónicos de acuerdo a un criterio específico. Por ejemplo, si usted no desea que los mensajes de notificación enviados por alguna aplicación sean importados a EspoCRM usted puede crear un filtro para hacer qie EspoCRM los omita. 

El administrador puede crear filtros globales, aplicados a todas las cuentas de correo electrónico. Los usuarios pueden crear filtros para sus propias cuentas de correo electrónico personales y para todo el buzón de entrada. 

Admin can create global filters, applied to all email accounts. Users can create filters for their own personal email account and for entire inbox.
