#Mengkonfigurasi EspoCRM untuk B2C (Business-to-Client)

Secara default EspoCRM dikonfigurasi untuk digunakan untuk bisnis B2B. Tapi Anda bisa dengan mudah mengaturnya untuk B2C.

* Ubah `b2cMode` menjadi true di file config `data/ config.php` Anda. Sejak versi 4.3.0 dapat dikonfigurasi di Administration> Seetings.
* Hapus tab *Account* dari menu navigasi (Administration> User Interface).
* Hapus *Account* field dari layout Anda (Administation> Layout Manager).
* Nonaktifkan akses ke *Account* scope untuk semua peran Anda (Administration> Roles).
* Hapus Account dari daftar pemilih dari semua bidang induk (Administration> Entity Manager> {Meeting/Call/Task/Email}>Fields>Parent).
