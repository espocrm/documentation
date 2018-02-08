# Gestión de Roles

## Visión de Conjunto

Para restringir el acceso de algunos usuarios, debes usar Roles. El administrador puede administrar roles en el panel de administración. Cada rol define un acceso a ciertas áreas (ámbitos) que se aplica a los usuarios que poseen ese rol.

Un usuario puede tener múltiples roles. Esos roles se pueden seleccionar para un usuario específico (campo 'Roles' en la entrada de Usuario) y/o heredarse de los equipos a los que pertenece el usuario.

Si un usuario tiene múltiples roles, se fusionarán para que la regla permisiva tenga una mayor prioridad. Eso le permite al administrador administrar el control de nivel de acceso de manera fácil y flexible.

Es posible ver qué permisos se aplican a un determinado usuario haciendo clic en el botón "Acceso" en la vista de detalles del usuario.

![1](../_static/images/administration/roles-management/scope-level.png)


## Ejemplo

Por ejemplo, el usuario pertenece al equipo 'Ventas'. Ese equipo tiene el rol único 'Vendedor'. Entonces, todos los usuarios de este equipo obtendrán el rol de 'vendedor'.

La función 'Vendedor' se define de la siguiente manera:

Liderar:
```
create - yes
read – team
edit – own
delete – no
stream - team
```

Oportunidad:
```
create - yes
read – team
edit – own
delete – no
stream - team
```

Los usuarios solo podrán leer los clientes potenciales y las oportunidades que pertenecen al equipo del "Departamento de ventas" (campo "Equipos").
El usuario solo podrá editar aquellos clientes potenciales y oportunidades a los que están asignados o aquellos que han creado.
Los usuarios no podrán eliminar ninguna ventaja u oportunidad.

Queremos otorgar más derechos a un determinado usuario que tenga un puesto de gerente de ventas en la empresa. Este empleado debe tener la capacidad de leer/editar/ eliminar todos los registros del equipo de "Ventas". El usuario debe pertenecer a nuestro equipo de 'Ventas'. Pero necesitamos crear la nueva función 'Gerente de ventas' y seleccionar esta función para ese usuario en el campo 'Roles'.

La función 'Gerente de ventas' se define de la siguiente manera:

Liderar:
```
create - yes
read – team
edit – team
delete – team
stream - team
```

Opportunidad:
```
create - yes
read – team
edit – team
delete – team
stream - team
```

Nuestro usuario podrá gestionar todas las oportunidades y oportunidades del equipo de "Ventas".

## Permisos Especiales

### Permiso de Asignación

Establezca este parámetro para restringir la capacidad de reasignar registros a otro usuario y/o equipos. Si configura `team`- entonces será posible asignar solo a usuarios de su (s) propio (s) equipo (s). Si `no` - los usuarios no podrán reasignar en absoluto.

También define si el usuario puede publicar en la transmisión de otros usuarios/equipos.

### Permiso del Usuario

Permite restringir la capacidad de los usuarios para ver actividades, calendario y transmisión de otros usuarios.

### Permiso del Portal

Define un acceso a la información del portal, la capacidad de publicar mensajes a los usuarios del portal.

### Permiso de Cuenta de Correo Electrónico Grupal

Define un acceso a cuentas de correo electrónico grupales, la capacidad de enviar correos electrónicos del grupo SMTP.

### Permiso de Exportación

Defiende si el usuario tiene la capacidad de exportar registros. (desde la versión 4.9.0)

## Permisos por Defecto

Por defecto (si no hay ninguno aplicado) los usuarios pueden leer y editar todos los registros. Pero no puede eliminar ninguno excepto aquellos que han creado y que están asignados al mismo tiempo.

Existe la posibilidad de restringir un acceso aplicado por defecto al habilitar 'ACL Strict Mode' en Administración> Configuración.

## Seguridad de Nivel de Campo

Permite controlar un acceso para un campo específico.

De manera predeterminada, el usuario puede leer todos los campos si puede leer el registro. El usuario puede editar cualquier campo si se puede editar el registro. Puede restringir el acceso a campos específicos usando Seguridad de Nivel de Campo.

En la vista de edición de un registro de roles en la sección Nivel de campo, haga clic en el icono más junto al alcance específico, luego seleccione el campo necesario. Luego podrá especificar el nivel de acceso para las acciones `read` y `edit`. Hay para las opciones: `yes` y `no`.

![2](../_static/images/administration/roles-management/field-level-secutiry.png)
