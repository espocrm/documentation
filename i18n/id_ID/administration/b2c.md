# Konfigurasi EspoCRM untuk B2C (Business-to-Client)

Secara default EspoCRM dikonfigurasi untuk menggunakan bisnis B2B. Tetapi Anda dapat mengatur B2C dengan mudah.

* Ganti `b2cMode` menjadi true di file konfigurasi `data/config.php`. Sejak versi 4.3.0 dapat dikonfigurasikan di administrasi > Pengaturan.
* Hapus tab *Account* dari menu navigasi (Administrasi > Pengalaman Pengguna).
* Hapus kolom *Account* dari tata letak Anda (Administation > Manajer Tata letak).
* Nonaktifkan akses ke cakupan *Account* untuk semua peran Anda (Administrasi > Peran).
* Remove Account from picklists of all parent fields (Administration > Entity Manager > {Meeting/Call/Task/Email} > Fields > Parent).
* Hapus Akun dari pilihan kolom induk (Administrasi > Manajer Entitas > {Rapat/Panggil/Tugas/Surel} > Kolom > Induk).
