# Portal

Portal provides an ability to access specific crm data and functions for your customers and partners. Administrator can create multiple portals. Each portal can have its own settings, dashlboard, user list, access control settings.

To create portal follow Administration > Portals, click Create Portal button.

* `Is Active`. If not check portal won't be available for anybody.
* `Is Default`. Means that portal will be available by shorter url: http(s)://YOUR_ESPO_URL/portal.
* `Roles`. Specify one or multiple portal roles that will be applied to users logged into portal. More information about portal roles is below.
* `Tab List`. Tabs which will be shown in navigation bar.
* `Dashboard Layout`. Specify dashlets that will be displayed on the home page of the portal. Note that portal users can't configure their dashboard.
* `URL`. Read only field that displays the link you can access the portal with.

## Portal Users

Administrators can create portal users.

1. Administration > Users.
2. Click right dropdown next to Create User.
3. Click Create Portal User.
4. Select Contact the portal user will be linked with.
5. Fill the form and click save.

Portal user should be linked to Portal record to be able to access that portal.

## Portal Roles

Portal roles are similar to regular roles in EspoCRM but with a few distinctions.

* `not-set` level denies an access.
* `own` level means that the record is created by the user. E.g. portal user cased some case and this case is owned by this user.
* `account` level means that the record is related to the account the portal user is related to.
* `contact` level means that the record is related to the contact the portal user is related to.

Assigned User and Teams fields are read only for portal users.

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
