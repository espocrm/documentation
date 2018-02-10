# Manajemen Proses Bisnis

Alat Manajemen Proses Bisnis (BPM) menyediakan kemampuan untuk memodelkan dan mengotomatisasi proses bisnis di EspoCRM. Ini adalah proses bisnis pelaksana mesin yang dijelaskan dalam standar BPMN 2.0. Alat BPM tersedia di [Paket Lanjutan](https://www.espocrm.com/extensions/advanced-pack/) perpanjangan.

![Contoh BPM](../_static/images/administration/bpm/bpm-1.png)

### Perbedaan Dari Alat Alur Kerja

Alat alur kerja ditujukan untuk otomasi aturan bisnis sederhana, dengan item arus berurutan, bila tidak perlu menampilkan arus secara grafis.

Alat BPM ditujukan untuk arus bisnis yang lebih kompleks, di mana ada arus divergen dan konvergen, penundaan eksekusi, interaksi pengguna. Tampilan flowchart membuat proses bisnis lebih mudah dipahami bagi manusia, sebuah log memungkinkan untuk melihat bagaimana prosesnya dilakukan.

## Bagan Alur Proses

Tautan ke diagram alur proses tersedia dari panel administrasi. Hal ini juga dapat ditambahkan sebagai tab pada panel navigasi.

Flowchart dimaksudkan untuk pemodelan proses bisnis. Administrator dapat membuat dan mengedit diagram alur. Pengguna biasa hanya dapat melihat diagram alur.

Setiap flowchart memiliki tipe entitas khusus (field Tipe Sasaran). flowchart menentukan pelaksanaan contoh proses masa depan. Ini terdiri dari unsur-unsur flowchart dan hubungan antara unsur-unsur.

Jika proses flowchart memiliki dicentang 'Apakah Aktif' lapangan maka tidak akan memulai contoh proses.

Untuk menunjukkan rincian dan parameter dari elemen flowchart tertentu yang perlu Anda klik di atasnya. Dalam mode sunting Anda akan dapat menyunting parameter.

## Proses

Prosesnya tersedia dari panel administrasi. Link ini juga bisa ditambahkan sebagai tab pada panel navigasi.

Proses mewakili contoh proses bisnis. Saat diinisiasi itu mendapat status 'Started'. Saat proses selesai itu mendapat status 'Ended'. Prosesnya juga bisa dihentikan secara manual oleh pengguna yang memiliki akses untuk mengedit prosesnya. Jika dihentikan secara manual, statusnya akan 'Berhenti'.

Proses dijalankan sesuai dengan flowchart. Flowchart proses tidak dapat diubah setelah proses dimulai.

Prosesnya wajib berkaitan dengan catatan target tunggal.

Proses dapat dimulai secara otomatis (pada kondisi tertentu atau dengan penjadwalan) atau manual (setidaknya ada satu Start Event di flowchart). Untuk memulai proses secara manual, pengguna perlu mengklik tombol 'Start Process' pada daftar tampilan proses.

## Elemen Alir Alur

### Acara

Acara yang ditampilkan pada diagram alur sebagai lingkaran.

#### Mulai Acara

Tidak memiliki parameter. Ini adalah titik awal dari proses. Start Event dapat dimulai secara manual oleh pengguna yang memiliki akses untuk membuat proses. Pengguna perlu mengklik tombol 'Start Process' pada tampilan daftar proses.

#### Acara Mulai Bersyarat

Titik awal proses. Ini seharusnya dipicu secara otomatis ketika kondisi tertentu terpenuhi. Ada dua jenis pemicu: 'Setelah rekor diciptakan', 'Setelah rekaman disimpan'.

#### Timer Mulai Acara

Titik awal proses. Ini memulai proses dengan penjadwalan. Anda perlu menentukan daftar laporan yang mengembalikan catatan untuk memulai proses dan penjadwalan dalam notasi crontab.

#### Acara Intermediate Bersyarat

Acara ini menghentikan aliran sampai kriteria tertentu terpenuhi.

#### Timer Intermediate Event

Acara ini menghentikan arus dan menunggu selama ditentukan oleh parameter acara.

Untuk pengaturan timer yang lebih kompleks Anda bisa menggunakan [formula] (formula.md). Skrip rumus harus mengembalikan nilai Date-Time (dalam zona waktu UTC). Setelah waktu ini tiba arus akan dilanjutkan ke elemen berikutnya.

Dengan memanfaatkan fungsi rumus di depan datetime, mungkin menetapkan timer ke waktu tertentu di masa mendatang, mis. awal hari kerja berikutnya.  

#### Acara Berakhir

Mengakhiri arus. Ini tidak mengakhiri arus yang mengalir secara paralel. Saat arus mencapai akhir acara dan tidak ada yang berjalan paralel maka prosesnya akan berakhir.

#### Hentikan Akhir Acara

Berakhir semua arus. Proses selanjutnya berakhir.

### Gateways

Gateway ditampilkan sebagai berlian.

#### Eksklusif Gateway

Dapat menyimpang atau konvergen arus.

Dalam kasus divergen itu mendefinisikan satu aliran (jalur) yang akan dipilih sesuai kriteria yang ditentukan. Kondisi pertama yang terpenuhi menentukan arus, kondisi selanjutnya dihilangkan. Ada kemampuan untuk menentukan arus default. Aliran default dipilih jika tidak ada kondisi yang terpenuhi. Aliran default ditandai dengan tanda garis miring.

Jika konvergen hanya mengarahkan arus ke elemen keluar. Itu tidak tersumbat setelah arus datang, jadi arus sejajar tidak akan tergabung dalam arus tunggal.

![gerbang eksklusif berbeda](../_static/images/administration/bpm/gateway-exclusive-divergent.png)

![konvergen gerbang eksklusif](../_static/images/administration/bpm/gateway-exclusive-convergent.png)

#### inklusif Gateway

Dapat menyimpang atau konvergen arus.

Dalam kasus divergen, ia dapat mengarahkan ke satu atau beberapa arus sejajar (jalur), tergantung pada pemenuhan kriteria setiap aliran. Aliran default dipilih jika tidak ada kondisi yang terpenuhi. Aliran default ditandai dengan tanda garis miring.

Jika ada kebutuhan untuk menggabungkan arus paralel yang dihasilkan oleh gateway inverging inklusif Anda perlu menggunakan gateway inklusif yang konvergen. Ini akan menunggu semua arus masuk dan kemudian melanjutkan ke elemen keluar.

![inklusif Gateway](../_static/images/administration/bpm/gateway-inclusive.png)

Catatan: Diverging dan konvergen gateways harus seimbang.

Catatan: Jika salah satu arus paralel telah berakhir karena beberapa alasan, maka gerbang divergen tidak akan pernah diproses. Prosesnya akan diblokir. Hindari desain flowchart yang bisa membawa situasi seperti itu.

#### Gateway paralel

Dapat menyimpang atau konvergen arus.

Dalam kasus divergen itu dibagi mengalir ke beberapa arus paralel. Tidak ada parameter untuk tipe gateway ini.

Jika terjadi konvergen, menunggu sampai semua arus masuk masuk dan kemudian berlanjut ke elemen keluar berikutnya.

![Gateway paralel](../_static/images/administration/bpm/gateway-parallel.png)

Catatan: Diverging dan konvergen gateways harus seimbang.

Catatan: Jika salah satu arus paralel telah berakhir karena beberapa alasan, maka gerbang divergen tidak akan pernah diproses. Prosesnya akan diblokir. Hindari desain flowchart yang bisa membawa situasi seperti itu.

#### Acara Gateway Berbasis

Hanya bisa menyimpang aliran.

Ini berhenti mengalir sampai ada kejadian keluar yang dipicu. Triggered event menentukan aliran tunggal. Acara keluar lainnya ditolak.

Hanya kejadian antara bisa berada di ujung arus deras keluar lainnya.

![gateway berbasis acara](../_static/images/administration/bpm/gateway-event-based.png)

### Kegiatan

Kegiatan ditampilkan sebagai persegi panjang bulat.

#### Tugas

Tugas dapat melakukan tindakan berikut:

* Buat Rekam - membuat catatan baru dari tipe entitas apa pun;
* Buat Catatan Terkait - membuat catatan baru yang terkait dengan catatan target;
* Perbarui Rekaman Target;
* Perbarui Rekor Terkait - update catatan atau catatan yang terkait dengan catatan target;
* Perbarui Rekaman yang Dibuat - memperbarui bidang spesifik dari setiap record yang dibuat dalam proses saat ini;
* Perbarui Rekaman Proses - dapat digunakan untuk menetapkan proses ke pengguna atau tim tertentu;
* Tautan ke Rekaman Lain - menghubungkan catatan target dengan catatan yang ditentukan;
* Batalkan Tautan dari Rekaman Lain - hapus catatan sasaran dari catatan yang ditentukan;
* Terapkan Aturan Tugas - memberikan catatan target, catatan proses atau catatan yang dibuat oleh proses sesuai dengan peraturan khusus;
* Buat Pemberitahuan - buat pemberitahuan dalam aplikasi untuk pengguna tertentu;
* Buat Diikuti - membuat pengguna tertentu mengikuti catatan target, catatan proses atau rekaman yang dibuat oleh proses;
* Jalankan Aksi Layanan - menjalankan tindakan layanan kustom yang dilakukan oleh pengembang.

Tindakan yang tersedia untuk tugas yang hampir sama dengan di fitur Workflow. Lihat rincian lebih lanjut tentang [tindakan alur kerja ini] (workflows.md # tindakan).

#### Kirim pesan tugas

Mengirim pesan email ke penerima tertentu.

#### Tugas Pengguna

Menyediakan kemampuan interaksi pengguna yang fleksibel. Ini berhenti eksekusi sampai pengguna (ditentukan secara eksplisit atau oleh aturan tugas) menyelesaikan tugasnya. Proses Pengguna Tugas record akan dibuat dalam sistem. Secara default ada tiga jenis tindakan: Setujui, Review, Diselesaikan.

* Setujui jenis mengharuskan pengguna untuk memilih antara 'Disetujui' dan 'Ditolak'.
* Tipe ulasan hanya memberikan satu pilihan: 'diulas'.
* Menyelesaikan jenis memiliki dua pilihan: 'Selesai' dan 'Gagal'.


Pengguna yang ditugaskan ke catatan Tugas Pengguna Proses yang dibuat akan menerima notifikasi dalam aplikasi. Administrator juga dapat mengaktifkan pemberitahuan email.

Pengguna juga dapat menambahkan dashlet Tugas Pengguna Proses di dasbor mereka untuk melihat tugas pengguna proses aktual mereka.

Anda bisa membaca resolusi tugas pengguna yang lewat di dalam gerbang yang berbeda atau kejadian bersyarat, yang membuat kerusakan dalam aliran proses.

#### Tugas Script

Jalankan script dalam bahasa [espo-formula] (formula.md). Semua variabel set (`$ variableName`) akan disimpan dan tersedia dalam proses.

### Arus

#### Urutan Arus

Direpresentasikan sebagai sebuah panah yang solid. Menunjukkan urutan elemen proses akan dieksekusi.

## Kondisi

Peristiwa bersyarat, gerbang invergen eksklusif dan inklusif memiliki kondisi yang menentukan arus proses.

Melalui UI ada kemampuan untuk memeriksa kondisi untuk catatan berikut:

* Target rekaman;
* Catatan yang terkait dengan target melalui hubungan banyak-ke-satu dan hubungan antara anak-ke-orang tua;
Rekaman dibuat oleh proses melalui tugas;
* User task records, yang memungkinkan pengecekan resolusinya.

Ini juga memungkinkan untuk mendefinisikan kondisi dalam bahasa [Espo-formula] (formula.md).

Kondisi alat BPM sama seperti pada fitur Workflow. Lihat rincian lebih lanjut tentang [kondisi alur kerja] (kondisi workflows.md #).

## Contoh

### Contoh 1

![Contoh 1](../_static/images/administration/bpm/example-1.png)

### Contoh 2

![Contoh 2](../_static/images/administration/bpm/example-2.png)

### Contoh 3

![Contohe 3](../_static/images/administration/bpm/example-3.png)
