# Manajemen Proses Bisnis

Manajemen Proses bisnis (BPM) alat ini menyediakan kemampuan untuk model dan mengotomatisasi proses bisnis di EspoCRM. Itu sebuah mesin yang menjalankan proses bisnis yang dijelaskan dalam BPMN 2.0 standar ektensi. BPM tool yang tersedia di [Advanced Pack](https://www.espocrm.com/extensions/advanced-pack/)


![BPM contoh](../_static/images/administration/bpm/bpm-1.png)

### Perbedaan dari Alur alat kerja

Alur kerja alat ini dimaksudkan untuk otomatisasi sederhana aturan bisnis, w/o berurutan aliran barang, ketika tidak ada kebutuhan untuk menampilkan aliran grafis.

BPM alat ini ditujukan untuk bisnis lebih kompleks mengalir, di mana bisa ada divergen dan konvergen mengalir, pelaksanaan, keterlambatan, interaksi pengguna. Flowchart view membuat proses bisnis lebih dipahami bagi manusia, log ini memungkinkan untuk melihat bagaimana proses itu dilakukan.







## Proses Diagram Alur
Link untuk proses diagram alur tersedia dari panel administrasi. Hal ini juga dapat ditambahkan sebagai tab di panel navigasi.




Setiap flowchart memiliki entitas tertentu jenis (Jenis Target field). Flowchart menentukan pelaksanaan depan contoh proses. Ini terdiri dari flowchart elemen-elemen dan hubungan antar elemen.

Jika flowchart proses memiliki dicentang 'Active' maka tidak akan memulai proses kasus.

Untuk menunjukkan rincian dan parameter tertentu flowchart elemen yang anda butuhkan untuk klik di atasnya. Dalam mode edit, anda akan dapat mengedit parameter.












## Proses

Prosesnya tersedia dari panel administrasi. Link ini juga bisa ditambahkan sebagai tab pada panel navigasi.

Proses mewakili contoh proses bisnis. Saat diinisiasi itu mendapat status 'Started'. Saat proses selesai itu mendapat status 'Ended'. Prosesnya juga bisa dihentikan secara manual oleh pengguna yang memiliki akses untuk mengedit prosesnya. Jika dihentikan secara manual, statusnya akan 'Berhenti'.

Proses dijalankan sesuai dengan flowchart. Flowchart proses tidak dapat diubah setelah proses dimulai.

Prosesnya wajib berkaitan dengan catatan target tunggal.

Proses dapat dimulai secara otomatis (pada kondisi tertentu atau dengan penjadwalan) atau manual (setidaknya ada satu Start Event di flowchart). Untuk memulai proses secara manual, pengguna perlu mengklik tombol 'Start Process' pada daftar tampilan proses.












## Flowchart Elements

## Elemen alir alur

### Events

### Acara

Events are displayed on a flowchart as circles.

Acara ditampilkan pada diagram alir sebagai lingkaran.

#### Start Event

Doesn't have parameters. It's a starting point of the process. Start Event can be initiated manually by a user who has an access to create processes. The user needs to click  'Start Process' button on the list view of processes.

#### mulai acara

Tidak memiliki parameter Ini adalah titik awal prosesnya. Start Event dapat dimulai secara manual oleh pengguna yang memiliki akses untuk membuat proses. Pengguna perlu mengklik tombol 'Start Process' pada tampilan daftar proses.

#### Conditional Start Event

A starting point of the process. It's supposed to be triggered automatically when specified conditions are met. There are two types of trigger: 'After record created', 'After record saved'.

#### Acara Mulai Bersyarat

Titik awal proses. Ini seharusnya dipicu secara otomatis saat kondisi tertentu terpenuhi. Ada dua jenis pemicu: 'After record created', 'After record saved'.

#### Timer Start Event

A starting point of the process. It initiates processes by scheduling. You need to specify the list report that returns records for initiating processes and scheduling in crontab notation.

#### Waktu Mulai acara

Titik awal proses. Ini memulai proses dengan penjadwalan. Anda perlu menentukan daftar laporan yang mengembalikan catatan untuk memulai proses dan penjadwalan dalam notasi crontab.

#### Conditional Intermediate Event

This event stops the flow until specified criteria is met.

#### Acara Intermediate Bersyarat

Acara ini menghentikan aliran sampai kriteria tertentu terpenuhi.

#### Timer Intermediate Event

This event stops the flow and waits as long as is specified by event's parameters.

For more complex timer settings you can utilize [formula](formula.md). Formula scripts should return Date-Time value (in UTC timezone). Once this time comes the flow will be proceeded to the next element.

By utilizing datetime\closest formula function it's possible to set the timer to a specific time in the future, e.g. the beginning of the next working day.  

#### Timer Intermediate Event

Acara ini menghentikan arus dan menunggu selama ditentukan oleh parameter acara.

Untuk pengaturan timer yang lebih kompleks Anda bisa menggunakan [formula] (formula.md). Skrip rumus harus mengembalikan nilai Date-Time (dalam zona waktu UTC). Setelah waktu ini tiba arus akan dilanjutkan ke elemen berikutnya.

Dengan memanfaatkan fungsi rumus di depan datetime, mungkin menetapkan timer ke waktu tertentu di masa mendatang, mis. awal hari kerja berikutnya.

#### End Event

Ends the current flow. It doesn't end flows running in parallel. When the flow reaches the end event and there is no anything running in parallel then process ends.

#### akhir acara

Mengakhiri arus. Ini tidak mengakhiri arus yang mengalir secara paralel. Saat arus mencapai akhir acara dan tidak ada yang berjalan paralel maka prosesnya akan berakhir.

#### Terminate End Event

Ends all flows. Process is subsequently ended.

#### Hentikan Akhir Acara

Berakhir semua mengalir. Proses selanjutnya berakhir.

### Gateways

Gateways are displayed as diamonds.

### Cara Gerbang

Gateways ditampilkan sebagai berlian.

#### Exclusive Gateway

Can diverge or converge flows.

In case of diverging it defines a single flow (path) that will be chosen according specified criteria. The first met condition determines the flow, next conditions are omitted. There is an ability to specify default flow. Default flow is chosen if there are no any met conditions. Default flow is marked with a slash sign.

In case of converging it just directs the flow to the outgoing element. It doesn't get blocked after the flow come though, so parallel flows won't be merged into the single flow.

#### cara Gate Eksklusif

Bisa menyimpang atau menyatu arus.

Dalam kasus divergen itu mendefinisikan satu aliran (jalur) yang akan dipilih sesuai kriteria yang ditentukan. Kondisi pertama yang terpenuhi menentukan arus, kondisi selanjutnya dihilangkan. Ada kemampuan untuk menentukan arus default. Aliran default dipilih jika tidak ada kondisi yang terpenuhi. Aliran default ditandai dengan tanda garis miring.

Jika konvergen hanya mengarahkan arus ke elemen keluar. Itu tidak tersumbat setelah arus datang, jadi arus sejajar tidak akan tergabung dalam arus tunggal.

![exclusive gateway divergent](../_static/images/administration/bpm/gateway-exclusive-divergent.png)

![exclusive gateway convergent](../_static/images/administration/bpm/gateway-exclusive-convergent.png)

#### Termasuk Gateway

Dapat menyimpang atau berkumpul mengalir.

Dalam kasus divergen, ia dapat mengarahkan ke satu atau beberapa arus sejajar (jalur), tergantung pada pemenuhan kriteria setiap aliran. Aliran default dipilih jika tidak ada kondisi yang terpenuhi. Aliran default ditandai dengan tanda garis miring.

Jika ada kebutuhan untuk menggabungkan arus paralel yang dihasilkan oleh gateway inverging inklusif Anda perlu menggunakan gateway inklusif yang konvergen. Ini akan menunggu semua arus masuk dan kemudian melanjutkan ke elemen keluar.








![inclusive gateway](../_static/images/administration/bpm/gateway-inclusive.png)

Note: Diverging and converging gateways must be balanced.

Catatan: Jika salah satu dari aliran paralel telah berakhir untuk beberapa alasan maka divergen gateway tidak akan diproses. Proses yang akan diblokir. Menghindari flowchart desain yang dapat membawa situasi seperti ini.





#### Parallel Gateway

Can diverge or converge flows.

In case of diverging it splits flow into multiple parallel flows. There are no parameters for this gateway type.

In case of converging it waits until all incoming flows come and then continues to the next outgoing element.

#### Temukan cara Gerbang Paralel

Bisa menyimpang atau menyatu arus.

Dalam kasus divergen itu dibagi mengalir ke beberapa arus paralel. Tidak ada parameter untuk tipe gateway ini.

Jika terjadi konvergen, menunggu sampai semua arus masuk masuk dan kemudian berlanjut ke elemen keluar berikutnya.

![parallel gateway](../_static/images/administration/bpm/gateway-parallel.png)

Note: Diverging and converging gateways must be balanced.

Catatan: Jika salah satu dari aliran paralel telah berakhir untuk beberapa alasan maka divergen gateway tidak akan diproses. Proses yang akan diblokir. Menghindari flowchart desain yang dapat membawa situasi seperti ini.




#### Event Based Gateway

Can only diverge flows.

It stops the flow until any of outgoing events gets triggered. Triggered event determines the single flow. Other outgoing events get rejected.

Only intermediate events can be on the other end of outgoing sequence flows.

#### cara berdasarkan gerbang

Hanya bisa menyimpang aliran.

Ini berhenti mengalir sampai ada kejadian keluar yang dipicu. Triggered event menentukan aliran tunggal. Acara keluar lainnya ditolak.

Hanya kejadian antara bisa berada di ujung arus deras keluar lainnya.

![event based gateway](../_static/images/administration/bpm/gateway-event-based.png)

### Activities

Activities are displayed as rounded rectangles.

### Kegiatan

Kegiatan ditampilkan sebagai persegi panjang bulat.

#### Tugas

Tugas dapat melakukan tindakan berikut:

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


















Tindakan yang tersedia untuk tugas hampir sama seperti pada fitur Workflow. Lihat rincian lebih lanjut tentang [tindakan alur kerja] (workingflows.md # actions).

#### Send Message Task

Sends email message to specific recipient.

#### Kirim pesan tugas

Mengirim pesan email ke penerima tertentu.

#### Tugas pengguna

Menyediakan fleksibel kemampuan interaksi pengguna. Berhenti eksekusi sampai pengguna (yang ditentukan secara eksplisit atau dengan penetapan aturan) menyelesaikan tugas. Proses Pengguna catatan Tugas yang akan dibuat dalam sistem. Secara default ada tiga jenis tindakan: Menyetujui, Review, Mencapai.

* Menyetujui jenis mengharuskan pengguna untuk memilih antara 'Disetujui' dan 'Menurun'.
* Review tipe hanya memberikan satu opsi: 'Review'.
* Mencapai jenis memiliki dua pilihan: 'Selesai' dan 'Gagal'.
Bersyarat peristiwa, eksklusif dan inklusif divergen gateway memiliki kondisi yang menentukan aliran proses.


The user assigned to the created Process User Task record will receive in-app notification. Administrator can also enable email notifications.

Users can also add Process User Tasks dashlet on their dashboard to see their actual process user tasks.

It's possible to read the resolution of the passed user task within diverging gateways or conditional events, making ramification in the process flow.










Pengguna yang ditugaskan ke catatan Tugas Pengguna Proses yang dibuat akan menerima notifikasi dalam aplikasi. Administrator juga dapat mengaktifkan pemberitahuan email.

Pengguna juga dapat menambahkan dashlet Tugas Pengguna Proses di dasbor mereka untuk melihat tugas pengguna proses aktual mereka.

Anda bisa membaca resolusi tugas pengguna yang lewat di dalam gerbang yang berbeda atau kejadian bersyarat, yang membuat kerusakan dalam aliran proses.

#### Script Task

Executes the script in [espo-formula](formula.md) language. All set variables (`$variableName`) will be stored and available within the process.

#### tugas skrip

Jalankan script dalam bahasa [espo-formula] (formula.md). Semua variabel set (`$variableName`) akan disimpan dan tersedia dalam proses.

### Flows

#### Sequence Flow

Represented as a solid arrow. Indicates the order in which process elements will be executed.

### Arus

#### Sequence Flow

Diwakili sebagai panah padat. Menunjukkan urutan elemen proses yang akan dijalankan.

## Kondisi

Bersyarat peristiwa, eksklusif dan inklusif divergen gateway memiliki kondisi yang menentukan aliran proses.

Melalui UI ada kemampuan untuk memeriksa kondisi untuk catatan berikut:

* Target rekam;
* Catatan terkait dengan target melalui banyak-ke-satu dan anak-anak-untuk-orangtua hubungan;
* Catatan yang dibuat oleh proses melalui tugas-tugas;
* Pengguna tugas catatan, yang memungkinkan memeriksa resolusi.
Tugas dapat mengeksekusi mengikuti tindakan:

It's also possible to define conditions in [Espo-formula](formula.md) language.

Conditions in BPM tool are the same as in Workflow feature. See more details about [workflow's conditions](workflows.md#conditions).












Ini juga memungkinkan untuk mendefinisikan kondisi dalam bahasa [Espo-formula] (formula.md).

Kondisi alat BPM sama seperti pada fitur Workflow. Lihat rincian lebih lanjut tentang [kondisi alur kerja] (kondisi workflows.md #).

## Examples

### Example 1

![Example 1](../_static/images/administration/bpm/example-1.png)

### Example 2

![Example 2](../_static/images/administration/bpm/example-2.png)

### Example 3

![Example 3](../_static/images/administration/bpm/example-3.png)
