# Настройка виртуального хоста на Nginx для EspoCRM

В этом руководстве мы покажем, как настроить виртуальный хост на Nginx для EspoCRM на сервере Ubuntu.

## Создайте файл блока сервера

Чтобы создать этот файл, откройте терминал и выполните команду:

```
sudo cp /etc/nginx/sites-available/default /etc/nginx/sites-available/espocrm.conf
```

Теперь откройте этот файл (/etc/nginx/sites-available/espocrm.conf) и измените код в соответствии с форматом, приведенным ниже (некоторые параметры могут отличаться в зависимости от вашей конфигурации): 

```
server {
    listen 80;
    listen [::]:80;
 
    server_name espocrm.local; # Replace espocrm.local to your domain name
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
 
        # With php7.0-cgi alone:
        # fastcgi_pass 127.0.0.1:9000;
 
        # With php7.0-fpm:
        fastcgi_pass unix:/run/php/php7.0-fpm.sock;
    }    
 
    # Add rewrite rules
    location / {
        try_files $uri $uri/ =404;
    }
 
    location /api/v1/ {
        if (!-e $request_filename){
            rewrite ^/api/v1/(.*)$ /api/v1/index.php last; break;
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

## Включите этот блок сервера

Создайте символическую ссылку:

```
sudo ln -s /etc/nginx/sites-available/espocrm.conf /etc/nginx/sites-enabled/
````

Запустите эту команду, чтобы проверить, все ли в порядке:

```
sudo nginx -t
```

И перезапустите сервер Nginx:

```
sudo service nginx restart
```

## Настройте локальные хосты (необязательно, только для локального домена)

Если вы добавили локальный домен, вы должны настроить его на локальном компьютере (не на сервере). Для Ubuntu откройте файл `/etc/hosts` и добавьте строку: 
```
192.168.1.1 espocrm.local  # specify the IP address of your Nginx server
```

Для Windows, пожалуйста, следуйте этим [инструкциям](http://support.microsoft.com/kb/923947).
