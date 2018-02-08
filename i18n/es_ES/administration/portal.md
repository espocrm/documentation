# Portal

Portal proporciona la capacidad de acceder a datos y funciones de crm específicos para sus clientes y socios. El administrador puede crear múltiples portales. Cada portal puede tener su propia configuración, dashlboard, lista de usuarios, configuración de control de acceso.

Para crear un portal, siga Administración> Portales, haga clic en el botón Crear portal.

* `is active`. Si no, el portal de verificación no estará disponible para nadie.
* `is default`. Significa que el portal estará disponible por URL más corta: http (s): // YOUR_ESPO_URL / portal.
* `Roles`. Especifique uno o varios roles del portal que se aplicarán a los usuarios que hayan iniciado sesión en el portal. Más información sobre los roles del portal a continuación.
* `Tab List`. Pestañas que se mostrarán en la barra de navegación.
* `Dashboard Layout` . Especifique los dashlets que se mostrarán en la página de inicio del portal. Tenga en cuenta que los usuarios del portal no pueden configurar su tablero.
* `URL`. Campo de solo lectura que muestra el enlace al que puede acceder el portal.

## Usuarios del portal

Los administradores pueden crear usuarios del portal.

1. Administración> Usuarios.
2. Haz clic en el menú desplegable a la derecha junto a Crear usuario.
3. Haga clic en Crear usuario del portal.
4. Seleccione Contactar con el que se vinculará el usuario del portal.
5. Rellene el formulario y haga clic en guardar.

El usuario del portal debe estar vinculado al registro del Portal para poder acceder a ese portal.

## Roles del portal

Los roles del portal son similares a los roles regulares en EspoCRM pero con algunas distinciones.

* el nivel `not-set` niega un acceso.
* el nivel `own` significa que el registro es creado por el usuario. P.ej. el usuario del portal presentó un caso y este caso pertenece a este usuario.
* nivel de `account` significa que el registro está relacionado con la cuenta con la que el usuario del portal está relacionado.
* nivel de `contact` significa que el registro está relacionado con el contacto con el que está relacionado el usuario del portal.

Los campos de Usuario asignado y Equipos son de solo lectura para usuarios del portal.

### Example

`Portal users should be able to create cases, view cases related to their account; they should be able to view knowledge base.`

1. Open Create Portal Role form (Administration > Portal Roles > Create Role).
2. Enable access to Cases, set: `create - yes, read - account, edit - no, delete - no, stream - account`.
3. Enable access to Knowledge Base, set `create - no, read - account, edit - no, delete - no`.
4. Edit your portal record (Administration > Portals). Select your portal role in Roles field and then save.

## Access to Portal

You can find the url for your portal in 'URL' field of the portal record. Also it's possible to use server configuration tools (such mod_rewrite) to be able to access by different url. For this case you need to fill in 'Custom URL' field.

### Access portal by Custom URL for Apache server

Custom URL: my-portal-host-name.com.

#### crm.portal.conf
```
<VirtualHost *:80>
	DocumentRoot /path/to/espocrm/instance/
	ServerName my-portal-host-name.com

    <Directory /path/to/espocrm/instance/>
        Options Indexes FollowSymLinks
        AllowOverride All
        Order allow,deny
        allow from all
    </Directory>

	ErrorLog ${APACHE_LOG_DIR}/error.log
	CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>

ServerAlias my-portal-host-name.com

```

#### Mod rewrite rules

Specify portal record ID instead of `{PORTAL_ID}`. Portal record ID can is avaialble in address bar of your web browser when you open detail view of the portal record. Like: https://my-espocrm-url.com/#Portal/16b9hm41c069e6j24. 16b9hm41c069e6j24 is a portal record id.

```
  RewriteCond %{HTTP_HOST} ^portal-host-name.com$
  RewriteRule ^client - [L]

  RewriteCond %{HTTP_HOST} ^portal-host-name.com$
  RewriteCond %{REQUEST_URI} !^/portal/{PORTAL_ID}/.*$
  RewriteRule ^(.*)$ /portal/{PORTAL_ID}/$1 [L]
```
