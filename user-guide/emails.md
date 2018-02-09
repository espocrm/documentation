# Pedoman Menggunakan Email

EspoCRM menyediakan kemampuan untuk mengambil email dari kotak IMAP. Hal ini membuat mungkin untuk menggunakan EspoCRM sebagai klien email bersama dengan fitur CRM spesifik.

## Akun IMAP

*Note: You need to have [cron](https://github.com/espocrm/documentation/blob/master/administration/server-configuration.md#setup-a-crontab) properly configured in your system to have inbound emails working.*

Pengguna dapat mensetup akun IMAP di halaman Akun Email Pribadi (tab Email> menu kanan atas> Akun Email Pribadi).

Tentukan folder apa yang akan dipantau di kolom Monitored Folders. Secara default itu diatur ke INBOX. Jika Anda menggunakan beberapa klien email eksternal untuk mengirim email Anda dapat menambahkan folder Dikirim ke arsip email mereka.

** Ambil Sejak * memungkinkan Anda untuk memilih email tanggal harus diarsipkan dari. Tetapkan ke beberapa tanggal sebelum hari ini jika Anda perlu mengarsipkan email lama.
Ada kemampuan untuk menentukan * Folder * dalam Personal Email Account. Email masuk akan dimasukkan ke dalam folder itu.
## Akun SMTP

Pengguna dapat mengatur pengaturan SMTP di Preferensi dan juga di Akun Email Pribadi mereka. Administrator juga dapat mengizinkan untuk menggunakan sistem SMTP (membuatnya Shared).

Pengguna dapat memiliki beberapa akun SMTP (sejak versi 4.2.0). Tapi alamat email pengguna dapat digunakan untuk mengirim email dari didefinisikan oleh alamat email dari * pengguna * ulang.

## Bekerja dengan Email

Email diambil oleh cron (di latar belakang) setiap beberapa menit (periode dapat ditentukan oleh Administrator).
Anda dapat melihat semua email Anda di tab Emails. Ada folder standar Inbox, Sent, Draft email di sebelah kiri.

* Bidang Status *. `Terkirim` berarti dikirim dari CRM,` Archived` - diambil dari akun IMAP atau diarsipkan secara manual, `Draft` - berarti email dibuat sebagai draf.

Saat email baru tersebut masuk, sistem mencoba mengenali catatan email mana yang menjadi miliknya. Hal ini dapat menghubungkannya dengan Akun, Lead, Peluang, Case (dan kontak dalam modus B2C) dll Jika itu tidak diakui maka pengguna dapat menghubungkan secara manual dengan mengisi * Parent * lapangan.

Jika email datang dari pengguna klien potensial baru dapat ** mengubahnya menjadi Memimpin **. Buka entri Email dan klik Create Lead di menu kanan atas.

Ini juga mungkin untuk ** membuat Task atau Case ** dari catatan email.

Jika alamat email (dari, ke, cc) dalam catatan email diketahui bahwa sistem akan menunjukkan orang yang mereka kenal (Kontak, Pimpin, Pengguna dll). Jika beberapa alamat email Anda baru saja Anda dapat membuat kontak ** langsung dari sana.

Semua email yang berhubungan dengan catatan tertentu ditampilkan dalam Sejarah panel dari catatan itu. Jika beberapa email terkait, misalnya, untuk peluang namun kesempatan berhubungan dengan account, itu akan ditampilkan baik dalam kesempatan dan akun.

## Mengirim Email

Anda bisa menulis email baru dengan beberapa cara:
* *Tulis Email * tombol pada daftar Email tampilan;
* membalas pada email yang lain;
* mengklik alamat email dari beberapa catatan;
* * Tulis Email * aksi panel Kegiatan.

Ada kemampuan untuk ** memilih template ** dari email anda.

Anda bisa mengatur ** tanda tangan email ** di Preferensi.

## Email Folder

Pengguna dapat membuat folder email mereka sendiri untuk memasukkan beberapa email untuk kenyamanan. Daftar folder yang tersedia tersedia di halaman Email di sisi kiri. Untuk membuat atau mengedit folder mengikuti Email> dropdown di pojok kanan atas> Folder. `Lewati Notifikasi` berarti Anda tidak diberi tahu tentang email masuk yang masuk ke folder tertentu. Dengan memanfaatkan Email Filters, mungkin saja memasukkan email ke folder secara otomatis menurut kriteria tertentu.

## Filter Email

Administrator dapat membuat filter email global untuk tidak melewatkan email yang diinginkan. Mereka tersedia di Administration> Email Filters.

Pengguna biasa dapat membuat filter email untuk Akun Email Pribadi mereka atau untuk keseluruhan kotak masuk mereka. Mereka tersedia di Email> dropdown di pojok kanan atas> Filter.

Ada dua jenis filter:
* Lewati - email akan dimasukkan ke dalam * Sampah * atau tidak diimpor jika filter terkait dengan Akun Email Pribadi;
* Masukan Folder - email yang diimpor akan dimasukkan ke dalam folder pengguna tertentu secara otomatis.

## Template Email

Email template yang tersedia di Email> dropdown di pojok kanan atas> Template Email. Mereka dapat digunakan baik untuk pengiriman email massal dan untuk email biasa. Kotak centang `One-off` berarti template email seharusnya hanya digunakan sekali saja, apa yang biasa untuk pemasaran email.

Ini mungkin untuk menggunakan placefolders dalam tubuh email template dan tunduk misal {Account.name}, {} Person.emailAddress. Mereka akan diganti dengan nilai-nilai catatan terkait.

Anda dapat menggunakan placeholder tambahan yang disediakan di badan template: {optOutUrl} dan {optOutLink}.
```
<a href="{optOutUrl}">Unsubscribe</a>
```
Ini adalah tautan berhenti berlangganan email massal.
