# Configuring Portal in Nginx

It's possible to be able to access to the portal by a different URL. You need to set the Custom URL field in the portal record. For example, you can use your domain name `portal.my-company.com` to access the portal.

## For EspoCRM v7

Config example:

```
server {
    listen 80 default_server;
    listen [::]:80 default_server;

    server_name localhost; # domain name

    charset utf-8;
    index index.html index.php;

    client_max_body_size 50M;

    keepalive_timeout 300;
    types_hash_max_size 2048;

    server_tokens off;
    fastcgi_send_timeout 300;
    fastcgi_read_timeout 300;

    gzip on;
    gzip_types text/plain text/css text/javascript application/javascript application/json;
    gzip_min_length 1000;
    gzip_comp_level 9;
    
    root /path-to-espo/public/portal; # path to `public/portal` dir

    location /client {
        root /path-to-espo; # no trailing slash needed
        autoindex off;

        location ~* ^.+.(js|css|png|jpg|jpeg|gif|ico|tpl)$ {
            access_log off;
            expires max;
        }
    }

    location /api {
        root /path-to-espo/public; # path to `public` dir
        autoindex off;

        location ~ \.php$ {
            fastcgi_pass espocrm-php:9000;
            include fastcgi_params;
            fastcgi_index index.php;
            fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
            fastcgi_param QUERY_STRING $query_string;
        }

        location /api/v1/portal-access {
            if (!-e $request_filename){
                rewrite ^/api/v1/portal-access/(.*)$ /api/v1/portal-access/index.php last; break;
            }
        }
    }

    location ~ \.php$ {
        fastcgi_pass espocrm-php:9000;
        include fastcgi_params;
        fastcgi_index index.php;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        fastcgi_param QUERY_STRING $query_string;

        fastcgi_param ESPO_PORTAL_ID {PORTAL_ID}; # portal ID
        fastcgi_param ESPO_PORTAL_IS_CUSTOM_URL "true";
    }

    location ~ /(\.htaccess|\web.config|\.git) {
        deny all;
    }
}
```

* Change `path-to-espo` to the absolute path of your EspoCRM instance.
* Change `{PORTAL_ID}` to the ID of your portal. Portal record ID can be obtained from the address bar of your web browser when you open the detail view of the portal record. Like: https://my-espocrm-url.com/#Portal/16b9hm41c069e6j24. 16b9hm41c069e6j24 is the portal record ID.

## For EspoCRM v6 and older


* Custom URL: `portal-host-name.com`
* Portal ID: `5a8a9b9328e6a955b`

#### crm.portal.conf
```
server {
    listen 80;
    listen [::]:80;

    server_name portal-host-name.com; # Replace portal-host-name to your domain name
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
        fastcgi_param ESPO_PORTAL_IS_CUSTOM_URL "true";
        include snippets/fastcgi-php.conf;
    }

    # Add rewrite rules
    location /client {
        rewrite ^/client/(.*) /client/$1 break;
    }

    location / {
        proxy_pass http://portal-host-name.com/portal/5a8a9b9328e6a955b/;
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

    location ^~ (data|api)/ {
        if (-e $request_filename){
            return 403;
        }
    }
    
    location ^~ /data/ {
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
