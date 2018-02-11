# Backup and Restore

## Bagaimana cara membackup EspoCRM secara manual

EspoCRM terdiri dari file dan data database. Semua data ini dibutuhkan untuk membuat salinan lengkap EspoCRM. Berikut adalah petunjuk cara melakukannya di server Ubuntu dengan MySQL.

### Langkah 1. Backup file

Buat arsip isi direktori EspoCRM yang terinstal. Untuk Ubuntu jalur defaultnya adalah `/var/www/html`. Anda bisa menggunakan perintah ini:

```bash
tar -czf "files.tar.gz" -C /var/www/html .
```

### Langkah 2. Backup database

Untuk mencadangkan semua data Anda, Anda harus mengetahui nama database dan kredensial akses. Anda bisa menemukan nama database di file konfigurasi `/ESPOCRM_DIRECTORY/data/config.php` di bawah bagian `database`. Anda bisa menggunakan perintah ini untuk membuat backup database Anda:

```bash
mysqldump --user=YOUR_USER --password=YOUR_PASSWORD YOUR_DATABASE_NAME > "db.sql"
```

### Langkah 3. Salin backup

Itu saja. Sekarang, Anda harus menyalin cadangan yang dibuat ke tempat yang aman.


## Bagaimana cara membackup EspoCRM dengan skrip

Anda bisa menggunakan script untuk membackup semua data yang dibutuhkan. Login via SSH dan jalankan perintah (tested on Ubuntu server).

### Unduh skrip

```bash
wget https://raw.githubusercontent.com/espocrm/documentation/master/_static/scripts/backup.sh
```

### Jalankan skrip

```bash
bash ./backup.sh PATH_TO_ESPOCRM BACKUP_PATH
```
dimana
 * `PATH_TO_ESPOCRM` adalah jalur untuk menginstal direktori EspoCRM.
 * `BACKUP_PATH` adalah path ke direktori backup.

Untuk server Ubuntu adalah:

```bash
bash ./backup.sh /var/www/html /opt/backups
```

Catatan: Jika pengguna MySQL Anda tidak memiliki hak yang diperlukan untuk membuang database Anda, Anda akan diminta untuk memasukkan kredensial pengguna MySQL lainnya.

Setelah sukses, Anda akan mendapatkan path menuju backup yang telah dibuat.

## Mengembalikan EspoCRM dari backup

Anda dapat mengembalikan EspoCRM dari cadangan yang dibuat seperti dijelaskan di atas.

### Langkah 1. Buka arsip file backup

Untuk mmebuka arsip file, Anda dapat menggunakan Manajer Arsip atau menjalankan perintah di bawah ini. File harus ditempatkan di direktori web-server.

```bash
tar -xzf "files.tar.gz" -C /var/www/html
```
dimana:
 * `/var/www/html` adalah direktori web-server.

### Langkah 2. Tetapkan izin yang diperlukan

File harus dimiliki oleh pengguna web-server dan memiliki izin yang benar. Mohon tetapkan izin yang diperlukan dengan mengikuti instruksi ini: [www.espocrm.com/documentation/administration/server-configuration/#user-content-required-permissions-for-unix-based-systems](https://www.espocrm.com/documentation/administration/server-configuration/#user-content-required-permissions-for-unix-based-systems).

### Langkah 3. Impor database dump

Database dump harus diimpor ke database yang sama dengan kredensial pengguna yang sama, jika tidak, koreksi harus dilakukan pada file konfigurasi `ESPOCRM_DIRECTORY/data/config.php`. Untuk mengimpor database Anda dari dump, jalankan perintah di bawah ini di terminal:

```bash
mysql --user=YOUR_DATABASE_USER --password=YOUR_DATABASE_PASSWORD YOUR_DATABASE_NAME < db.sql
```

### Langkah 4. Periksa/konfigurasikan crontab

Periksa apakah crontab Anda dikonfigurasi dengan benar. Jalankan perintah di bawah ini dan periksa apakah path ke EspoCRM benar:

```bash
sudo crontab -l -u www-data
```
dimana:
 * `www-data` adalah pengguna web-server Anda.

Jika Anda harus membuat perubahan, gunakan perintah ini:

```bash
sudo crontab -l -u www-data
```

Rincian lebih lanjut tentang mengonfigurasi crontab untuk EspoCRM dijelaskan di sini [www.espocrm.com/documentation/administration/server-configuration/#user-content-setup-a-crontab](https://www.espocrm.com/documentation/administration/server-configuration/#user-content-setup-a-crontab).
