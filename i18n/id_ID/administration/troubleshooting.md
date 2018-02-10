# Penyelesaian Masalah

## Periksa log

Untuk mengetahui masalahnya, Anda harus memeriksa file error log.

#### Log kesalahan EspoCRM

Log EspoCRM terletak di `<ESPOCRM_DIRECTORY>/logs/*.log` dan berisi beberapa informasi kesalahan.

#### Log kesalahan Apache

Untuk server Ubuntu log kesalahan apache terletak di `/var/log/apache2/error.log` dan berisi semua informasi kesalahan. Lokasi file log bisa berbeda pada sistem lain. 

## Aktifkan mode debugging

Untuk mengaktifkan mode debugging, masuk ke direktori EspoCRM yang terinstal, buka file `data/config.php` dan ubah nilainya:

```
'logger' => [
    ...
    'level' => 'WARNING',
    ...
]
```
menjadi
```
'logger' => [
    ...
    'level' => 'DEBUG',
    ...
]
```

## Pekerjaan Terjadwal tidak bekerja

#### Masalah #1: Crontab Anda tidak dikonfigurasi

1. Login melalui SSH ke server anda.

2. Konfigurasikan crontab Anda dengan mengikuti langkah-langkah berikut: https://www.espocrm.com/documentation/administration/server-configuration/#user-content-setup-a-crontab.

Catatan: Crontab harus dikonfigurasi di bawah pengguna server web, misalnya `crontab -e -u www-data`

3. Tunggu beberapa saat dan periksa Pekerjaan Terjadwal untuk melihat apakah ada pekerjaan yang dieksekusi (lihat panel Log).

#### Masalah #2. Crontab telah dikonfigurasi, namun Pekerjaan Terjadwal tidak berfungsi

Untuk memastikan tidak ada kesalahan saat cron sedang berjalan, coba jalankan perintah cron di terminal:

1. Login melalui SSH ke server anda.

2. Masuk ke direktori tempat EspoCRM diinstal. Misalnya untuk direktori `/var/www/html/espocrm` perintahnya adalah:

```bash
cd /var/www/html/espocrm
```

3. Jalankan perintah crontab:

```bash
php cron.php
```

Catatan: Ini harus dijalankan di bawah pengguna web-server. Jika Anda login sebagai root, perintahnya seharusnya (misalnya untuk Ubuntu):

```bash
sudo -u www-data php cron.php
```

dimana `www-data` adalah pengguna web-server.

4. Jika tidak ada kesalahan, periksa Pekerjaan Terjadwal untuk melihat apakah ada pekerjaan yang dijalankan (lihat panel Log).

## EspoCRM tidak loading setelah updgare

Hal ini terkadang dapat terjadi pada beberapa shared hostings.

Periksa izin file:
/index.php
/api/v1/index.php

File tersebut harus 644. Jika salah satu dari file tersebut memiliki izin 664, Anda perlu mengubahnya menjadi 644. Gunakan panel kontrol atau perintah chmod hosting Anda.

```
chmod 644 /path/to/file
```
Informasi lebih lanjut tentang hak akses file: [disini](server-configuration.md#required-permissions-for-unix-based-systems).
