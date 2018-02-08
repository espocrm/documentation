# Alur kerja

Fitur alur kerja tersedia di [Paket Lanjutan](https://www.espocrm.com/extensions/advanced-pack/).

Alur kerja mengotomatisasi proses bisnis Anda dengan cara yang mudah. Anda bisa menemukannya di panel Administrasi. Untuk membuat aturan alur kerja yang perlu Anda definisikan:

* Sasaran Entitas - alur kerja jenis entitas apa yang diterapkan;
* Tipe Pemicu - saat alur kerja akan dipicu;
* Kondisi - kondisi harus dipenuhi untuk memicu alur kerja;
* Tindakan - apa yang harus dilakukan jika alur kerja dipicu.

## Jenis Pemicu

### Setelah record dibuat

Dipicu hanya saat ada rekaman baru. Jika kondisi tertentu terpenuhi maka tindakan akan dilakukan.

### Setelah rekaman disimpan

Dipicu saat sebuah rekaman baru dibuat atau catatan yang ada diperbarui. Jika kondisi tertentu terpenuhi maka tindakan akan dilakukan.

Untuk aturan alur kerja dengan jenis pemicu ini adalah praktik umum untuk memiliki kondisi yang memeriksa apakah beberapa bidang 'berubah'. Misalnya. Jika status Case diubah maka lakukan beberapa tindakan.

### Terjadwal

Dipicu menurut penjadwalan yang telah ditentukan. Anda dapat mengaturnya agar berjalan setiap hari, setiap minggu, dll. Tindakan akan diterapkan untuk catatan yang dikembalikan oleh daftar laporan yang ditentukan. Jadi Anda juga perlu membuat daftar laporan.

Penjadwalan ditentukan dalam notasi crontab.

```
* * * * * *
| | | | | | 
| | | | | +-- Year              (range: 1900-3000)
| | | | +---- Day of the Week   (range: 1-7, 1 standing for Monday)
| | | +------ Month of the Year (range: 1-12)
| | +-------- Day of the Month  (range: 1-31)
| +---------- Hour              (range: 0-23)
+------------ Minute            (range: 0-59)
```

### Sekuensial

Jarang digunakan Seharusnya dijalankan oleh alur kerja lain. Menyediakan kemampuan untuk membuat logika yang kompleks.

Catatan: Untuk alur kerja sekuensial, disarankan untuk menggunakan [alat BPM] (bpm.md) daripada fitur Workflow.

## Kondisi

Anda bisa menentukan kondisi yang harus dipenuhi untuk memicu alur kerja. Ada dua cara bagaimana kondisi bisa ditentukan: dengan pembangun kondisi UI dan dengan rumus.

### pembangun kondisi UI

Beberapa tipe kondisi yang tersedia:

* _equals_ - bidang sama dengan nilai tertentu atau nilai bidang lain;
* _was equal_ - lapangan sama dengan nilai tertentu sebelum alur kerja dipicu;
* _not equals_ - bidang tidak sama dengan nilai tertentu atau nilai bidang lain;
* tidak setara - bidang tidak sama dengan nilai spesifik sebelum alur kerja dipicu;
* _empty_ - nilai field kosong;
* _not empty_ - nilai field tidak kosong;
* _changed_ - field berubah;
* _not changed_ - field tidak berubah

### Kondisi formula

Formula menyediakan kemampuan untuk menentukan kondisi kompleksitas apapun. Untuk membaca tentang sintaks rumus ikuti [artikel ini] (formula.md).

Catatan: Seharusnya tidak ada pembatas `;` yang digunakan dalam kode formula saat menentukan suatu kondisi.

## Tindakan

### Mengirim email

Sistem akan mengirim email menggunakan template email yang ditentukan. Alamat email penerima dapat diambil dari catatan target, catatan terkait, pengguna terkini, pengikut, pengguna tim atau yang ditentukan. Email dapat dikirim segera atau tertunda untuk interval tertentu.

### Buat Rekam

Sistem akan membuat record baru dari tipe entity manapun. Jika ada hubungan antara target record dan menciptakan record, kemungkinan untuk menghubungkan record.

Ada kemampuan untuk mendefinisikan rumus untuk menghitung ladang.

### Buat Catatan Terkait

Sistem akan membuat catatan yang berhubungan dengan target record. Mungkin untuk mendefinisikan rumus untuk menghitung bidang.

### Perbarui Record Target

Memungkinkan perubahan bidang spesifik dari catatan target. Mungkin untuk mendefinisikan rumus untuk menghitung bidang.

Jika Anda perlu menambahkan item baru ke kolom Link-Multiple tanpa kehilangan data yang ada (misalnya Tim) Anda perlu menggunakan entitas fungsi rumus \ addLinkMultipleId. Contoh: `entity \ addLinkMultipleId ('tim', 'teamId')`.

### Update Related Record

Memungkinkan perubahan bidang spesifik catatan atau catatan terkait. Mungkin untuk mendefinisikan rumus untuk menghitung bidang.

### Link dengan Rekor Lain

Mengaitkan entitas target dengan entitas spesifik lainnya. Misalnya. menambahkan tim tertentu ke catatan.

### Batalkan Tautan dengan Rekaman Lain

Tidak terkait entitas target dari entitas spesifik lainnya. Misalnya. menghapus tim tertentu dari catatan.

### Terapkan Aturan Tugas

Tetapkan catatan target kepada pengguna berdasarkan aturan distribusi. Ada dua aturan yang tersedia: Round-Robin dan Least-Busy.

* Round-Robin - pengguna dipilih dari atas ke bawah daftar (tim) dan kemudian mulai lagi.
* Least-Sibuk - pengguna yang memiliki lebih sedikit catatan yang ditugaskan akan dipilih untuk tugas.

_List Report_ - Untuk distribusi Least-Sibuk menentukan catatan apa yang akan diperhitungkan untuk menghitung jumlah catatan yang ditugaskan. Misalnya. untuk Kasus kita hanya perlu mengambil catatan dengan status aktif.

### Buat Pemberitahuan

Beritahu pengguna tertentu dengan pesan. Mungkin menggunakan placeholder dalam template pesan: {entity} - target record, {user} - pengguna saat ini.

### Buatlah Diikuti

Memaksa pengguna tertentu untuk mengikuti entitas target atau entitas terkait yang terkait.

### Trigger Another Workflow

Memungkinkan untuk membuat alur kerja berurutan. Mungkin dengan alur kerja cabang berdasarkan kondisi: Anda dapat mengatur alur kerja untuk memicu dua alur kerja dengan kondisi berbeda yang didefinisikan dalam alur kerja tersebut.

Mungkin saja menunda eksekusi alur kerja sekuensial. Dalam alur logika berurutan Anda dapat menentukan kondisi yang memeriksa apakah bidang spesifikasi berubah karena alur kerja orang tua dipicu dengan menggunakan tipe kondisi _Changed_ dan _Was Equal_.

Catatan: Untuk alur kerja sekuensial, disarankan untuk menggunakan [alat BPM] (bpm.md) daripada fitur Workflow.

### Jalankan Tindakan Layanan

Memungkinkan untuk menjalankan skrip layanan tertentu. Secara default ada tindakan berikut yang tersedia:

* Kirim Undangan - untuk Rapat / Panggilan;
* Tambahkan Item Kutipan - untuk Penawaran.

Pengembang dapat menulis tindakan layanan mereka sendiri. Lihat [selengkapnya] (../ development / workflow-service-actions.md).

## Menggunakan Formula dalam Tindakan

Mungkin untuk mendefinisikan rumus untuk menghitung field untuk Create Record, Update Target Record, Create Related Record, Update Related Record. Untuk dua yang terakhir, untuk mengakses atribut entitas target Anda harus menggunakan function `targetEntity \ attribute`. Untuk mengakses atribut entitas target yang telah ditentukan sebelum alur kerja dipicu gunakan fungsi `targetEntity \ attributesFetched`.

Contoh:
```
name = string\concatenate(targetEntity\attribute('name'), ' ', datetime\today());
```
