# Manajemen Proses Bisnis

Alat Manajemen Proses Bisnis (MPB) menyediakan kemampuan untuk memodelkan dan mengotomatisasi proses bisnis di EspoCRM. Ini adalah proses bisnis pelaksana mesin yang dijelaskan dalam standar BPMN 2.0. Alat BPM tersedia di ekstensi [Paket Lanjutan](https://www.espocrm.com/extensions/advanced-pack/).

![contoh MPB](../_static/images/administration/bpm/bpm-1.png)

### Perbedaan alat Alur Kerja

Alur kerja kerja ditujukan untuk otomatisasi aturan bisnis sederhana, selain item alur berurutan, jika tidak perlu menampilkan arus secara grafis.

Alat MPB ditujukan untuk arus bisnis yang lebih kompleks, dimana ada arus divergen dan konvergen, penundaan eksekusi, interaksi pengguna. Tampilan alur kerja membuat proses bisnis lebih mudah dipahami bagi manusia, sebuah log memungkinkan untuk melihat bagaimana prosesnya dilakukan.

## Proses Alur Kerja

Tautan untuk memproses alur kerja tersedia dari panel administrasi. Ini juga bisa ditambahkan sebagai tab pada panel navigasi.

Alur kerja ditujukan untuk pemodelan proses bisnis. Administrator dapat membuat dan mengedit alur kerja. Pengguna biasa hanya dapat melihat alur kerja.

Setiap alur kerja memiliki tipe entitas khusus (bidang Tipe Sasaran). Alur kerja menentukan pelaksanaan contoh proses di kemudian. Ini terdiri dari elemen alur kerja dan koneksi antar elemen.

Jika proses alur kerja memiliki bidang 'Aktif' yang tidak dicentang maka tidak akan melakukan proses instance.

Untuk menampilkan rincian dan parameter elemen alur kerja tertentu Anda perlu mengkliknya. Dalam mode edit Anda dapat mengubah parameter.

## Pengolahan

Pengolahan tersedia dari panel administrasi. Tautan ini juga bisa ditambahkan sebagai tab pada panel navigasi.

Pengolahan  mewakili contoh proses bisnis. Saat diinisiasi akan mendapat status 'Dimulai'. Saat proses selesai akan mendapat status 'Berakhir'. Pengolahannya juga bisa dihentikan secara manual oleh pengguna yang memiliki akses untuk mengubah pengolahannya. Jika dihentikan secara manual, statusnya akan 'Berhenti'.

Pengolahan dijalankan sesuai dengan alur kerja. Proses alur kerja tidak dapat diubah setelah proses dimulai.

Pengolahan wajib berkaitan dengan catatan target tunggal.

Pengolahan dapat dimulai secara otomatis (pada kondisi tertentu atau dengan penjadwalan) atau manual (setidaknya ada satu Perihal Awal di alur kerja). Untuk memulai proses secara manual, pengguna perlu mengklik tombol 'Mulai Pengolahan' pada daftar tampilan pengolahan.

## Elemen Alur Kerja

### Perihal

Perihal ditampilkan pada alur kerja sebagai lingkaran.

#### Memulai Perihal

Tidak memiliki parameter. Ini adalah titik awal prosesnya. Memulai Perihal dapat dimulai secara manual oleh pengguna yang memiliki akses untuk membuat proses. Pengguna perlu mengklik tombol 'Mulai Proses' pada tampilan daftar proses.

#### Memulai Perihal Bersyarat

Titik awal proses. Ini seharusnya dipicu secara otomatis saat kondisi tertentu terpenuhi. Ada dua jenis pemicu: 'Setelah Rekaman Dibuat', 'Setelah Rekaman Disimpan'.

#### Waktu Memulai Perihal

Titik awal proses. Ini memulai proses dengan penjadwalan. Anda perlu menentukan daftar laporan yang mengembalikan rekaman untuk memulai proses dan penjadwalan dalam notasi *crontab*.

#### Perihal Menengah Bersyarat

Perihal ini menghentikan alur sampai kriteria tertentu terpenuhi.

#### Perihal Waktu Menengah

Acara ini menghentikan alur dan menunggu selama ditentukan oleh parameter perihal.

Untuk pengaturan waktu yang lebih kompleks Anda bisa menggunakan [rumus](formula.md). Skrip rumus harus mengembalikan nilai Tanggal-Waktu (dalam zona waktu UTC). Setelah waktu ini tiba alur akan dilanjutkan ke elemen berikutnya.

Dengan memanfaatkan fungsi rumus *datetime\closest*, Memungkinkan untuk menetapkan waktu ke waktu tertentu di masa mendatang, misalnya awal hari kerja berikutnya. 

#### Akhir Perihal

Mengakhiri alur terkini. Ini tidak mengakhiri alur yang mengalir secara paralel. Saat alur mencapai akhir perihal dan tidak ada yang berjalan pada paralel maka prosesnya akan berakhir.

#### Mengakhiri Perihal

Mengakhiri semua alur. Perihal selanjutnya berakhir.

### Gateway

Gateway ditampilkan sebagai berlian.

#### Gateway Eksklusif

Bisa alur menyimpang atau menyatu.

Dalam kasus divergen mendefinisikan satu alur (jalur) yang akan dipilih sesuai kriteria yang ditentukan. Kondisi pertama yang terpenuhi menentukan alur, kondisi selanjutnya dihilangkan. Ada kemampuan untuk menentukan alur default. Alur default dipilih jika tidak ada kondisi yang terpenuhi. Alur default ditandai dengan tanda garis miring.

Jika konvergen hanya mengarahkan alur ke elemen keluar. Itu tidak tersumbat setelah arus datang, jadi alur sejajar tidak akan tergabung dalam alur tunggal.

![gateway divergent eksklusif](../_static/images/administration/bpm/gateway-exclusive-divergent.png)

![gateway convergent eksklusif](../_static/images/administration/bpm/gateway-exclusive-convergent.png)

#### Gateway Inklusif

Bisa alur menyimpang atau menyatu.

Dalam kasus divergen, ia dapat mengarahkan ke satu atau beberapa alur sejajar (jalur), tergantung pada pemenuhan kriteria setiap alur. Alur default dipilih jika tidak ada kondisi yang terpenuhi. Alur default ditandai dengan tanda garis miring.

Jika ada kebutuhan untuk menggabungkan alur yang dihasilkan oleh gateway inverging inklusif Anda perlu menggunakan gateway inklusif yang konvergen. Ini akan menunggu semua alur masuk dan kemudian melanjutkan ke elemen keluar.

![gateway inklusif](../_static/images/administration/bpm/gateway-inclusive.png)

Catatan: Gateways diverging dan konvergen harus seimbang.

Catatan: Jika salah satu alur telah berakhir karena beberapa alasan, maka gateway divergen tidak akan pernah diproses. Prosesnya akan diblokir. Hindari desain alur kerja yang bisa membawa situasi seperti itu.

#### Gateway Paralel

Bisa alur menyimpang atau menyatu.

Dalam kasus divergen itu dibagi mengalir ke beberapa alur paralel. Tidak ada parameter untuk tipe gateway ini.

Jika terjadi konvergen, menunggu sampai semua alur masuk kemudian berlanjut ke elemen keluar berikutnya.

![gateway paralel](../_static/images/administration/bpm/gateway-parallel.png)

Catatan: Gateways divergen dan konvergen harus seimbang.

Catatan: Jika salah satu alur paralel telah berakhir karena beberapa alasan, maka gateway divergen tidak akan pernah diproses. Prosesnya akan diblokir. Hindari desain alur kerja yang bisa membawa situasi seperti itu.

#### Gateway Berdasarkan Perihal

Hanya bisa alur menyimpang.

Ini memberhentikan alur sampai ada kejadian keluar yang dipicu. Perihal yang dipicu menentukan alur tunggal. Perihal keluar lainnya akan ditolak.

Hanya Perihal mengengah yang bisa berada di ujung alur deras keluar lainnya.

![gateway berdasarkan perihal](../_static/images/administration/bpm/gateway-event-based.png)

### Aktivitas

Aktifitas ditampilkan sebagai persegi panjang bulat.

#### Tugas

Tugas dapat melakukan tindakan berikut:

* Buat Rekaman - membuat rekaman baru dari tipe entitas apa pun;
* Buat Rekaman Terkait - membuat rekaman baru yang terkait dengan rekaman target;
* Perbarui Target Rekaman;
* Perbarui Rekaman Terkait - perbarui rekaman atau rekaman yang terkait dengan rekaman target;
* Perbarui Rekaman yang Dibuat - memperbarui bidang spesifik dari setiap rekaman yang dibuat dalam proses saat ini;
* Perbarui Proses Rekaman - dapat digunakan untuk menetapkan proses ke pengguna atau tim tertentu;
* Tautan ke Rekaman Lain - menghubungkan rekaman target dengan rekaman yang ditentukan;
* Batalkan Tautan dari Rekaman Lain - hapus rekaman sasaran dari rekaman yang ditentukan;
* Terapkan Aturan Tugas - memberikan rekaman target, rekaman proses atau rekaman yang dibuat oleh proses sesuai dengan peraturan khusus;
* Buat Pemberitahuan - buat pemberitahuan dalam aplikasi untuk pengguna tertentu;
* Buat Diikuti - membuat pengguna tertentu mengikuti rekaman target, rekaman proses atau rekaman yang dibuat oleh proses;
* Jalankan Tindakan - menjalankan tindakan layanan kustom yang dilakukan oleh pengembang.

Tindakan yang tersedia untuk tugas hampir sama seperti pada fitur Alur Kerja. Lihat rincian lebih lanjut tentang [tindakan alur kerja](workingflows.md#actions).

#### Mengirim Pesan Tugas

Mengirim pesan surel ke penerima tertentu.

#### Tugas Pengguna

Menyediakan kemampuan interaksi pengguna yang fleksibel. Ini berhenti eksekusi sampai pengguna (ditentukan secara eksplisit atau oleh aturan tugas) menyelesaikan tugasnya. Proses catatan Tugas Pengguna akan dibuat di sistem. Secara default ada tiga jenis tindakan: Setujui, Review, Diselesaikan.

* Tipe setujui mengharuskan pengguna untuk memilih antara 'Disetujui' dan 'Ditolak'.
* Tipe ulasan hanya memberikan satu pilihan: 'diulas'.
* Tipe yang tersertifikasi memiliki dua pilihan: 'Selesai' dan 'Gagal'.

Pengguna yang ditugaskan ke catatan Proses Tugas Pengguna  yang dibuat akan menerima notifikasi dalam aplikasi. Administrator juga dapat mengaktifkan pemberitahuan surel.

Pengguna juga dapat menambahkan dashlet Proses Tugas Pengguna di dasbor mereka untuk melihat proses aktual tugas pengguna mereka.

Ini memungkinkan untuk membaca resolusi tugas pengguna yang lewat di dalam gateway yang berbeda atau kejadian bersyarat, yang membuat kerusakan dalam aliran proses.

#### Tugas Skrip

Eksekusi skrip dalam bahasa [rumus-espo](formula.md). Semua variabel yang diatur (`$variableName`) akan disimpan dan tersedia dalam proses.

### Arus

#### Urutan Arus

Diwakili sebagai panah tebal. Menunjukkan urutan elemen proses yang akan dijalankan.

## Kondisi

Perihal bersyarat, gateway invergen eksklusif dan inklusif memiliki kondisi yang menentukan proses arus.

Melalui UI ada kemampuan untuk memeriksa kondisi untuk catatan berikut:

* Target rekaman;
* Rekaman terkait dengan target melalui hubungan banyak-ke-satu dan hubungan antara anak-ke-induk;
* Rekaman dibuat oleh proses melalui tugas;
* Rekaman tugas pengguna, yang memungkinkan pengecekan resolusinya.

Ini juga memungkinkan untuk mendefinisikan kondisi dalam bahasa [Rumus-espo](formula.md).

Kondisi alat MPB sama seperti pada fitur Alur Kerja. Lihat rincian lebih lanjut tentang [kondisi alur kerja](workflows.md#conditions).

## Contoh

### Contoh 1

![Contoh 1](../_static/images/administration/bpm/example-1.png)

### Contoh 2

![Contoh 2](../_static/images/administration/bpm/example-2.png)

### Contoh 3

![Contoh 3](../_static/images/administration/bpm/example-3.png)
