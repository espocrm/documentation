# Business Process Management

Business Process Management (BPM) tool provides the ability to model and automate business processes in EspoCRM. It's an engine executing business processes described in BPMN 2.0 standard. BPM tool is available in [Advanced Pack](https://www.espocrm.com/extensions/advanced-pack/) extension.

Alat Manajemen Proses Bisnis (BPM) menyediakan kemampuan untuk memodelkan dan mengotomatisasi proses bisnis di EspoCRM. Ini adalah proses bisnis pelaksana mesin yang dijelaskan dalam standar BPMN 2.0. Alat BPM tersedia di ekstensi [Paket Lanjutan] (https://www.espocrm.com/extensions/advanced-pack/).

![BPM example](../_static/images/administration/bpm/bpm-1.png)

### Difference from Workflows tool

Workflows tool is intended for automation of simple business rules, w/o sequential flow items, when there is no need to display the flow graphically.

BPM tool is intended for more complex business flows, where there can be diverging and converging flows, execution delays, user interactions. A flowchart view makes the business process more comprehensible for a human, a log allows to see how the process was held.

### Selisih alat Workflows

Alat alur kerja ditujukan untuk otomasi aturan bisnis sederhana, dengan item arus berurutan, bila tidak perlu menampilkan arus secara grafis.

Alat BPM ditujukan untuk arus bisnis yang lebih kompleks, di mana ada arus divergen dan konvergen, penundaan eksekusi, interaksi pengguna. Tampilan flowchart membuat proses bisnis lebih mudah dipahami bagi manusia, sebuah log memungkinkan untuk melihat bagaimana prosesnya dilakukan.

## Process Flowcharts

The link to process flowcharts is available from administration panel. It also can be added as a tab on the navigation panel.

Flowcharts are intended for business processes modeling. Administrator can create and edit flowcharts. Regular users can only view flowcharts.

Every flowchart has its specific entity type (Target Type field). The flowchart determines execution of future process instances. It comprises flowchart elements and connections between elements.

If process flowchart has the unchecked 'Is Active' field then it won't initiate process instances.

To show details and parameters of a certain flowchart element you need to click on it. In edit mode you will be able to edit parameters.

## Bagan alur proses

Tautan ke diagram alur proses tersedia dari panel administrasi. Ini juga bisa ditambahkan sebagai tab pada panel navigasi.

Flowchart ditujukan untuk pemodelan proses bisnis. Administrator dapat membuat dan mengedit diagram alur. Pengguna biasa hanya dapat melihat diagram alur.

Setiap flowchart memiliki tipe entitas khusus (field Tipe Sasaran). Diagram alir menentukan pelaksanaan contoh proses di masa depan. Ini terdiri dari elemen flowchart dan koneksi antar elemen.

Jika flowchart proses memiliki field 'Is Active' yang tidak dicentang maka tidak akan melakukan instance proses.

Untuk menampilkan rincian dan parameter elemen diagram alir tertentu yang perlu Anda klik di atasnya. Dalam mode edit Anda bisa mengedit parameter.

## Processes

Processes are available from administration panel. The link also can be added as a tab on the navigation panel.

Process represents business process instance. When it's initiated it gets the status 'Started'. When process is finished it gets the status 'Ended'. The process can also be stopped manually by a user who has an access to edit the process. If it's stopped manually it gets status the 'Stopped'.

The process is executed according the flowchart. Flowchart of process can't be changed after process is started.

The process obligatorily is related to single target record.

Processes can be started automatically (upon specific conditions or by scheduling) or manually (where there is at least one Start Event in the flowchart). To start process manually the user needs to click 'Start Process' button on the list view of processes.

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

#### Inclusive Gateway

Can diverge or converge flows.

In case of diverging, it can direct to one or multiple parallel flows (paths), depending on accomplishment of criteria of each flow. Default flow is chosen if there are no any met conditions. Default flow is marked with a slash sign.

If there is a necessity to merge parallel flows produced by a diverging inclusive gateway you need to use a converging inclusive gateway. It will wait for all incoming flows and then continue to the outgoing element.

#### gerbang inklusif

Bisa menyimpang atau menyatu arus.

Dalam kasus divergen, ia dapat mengarahkan ke satu atau beberapa arus sejajar (jalur), tergantung pada pemenuhan kriteria setiap aliran. Aliran default dipilih jika tidak ada kondisi yang terpenuhi. Aliran default ditandai dengan tanda garis miring.

Jika ada kebutuhan untuk menggabungkan arus paralel yang dihasilkan oleh gateway inverging inklusif Anda perlu menggunakan gateway inklusif yang konvergen. Ini akan menunggu semua arus masuk dan kemudian melanjutkan ke elemen keluar.

![inclusive gateway](../_static/images/administration/bpm/gateway-inclusive.png)

Note: Diverging and converging gateways must be balanced.

Note: If one of parallel flows has been ended for some reason then diverging gateway will never be processed. The process will be blocked. Avoid a flowchart design that can bring about such a situation.

Catatan: Diverging dan konvergen cara gerbang harus seimbang.

Catatan: Jika salah satu arus paralel telah berakhir karena beberapa alasan, maka gerbang divergen tidak akan pernah diproses. Prosesnya akan diblokir. Hindari desain flowchart yang bisa membawa situasi seperti itu.

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

Note: If one of parallel flows has been ended for some reason then diverging gateway will never be processed. The process will be blocked. Avoid a flowchart design that can bring about such a situation.

Catatan: Diverging dan konvergen cara gerbang harus seimbang.

Catatan: Jika salah satu arus paralel telah berakhir karena beberapa alasan, maka gerbang divergen tidak akan pernah diproses. Prosesnya akan diblokir. Hindari desain flowchart yang bisa membawa situasi seperti itu.

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

#### Task

Task can execute following the actions:

* Create Record - creates new record of any entity type;
* Create Related Record - creates new record related to the target record;
* Update Target Record;
* Update Related Record - updates the record or records related to the target record;
* Update Created Record - updates specific field of any record created in the current process;
* Update Process Record - can be used to assign the process to specific user or team;
* Link to Another Record - links the target record with a specified record;
* Unlink from Another Record - unlinks the target record from the specified record;
* Apply Assignment Rule - assigns the target record, the process record or any record created by the process according to the specific rule;
* Create Notification - creates in-app notification for specific users;
* Make Followed - makes specific users follow the target record, the process record or any record created by the process;
* Run Service Action - runs custom service actions implemented by developers.

Actions available for task are almost the same as in Workflow feature. See more details about [workflow's actions](workflows.md#actions).

#### Tugas

Tugas dapat melakukan tindakan berikut:

* Buat Rekam - membuat catatan baru dari tipe entitas apa pun;
* Buat Catatan Terkait - membuat catatan baru yang terkait dengan catatan target;
* Perbarui Record Target;
* Update Related Record - update catatan atau catatan yang terkait dengan catatan target;
* Update Created Record - memperbarui bidang spesifik dari setiap record yang dibuat dalam proses saat ini;
* Update Process Record - dapat digunakan untuk menetapkan proses ke pengguna atau tim tertentu;
* Tautan ke Rekaman Lain - menghubungkan catatan target dengan catatan yang ditentukan;
* Batalkan Tautan dari Rekaman Lain - hapus catatan sasaran dari catatan yang ditentukan;
* Terapkan Aturan Tugas - memberikan catatan target, catatan proses atau catatan yang dibuat oleh proses sesuai dengan peraturan khusus;
* Buat Pemberitahuan - buat pemberitahuan dalam aplikasi untuk pengguna tertentu;
* Buat Diikuti - membuat pengguna tertentu mengikuti catatan target, catatan proses atau rekaman yang dibuat oleh proses;
* Run Service Action - menjalankan tindakan layanan kustom yang dilakukan oleh pengembang.

Tindakan yang tersedia untuk tugas hampir sama seperti pada fitur Workflow. Lihat rincian lebih lanjut tentang [tindakan alur kerja] (workingflows.md # actions).

#### Send Message Task

Sends email message to specific recipient.

#### Kirim pesan tugas

Mengirim pesan email ke penerima tertentu.

#### User Task

Provides a flexible ability of user interaction. It stops execution until the user (specified explicitly or by assignment rule) resolves the task. Process User Task record will be created in the system. By default there are three action types: Approve, Review, Accomplish.

* Approve type requires the user to chose between 'Approved' and 'Declined'.
* Review type gives only one option: 'Reviewed'.
* Accomplish type has two options: 'Completed' and 'Failed'.


The user assigned to the created Process User Task record will receive in-app notification. Administrator can also enable email notifications.

Users can also add Process User Tasks dashlet on their dashboard to see their actual process user tasks.

It's possible to read the resolution of the passed user task within diverging gateways or conditional events, making ramification in the process flow.

#### tugas pengguna

Menyediakan kemampuan interaksi pengguna yang fleksibel. Ini berhenti eksekusi sampai pengguna (ditentukan secara eksplisit atau oleh aturan tugas) menyelesaikan tugasnya. Proses User Task record akan dibuat di sistem. Secara default ada tiga jenis tindakan: Setujui, Review, Diselesaikan.

* Setujui jenis mengharuskan pengguna untuk memilih antara 'Disetujui' dan 'Ditolak'.
* Tipe ulasan hanya memberikan satu pilihan: 'diulas'.
* Tipe yang tersertifikasi memiliki dua pilihan: 'Completed' dan 'Failed'.


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

## Conditions

Conditional events, exclusive and inclusive diverging gateways have conditions that determine the flow of the process.

Through UI there is an ability to check conditions for the following records:

* Target record;
* Records related to the target through many-to-one and children-to-parent relationships;
* Records created by the process via tasks;
* User task records, which allows checking the resolution.

It's also possible to define conditions in [Espo-formula](formula.md) language.

Conditions in BPM tool are the same as in Workflow feature. See more details about [workflow's conditions](workflows.md#conditions).

## Kondisi

Peristiwa bersyarat, gerbang invergen eksklusif dan inklusif memiliki kondisi yang menentukan arus proses.

Melalui UI ada kemampuan untuk memeriksa kondisi untuk catatan berikut:

* Target rekaman;
* Catatan yang terkait dengan target melalui hubungan banyak-ke-satu dan hubungan antara anak-ke-orang tua;
Rekaman dibuat oleh proses melalui tugas;
* User task records, yang memungkinkan pengecekan resolusinya.

Ini juga memungkinkan untuk mendefinisikan kondisi dalam bahasa [Espo-formula] (formula.md).

Kondisi alat BPM sama seperti pada fitur Workflow. Lihat rincian lebih lanjut tentang [kondisi alur kerja] (kondisi workflows.md #).

## Examples

### Example 1

![Example 1](../_static/images/administration/bpm/example-1.png)

### Example 2

![Example 2](../_static/images/administration/bpm/example-2.png)

### Example 3

![Example 3](../_static/images/administration/bpm/example-3.png)
