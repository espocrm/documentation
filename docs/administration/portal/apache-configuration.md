# Configuring Portal in Apache

It's possible to be able to access to the Portal by a different URL. You need to set the *Custom URL* field in the Portal record. For example, you can use your domain name `portal.my-company.com` to access the Portal.


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

* Replace `/path_to_espo/` with the absolute path of your EspoCRM instance (e.g. it can be `/var/www/html/`).
* Replace `{PORTAL_ID}` with the ID of your Portal. The ID can be obtained from the address bar in your web browser when you open the detail view of the Portal record. E.g. in the URL `https://my-espocrm-url.com/#Portal/16b9hm41c069e6j24`, *16b9hm41c069e6j24* is the Portal record ID.

What this configuration does:

* Sets the *public/portal* directory as a root directory.
* Creates an alias to redirect */client/* requests to the *client* directory which is located outside of our webserver root.
* Creates an alias to redirect */api/v1/* requests to the respective directory.
* Disables *.htaccess* in the Espo root directory (as it's not needed).
* Enables *.htaccess* in the *public* directory (which defines rewrite rules for API requests).
* Enables *mod_rewrite*.
* Makes the portal ID to be passed in an environment variable to let Espo know what Portal to start (as there can be multiple Portals in Espo).

Note that if you use [WebSocket](../websocket.md), you also need to setup a [proxy](../websocket.md#apache) for the portal URL.
