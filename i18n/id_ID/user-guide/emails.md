# Panduan Menggunakan Email

EspoCRM membolehkan untuk mengambil email dari kotak IMAP. Hal ini memungkinkan untuk menggunakan EspoCRM sebagai klien email dan juga  fitur khusus CRM.

## Akun IMAP

*Catatan: Anda harus mempunyai [cron](https://github.com/espocrm/documentation/blob/master/administration/server-configuration.md#setup-a-crontab) yang dikonfigurasi dengan benar di sistem Anda agar email masuk bekerja.*

Pengguna dapat mengatur akun IMAP pada halaman Akun Email Pribadi (Tab email> menu kanan atas> Akun Email Pribadi).

Tentukan folder mana yang akan dipantau pada kolom Folder Pantauan. Secara default itu diatur ke KOTAK MASUK. Jika Anda menggunakan beberapa klien email eksternal untuk mengirim email, Anda dapat menambahkan folder Terkirim untuk mengarsipkan email tersebut.

*Fetch Since* mengizinkan Anda untuk memilih tanggal email dari mana yang harus diarsipkan. Tetapkan ke beberapa tanggal sebelum hari ini jika Anda perlu mengarsipkan email lama.

Anda dibolehkan menentukan *Folder* dalam Akun Email Pribadi. Email masuk akan dimasukkan ke delam folder tersebut.

## Akun SMTP

Pengguna dapat mengatur pengaturan SMTP di Preferensi seperti di Akun Email Pribadi mereka. Administrator juga dapat mengizinkan untuk menggunakan sistem SMTP (bersamaan).

Pengguna dapat mempunyai beberapa akun SMTP (sejak versi 4.2.0). Tetapi alamat email pengguna dapat digunakan untuk mengirim email dari yang sudah ditentukan oleh alamat email dari riwayat *Pengguna*.

## Bekerja dengan Email

Email diambil oleh cron (di latar belakang) setiap beberapa menit (periode dapat ditentukan oleh Administrator).
Anda dapat melihat semua email Anda di tab Email. Disana ada folder standar Kotak Masuk, Terkirim, Draft di sebelah kiri.

Kolom *Status*. `Terkirim` artinya dikirim dari CRM, `Diarsipkan` - diambil dari akun IMAP atau diarsipkan secara manual, `Draft` - artinya email dibuat sebagai draft.

Ketika email baru masuk sistem akan mencoba mengenali catatan email mana yang menjadi miliknya. Ini dapat ditautkan dengan Akun, Judul, Kemungkinan, Kejadian (dan Kontak pada mode B2C) dll. Jika tidak dikenali maka pengguna bisa menautkannya secara manual dengan mengisi kolom *Utama*.

Jika email berasal dari pengguna klien potensial baru dapat **Mengubahnya ke Judul**. Buka entri email dan klik Buat Judul di menu kanan atas.

Ini juga memungkinkan untuk **membuat Task atau Kejadian** dari catatan sebuah email.

Jika alamat email (dari, ke, cc) pada catatan email diketahui sistem akan menampilkan orang yang mereka kenal (Kontak, Pimpinan, Pengguna dll). Jika email tersebut baru Anda dapat **membuat kontak** langsung dari sana.

Semua alamat email yang terkait dengan catatan tertentu ditampilkan di panel Riwayat catatan itu. Jika beberapa email saja yang terkait, misalnya, untuk kesempatan tetapi kesempatan akan terkait dengan akun, maka akan ditunjukan ke kesempatan dan akun.

## Mengirim Email

Anda dapat menulis email baru dengan cara berikut:
* Tombol *Tulis Email* pada tampilan daftar Email;
* membalas email lain;
* mengklik alamat email dari beberapa catatan;
* Tindakan *Tulis Email* pada panel Aktivitas.

Ada pilihan untuk **memilih template** dari email anda.

Anda dapat mengatur **tanda tangan email** di Preferensi.

## Folder Email

Pengguna dapat membuat folder email mereka sendiri untuk memasukkan beberapa email agar santai. Daftar folder yang tersedia tersedia di halaman Email di sisi kiri. Untuk membuat atau mengedit folder ikuti Email> geser kebawah di pojok kanan atas> Folder. `Lewati Notifikasi` artinya Anda tidak akan diberi tahu tentang email masuk yang masuk ke folder tertentu. Dengan memanfaatkan Email Filter, memungkinkan memasukkan email ke folder secara otomatis menurut kriteria tertentu.

## Penyaring Email

Administrator dapat membuat filter email global untuk melewatkan email yang tidak diinginkan. Penyaring email tersedia di Administrasi> Penyaring Email.

Pengguna biasa dapat membuat filter email untuk Akun Email Pribadi mereka atau untuk keseluruhan kotak masuk mereka. Mereka tersedia di Email> geser kebawah di pojok kanan atas> Filter.

Ada dua jenis penyaringan:
* Lewati - email akan dimasukan dalam *Sampah* atau tidak diimpor jika penyaringna tersebut terkait dengan Akun Email Personal.
* Masukkan ke Folder - email yang diimpor akan dimasukan ke folder tertentu pengguna secara otomatis.

## Template Email

Template email tersedia di Email> geser kebawah di pojok kanan atas> Template Email. Template Email dapat digunakan baik untuk pengiriman email massal dan untuk email biasa. Kotak centang `One-off` berarti template email seharusnya hanya digunakan sekali saja, seperti biasa digunakan untuk pemasaran email.

Hal ini memungkinkan Anda untuk menggunakan folder tertentu di badan tempalte email dan subjek, misalnya {Account.name}, {Person.emailAddress}. Mereka akan diganti dengan nilai catatan terkait.

Anda dapat menggunakan tambahan folder khusus di badan tempate: {optOutUrl} dan {optOutLink}.
```
<a href="{optOutUrl}">Berhenti berlangganan</a>
```
Ini adalah tautan berhenti berlangganan email massal.
