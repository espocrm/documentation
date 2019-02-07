# Конфигурация сервера Nginx для EspoCRM

Эти инструкции являются дополнительными к руководству по [Server Configuration](server-configuration.md). Обратите внимание, что все перечисленные здесь параметры конфигурации выполняются на сервере Ubuntu.

## Требования PHP

Чтобы установить все необходимые библиотеки, выполните следующие команды в терминале:

```
sudo apt-get update
sudo apt-get install php-mysql php-json php-gd php-zip php-imap php-mbstring php-curl
sudo phpenmod imap mbstring
sudo service nginx restart
```

## Исправление проблемы «Ошибка API: API EspoCRM недоступен»:


Принимайте только необходимые меры. После каждого шага проверяйте, решена ли проблема.

### 1. Включите правила перезаписи на сервере Nginx

Добавьте этот код в файл конфигурации блока вашего сервера Nginx (/etc/nginx/sites-available/YOUR_SITE) внутри блока «server»:
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

Если у вас нет этого файла, вы должны его создать. Для этого откройте терминал и выполните команду:

```
sudo cp /etc/nginx/sites-available/default /etc/nginx/sites-available/espocrm.conf
```

И добавьте код, указанный выше. Для получения дополнительной информации о том, как настроить новый виртуальный хост в Nginx, пожалуйста, прочитайте это [руководство](nginx-virtual-host.md).

Запустите эту команду в терминале, чтобы проверить, все ли в порядке:

```
sudo nginx -t
```

Если это так, выполните команду для перезапуска сервера nginx:

```
sudo service nginx restart
```

### 2. Добавьте путь RewriteBase

Откройте файл /ESPOCRM_DIRECTORY/api/v1/.htaccess и замените следующую строку:

```
# RewriteBase /
```
на 

```
RewriteBase /REQUEST_URI/api/v1/
```

где REQUEST_URI является частью URL, например, для «http://example.com/espocrm/» REQUEST_URI - «espocrm».
