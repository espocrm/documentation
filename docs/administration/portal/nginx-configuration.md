# Configuring Portal in Nginx

It's possible to be able to access to the Portal by a different URL. You need to set the Custom URL field in the Portal record. For example, you can use your domain name `portal.my-company.com` to access the Portal.

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

* Replace `path-to-espo` with the absolute path to your EspoCRM instance.
* Replace `{PORTAL_ID}` with the ID of your Portal. The Portal record ID can be obtained from the address bar of your web browser when you open the detail view of the Portal record. For example, in *https://my-espocrm-url.com/#Portal/16b9hm41c069e6j24*, 16b9hm41c069e6j24 is the Portal record ID.
