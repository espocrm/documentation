# Configuring Portal in Apache

It's possible to be able to access to the portal by a different URL. You need to set the *Custom URL* field in the portal record. For example, you can use your domain name `portal.my-company.com` to access the portal.


## For EspoCRM v7

Config example:

```
DocumentRoot /path_to_espo/public/portal/
Alias /client/ /path_to_espo/client/
Alias /api/v1/ /path_to_espo/public/api/v1/

<Directory /path_to_espo/>
    AllowOverride None
</Directory>

<Directory /path_to_espo/public/>
    AllowOverride All
</Directory>

<IfModule mod_rewrite.c>
    RewriteEngine On

    RewriteRule .* - [E=ESPO_PORTAL_ID:{PORTAL_ID}]
</IfModule>
```

* Change `/path_to_espo/` to the absolule path of your EspoCRM instance (e.g. it can be `/var/www/html/`).
* Change `{PORTAL_ID}` to the ID of your portal. The portal record ID can be obtained from the address bar of your web browser when you open the detail view of the portal record. E.g. in https://my-espocrm-url.com/#Portal/16b9hm41c069e6j24, *16b9hm41c069e6j24* is the portal record ID.

Note that you might also need to [setup proxy](../websocket.md#apache) for websocket for the custom portal URL.

## For EspoCRM v6 and older

It's also possible to use server configuration tools (such as mod_rewrite) to be able to access by different url. For this case, you need to fill in 'Custom URL' field.

### Access by Custom URL for Apache server

* Custom URL: `portal-host-name.com`
* Portal ID: `16b9hm41c069e6j24`

#### crm.portal.conf

```
<VirtualHost *:80>
    DocumentRoot /path/to/espocrm/instance/
    ServerName portal-host-name.com

    <Directory /path/to/espocrm/instance/>
        Options Indexes FollowSymLinks
        AllowOverride All
        Order allow,deny
        allow from all
    </Directory>

    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
```

#### Mod rewrite rules

Specify portal record ID instead of `{PORTAL_ID}`. Portal record ID can be obtained from the address bar of your web browser when you open the detail view of the portal record. Like: `https://my-espocrm-url.com/#Portal/16b9hm41c069e6j24`. *16b9hm41c069e6j24* is the portal record ID.

```
  RewriteCond %{HTTP_HOST} ^portal-host-name\.com$
  RewriteRule ^client - [L]

  RewriteCond %{HTTP_HOST} ^portal-host-name\.com$
  RewriteCond %{REQUEST_URI} !^/portal/{PORTAL_ID}/.*$
  RewriteRule ^(.*)$ /portal/{PORTAL_ID}/$1 [L]
```
