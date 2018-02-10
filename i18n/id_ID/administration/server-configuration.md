# Konfigurasi Server untuk EspoCRM

EspoCRM dapat diinstal di Apache ([intruksi](apache-server-configuration.md)), Nginx ([intruksi](nginx-server-configuration.md)), atau server IIS dengan dukungan versi PHP 5.6 atau lebih dan MySQL versi 5.1 atau yang lebih baru.

## Rekomendasi Konfigurasi

### Persyaratan PHP

EspoCRM membutuhkan PHP 5,6 atau lebih, dengan ekstensi berikut diaktifkan:

* [PDO](http://php.net/manual/en/book.pdo.php) – untuk mengakses MySQL di PHP;
* [JSON](http://php.net/manual/en/book.json.php) – sumber menggunakan format ini (metadata, tata letak, bahasa, dan lain-lain);
* [GD](http://php.net/manual/en/book.image.php) – untuk memanipulasi gambar;
* [OpenSSL](http://php.net/manual/en/book.openssl.php) – untuk memastikan perlindungan tertinggi;
* [Zip](http://php.net/manual/en/book.zip.php) – untuk mengupgrade EspoCRM dan memasang ekstensi;
* [IMAP](http://php.net/manual/en/book.imap.php) – to memantau kotak masuk di EspoCRM;
* [mbstring](http://php.net/manual/en/book.mbstring.php);
* [cURL](http://php.net/manual/en/book.curl.php).

Ini juga disarankan untuk memasang ekstensi pecl [mailparse](https://pecl.php.net/package/mailparse). Ini diperlukan untuk kelancaran fitur pengambilan email.


pengaturan php.ini:

```
max_execution_time = 180
max_input_time = 180
memory_limit = 256M
post_max_size = 50M
upload_max_filesize = 50M
```


### Persyaratan MySQL

EspoCRM mendukung versi MySQL 5.1 atau yang lebih baru.
Ini bukan kekhasan khusus. Semua pengaturan standar bagus untuk EspoCRM.

## Izin yang diperlukan untuk Sistem Berbasis Unix

File dan direktori harus memiliki izin berikut:

* `/data`, `/custom`, `/client/custom` – harus dapat ditulis semua file, direktori dan subdirektori (664 untuk file, 775 untuk direktori, termasuk semua subdirektori dan file);
* `/application/Espo/Modules`, `/client/modules` – harus dapat ditulis direktori saat ini (775 untuk direktori saat ini, 644 untuk file, 755 untuk direktori dan subdirektori);
* Semua file dan direktori lainnya harus dibaca (644 untuk file, 755 untuk direktori).

Untuk mengatur hak akses, jalankan perintah ini di terminal:

```
cd <PATH-TO-ESPOCRM-DIRECTORY>
find . -type d -exec chmod 755 {} + && find . -type f -exec chmod 644 {} +;
find data custom -type d -exec chmod 775 {} + && find data custom -type f -exec chmod 664 {} +;
```

Semua file harus dimiliki dan milik-kelompok oleh proses webserver. Bisa berupa "www-data", "daemon", "apache", "www", dll.
Catatan: Di Bitnami Stack, file harus dimiliki dan milik-kelompok oleh pengguna "daemon".
Catatan: Pada host bersama, file harus dimiliki dan milik-grup oleh akun pengguna Anda.

Untuk mengatur pemilik dan milik-grup, jalankan perintah ini di terminal:

```
cd <PATH-TO-ESPOCRM-DIRECTORY>
chown -R <OWNER>:<GROUP-OWNER> .;
```

## Mengatur crontab

Untuk menyiapkan crontab pada sistem UNIX, lakukan langkah-langkah berikut:

* 1. Login sebagai administrator ke contoh EspoCRM Anda.
* 2. Pergi ke bagian Pekerjaan Terjadwal di panel administrator (Menu> Administrasi> Pekerjaan Terjadwal) dan salin string untuk crontab. Bentuknya seperti ini:
```
* * * * * /usr/bin/php -f /var/www/html/espocrm/cron.php > /dev/null 2>&1
```
* 3. Buka terminal dan jalankan perintah ini:
```
crontab -e -u WEBSERVER_USER
```
WEBSERVER_USER dapat menjadi salah satu berikut "www", "www-data", "apache", dll (tergantung pada server web Anda).
* 4. Tempel string yang disalin (dari langkah 2) dan simpan file crontab (Ctrl+O, lalu Ctrl+X untuk editor nano).

## Petunjuk konfigurasi berdasarkan server Anda:

* [Konfigurasi server Apache](apache-server-configuration.md).
* [Konfigurasi server Nginx](nginx-server-configuration.md).
