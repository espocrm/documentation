# Instalasi

### Persyaratan
EspoCRM berjalan pada penyedia layanan hosting. Persyaratannya meliputi:

* PHP 5.5 atau versi terbaru dari PHP dengan ekstensi aktif pdo, json, GD library mcrypt (biasanya diaktifkan secara default);
* MySQL 5.1 atau lebih tinggi.

Lihat artikel [Konfigurasi Server](server-configuration.md) untuk informasi lebih lanjut.

### 1. Unduh paket instalasi EspoCRM
Untuk mendapatkan versi terbaru dari EspoCRM ikuti tautan [halaman unduh](http://www.espocrm.com/download/).

### 2. Unggah file EspoCRM ke Server Anda

Setelah unduhan selesai, unggah paket tersebut ke server web Anda.
Untuk mengunggah, Anda dapat menggunakan SSH, FTP atau panel administrasi hosting.
Ekstrak arsip ke direktori server web publik (misalnya, `public_html`, `www`, dll.).

_Catatan: untuk FTP, Anda perlu mengekstrak Arsip unduhan sebelum mengunggah ke server web Anda._

### 3. Buat Database MySQL yang akan digunakan untuk EspoCRM

Pergi ke panel administrasi hosting Anda, atau ke SSH, dan buat database baru dan pengguna untuk EspoCRM (misalnya, `MySQL database` di cPanel).

### 4. Jalankan proses instalasi EspoCRM

Sekarang, buka browser web Anda, dan pergi ke URL file EspoCRM (misalnya, `http://yourdomain.com/espo`).

Jika Anda melihat layar ini, Anda memiliki eror "Permission denied".
Maka, Anda perlu menjalankan command tampilan di terminal melalui SSH, atau mengatur izin yang benar.
Harusnya 755 untuk direktori, 644 untuk file, dan 775 untuk direktori `data`.
Pastikan juga bahwa Anda memiliki _owner_ dan _group_ yang benar.

![1](../_static/images/administration/installation/1.png)

Jika Anda melihat layar berikut, izin Anda benar dan Anda dapat memulai menginstal EspoCRM.

![2](../_static/images/administration/installation/2.png)

Pada Halaman ini, Anda dapat membaca dan menyetujui Perjanjian Lisensi.

![3](../_static/images/administration/installation/3.png)

Masukkan rincian untuk database MySQL yang baru Anda buat.

![4](../_static/images/administration/installation/4.png)

Masukkan nama pengguna dan sandi Administrator EspoCRM.

![5](../_static/images/administration/installation/5.png)

Pada Halaman ini Anda dapat menetapkan pengaturan default EspoCRM, seperti format tanggal dan waktu, zona waktu, mata uang, dan lain-lain.

![6](../_static/images/administration/installation/6.png)

Masukkan Pengaturan SMTP untuk surel keluar, jika Anda menginginkan untuk mengirim surel.
Langkah ini dapat dilewatkan dengan mengeklik tombol _Selanjutnya_.
Semua pilihan ini dapat ditambahkan/berubah di EspoCRM setelah instalasi.

![7](../_static/images/administration/installation/7.png)

Selamat! Instalasi sudah selesai.
Hal terakhir adalah aturlah Tugas Terjadwal agar dapat dijalankan oleh sistem Anda. Hal ini dapat dilakukan dengan menjalankan `crontab -e` di linux cli dan _Windows Tasks Scheduler_ di sistem Windows.

![8](../_static/images/administration/installation/8.png)

Kami berharap Anda dapat menikmati pekerjaan Anda di EspoCRM.







