# Correo Electrónico Masivo

## Cómo enviar correos masivos

Necesita tener al menos una Lista de Objetivos con registros de objetivos y una Plantilla de Correo Electrónico en su crm.

1. Crea una nueva campaña con un estado `Correo electrónico` u `Hoja Informativa`. Seleccione una o algunas listas de objetivos en el campo `Listas de Objetivos`.
2. Después de que el registro de campaña es creado, cree un Correo Electrónico Masivo para esta campaña: haga clic en más en el panel de Correo Electrónico Masivo. Especifique _Fecha Inicio_ - cuando se deben enviar correos electrónicos, y seleccione _Plantilla de Correo Electrónico_. Asegúrate de que _Estado_ esté configurado como `Pendiente`.

Si todo está configurado correctamente, los correos electrónicos deberían apagarse. Deberían enviarse cada hora con porciones (puede cambiar el tamaño de la porción en Administración > Correos Electrónicos Salientes). El administrador puede cambiarlo actualizando el campo `Programación` de la tarea programada `Verificar Cuentas de Correo Electrónico Grupales`.

Puede verificar si los correos electrónicos se envían en el panel de registro.

## Prueba lo que se enviará a los destinatarios

Haga clic en el menú desplegable de la derecha en la fila de correo electrónico masivo en el panel _Correo Electrónico Masivo_ y luego haga clic en _Enviar prueba_.

## Iniciar Sesión

En el registro puedes ver:
* Email enviado;
* Correos electrónicos abiertos por el destinatario;
* Enlaces clickeados por el destinatario;
* Destinatarios que optaron por salir;
* Mensajes de correo electrónico devueltos (no entregados al destinatario).

## Enlace de exclusión

De manera predeterminada, el sistema agregará la opción de exclusión voluntaria a todos los correos electrónicos enviados. Pero puede usar uno personalizado en su Plantilla de Correo Electrónico.

Ejemplo:
```html
<a href="{optOutUrl}">Cancelar la suscripción a la lista de correo.</a>
```

El administrador puede inhabilitar el enlace de exclusión voluntaria que el sistema agrega en Administración > Correos Electrónicos Salientes.

## URL de Rastreo

Si desea saber que su destinatario abrió el enlace desde su correo electrónico, debe crear la URL de seguimiento. Especifique cualquier _Nombre_ y _URL_ a dónde debería conducir su enlace. Luego, deberá pegar el código generado en su Plantilla de Correo Electrónico.

Ejemplo:
  ```html
<a href="{trackingUrl:55f2c87b09a220a78}">Pruebe nuestra demostración</a>
  ```

## Listas de Objetivos

Las Listas de Objetivos contienen las listas de Cuentas, Contactos, Clientes Potenciales y Registros de Usuarios.

Los usuarios pueden completar manualmente las listas de objetivos usando la acción _Seleccionar_ en el panel correspondiente en la vista detallada de la Lista de Objetivos. Existe la habilidad de filtrar y luego seleccionar todos los resultados de la búsqueda.

## Poblar Listas de objetivos con Informes

La función [Reportes](reports.md#sincronización-con-listas-de-objetivos) proporciona la capacidad de rellenar listas de objetivos con registros que coincidan con criterios específicos.

## Excluir Listas de Objetivos

Especifique la Exclusión de Listas de Objetivos para evitar el envío masivo de correos electrónicos a ciertos destinatarios. Si hay un registro con la dirección de correo electrónico que coincida con la dirección de correo electrónico de cualquier registro excluido, también se excluirá el primer registro.

## Registro de Campaña

En el Registro de Campaña puede ver los correos electrónicos que se han enviado, los correos electrónicos abiertos, los correos electrónicos devueltos, los que se han excluido y quienes han hecho clic en el enlace del correo electrónico. Es posible utilizar este registro creando Lista de Objetivos (menú desplegable en la esquina superior derecha del panel) según los archivos del registro. Por ejemplo, selecciona solo los contactos que hicieron clic en el enlace (URL de rastreo).

## Solución de Problemas

_Para los Administradores_

#### ¿Qué hacer si no se envían correos electrónicos?

1. Compruebe si funciona _Envío de Pruebba_. Si no funciona, verifique si la configuración SMTP del sistema es correcta.
2. Compruebe si tiene configurado cron para su sistema.
3. Verifique si tiene el Trabajo Programado `Enviar correos electrónicos masivos` y está `Activo` (Administración > Trabajos Programados > Enviar Correos Electrónicos Masivos). Verifica si hay algo en el Registro.

#### ¿Qué pasa si la URL de Rastreo tiene una URL incorrecta que no conduce a su crm?

Compruebe el parámetro 'siteUrl' en el archivo `data/config.php`. Debe establecerse como URL de su EspoCRM accesible desde el mundo externo.

#### Los correos electrónicos devueltos no se registran

Los correos electrónicos devueltos solo pueden ser manejados por una cuenta de correo electrónico grupal. Asegúrese de tener una cuenta de correo electrónico grupal que supervise los correos electrónicos devueltos del buzón a los que se envía.

Además algunos proveedores de servidores de correo pueden desviarse de los estándares, por lo que no se pueden distinguir los correos electrónicos devueltos.
