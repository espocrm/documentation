# Manajemen Proses Bisnis

Manajemen Proses bisnis (BPM) alat ini menyediakan kemampuan untuk model dan mengotomatisasi proses bisnis di EspoCRM. Itu sebuah mesin yang menjalankan proses bisnis yang dijelaskan dalam BPMN 2.0 standar. BPM tool yang tersedia di [Advanced Pack](https://www.espocrm.com/extensions/advanced-pack/) ekstensi.

![BPM contoh](../_static/gambar/administrasi/bpm/bpm-1.png)
### Perbedaan dari Alur alat kerja

Alur kerja alat ini dimaksudkan untuk otomatisasi sederhana aturan bisnis, w/o berurutan aliran barang, ketika tidak ada kebutuhan untuk menampilkan aliran grafis.

BPM alat ini ditujukan untuk bisnis lebih kompleks mengalir, di mana bisa ada divergen dan konvergen mengalir, pelaksanaan, keterlambatan, interaksi pengguna. Flowchart view membuat proses bisnis lebih dipahami bagi manusia, log ini memungkinkan untuk melihat bagaimana proses itu dilakukan.

## Proses Diagram Alur

Link untuk proses diagram alur tersedia dari panel administrasi. Hal ini juga dapat ditambahkan sebagai tab di panel navigasi.

Diagram alur dimaksudkan untuk proses bisnis pemodelan. Administrator dapat membuat dan mengedit diagram alur. Pengguna biasa hanya bisa melihat diagram alur.

Setiap flowchart memiliki entitas tertentu jenis (Jenis Target field). Flowchart menentukan pelaksanaan depan contoh proses. Ini terdiri dari flowchart elemen-elemen dan hubungan antar elemen.

Jika flowchart proses memiliki dicentang 'Active' maka tidak akan memulai proses kasus.

Untuk menunjukkan rincian dan parameter tertentu flowchart elemen yang anda butuhkan untuk klik di atasnya. Dalam mode edit, anda akan dapat mengedit parameter.
## Proses

Proses yang tersedia dari panel administrasi. Link juga dapat ditambahkan sebagai tab di panel navigasi.

Proses ini merupakan proses bisnis misalnya. Ketika itu diprakarsai mendapat status 'Mulai'. Ketika proses selesai itu mendapat status 'Berakhir'. Proses ini juga dapat dihentikan secara manual oleh user yang memiliki akses untuk mengedit proses. Jika itu berhenti secara manual itu mendapat status 'Berhenti'.

Proses ini dilaksanakan sesuai dengan diagram alir. Bagan alir proses tidak dapat diubah setelah proses dimulai.

Proses secara wajib adalah terkait dengan target tunggal record.

Proses dapat dimulai secara otomatis (pada kondisi tertentu atau dengan penjadwalan) atau secara manual (di mana ada setidaknya satu Mulai Kegiatan di dalam bagan alir). Untuk memulai proses manual user perlu untuk mengklik 'Start' Proses tombol pada tampilan daftar dari proses.

## Flowchart Elemen

### Peristiwa

Peristiwa-peristiwa ditampilkan pada flowchart sebagai lingkaran.

#### Mulai Acara

Tidak memiliki parameter. Ini adalah titik awal dari proses. Mulai Acara dapat dimulai secara manual oleh pengguna yang memiliki akses untuk membuat proses. Pengguna perlu untuk klik 'Proses Start' tombol pada tampilan daftar dari proses.

#### Bersyarat Mulai Acara

Titik awal dari proses. Hal itu seharusnya dapat dipicu secara otomatis ketika kondisi tertentu terpenuhi. Ada dua jenis pemicu: 'Setelah dibuat catatan', 'Setelah rekor diselamatkan'.

#### Waktu Mulai Acara

Titik awal dari proses. Ini memulai proses penjadwalan. Anda perlu menentukan daftar laporan yang kembali catatan untuk memulai proses dan penjadwalan crontab notasi.

#### Acara Intermediate Bersyarat

Acara ini berhenti mengalir sampai kriteria-kriteria yang ditentukan terpenuhi.

#### Timer Intermediate Event

Acara ini berhenti mengalir dan menunggu selama lebih ditentukan oleh acara parameter.

Untuk yang lebih kompleks pengaturan timer anda dapat memanfaatkan [formula](formula.md). Formula script harus kembali Tanggal-Waktu nilai (dalam zona waktu UTC). Sekali kali ini datang aliran akan melanjutkan ke elemen berikutnya.

Dengan memanfaatkan datetime\terdekat rumus fungsi ini memungkinkan anda untuk mengatur timer untuk waktu tertentu di masa depan, misalnya awal hari kerja berikutnya.  

#### End Event

Ujung aliran arus. Itu tidak berakhir arus yang berjalan secara paralel. Ketika aliran mencapai akhir acara dan tidak ada sesuatu yang berjalan secara paralel maka proses berakhir.

#### Terminate End Event

Berakhir semua mengalir. Proses ini kemudian berakhir.

### Gateways

Gateways are displayed as diamonds.

#### Exclusive Gateway

Dapat menyimpang atau berkumpul mengalir.

Dalam kasus divergen ini mendefinisikan aliran tunggal (path) yang akan dipilih sesuai kriteria yang ditentukan. Pertama bertemu menentukan kondisi aliran, di samping kondisi dihilangkan. Ada kemampuan untuk menentukan default aliran. Default aliran ini dipilih jika tidak ada terpenuhi kondisi. Default aliran ditandai dengan tanda slash.

Dalam kasus konvergen itu hanya mengarahkan aliran keluar elemen. Itu tidak bisa diblokir setelah aliran datang, jadi arus sejajar tidak akan bergabung ke dalam aliran tunggal.

![exclusive gateway divergent](../_static/images/administration/bpm/gateway-exclusive-divergent.png)

![exclusive gateway convergent](../_static/images/administration/bpm/gateway-exclusive-convergent.png)

#### Inclusive Gateway

Can diverge or converge flows.

Dalam kasus divergen, dapat langsung ke satu atau beberapa aliran paralel (jalan), tergantung pada pemenuhan kriteria dari masing-masing aliran. Default aliran ini dipilih jika tidak ada terpenuhi kondisi. Default aliran ditandai dengan tanda slash.

Jika ada kebutuhan untuk menggabungkan paralel arus yang dihasilkan oleh divergen inklusif gateway anda perlu menggunakan konvergen inklusif gateway. Ia akan menunggu untuk semua arus masuk dan kemudian terus keluar elemen.

![inclusive gateway](../_static/images/administration/bpm/gateway-inclusive.png)

Catatan: Divergen dan konvergen gateway harus seimbang.

Catatan: Jika salah satu dari aliran paralel telah berakhir untuk beberapa alasan maka divergen gateway tidak akan diproses. Proses yang akan diblokir. Menghindari flowchart desain yang dapat membawa situasi seperti ini.

#### Parallel Gateway

Dapat menyimpang atau berkumpul mengalir.

Dalam kasus divergen ia membagi aliran menjadi beberapa aliran paralel. Tidak ada parameter untuk gateway ini jenis.

Dalam kasus konvergen itu menunggu sampai semua masuk arus datang dan kemudian berlanjut ke yang berikutnya keluar elemen.

![parallel gateway](../_static/images/administration/bpm/gateway-parallel.png)

Note: Diverging and converging gateways must be balanced.

Catatan: Jika salah satu dari aliran paralel telah berakhir untuk beberapa alasan maka divergen gateway tidak akan diproses. Proses yang akan diblokir. Menghindari flowchart desain yang dapat membawa situasi seperti ini.

#### Event Based Gateway

Can only diverge flows.

Berhenti mengalir sampai keluar acara akan dipicu. Peristiwa dipicu menentukan aliran tunggal. Keluar lain peristiwa ditolak.

Only intermediate events can be on the other end of outgoing sequence flows.

![event based gateway](../_static/images/administration/bpm/gateway-event-based.png)

### Activities

Activities are displayed as rounded rectangles.

#### Task

Task can execute following the actions:

* Membuat Catatan - menciptakan rekor baru dari setiap tipe entitas;
* Membuat Catatan Terkait - menciptakan rekor baru terkait dengan target rekor;
* Update Target Rekam;
* Update yang Terkait Rekor - update record atau catatan yang berkaitan dengan target rekor;
* Update Menciptakan Rekor - update bidang tertentu dari setiap catatan yang dibuat pada saat proses;
* Proses Update Record - dapat digunakan untuk menetapkan proses untuk pengguna tertentu atau tim;
* Link ke Catatan Lain - link target rekor dengan yang ditentukan catatan;
* Batalkan tautannya dari Rekor Lain - unlinks target rekor dari yang ditentukan catatan;
* Menerapkan Penetapan Aturan - menetapkan target catatan, proses record atau catatan yang dibuat oleh proses yang menurut aturan tertentu;
* Membuat Pemberitahuan - membuat di-app pemberitahuan untuk pengguna tertentu;
* Membuat Diikuti - membuat pengguna tertentu mengikuti target catatan, proses record atau catatan yang dibuat oleh proses;
* Menjalankan Layanan Tindakan - menjalankan layanan kustom tindakan-tindakan yang dilaksanakan oleh pengembang.

Actions available for task are almost the same as in Workflow feature. See more details about [workflow's actions](workflows.md#actions).

#### Send Message Task

Sends email message to specific recipient.

#### User Task

Menyediakan fleksibel kemampuan interaksi pengguna. Berhenti eksekusi sampai pengguna (yang ditentukan secara eksplisit atau dengan penetapan aturan) menyelesaikan tugas. Proses Pengguna catatan Tugas yang akan dibuat dalam sistem. Secara default ada tiga jenis tindakan: Menyetujui, Review, Mencapai.

* Menyetujui jenis mengharuskan pengguna untuk memilih antara 'Disetujui' dan 'Menurun'.
* Review tipe hanya memberikan satu opsi: 'Review'.
* Mencapai jenis memiliki dua pilihan: 'Selesai' dan 'Gagal'.


Pengguna ditugaskan untuk menciptakan Proses Pengguna catatan Tugas akan menerima pemberitahuan dalam aplikasi. Administrator juga dapat mengaktifkan pemberitahuan email.

Pengguna juga dapat menambahkan Proses tugas-Tugas Pengguna dashlet di dashboard mereka untuk melihat mereka sebenarnya proses tugas-tugas pengguna.

Hal ini dimungkinkan untuk membaca resolusi berlalu pengguna tugas dalam divergen gateway atau bersyarat peristiwa, membuat percabangan dalam aliran proses.

#### Script Task

Executes the script in [espo-formula](formula.md) language. All set variables (`$variableName`) will be stored and available within the process.

### Flows

#### Sequence Flow

Represented as a solid arrow. Indicates the order in which process elements will be executed.

## Conditions

Bersyarat peristiwa, eksklusif dan inklusif divergen gateway memiliki kondisi yang menentukan aliran proses.

Melalui UI ada kemampuan untuk memeriksa kondisi untuk catatan berikut:

* Target rekam;
* Catatan terkait dengan target melalui banyak-ke-satu dan anak-anak-untuk-orangtua hubungan;
* Catatan yang dibuat oleh proses melalui tugas-tugas;
* Pengguna tugas catatan, yang memungkinkan memeriksa resolusi.

It's also possible to define conditions in [Espo-formula](formula.md) language.

Conditions in BPM tool are the same as in Workflow feature. See more details about [workflow's conditions](workflows.md#conditions).

## Examples

### Example 1

![Example 1](../_static/images/administration/bpm/example-1.png)

### Example 2

![Example 2](../_static/images/administration/bpm/example-2.png)

### Example 3

![Example 3](../_static/images/administration/bpm/example-3.png)
