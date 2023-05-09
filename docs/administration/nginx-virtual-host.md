# Configuring a Virtual Host on Nginx for EspoCRM

In this guide we will show how to configure a virtual host on Nginx for EspoCRM on Ubuntu server.

## Create a server block file

To create this file, open a terminal and run the command:

```
sudo cp /etc/nginx/sites-available/default /etc/nginx/sites-available/espocrm.conf
```

Now, open this file (`/etc/nginx/sites-available/espocrm.conf`) and modify the code following the format printed below (some settings may be different based on your configuration).

### EspoCRM v7

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

## Enable this server block

Create a symbolic link:

```
sudo ln -s /etc/nginx/sites-available/espocrm.conf /etc/nginx/sites-enabled/
````

Run this command to check if everything is fine:

```
sudo nginx -t
```

And restart Nginx server:

```
sudo service nginx restart
```

## Configure your local hosts (optional, for a local domain only)

If you added a local domain, you have to configure it on your local computer (not on the server). For Ubuntu, open the file `/etc/hosts` and add the line:

```
192.168.1.1 espocrm.local  # specify the IP address of your Nginx server
```

For Windows, please follow these [instructions](http://support.microsoft.com/kb/923947).
