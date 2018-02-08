# Transmisión

La Transmisión en EspoCRM es un feed donde puedes ver actualizaciones y nuevas adiciones para los registros que sigues. También puede publicar en una transmisión propia y transmitir otros usuarios (desde la versión 3.8.0). Hay dos tipos de transmisión en EspoCRM: secuencia de grabación y secuencia de usuario.

Por defecto las siguientes entidades tienen una transmisión: Cuentas, Contactos, Clientes potenciales, Oportunidades, Casos. Los administradores pueden habilitar o deshabilitar la transmisión de una entidad determinada en [Gerente de la Entidad](../administration/entity-manager.md).

## Registrar la Transmisión

Registrar la Transmisión se muestra en un panel de Transmisión de un cierto registro en la vista de detalles. Las publicaciones, actualizaciones y nuevas adiciones relacionadas con el registro actual se muestran aquí.

## Transmisión de Usuario

Los usuarios pueden ver su transmisión en el dashlet de Transmisión y en la pestaña de Transmisión. Los usuarios también pueden ver el flujo de otros usuarios en la vista de detalles del usuario, si tienen un acceso que está controlado por el campo de roles `Permiso del Usuario`.

En la transmisión de usuario puede ver publicaciones, actualizaciones y nuevas adiciones relacionadas con los registros que sigue el usuario. También puede ver las publicaciones dirigidas al usuario. Esas publicaciones no están relacionadas con ningún registro.

## Notificaciones

Recibirá notificaciones sobre nuevas adiciones a su transmisión que fueron causadas por otros usuarios.

## Publicaciones

Puede crear publicaciones relacionadas con un determinado registro. También puede adjuntar múltiples archivos e imágenes a su publicación. Si quiere mencionar a alguien en su publicación, solo tiene que escribir el símbolo `@` y comenzar a escribir el nombre del usuario. El usuario que ha mencionado en su publicación recibirá una notificación al respecto.

## Publicaciones a los usuarios

_Esta función está disponible desde la versión 3.8.0._

Los usuarios pueden crear publicaciones para ciertos usuarios, para ciertos equipos, para todos los usuarios y para sí mismos. Un acceso para esta habilidad está controlado por el campo `Permiso de Asignación` de Roles.

## Filtrado

Puede filtrar qué mostrar en una transmisión: `Todo`, `Publicaciones` o `Actualizaciones`.
