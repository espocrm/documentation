# Pedoman Menggunakan Email

EspoCRM menyediakan kemampuan untuk mengambil email dari kotak IMAP. Hal ini memungkinkan untuk menggunakan EspoCRM sebagai klien email beserta fitur khusus CRM.

## akun IMAP

* Catatan: Anda harus memiliki [cron] (https://github.com/espocrm/documentation/blob/master/administration/server-configuration.md#setup-a-crontab) yang dikonfigurasikan dengan benar di sistem Anda agar memiliki email masuk kerja.*

Pengguna dapat mensetup akun IMAP di halaman Akun Email Pribadi (tab Email> menu kanan atas> Akun Email Pribadi).

Tentukan folder apa yang akan dipantau di kolom Monitored Folders. Secara default itu diatur ke INBOX. Jika Anda menggunakan beberapa klien email eksternal untuk mengirim email, Anda dapat menambahkan folder Terkirim untuk mengarsipkan email tersebut.

* Fetch Since * memungkinkan Anda memilih tanggal email yang harus diarsipkan dari. Tetapkan ke beberapa tanggal sebelum hari ini jika Anda perlu mengarsipkan email lama.

Ada kemampuan untuk menentukan * Folder * di Akun Email Persnoal. Email masuk akan dimasukkan ke dalam folder itu.

## akun SMTP

Pengguna dapat mengatur pengaturan SMTP di Preferensi dan juga di Akun Email Pribadi mereka. Administrator juga dapat mengizinkan untuk menggunakan sistem SMTP (membuatnya Shared).

Pengguna dapat memiliki beberapa akun SMTP (sejak versi 4.2.0). Tapi alamat email yang bisa digunakan pengguna untuk mengirim email dari yang ditentukan oleh alamat email * User * record.

## Bekerja dengan Email

Email diambil oleh cron (di latar belakang) setiap beberapa menit (periode dapat ditentukan oleh Administrator).
Anda dapat melihat semua email Anda di tab Emails. Ada folder standar Inbox, Sent, Draft email di sebelah kiri.

* Bidang Status *. `Terkirim` berarti dikirim dari CRM,` Archived` - diambil dari akun IMAP atau diarsipkan secara manual, `Draft` - berarti email dibuat sebagai draf.

Saat email baru tersebut masuk, sistem mencoba mengenali catatan email mana yang menjadi miliknya. Ini bisa menautkannya dengan Account, Lead, Opportunity, Case (dan Kontak dalam mode B2C) dll. Jika tidak dikenali maka pengguna bisa menautkannya secara manual dengan mengisi kolom * Parent *.

Jika email berasal dari pengguna klien potensial baru, bisa mengonversinya menjadi Lead **. Buka entri Email dan klik Create Lead di menu kanan atas.

**Mungkin juga untuk membuat Task atau Case** dari sebuah email record.

Jika alamat email (dari, ke, cc) dalam catatan email diketahui bahwa sistem akan menunjukkan orang yang mereka kenal (Kontak, Pimpin, Pengguna dll). Jika beberapa alamat email Anda baru saja Anda dapat membuat kontak ** langsung dari sana.

Semua email yang terkait dengan catatan tertentu ditampilkan di panel Sejarah rekaman itu. Jika beberapa email terkait, misalnya dengan peluang tapi peluang terkait dengan akun, maka akan ditunjukkan peluang dan akun.

## Mengirim Email

Anda bisa menulis email baru dengan beberapa cara:
* * Tulis Email * pada tampilan daftar Email;
* membalas email lain;
* mengklik alamat email dari beberapa catatan;
* * Tulis Email * action of Activities panel.

Ada kemampuan untuk ** memilih template ** dari email anda.

Anda bisa mengatur ** email signature ** in Preferences.

## Email Folders

Pengguna dapat membuat folder email mereka sendiri untuk memasukkan beberapa email untuk kenyamanan. Daftar folder yang tersedia tersedia di halaman Email di sisi kiri. Untuk membuat atau mengedit folder ikuti Email> dropdown di pojok kanan atas> Folder. `Lewati Notifikasi` berarti Anda tidak diberi tahu tentang email masuk yang masuk ke folder tertentu. Dengan memanfaatkan Email Filters, mungkin saja memasukkan email ke folder secara otomatis menurut kriteria tertentu.

## Filter Email

Administrator dapat membuat filter email global untuk tidak melewatkan email yang diinginkan. Mereka tersedia di Administration> Email Filters.

Pengguna biasa dapat membuat filter email untuk Akun Email Pribadi mereka atau untuk keseluruhan kotak masuk mereka. Mereka tersedia di Email> dropdown di pojok kanan atas> Filter.

Ada dua jenis filter:
* Lewati - email akan dimasukkan ke dalam * Sampah * atau tidak diimpor jika filter terkait dengan Personal Email Account;
* Masukan Email yang diimpor Folder akan dimasukkan ke dalam folder pengguna tertentu secara otomatis.

## Email Template

Template email tersedia di Email> dropdown di pojok kanan atas> Template Email. Mereka dapat digunakan baik untuk pengiriman email massal dan untuk email biasa. Kotak centang `One-off` berarti template email seharusnya hanya digunakan sekali saja, apa yang biasa untuk pemasaran email.

Anda mungkin menggunakan placefolders di kerangka email dan subjek, mis. {Account.name}, {Person.emailAddress}. Mereka akan diganti dengan nilai-nilai catatan terkait.

Anda dapat menggunakan placeholder tambahan yang disediakan di badan template: {optOutUrl} dan {optOutLink}.
`` `
<a href="{optOutUrl}">Unsubscribe</a>
`` `
Ini adalah tautan berhenti berlangganan email massal.
