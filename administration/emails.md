# Email

> Penting [Cron] (https://github.com/espocrm/documentation/blob/master/administration/server-configuration.md#setup-a-crontab) harus dikonfigurasi di sistem Anda untuk melakukan pengambilan email. Anda dapat menemukan informasi di EspoCRM Anda di Administration> Scheduled Jobs.

## Ikhtisar

EspoCRM memiliki kemampuan untuk memantau kotak pesan IMAP. Email dapat diarsipkan dalam dua cara: Akun Email Grup dan Akun Email Pribadi. Akun Inbound Grup ditujukan untuk kotak pesan grup: kasus yang paling umum adalah kotak dukungan. Akun Email Pribadi ditujukan untuk kotak pesan pribadi pengguna.

Sebagai email yang masuk, sistem mencoba menautkannya dengan catatan yang sesuai (Accounts, Lead, Opportunity, Case). Pengguna yang mengikuti rekaman tersebut akan menerima pemberitahuan tentang email baru di sistem, meski tidak berada di To atau CC.

## Akun Email Grup

Hanya administrator yang dapat mengatur Akun Email Grup. Akun Email Grup dapat digunakan untuk menerima dan mengirim email. Mengirim email dari akun grup telah tersedia sejak versi 4.9.0.

Bidang tim menentukan tim email masuk mana yang akan ditugaskan.

Jika akun email grup memiliki SMTP dan dicentang sebagai shared maka akses akan dikontrol oleh Peran melalui izin Akun Email Grup. Lapangan tim akan digunakan jika level izin diset ke 'tim'.

Ada kemampuan untuk membuat sistem mengirim balasan otomatis untuk email masuk.

## Email-to-Case

Ada pilihan untuk membuat sistem membuat kasus dari email grup yang masuk.
Fitur ini ditujukan untuk tim pendukung.
Kasus dapat didistribusikan ke pengguna dari tim tertentu sesuai dengan cara berikut:
`direct assignment`,` round-robin` dan `less-busy`.
Hanya email pertama di thread yang menciptakan kasus baru.
Setiap berikutnya akan dihubungkan dengan catatan kasus yang ada dan ditampilkan di panel Stream-nya.

Saat pengguna ingin mengirim balasan kepada pelanggan yang mereka butuhkan untuk memastikan bahwa kasus tersebut dipilih sebagai orang tua dari email yang sedang dikirim. Ini akan membuat pelanggan membalas alamat email grup daripada ke pengguna sendiri.

## Akun Email Pribadi

Pengguna bisa mensetup akun email mereka sendiri yang perlu dipantau. Email> Menu Dropdown Kanan Atas> Akun Email Pribadi. Administrator juga bisa mengatur akun email pengguna.

## Filter Email

Ini memungkinkan penyaringan email masuk sesuai dengan kriteria yang ditentukan. Misalnya. Jika Anda tidak ingin pesan pemberitahuan dikirim oleh beberapa aplikasi untuk diimpor ke EspoCRM Anda dapat membuat filter untuk membuat EspoCRM melewatkannya.

Admin dapat membuat filter global, diterapkan ke semua akun email. Pengguna dapat membuat filter untuk akun email pribadi mereka dan untuk keseluruhan kotak masuk.
