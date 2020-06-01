# Emails

> Importante. [Cron](server-configuration.md#setup-a-crontab) debe configurarse en su sistema para que funcione el correo electrónico. Puede encontrar la información en su EspoCRM en Administration > Scheduled Jobs.

## Vista General

EspoCRM tiene la capacidad de monitorear los buzones IMAP. El correo electrónico se puede archivar de dos maneras: Cuentas de correo electrónico grupales y Cuentas de correo electrónico personales. Las cuentas entrantes grupales están destinadas a buzones grupales: el caso más común es un buzón de soporte. Las cuentas de correo electrónico personales están destinadas a los buzones de correo personales de los usuarios.

A medida que se recibe un correo electrónico, el sistema intenta vincularlo con el registro apropiado (Cuentas, Plomo, Oportunidad, Caso). Los usuarios que sigan ese registro recibirán una notificación sobre un nuevo correo electrónico en el sistema, incluso si no están en A o CC.

## Cuentas de correo grupal

Solo el administrador puede configurar cuentas de correo electrónico grupales. Las cuentas de correo grupal se pueden usar para recibir y enviar correos electrónicos. El envío de correos electrónicos desde cuentas de grupo ha estado disponible desde la versión 4.9.0.

El campo Equipos determina a qué equipos se asignarán los correos electrónicos entrantes.

Si la cuenta de correo electrónico grupal tiene SMTP y se marca como compartida, un acceso será controlado por Roles a través del permiso de Cuenta de correo electrónico grupal. El campo Equipos se usará si el nivel de permiso se establece en 'equipo'.

Existe la posibilidad de que el sistema envíe una respuesta automática para los correos electrónicos entrantes.

## Email-A-Case

Existe una opción para que el sistema cree casos a partir de correos electrónicos de grupos entrantes.
Esta función está destinada a los equipos de soporte.
Los casos se pueden distribuir a los usuarios de un equipo específico de acuerdo con estas formas:
`direct assignment`, `round-robin` y `less-busy`.
Solo el primer correo electrónico en el hilo crea un nuevo caso.
Cada uno posterior se vinculará con el registro de caso existente y se mostrará en su panel de Stream.

Cuando los usuarios desean enviar una respuesta al cliente, deben asegurarse de que el caso esté seleccionado como padre del correo electrónico que se está enviando. Hará que el cliente responda a la dirección de correo electrónico del grupo en lugar de a la del usuario.

## Cuentas personales de correo electrónico

Los usuarios pueden configurar sus propias cuentas de correo electrónico que necesitan ser monitoreadas.  Emails > Top Right Dropdown Menu > Personal Email Accounts. El administrador también puede administrar las cuentas de correo electrónico de los usuarios.

## Filtros de correo electrónico

Estos permiten el filtrado de correos electrónicos entrantes según criterios específicos. por ejemplo. Si no desea que se importen mensajes de notificación enviados por alguna aplicación a EspoCRM, puede crear un filtro para hacer que EspoCRM los omita.

El administrador puede crear filtros globales, aplicados a todas las cuentas de correo electrónico. Los usuarios pueden crear filtros para su propia cuenta de correo electrónico personal y para la bandeja de entrada completa.
