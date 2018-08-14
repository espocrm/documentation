# Bagaimana Meng-upgrade EspoCRM

EspoCRM dapat diupgrade ke versi terbaru dengan mengikuti langkah berikut:

### Langkah 1. Periksa versi Anda saat ini

Untuk memeriksa versi Anda saat ini, masuk ke halaman Administrasi> Halaman upgrade.

### Langkah 2. Download paket upgrade yang dibutuhkan

Buka halaman upgrade https://www.espocrm.com/download/upgrades/ dan pusatkan versi paket download yang Anda gunakan saat ini.

### Langkah 3. Buatlah cadangan (opsional)

Buatlah cadangan file dan data EspoCRM Anda sebelum melakukan upgrade. Ikuti  [petunjuk ini](https://github.com/espocrm/documentation/blob/master/administration/backup-and-restore.md) untuk menyelesaikannya.

### Step 4. Proses upgrade

Buka Administrasi> Upgrade. Unggah dan instal satu demi satu paket upgrade.

Anda dapat memeriksa apakah Anda memiliki versi terbaru di Menu> About.

## Upgrade lewat CLI

Anda juga bisa menjalankan upgrade lewat baris perintah antar muka. Anda perlu menjalankan perintah berikut dari direktori root EspoCRM:

```
php upgrade.php /path/to/upgrade/package.zip
```
