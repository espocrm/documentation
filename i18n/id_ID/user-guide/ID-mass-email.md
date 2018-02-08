# Email massal

## Bagaimana mengirim email massal

Anda harus memiliki setidaknya satu Daftar Target dengan catatan target dan Template Email di crm Anda.

1. Buat Campaign baru dengan status `Email` atau` Newsletter`. Pilih satu atau beberapa daftar target di bidang `Daftar Target`.
2. Setelah rekaman Kampanye dibuat buat Email Massal untuk kampanye ini: klik plus pada panel Email Massa. Tentukan _Date Start_ - saat email harus dikirim, dan pilih _Email Template_. Pastikan _Status_ ditetapkan sebagai `Pending`.

Jika semuanya benar setup email harus keluar. Mereka harus dikirim setiap jam dengan porsi (Anda dapat mengubah ukuran porsi di Administration> Outbound Emails). Administrator dapat mengubahnya dengan memperbarui bidang `Penjadwalan` dari `Periksa Akun Email` Pekerjaan Terjadwal. 

Anda dapat memeriksa apakah email dikirim ke panel Log.

## Uji apa yang akan dikirim ke penerima

Klik tarik-turun kanan pada baris email massal di _Mass Email_ panel dan kemudian klik _Send Test_.

## Log

Dalam log Anda dapat melihat:
* Email terkirim;
* Email yang dibuka oleh penerima;
* Tautan yang diklik oleh penerima;
* Penerima yang memilih keluar;
* Email terpental (tidak terkirim ke penerima).

## Tautan opt-out

Secara default sistem akan menambahkan opt-out ke semua email yang dikirim. Tapi Anda dapat menggunakan custom one di Template Email Anda.

Contoh:
```html
<a href="{optOutUrl}"> Berhenti berlangganan dari list email. </a>
```

Administrator dapat menonaktifkan link opt-out wajib yang ditambahkan oleh sistem di Administration> Email keluar.

## Tracking URL

Jika Anda ingin tahu bahwa penerima Anda membuka tautan dari email Anda, Anda perlu membuat URL Pelacakan. Tentukan _Name_ apapun
dan _URL_ di mana link Anda harus mengarah ke. Kemudian Anda perlu menempelkan kode yang dihasilkan ke Template Email Anda.

 Contoh:
 ```html
<a href="{trackingUrl:55f2c87b09a220a78}"> Coba demo kami </a>
 ```
 
## Daftar Target

Daftar Target berisi daftar catatan Akun, Kontak, Pimpinan dan Pengguna.

Pengguna dapat mengisi daftar target secara manual dengan menggunakan _Select_ action pada panel yang sesuai pada tampilan detail Daftar Target. Ada kemampuan untuk melakukan penyaringan lalu pilih semua hasil pencarian.

## Mengisi daftar target dengan Laporan

[Reports] (reports.md # syncing-dengan-daftar target) fitur menyediakan kemampuan untuk mengisi daftar target dengan catatan yang sesuai dengan kriteria spesifik.

## Tidak termasuk Daftar Target

Tentukan Daftar Penawaran Tidak Termasuk untuk tidak mengirim email massal kepada penerima tertentu. Jika ada catatan dengan alamat email yang cocok dengan alamat email dari catatan yang tidak termasuk, rekaman pertama akan dikecualikan juga.

## Log Kampanye

Di Campaign Log Anda dapat melihat email yang telah dikirim, email terbuka, email terpental, yang memilih ikut serta, dan siapa yang mengklik tautan di email. Anda dapat memanfaatkan log ini dengan membuat Daftar Target (dropdown di pojok kanan atas pada panel) berdasarkan catatan dari log. Misalnya, Anda hanya memilih kontak yang diklik pada link (tracking url).

## Penyelesaian masalah

_Untuk administrator_

#### Apa yang harus dilakukan jika email tidak terkirim.

1. Periksa apakah _Send Tes_ bekerja. Jika tidak berhasil, maka periksa apakah setting sistem SMTP benar.
2. Periksa apakah Anda memiliki setup cron untuk sistem Anda.
3. Periksa apakah Anda memiliki `Kirim Email Massal` Pekerjaan yang Dijadwalkan dan itu `Aktif` (Administrasi> Pekerjaan Terjadwal> Kirim Email Massal). Periksa apakah ada sesuatu di Log.


#### Bagaimana jika URL Pelacakan memiliki url salah yang tidak mengarah ke crm Anda.

Periksa parameter 'siteUrl' di file `data/config.php`. Ini harus ditetapkan sebagai URL EspoCRM Anda dapat diakses dari dunia luar.

#### Email yang dipantulkan tidak masuk log

Email terpental hanya bisa ditangani oleh akun email grup. Pastikan bahwa Anda memiliki akun email grup yang memonitor kotak pesan yang memantul email dikirim.

Juga beberapa penyedia server email bisa menyimpang dari standar, sehingga email yang terpental tidak bisa dibedakan.
