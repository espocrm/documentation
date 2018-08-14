# Konfigurasi server Apache untuk EspoCRM

Petunjuk ini sudah ditambahkan pada panduan [Konfigurasi Server](server-configuration.md). Harap dicatat bahwa semua pengaturan konfigurasi yang tercantum di sini dibuat pada server Ubuntu.


## Persyaratan PHP

Untuk menginstal semua perpustakaan yang diperlukan, jalankan command ini dalam terminal:

```
sudo apt-get update
sudo apt-get install php-mysql php-json php-gd php-mcrypt php-zip php-imap php-mbstring php-curl
sudo phpenmod mcrypt imap mbstring
sudo service apache2 restart
```

## Memperbaiki masalah “API Error: EspoCRM API is unavailable”:

Ikuti langkah berikut. Periksa apakah masalah terpecahkan setelah langkah ini diikuti.

### 1. Aktifkan dukungan "mod_rewrite" di Apache

Untuk mengaktifkan "mod_rewrite", jalankan command ini dalam terminal:

```
sudo a2enmod rewrite
sudo service apache2 restart
```

### 2. Aktifkan dukungan .htaccess

Untuk mengaktifkan dukungan .htaccess, tambah/ubah Pengaturan Konfigurasi Server /etc/apache2/sites-available/ESPO_VIRTUAL_HOST.conf atau /etc/apache2/apache2.conf (/etc/httpd/conf/httpd.conf):

```
<Directory /PATH_TO_ESPO/>
AllowOverride All
</Directory>
```

Setelah itu, jalankan command berikut dalam terminal:

```
sudo service apache2 restart
```

### 3. Tambahkan path RewriteBase

Buka file /ESPOCRM_DIRECTORY/api/v1/.htaccess dan ganti dengan baris berikut:

```
# RewriteBase /
```

dengan

```
RewriteBase /REQUEST_URI/api/v1/
```

dimana REQUEST_URI adalah bagian dari URL, contohnya untuk “http://example.com/espocrm/”, REQUEST_URI-nya adalah “espocrm”.


## Aktifkan dukungan HTTP AUTHORIZATION (hanya untuk FastCGI).

Secara default FastCGI tidak mendukung HTTP AUTHORIZATION. Jika Anda menggunakan FastCGI, Anda harus mengaktifkannya di VirtualHost Anda atau /etc/apache2/apache2.conf (httpd.conf) dengan menambahkan baris kode berikut:

Untuk modul Fcgid:

```
<IfModule mod_fcgid.c>
  FcgidPassHeader Authorization
  FcgidPassHeader Proxy-Authorization
  FcgidPassHeader HTTP_AUTHORIZATION  
</IfModule>
```

Untuk modul FastCgi:

```
<IfModule mod_fastcgi.c>
   FastCgiConfig -pass-header Authorization \
                        -pass-header Proxy-Authorization \
                        -pass-header HTTP_AUTHORIZATION  
</IfModule>
```

Untuk memeriksa modul mana yang saat ini sedang digunakan, jalankan command ini dan temukan modul:

```
apache2ctl -M
```
