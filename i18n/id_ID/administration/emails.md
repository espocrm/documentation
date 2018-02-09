# Surel

> Penting. [Cron](https://github.com/espocrm/documentation/blob/master/administration/server-configuration.md#setup-a-crontab) harus dikonfigurasi di sistem Anda untuk melakukan pengambilan surel. Anda dapat menemukan informasi di EspoCRM Anda di Administrasi> Pekerjaan Terjadwal.

## Ikhtisar

EspoCRM memiliki kemampuan untuk memantau kotak pesan IMAP. Surel dapat diarsipkan dalam dua cara: Akun Surel Grup dan Akun Surel Pribadi. Akun Tidak terikat Grup ditujukan untuk kotak pesan grup: kasus yang paling umum adalah kotak dukungan. Akun Surel Pribadi ditujukan untuk kotak pesan pribadi pengguna.

Sebagai surel yang masuk sistem mencoba menautkannya dengan catatan yang sesuai (Akun, Pimpinan, Opportuniti, Kasus). Pengguna yang mengikuti rekaman tersebut akan menerima pemberitahuan tentang surel baru di sistem, meski tidak berada di Kepada atau CC.

## Akun Surel Grup

Hanya administrator yang dapat mengatur Akun Surel Grup. Akun Surel Grup dapat digunakan untuk menerima dan mengirim surel. Mengirim surel dari akun grup telah tersedia sejak versi 4.9.0.

Bidang tim menentukan tim surel masuk mana yang akan ditugaskan. 

Jika akun surel grup memiliki SMTP dan dicentang sebagai bersama maka akses akan dikontrol oleh Peran melalui izin Akun Surel Grup. Tim lapangan akan digunakan jika level izin diatur ke 'tim'.

Anda dibolehkan untuk membuat sistem mengirim balasan otomatis untuk email masuk.

## Surel-ke-Kasus

Ada pilihan untuk membuat sistem membuat kasus dari surel grup yang masuk.
Fitur ini ditujukan untuk tim pendukung.
Kasus dapat didistribusikan ke pengguna dari tim tertentu sesuai dengan cara berikut:
`direct assignment`, ` round-robin` dan `less-busy`.
Hanya surel pertama di lembaran yang menciptakan kasus baru.
Setiap berikutnya akan dihubungkan dengan catatan kasus yang ada dan ditampilkan di panel Stream-nya.

Saat pengguna ingin mengirim balasan kepada pelanggan yang mereka butuhkan untuk memastikan bahwa kasus tersebut dipilih sebagai induk dari surel yang sedang dikirim. Ini akan membuat pelanggan membalas alamat surel grup daripada ke pengguna sendiri.

## Akun Surel Pribadi

Pengguna bisa mengatur akun surel mereka sendiri yang perlu dipantau. Surel> Menu Tarik-ulur Kanan Atas> Akun Surel Pribadi. Administrator juga bisa mengatur akun surel pengguna.

## Penyaringan Surel

Ini memungkinkan penyaringan surel masuk sesuai dengan kriteria yang ditentukan. Misalnya jika Anda tidak ingin pesan pemberitahuan dikirim oleh beberapa aplikasi untuk diimpor ke EspoCRM Anda dapat membuat filter untuk membuat EspoCRM melewatkannya.

Admin dapat membuat penyaringan umum, diterapkan ke semua akun surel. Pengguna dapat membuat penyaringan untuk akun surel pribadi mereka dan untuk keseluruhan kotak masuk.
