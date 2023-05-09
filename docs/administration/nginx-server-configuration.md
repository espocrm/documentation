# Nginx server configuration for EspoCRM

These instructions are supplementary to the [server configuration](server-configuration.md) guidelines. Note that all configuration settings listed here are made on Ubuntu server.

## PHP requirements

To install all necessary libraries, run these commands in a terminal:

```
sudo apt-get update
sudo apt-get install php-mysql php-json php-gd php-zip php-imap php-mbstring php-curl php-exif php-ldap
sudo phpenmod imap mbstring
sudo service nginx restart
```

## Server configuration

Nginx config file example:

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

    root /path-to-espo/public; # path to public dir

    location /client {
        root /path-to-espo; # path to espocrm root dir
        autoindex off;

        location ~* ^.+.(js|css|png|jpg|svg|svgz|jpeg|gif|ico|tpl)$ {
            access_log off;
            expires max;
        }
    }

    location = /favicon.ico { access_log off; log_not_found off; }
    location = /robots.txt  { access_log off; log_not_found off; }

    location ~ \.php$ {
        fastcgi_pass espocrm-php:9000;
        include fastcgi_params;
        fastcgi_index index.php;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        fastcgi_param QUERY_STRING $query_string;
    }

    location /api/v1/ {
        if (!-e $request_filename){
            rewrite ^/api/v1/(.*)$ /api/v1/index.php last; break;
        }
    }

    location /portal/ {
        try_files $uri $uri/ /portal/index.php?$query_string;
    }

    location /api/v1/portal-access {
        if (!-e $request_filename){
            rewrite ^/api/v1/(.*)$ /api/v1/portal-access/index.php last; break;
        }
    }

    location ~ /(\.htaccess|\web.config|\.git) {
        deny all;
    }
}
```

You need to change `/path-to-espo` to the absolute path of your EspoCRM instance.

Config file path: `/etc/nginx/sites-available/YOUR_SITE`. If you don’t have this file, you have to create it. For this open a terminal and run the command:

```
sudo cp /etc/nginx/sites-available/default /etc/nginx/sites-available/espocrm.conf
```

For more information on how to configure a new Virtual Host on Nginx, please read this [guidelines](nginx-virtual-host.md).

Run this command in a terminal to check if everything is fine:

```
sudo nginx -t
```

If so, run the command to restart nginx server:

```
sudo service nginx restart
```

## See also

To configure a new Virtual Host on Nginx, please read this [guidelines](nginx-virtual-host.md).
