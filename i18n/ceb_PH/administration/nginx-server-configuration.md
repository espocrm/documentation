# Ang Nginx server configuration para sa EspoCRM

Ang kani nga mga instruction kay pampuno lang sa [Server Configuration](server-configuration.md) nga mga guideline. Palihug timan-e nga ang tanang mga configuration setting nga gilista diri kay gihimo sa Ubuntu nga server.

## Mga PHP requirement

Para ma-install ang tanang gikinahanglan nga mga library, ipadagan ang kani nga mga command ngadto sa terminal:

```
sudo apt-get update
sudo apt-get install php-mysql php-json php-gd php-mcrypt php-zip php-imap php-mbstring php-curl
sudo phpenmod mcrypt imap mbstring
sudo service nginx restart
```

## Pag-ayo sa issue nga “API Error: EspoCRM API is unavailable”:

Himoa ra ang mga gikinahanglan nga mga lakang. Pagkahuman sa tagsa tagsa ka mga lakang, e-check kung na resolba naba ang problema.

### 1. I-enable ang mga rewrite rule sa Nginx server

Ipuno ni nga code sa imohang Nginx server block config nga file (/etc/nginx/sites-available/IMOHANG_SITE) sulod sa “server” nga bloke:

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

Kung wala ka ani nga file, gikinahanglan ka muhimo niini. Para mahimo ni, pag-abli og terminal ug ipadagan ni nga mga command.

```
sudo cp /etc/nginx/sites-available/default /etc/nginx/sites-available/espocrm.conf
```

Ug ipuno ang mga code nga nakalista sa taas. Para sa dugang pa nga mga impormasyon kung unsaon pag-configure sa usa ka bag-o nga Virtual Host sa Nginx, palihug ug basa ani nga [ guideline](nginx-virtual-host.md).

Ipadagan ni nga command sa usa ka terminal para e-check kung ang tanan kay maayo ra.

```
sudo nginx -t
```

Kon mao, ipadagan ang command para ma-restart ang nginx nga server:

```
sudo service nginx restart
```

### 2. Pagdungag og RewriteBase path

Pag-abli og file sa /ESPOCRM_DIRECTORY/api/v1/.htaccess ug ilisi ang mga musnod nga linya:

```
# RewriteBase /
```
og

```
RewriteBase /REQUEST_URI/api/v1/
```

kung asa ang REQUEST_URI kay usa ka parte sa URL, e.g. para sa “http://example.com/espocrm/”, ug ang REQUEST_URI kay “espocrm”.
