# Manajer Entitas

Manajer Entitas tersedia di panel Administrasi. Ini memberikan kemampuan untuk sangat menyesuaikan contoh EspoCRM Anda. Anda dapat melakukan hal berikut:

* Menambahkan jenis entitas baru.
* Menyesuaikan jenis entitas yang ada: ganti label, urutan default dalam tampilan daftar, aktifkan atau nonaktifkan siaran.
* Mengkonfigurasi bidang: menambahkan, menyesuaikan yang sudah ada.
* Mengkonfigurasi hubungan: menambahkan, ganti label yang sudah ada.

## Membuat entitas baru

Klik tombol `Buat Entitas` di halaman Manajer Entitas. Tentukan nama, label dan tipe. Jika Anda memilih tipe `Orang`, entitas Anda akan memiliki kolom Surel, Telepon, Nama Depan, Nama Belakang dan Salam. Centang `Siaran` jika Anda ingin entitas Anda memiliki panel siaran dan pengguna untuk dapat mengikuti entitas jenis ini.

Tipe:

* Basis - entitas kosong hanya dengan bidang dasar seperti Nama, Pengguna yang Ditugaskan, Tim, Deskripsi.
* Basis Tambahan - seperti Basis tapi dengan Kegiatan, Sejarah, Panel tugas (tersedia sejak 4.3.0).
* Event - Tanggal Mulai, Tanggal Akhir, Durasi, Induk, Bidang Status. Tersedia dalam panel Kalender dan Aktivitas (sejak 4.3.0, harus diaktifkan di Administrasi> Pengaturan).
* Orang - Surel, Telepon, Nama Depan, Nama Belakang, Salam, Bidang Alamat. Aktifitas, Sejarah, Panel tugas.
* Perusahaan - Surel, Telepon, Alamat Penagihan, Alamat Pengiriman. Aktifitas, Sejarah, Panel tugas.

## Memperbarui entitas yang ada

Jika Anda mengklik link `Ubah` pada entitas tertentu Anda akan dapat mengubah beberapa parameter dari entitas itu.

* Label - nama singular dan plural dari entitas.
* Catatan pesanan default diurutkan berdasarkan daftar tampilan.
* Siaran - apakah fitur Siaran diaktifkan untuk entitas ini.
* Dinonaktifkan - periksa apakah Anda tidak memerlukan entitas ini di siaran Anda.
* Bidang Penyaringan Teks - bidang apa yang dicari di penyaringan teks utama dan pencarian umum.


## Bidang

Dengan mengklik link `Bidang` Anda akan dipindahkan ke halaman yang terpisah. Di sana Anda akan bisa membuat bidang baru atau memperbarui yang sudah ada. Jenis bidang berikut tersedia di Manajer Entitas:

* Alamat - alamat dengan jalan, kota, negara bagian, kode pos dan negara;
* Jajaran - daftar nilai, dengan kemampuan untuk memilih beberapa nilai (bukan pilihan yang baik jika Anda perlu mencari dengan bidang ini); pengguna dapat menambahkan nilai mereka sendiri jika opsi tidak ditentukan.
* Lampiran Beberapa - melampirkan beberapa file;
* Kenaikan-otomatis - hanya membaca nomor yang dihasilkan;
* Boolean - kotak centang, benar atau salah;
* Mata uang - untuk nilai mata uang;
* Tanggal;
* Tanggal Waktu;
* Enum - kotak pilih, dengan kemampuan untuk memilih hanya satu nilai;
* File - mengunggah satu file;
* Float - angka dengan bagian desimal;
* Asing - bidang entitas terkait;
* Gambar - mengunggah file gambar dengan preview;
* Integer - bilangan bulat;
* Nomor - jumlah incrementing otomatis tipe string dengan awalan yang mungkin dan panjang tertentu;
* Multi-enum - daftar nilai, dengan kemampuan untuk memilih beberapa nilai (bukan pilihan yang baik jika Anda perlu mencari dengan bidang ini), mirip dengan Jajaran tapi lebih bagus.
* Text - text area, untuk teks multiline yang panjang;
* Url - untuk tautan;
* Varchar - teks pendek;
* Wysiwyg - mirip dengan Area teks, dengan kemampuan untuk memformat teks.

Parameter:
* Diperlukan - apakah pengisian di lapangan adalah wajib.
* Nilai Default - Nilai bidang yang ditetapkan saat membuat catatan baru.
* Audit - pembaruan lapangan akan dicatat di Siaran.


**Catatan**: Setelah menambahkan bidang baru, Anda perlu menempatkan bidang ini di [tata letak](layout-manager.md) (Administrasi> Manajer Tata letak).

### Logika Dinamis

Menyediakan kemampuan untuk membuat bentuk dinamis. Mungkin untuk menentukan kondisi yang membuat bidang tertentu terlihat, dibutuhkan atau hanya-baca. Kondisi akan diperiksa secara otomatis bila data dalam bentuk berubah.

Untuk bidang Enum, Array dan Multi Enum, mungkin untuk menentukan rangkaian opsi yang berbeda yang akan tersedia untuk lapangan tergantung pada kondisi yang terpenuhi.


## Hubungan

Anda dapat membuat hubungan baru antara entitas yang beda dari biasanya dan custom. Ada 3 jenis hubungan yang tersedia:

* Satu-ke-Banyak: setelah Anda membuat hubungan ini, Anda dapat memasukkan bidang tautan ke tata letak detail entitas yang benar dan menambahkan panel hubungan ke entitas kiri;
* Banyak-ke-Satu: sama seperti Satu-ke-Banyak tetapi sebaliknya;
* Banyak-ke-Banyak: panel hubungan di kedua sisi.

Parameter 'Link Multiple Field' menyiratkan bahwa bidang tipe `linkMultiple` akan dibuat bersamaan dengan hubungan. Anda dapat menempatkan bidang semacam itu pada tata letak. Ini mudah untuk memilih catatan terkait dengan cepat. Ini bukan pilihan yang baik jika hubungan Anda dimaksudkan untuk memiliki banyak catatan terkait yang dapat memperlambat pemuatan layar tampilan detail.

Jika parameter 'Diaudit' diperiksa maka pembaruan hubungan akan dicatat di Siaran.

