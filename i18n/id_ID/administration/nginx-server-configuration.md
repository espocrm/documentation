# Konfigurasi server Nginx untuk EspoCRM

Petunjuk ini sudah ditambahkan pada panduan [Konfigurasi Server](server-configuration.md). Harap dicatat bahwa semua pengaturan konfigurasi yang tercantum di sini dibuat pada server Ubuntu.

## Persyaratan PHP

Untuk menginstal semua perpustakaan yang diperlukan, jalankan command ini dalam terminal:

```
sudo apt-get update
sudo apt-get install php-mysql php-json php-gd php-mcrypt php-zip php-imap php-mbstring php-curl
sudo phpenmod mcrypt imap mbstring
sudo service nginx restart
```

## Memperbaiki masalah “API Error: EspoCRM API is unavailable”:

Ikuti langkah berikut. Periksa apakah masalah terpecahkan setelah langkah ini diikuti.

### 1. Aktifkan dukungan "mod_rewrite" di Nginx

Untuk mengaktifkan "mod_rewrite", jalankan command ini dalam terminal:

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

Jika Anda tidak memiliki file ini, Anda harus membuatnya. Caranya bukalah terminal dan jalankan command berikut:

```
sudo cp /etc/nginx/sites-available/default /etc/nginx/sites-available/espocrm.conf
```

Dan tambahkan kode yang tercantum di atas. Untuk selengkapnya tentang cara mengkonfigurasi Virtual Host baru pada Nginx, silahkan baca ini [panduan](nginx-virtual-host.md).

Jalankan command berikut dalam terminal untuk memeriksa apakah semuanya baik-baik saja:

```
sudo nginx -t
```

Jika sudah, jalankan command untuk me-restart nginx server:

```
sudo service nginx restart
```

### 2. Tambahkan path RewriteBase

Buka file /ESPOCRM_DIRECTORY/api/v1/.htaccess dan ganti dengan baris kode berikut:

```
# RewriteBase /
```
dengan 

```
RewriteBase /REQUEST_URI/api/v1/
```

dimana REQUEST_URI adalah bagian dari URL, contohnya untuk “http://example.com/espocrm/”, REQUEST_URI-nya adalah “espocrm”.
