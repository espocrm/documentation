# Portal

Portal provides an ability to access specific crm data and functions for your customers and partners. Administrators can create multiple portals. Each portal can have its own settings, dashboard, user list, access control settings.

To create portal follow Administration > Portals, click Create Portal button.

* `Is Active`. If not checked, portal won't be available for anybody.
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

* not-set ‒ Denies an access.
* own ‒ Records created by the user. E.g. portal user cased some case and this case is owned by this user.
* account ‒ Records related to the account the portal user is related to. Relation (link) should be named `account` or `accounts`.
* contact ‒ Records related to the contact the portal user is related to. Relation (link) should be named `contact` or `contacts`.

Assigned User and Teams fields are read only for portal users.

### Example

`Portal users should be able to create cases, view cases related to their account; they should be able to view knowledge base.`

1. Open Create Portal Role form (Administration > Portal Roles > Create Role).
2. Enable access to Cases, set: `create - yes, read - account, edit - no, delete - no, stream - account`.
3. Enable access to Knowledge Base, set `create - no, read - account, edit - no, delete - no`.
4. Edit your portal record (Administration > Portals). Select your portal role in Roles field and then save.

## Access to Portal

You can find the url for your portal in 'URL' field of the portal record. It's also possible to use server configuration tools (such mod_rewrite) to be able to access by different url. For this case you need to fill in 'Custom URL' field.

### Access portal by Custom URL for Apache server

Custom URL: portal-host-name.com.

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

Specify portal record ID instead of `{PORTAL_ID}`. Portal record ID is available in address bar of your web browser when you open detail view of the portal record. Like: https://my-espocrm-url.com/#Portal/16b9hm41c069e6j24. 16b9hm41c069e6j24 is a portal record id.

```
  RewriteCond %{HTTP_HOST} ^portal-host-name\.com$
  RewriteRule ^client - [L]

  RewriteCond %{HTTP_HOST} ^portal-host-name\.com$
  RewriteCond %{REQUEST_URI} !^/portal/{PORTAL_ID}/.*$
  RewriteRule ^(.*)$ /portal/{PORTAL_ID}/$1 [L]
```

### Access portal by Custom URL for Nginx server

Custom URL: portal-host-name.com.   
Portal ID: 5a8a9b9328e6a955b.

#### crm.portal.conf
```
server {
    listen 80;
    listen [::]:80;
 
    server_name portal-host-name.com; # Replace espocrm.local to your domain name
    root /var/www/html/espocrm; # Specify your EspoCRM document root
 
    index index.php index.html index.htm;
 
    # SSL configuration
    #
    # listen 443 ssl;
    # listen [::]:443 ssl;
    # include snippets/snakeoil.conf;    
 
    # Specify your PHP (php-cgi or php-fpm) based on your configuration
    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
 
        # With php7.3-cgi alone:
        # fastcgi_pass 127.0.0.1:9000;
 
        # With php7.3-fpm:
        fastcgi_pass unix:/run/php/php7.3-fpm.sock;
    }    
 
    # Add rewrite rules
    location /client {
        rewrite ^/client/(.*) /client/$1 break;
    }

    location / {
        proxy_pass http://asd.com/portal/5a8a9b9328e6a955b/;
    }
 
    location /api/v1/ {
        if (!-e $request_filename){
            rewrite ^/api/v1/(.*)$ /api/v1/index.php last; break;
        }
    }

    location /api/v1/portal-access {
        if (!-e $request_filename){
            rewrite ^/api/v1/(.*)$ /api/v1/portal-access/index.php last; break;
        }
    }

    location /portal/ {
        try_files $uri $uri/ /portal/index.php?$query_string;
    }
 
    location ~ /reset/?$ {
        try_files /reset.html =404;
    }
 
    location ^~ (data|api)/ {
        if (-e $request_filename){
            return 403;
        }
    }
    location ^~ /data/logs/ {
        deny all;
    }
    location ^~ /data/\.backup/ {
        deny all;
    }
    location ^~ /data/config.php {
        deny all;
    }
    location ^~ /data/cache/ {
        deny all;
    }
    location ^~ /data/upload/ {
        deny all;
    }
    location ^~ /application/ {
        deny all;
    }
    location ^~ /custom/ {
        deny all;
    }
    location ^~ /vendor/ {
        deny all;
    }
    location ~ /\.ht {
        deny all;
    }
}
```

## See also

[Portal ACL customization](../development/acl.md#portal-acl)
