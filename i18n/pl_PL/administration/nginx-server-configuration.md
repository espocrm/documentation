# Nginx server configuration for EspoCRM

These instructions are supplementary to the [Server Configuration](server-configuration.md) guideline. Please note that all configuration settings listed here are made on Ubuntu server.

## PHP requirements

To install all necessary libraries, run these commands in a terminal:

```
sudo apt-get update
sudo apt-get install php-mysql php-json php-gd php-mcrypt php-zip php-imap php-mbstring php-curl
sudo phpenmod mcrypt imap mbstring
sudo service nginx restart
```

## Fixing the issue “API Error: EspoCRM API is unavailable”:

Take only necessary steps. After each step check if the issue is solved.

### 1. Enable rewrite rules in Nginx server

Add this code to your Nginx server block config file (/etc/nginx/sites-available/YOUR_SITE) inside “server” block:

```
server {   
    # ...
    
    client_max_body_size 50M;
    
    location / {
        try_files $uri $uri/ /index.php?$query_string;
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

If you don’t have this file, you have to create it. For this open a terminal and run the command:

```
sudo cp /etc/nginx/sites-available/default /etc/nginx/sites-available/espocrm.conf
```

And add the code listed above. For more information on how to configure a new Virtual Host on Nginx, please read this [ guideline](nginx-virtual-host.md).

Run this command in a terminal to check if everything is fine:

```
sudo nginx -t
```

If so, run the command to restart nginx server:

```
sudo service nginx restart
```

### 2. Add RewriteBase path

Open a file /ESPOCRM_DIRECTORY/api/v1/.htaccess and replace the following line:

```
# RewriteBase /
```
with 

```
RewriteBase /REQUEST_URI/api/v1/
```

where REQUEST_URI is a part of URL, e.g. for “http://example.com/espocrm/”, REQUEST_URI is “espocrm”.
