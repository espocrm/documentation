# Memindahkan EspoCRM ke server lain

Ikuti langkah berikut untuk memindahkan EspoCRM ke server lain:

### Langkah 1. Backup file

Buka file manager atau login via SSH untuk mengarsipkan file yang tersedia dari direktori EspoCRM. [Detail lebih lanjut](backup-and-restore.md#langkah-1-backup-file).

### Lagkah 2. Backup database Anda

Data yang tersimpan dalam database (MySQL, MariaDB) harus di-_backup_. Silakan ikuti [saran berikut](backup-and-restore.md#langkah-2-backup-database).

### Langkah 3. Salin file dan backup database ke server lain

Salin file backup database Anda ke server baru.

### Langkah 4. Buka arsip file backup

Untuk membuka arsip file backup, Anda dapat menggunakan Archive Manager atau [petunjuk berikut](backup-and-restore.md#langkah-1-buka-arsip-file-backup).
Catatan: File harus berada dalam direktori web-server.

### Langkah 5. Konfigurasi server

Konfigurasikan server baru berdasarkan [rekomendasi ini](server-configuration.md).

### Langkah 6. Koreksi izin

Atur [izin](server-configuration.md#izin-yang-diperlukan-untuk-sistem-berbasis-unix) yang diperlukan dan pemilik file.

### Langkah 7. Impor backup database Anda

Pertama, Anda harus membuat database baru dengan pengguna di MySQL. Untuk mengimpor database dari backup, ikuti [langkah ini](backup-and-restore.md#langkah-3-impor-database-dump).

### Langkah 8. Koreksi konfigurasi EspoCRM

Setelah sukses mengimpor dan mengkonfigurasi server, silakan koreksi konfigurasi EspoCRM di dalam file `ESPOCRM_DIRECTORY/data/config.php`:

 * pengaturan koneksi database:

  ```php
  'database' => [
        'driver' => 'pdo_mysql',
        'dbname' => 'YOUR_DATABASE_NAME',
        'user' => 'YOUR_USER',
        'password' => 'YOUR_DATABASE_PASSWORD',
        'host' => 'localhost',
        'port' => ''
    ],
  ```

   * "siteUrl" - jika nama domain Anda (URL) berubah:

  ```php
  'siteUrl' => 'https://new-link.com',
  ```

  * pemilik file default (jika berbeda):

  ```php
  'defaultPermissions' => [
        'user' => 'www-data',
        'group' => 'www-data'
    ]
  ```

  dimana `www-data` adalah pengguna web-server Anda.

### Langkah 9. Atur crontab

Atur [crontab](server-configuration.md#mengatur-crontab).

Catatan: ini harus dikonfigurasi dibawah pengguna web-server Anda.

Itu saja. Sekarang EspoCRM Anda berjalan di server baru.
