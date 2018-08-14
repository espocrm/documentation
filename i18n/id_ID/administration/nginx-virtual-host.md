# Mengkonfigurasi Virtual Host di Nginx untuk EspoCRM

Dalam panduan ini, kami akan menunjukkan cara mengkonfigurasi virtual host di Nginx untuk EspoCRM di server Ubuntu.

## Buat file blok server

Untuk membuat file ini, buka terminal dan jalankan command:

```
sudo cp /etc/nginx/sites-available/default /etc/nginx/sites-available/espocrm.conf
```

Sekarang buka file ini (/etc/nginx/sites-available/espocrm.conf) dan ubah kode berikut dengan mengikuti format yang tercetak dibawah ini (beberapa pengaturan mungkin berbeda berdasarkan konfigurasi Anda):

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

##Aktifkan blok server ini

Buat link symbolic:

```
sudo ln -s /etc/nginx/sites-available/espocrm.conf /etc/nginx/sites-enabled/
````

Jalankan command ini untuk memeriksa apakah semuanya berjalan lancar:

```
sudo nginx -t
```

Dan restart server Nginx:

```
sudo service nginx restart
```

##Konfigurasi local hosts Anda (opsional, untuk domain lokal saja)

Jika Anda menambahkan domain lokal, Anda harus mengkonfigurasnya di komputer lokal Anda (bukan di server). Untuk Ubuntu, buka file /etc/hosts dan tambahkan baris:

```
192.168.1.1 espocrm.local  # specify the IP address of your Nginx server
```

Untuk Windows, silakan ikuti [petuntuk](http://support.microsoft.com/kb/923947) berikut.
