# Email massal

## Bagaimana mengirim email massal



Anda harus memiliki setidaknya satu Daftar Target dengan target catatan dan Email Template dalam crm anda.

Jika semuanya benar setup email harus keluar. Mereka harus dikirim setiap jam dengan porsi (Anda dapat mengubah ukuran porsi di Administration> Outbound Emails). Administrator dapat mengubahnya dengan memperbarui bidang `Penjadwalan` dari` Periksa Akun Email' Pekerjaan Terjadwal. 



Anda dapat memeriksa apakah email yang dikirim dalam Log panel.



## Tes apa yang akan dikirim ke penerima



Klik kanan dropdown pada email massal baris di _Mass Email_ panel, dan kemudian klik _kirim Test_.








## Log

Dalam log, anda dapat melihat:
* Mengirim email;
* Email dibuka oleh penerima;
* Tautan diklik oleh penerima;
* Penerima yang memilih keluar;
* Membangun email (tidak dikirimkan kepada penerima).



## Tautan penyisihan



Secara default sistem akan menambahkan opt-out untuk semua email yang dikirim. Tapi anda dapat menggunakan satu kustom di Template Email anda.








Contoh:
``html
<a href="{optOutUrl}">berhenti Berlangganan dari mailing list.</a>
``

Administrator dapat menonaktifkan wajib opt-out link yang ditambahkan oleh sistem Administrasi > Email Keluar.



## Melacak URL



 
 Jika anda ingin tahu bahwa penerima anda membuka link dari email anda, yang anda butuhkan untuk membuat URL Pelacakan. Menentukan _Name_
dan _URL_ di mana link anda harus mengarah ke. Kemudian anda akan perlu untuk paste kode yang dihasilkan menjadi Template Email anda.





 
 Contoh:
  `` `html
<a href="{trackingUrl:55f2c87b09a220a78}"> Coba demo kami </a>
  `` `
  






## Daftar Target

Target berisi daftar Akun, Kontak, Memimpin dan Pengguna catatan.

Pengguna dapat mengisi target daftar secara manual menggunakan _Select_ tindakan pada panel yang sesuai pada tampilan detail Daftar Target. Ada kemampuan untuk membuat penyaringan dan kemudian pilih semua hasil pencarian.





## Mengisi daftar sasaran dengan Laporan

[Laporan](laporan.md#sinkronisasi-dengan-target-list) fitur ini memberikan kemampuan untuk mengisi daftar sasaran dengan catatan yang sesuai dengan kriteria tertentu.





## Tidak termasuk Target Daftar

Menentukan tidak Termasuk Target Daftar untuk menghindari mengirim email massal ke penerima tertentu. Jika ada record dengan alamat email yang sesuai dengan alamat email apapun termasuk catatan pertama akan dikeluarkan juga.





## Log Kampanye

Pada Kampanye Log anda dapat melihat email yang telah dikirim, membuka email, memantul email, yang memilih keluar, dan yang mengklik link dalam email. Itu mungkin untuk menggunakan log ini dengan membuat Daftar Target (dropdown di pojok kanan atas pada panel) yang didasarkan pada catatan dari log. Misalnya, anda memilih hanya kontak yang diklik pada link (url pelacakan).





## Penyelesaian masalah

_Untuk administrator_







#### Apa yang harus dilakukan jika email tidak dikirim..

1. Periksa apakah _kirim Test_ bekerja. Jika tidak bekerja, kemudian memeriksa apakah sistem pengaturan SMTP adalah benar.
2. Periksa jika anda memiliki setup cron untuk sistem anda.
3. Periksa apakah anda memiliki `Kirim Email Massal` Dijadwalkan Pekerjaan dan itu `Aktif` (Administrasi > Dijadwalkan Pekerjaan > Kirim Email Massal). Periksa jika ada sesuatu dalam Log.





#### Bagaimana jika Url Pelacakan memiliki url yang salah yang tidak mengarah ke crm anda.

Periksa 'siteUrl' parameter `data/config.php` file. Itu harus ditetapkan sebagai URL anda EspoCRM dapat diakses dari dunia luar







#### email yang dipantulkan tidak masuk log

Bangkit email dapat ditangani oleh kelompok akun email saja. Pastikan bahwa anda memiliki sebuah kelompok akun email yang monitores kotak memantul email yang dikirim.

Juga beberapa mail server penyedia dapat menyimpang dari standar, sehingga terpental email tidak dapat dibedakan.
