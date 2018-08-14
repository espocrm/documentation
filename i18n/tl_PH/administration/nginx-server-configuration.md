# Ang Configuration ng Nginx server para sa EspoCRM

Ang mga instruksiyon na ito ay suplimentaryo para sa [Server Configuration](server-configuration.md) na guideline. Pakatandaan na hindi lahat ng configuration setting na nakalista dito ay ginawa sa Ubunto server. 

## Mga Requirement sa PHP 

Upang ma-install ang mga kakailanganing library, patakbuhin ang mga command na ito sa isang termina: 

```
sudo apt-get update
sudo apt-get install php-mysql php-json php-gd php-mcrypt php-zip php-imap php-mbstring php-curl
sudo phpenmod mcrypt imap mbstring
sudo service nginx restart
```

## Pag-aayos ng isyu na “API Error: EspoCRM API is unavailable”:

Gawin lamang ang mga kinakailangang mga hakbang. Pagkatapos ng bawat hakbang, i-check kung naresolba na ang isyu. 

### 1. Paganahin ang mga rewrite rule sa Nginx server

Idagdag ang code na ito sa iyong Nginx server block config file (/etc/nginx/sites-available/YOUR_SITE) inside “server” block:

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

Kung wala ka ng file na ito, kailangan mo itong likhain. Para dito, mag-open ng isang terminal at patakbuhin ang command: 

```
sudo cp /etc/nginx/sites-available/default /etc/nginx/sites-available/espocrm.conf
```

At idagdag ang code the nakalista sa itaas. Para sa karagdagang impormasion kung paano i-configure ang isang bagong Virtual Host sa Nginx, pakibasa ito [ guideline](nginx-virtual-host.md).

Patakbuhin ang command na ito sa isang terminal para ma-check kung lahat ay gumagana: 

```
sudo nginx -t
```

Kung gayo, patakbuhin ang command upang muling simulan ang nginx server. 

```
sudo service nginx restart
```

### 2. Idagdag ang RewriteBase path

Buksan ang file /ESPOCRM_DIRECTORY/api/v1/.htaccess at palitan ang sumusunod na line: 

```
# RewriteBase /
```
with 

```
RewriteBase /REQUEST_URI/api/v1/
```

kung saan ang where REQUEST_URI are parte ng URL, e.g. for “http://example.com/espocrm/”, REQUEST_URI ay “espocrm”.
