# Manajemen Proses Bisnis

Alat Manajemen Proses Bisnis (BPM) menyediakan kemampuan untuk memodelkan dan mengotomatisasi proses bisnis di EspoCRM. Ini adalah proses bisnis pelaksana mesin yang dijelaskan dalam standar BPMN 2.0. Alat BPM tersedia di ekstensi [Paket Lanjutan](https://www.espocrm.com/extensions/advanced-pack/).

! [Contoh BPM] (../_ static / images / administration / bpm / bpm-1.png)

### Selisih alat Alur kerja

Alat alur kerja ditujukan untuk otomasi aturan bisnis sederhana, dengan item arus berurutan, bila tidak perlu menampilkan arus secara grafis.

Alat BPM ditujukan untuk arus bisnis yang lebih kompleks, di mana ada arus divergen dan konvergen, penundaan eksekusi, interaksi pengguna. Tampilan Grafik Alir membuat proses bisnis lebih mudah dipahami bagi manusia, sebuah log memungkinkan untuk melihat bagaimana prosesnya dilakukan.

## Proses Grafik Alir

Tautan ke diagram alur proses tersedia dari panel administrasi. Ini juga bisa ditambahkan sebagai tab pada panel navigasi.

Grafik Alir ditujukan untuk pemodelan proses bisnis. Administrator dapat membuat dan mengedit diagram alur. Pengguna biasa hanya dapat melihat diagram alur.

Setiap Grafik Alir memiliki tipe entitas khusus (field Tipe Sasaran). Diagram alir menentukan pelaksanaan contoh proses di masa depan. Ini terdiri dari elemen Grafik Alir dan koneksi antar elemen.

Jika Grafik Alir proses memiliki field 'Is Active' yang tidak dicentang maka tidak akan melakukan instance proses.

Untuk menampilkan rincian dan parameter elemen diagram alir tertentu yang perlu Anda klik di atasnya. Dalam mode edit Anda bisa mengedit parameter.

## Proses

Prosesnya tersedia dari panel administrasi. Link ini juga bisa ditambahkan sebagai tab pada panel navigasi.

Proses mewakili contoh proses bisnis. Saat diinisiasi itu mendapat status 'Started'. Saat proses selesai itu mendapat status 'Ended'. Prosesnya juga bisa dihentikan secara manual oleh pengguna yang memiliki akses untuk mengedit prosesnya. Jika dihentikan secara manual, statusnya akan 'Berhenti'.

Proses dijalankan sesuai dengan Grafik Alir. Grafik Alir proses tidak dapat diubah setelah proses dimulai.

Prosesnya wajib berkaitan dengan Rekaman sasaran tunggal.

Proses dapat dimulai secara otomatis (pada kondisi tertentu atau dengan penjadwalan) atau manual (setidaknya ada satu Start Event di Grafik Alir). Untuk memulai proses secara manual, pengguna perlu mengklik tombol 'Start Process' pada daftar tampilan proses.

## Elemen Grafik Alir

### Peristiwa

Peristiwa ditampilkan pada diagram alir sebagai lingkaran.

#### Mulai Peristiwa

Tidak memiliki parameter Ini adalah titik awal prosesnya. Start Event dapat dimulai secara manual oleh pengguna yang memiliki akses untuk membuat proses. Pengguna perlu mengklik tombol 'Start Process' pada tampilan daftar proses.

#### Peristiwa Awal Bersyarat

Titik awal proses. Ini seharusnya dipicu secara otomatis saat kondisi tertentu terpenuhi. Ada dua jenis pemicu: 'Setelah rekaman terbuat', 'Setelah rekaman tersimpan'.

#### Waktu Mulai Peristiwa

Titik awal proses. Ini memulai proses dengan penjadwalan. Anda perlu menentukan daftar laporan yang mengembalikan Rekaman untuk memulai proses dan penjadwalan dalam notasi crontab.

#### Peristiwa Bersyarat Menengah

peristiwa ini menghentikan aliran sampai kriteria tertentu terpenuhi.

#### Peristiwa Waktu Menengah

Peristiwa ini menghentikan arus dan menunggu selama ditentukan oleh parameter peristiwa.

Untuk pengaturan timer yang lebih kompleks Anda bisa menggunakan [formula](formula.md). Skrip rumus harus mengembalikan nilai Date-Time (dalam zona waktu UTC). Setelah waktu ini tiba arus akan dilanjutkan ke elemen berikutnya.

Dengan memanfaatkan fungsi rumus di depan datetime, mungkin menetapkan timer ke waktu tertentu di masa mendatang, mis. awal hari kerja berikutnya.

#### Akhir Peristiwa

Mengakhiri arus. Ini tidak mengakhiri arus yang mengalir secara paralel. Saat arus mencapai akhir peristiwa dan tidak ada yang berjalan paralel maka prosesnya akan berakhir.

#### Hentikan Akhir peristiwa

Berakhir semua mengalir. Proses selanjutnya berakhir.

### Gerbang

gerbang ditampilkan sebagai berlian.

#### Gerbang Ekslusif

Bisa menyimpang atau menyatu arus.

Dalam kasus divergen itu mendefinisikan satu aliran (jalur) yang akan dipilih sesuai kriteria yang ditentukan. Kondisi pertama yang terpenuhi menentukan arus, kondisi selanjutnya dihilangkan. Ada kemampuan untuk menentukan arus default. Aliran default dipilih jika tidak ada kondisi yang terpenuhi. Aliran default ditandai dengan tanda garis miring.

Jika konvergen hanya mengarahkan arus ke elemen keluar. Itu tidak tersumbat setelah arus datang, jadi arus sejajar tidak akan tergabung dalam arus tunggal.

! [gateway eksklusif divergen] (../_ static / images / administration / bpm / gateway-exclusive-divergent.png)

! [gateway eksklusif konvergen] (../_ static / images / administration / bpm / gateway-exclusive-convergent.png)

#### Gerbang Inklusif

Bisa menyimpang atau menyatu arus.

Dalam kasus divergen, ia dapat mengarahkan ke satu atau beberapa arus sejajar (jalur), tergantung pada pemenuhan kriteria setiap aliran. Aliran default dipilih jika tidak ada kondisi yang terpenuhi. Aliran default ditandai dengan tanda garis miring.

Jika ada kebutuhan untuk menggabungkan arus paralel yang dihasilkan oleh gerbang inverging inklusif Anda perlu menggunakan gerbang inklusif yang konvergen. Ini akan menunggu semua arus masuk dan kemudian melanjutkan ke elemen keluar.

! [gerbang inklusif] (../_ static / images / administration / bpm / gateway-inclusive.png)

Rekaman: Diverging dan gerbang konvergen harus seimbang.

Rekaman: Jika salah satu arus paralel telah berakhir karena beberapa alasan, maka gerbang divergen tidak akan pernah diproses. Prosesnya akan diblokir. Hindari desain Grafik Alir yang bisa membawa situasi seperti itu.

#### Gerbang Paralel

Bisa menyimpang atau menyatu arus.

Dalam kasus divergen itu dibagi mengalir ke beberapa arus paralel. Tidak ada parameter untuk tipe gerbang ini.

Jika terjadi konvergen, menunggu sampai semua arus masuk masuk dan kemudian berlanjut ke elemen keluar berikutnya.

! [gateway paralel] (../_ static / images / administration / bpm / gateway-parallel.png)

Rekaman: Diverging dan konvergen gerbang harus seimbang.

Rekaman: Jika salah satu arus paralel telah berakhir karena beberapa alasan, maka gerbang divergen tidak akan pernah diproses. Prosesnya akan diblokir. Hindari desain Grafik Alir yang bisa membawa situasi seperti itu.

#### Basis Secara Gerbang

Hanya bisa menyimpang aliran.

Ini berhenti mengalir sampai ada kejadian keluar yang dipicu. Peristiwa yang dipicu menentukan aliran tunggal. peristiwa keluar lainnya ditolak.

Hanya kejadian antara bisa berada di ujung arus deras keluar lainnya.

! [event based gateway] (../_ static / images / administration / bpm / gateway-event-based.png)

### Kegiatan

Kegiatan ditampilkan sebagai persegi panjang bulat.

#### Tugas

Tugas dapat melakukan tindakan berikut:

* Buat Rekaman - membuat Rekaman baru dari tipe entitas apa pun;
* Buat Rekaman sasaran - membuat Rekaman baru yang terkait dengan Rekaman sasaran;
* Perbarui Rekaman Sasaran;
* Perbarui Rekaman yang terkait - Perbarui Rekaman atau Rekaman yang terkait dengan Rekaman sasaran;
* Perbarui Rekaman yang dibuat - memperbarui bidang spesifik dari setiap Rekaman yang dibuat dalam proses saat ini;
* Perbarui Rekaman proses - dapat digunakan untuk menetapkan proses ke pengguna atau tim tertentu;
* Tautakan ke Rekaman Lain - menghubungkan Rekaman sasaran dengan Rekaman yang ditentukan;
* Batalkan Tautan dari Rekaman Lain - hapus Rekaman sasaran dari Rekaman yang ditentukan;
* Terapkan Aturan Tugas - memberikan Rekaman sasaran, Rekaman proses atau Rekaman yang dibuat oleh proses sesuai dengan peraturan khusus;
* Buat Pemberitahuan - buat pemberitahuan dalam aplikasi untuk pengguna tertentu;
* Buat Diikuti - membuat pengguna tertentu mengikuti Rekaman sa, Rekaman proses atau rekaman yang dibuat oleh proses;
* Jalankan Aksi Layanan - menjalankan tindakan layanan kustom yang dilakukan oleh pengembang.

Tindakan yang tersedia untuk tugas hampir sama seperti pada fitur Workflow. Lihat rincian lebih lanjut tentang [tindakan alur kerja] (workingflows.md # actions).

#### Kirim pesan tugas

Mengirim pesan email ke penerima tertentu.

#### Tugas Pengguna

Menyediakan kemampuan interaksi pengguna yang fleksibel. Ini berhenti eksekusi sampai pengguna (ditentukan secara eksplisit atau oleh aturan tugas) menyelesaikan tugasnya. Proses Tugas Pengguna Rekaman akan dibuat di sistem. Secara bawaan ada tiga jenis tindakan: Setujui, Ulasan, Diselesaikan.

* Setujui jenis mengharuskan pengguna untuk memilih antara 'Disetujui' dan 'Ditolak'.
* Tipe ulasan hanya memberikan satu pilihan: 'diulas'.
* Tipe yang tersertifikasi memiliki dua pilihan: 'Completed' dan 'Failed'.


Pengguna yang ditugaskan ke Rekaman Tugas Pengguna Proses yang dibuat akan menerima notifikasi dalam aplikasi. Administrator juga dapat mengaktifkan pemberitahuan email.

Pengguna juga dapat menambahkan dashlet Tugas Pengguna Proses di dasbor mereka untuk melihat tugas pengguna proses aktual mereka.

Anda bisa membaca resolusi tugas pengguna yang lewat di dalam gerbang yang berbeda atau kejadian bersyarat, yang membuat kerusakan dalam aliran proses.

#### Tugas Skrip

Jalankan skrip dalam bahasa [espo-formula](formula.md). Semua variabel set (`$ variableName`) akan disimpan dan tersedia dalam proses.

### Arus

#### Aliran Urutan

Diwakili sebagai panah padat. Menunjukkan urutan elemen proses yang akan dijalankan.

## Kondisi

Peristiwa bersyarat, gerbang invergen eksklusif dan inklusif memiliki kondisi yang menentukan arus proses.

Melalui UI ada kemampuan untuk memeriksa kondisi untuk Rekaman berikut:

* sasaran rekaman;
* Rekaman yang terkait dengan sasaran melalui hubungan banyak-ke-satu dan hubungan antara anak-ke-orang tua;
Rekaman dibuat oleh proses melalui tugas;
* User task Rekamans, yang memungkinkan pengecekan resolusinya.

Ini juga memungkinkan untuk mendefinisikan kondisi dalam bahasa [Espo-formula](formula.md).

Kondisi alat BPM sama seperti pada fitur Workflow. Lihat rincian lebih lanjut tentang [kondisi alur kerja] (kondisi workflows.md #).

## Contoh

### Contoh 1

! [Contoh 1] (../_ static / images / administration / bpm / example-1.png)

### Contoh 2

! [Contoh 2] (../_ static / images / administration / bpm / example-2.png)

### Contoh 3

! [Contoh 3] (../_ static / images / administration / bpm / example-3.png)