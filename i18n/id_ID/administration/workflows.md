# Alur Kerja

Fitur alur kerja tersedia di [Paket Lanjutan](https://www.espocrm.com/extensions/advanced-pack/).

Alur kerja mengotomatisasi proses bisnis Anda dengan mudah. Anda dapat menemukannya dalam Panel administrasi. Untuk membuat aturan alur kerja Anda perlu menentukan:

* Target entitas - jenis alur kerja apa yang entitas diterapkan;
* Jenis pemicu - ketika alur kerja akan dipicu;
* Kondisi - kondisi yang harus dipenuhi untuk memicu alur kerja;
* Tindakan - apa yang harus dilakukan jika alur kerja dipicu.


## Tipe Pemicu

### Setelah rekaman dibuat

Dipicu hanya ketika rekaman baru diciptakan. Jika kondisi yang ditentukan terpenuhi maka tindakan akan dieksekusi.

### Setelah rekaman disimpan

Dipicu ketika catatan yang sudah ada baru dibuat atau diperbarui . Jika kondisi yang ditentukan terpenuhi maka tindakan akan dieksekusi.

Untuk aturan alur kerja dengan jenis pemicu ini adalah praktik umum untuk memiliki kondisi yang memeriksa apakah beberapa bidang 'berubah'. Misalnya jika status Kasus diubah maka lakukan beberapa tindakan.

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

Jarang digunakan. Seharusnya dijalankan oleh alur kerja lain. Menyediakan kemampuan untuk membuat logika yang kompleks.

Catatan: Untuk alur kerja sekuensial, disarankan untuk menggunakan [alat BPM](bpm.md) daripada fitur Alur kerja.

## Kondisi

Anda bisa menentukan kondisi yang harus dipenuhi untuk memicu alur kerja. Ada dua cara bagaimana kondisi bisa ditentukan: dengan pembangun kondisi UI dan dengan rumus.

### Pembangunan kondisi UI

Beberapa tipe kondisi yang tersedia:

* _sama dengan_ - bidang sama dengan nilai tertentu atau nilai bidang lain;
* _sudah sama_ - bidang sama dengan nilai tertentu sebelum alur kerja dipicu;
* _tidak sama_ - bidang tidak sama dengan nilai tertentu atau nilai bidang lain;
* _sudah tidak sama_ - bidang tidak sama dengan nilai spesifik sebelum alur kerja dipicu;
* _kosong_ - nilai bidang kosong;
* _tidak kosong_ - nilai field tidak kosong;
* _berubah_ - bidang telah berubah;
* _tidak berubah_ - bidang tidak berubah.

### Kondisi rumus

Rumus menyediakan kemampuan untuk menentukan kondisi kompleksitas apapun. Untuk membaca tentang sintaks rumus ikuti [artikel ini](formula.md).

Catatan: Seharusnya tidak ada pembatas `;` yang digunakan dalam kode rumus saat menentukan suatu kondisi.

## Tindakan

### Mengirim surel

Sistem akan mengirim surel menggunakan template surel yang ditentukan. Alamat surel penerima dapat diambil dari catatan target, catatan terkait, pengguna terkini, pengikut, pengguna tim atau yang ditentukan. Surel dapat dikirim segera atau tertunda untuk interval tertentu.

### Buat rekaman

Sistem akan membuat record baru dari tipe entitas manapun. Jika ada hubungan antara target rekaman dan menciptakan rekaman, memungkinkan untuk menghubungkan rekaman.

Anda dibolehkan untuk mendefinisikan rumus untuk menghitung bidang.

### Membuat Rekaman Terkait

Sistem akan membuat rekaman yang berhubungan dengan target rekaman. Ini memungkinkan untuk mendefinisikan rumus untuk menghitung bidang.

### Memperbarui Target Rekaman

Memungkinkan perubahan bidang spesifik dari catatan target. Mungkin untuk mendefinisikan rumus untuk menghitung bidang.

Jika Anda perlu menambahkan item baru ke bidang Tautan-Multiple tanpa kehilangan data yang ada (misalnya Tim) Anda perlu menggunakan fungsi rumus entity\addLinkMultipleId. Contoh: `entity \ addLinkMultipleId ('tim', 'teamId')`.

### Memperbarui Rekaman Terkait

Memungkinkan perubahan bidang spesifik catatan atau catatan terkait. Ini memungkinkan untuk mendefinisikan rumus untuk menghitung bidang.

### Tautkan dengan Rekaman Lain

Mengaitkan entitas target dengan entitas spesifik lainnya. Misalnya menambahkan tim tertentu ke catatan.

### Batalkan Tautan dengan Rekaman Lain

Tidak mengaitkan entitas target dari entitas spesifik lainnya. Misalnya menghapus tim tertentu dari catatan.

### Terapkan Aturan Tugas

Tetapkan catatan target kepada pengguna berdasarkan aturan distribusi. Ada dua aturan yang tersedia: Round-Robin dan Least-Busy.

* Round-Robin - pengguna dipilih dari atas ke bawah daftar (tim) dan kemudian mulai lagi.
* Least-Busy - pengguna yang memiliki lebih sedikit catatan yang ditugaskan akan dipilih untuk tugas.

_Daftar Laporan_ - Untuk distribusi Least-Busy menentukan catatan apa yang akan diperhitungkan untuk menghitung jumlah catatan yang ditugaskan. Misalnya untuk Kasus kita hanya perlu mengambil catatan dengan status aktif.

### Membuat Pemberitahuan

Beritahu pengguna tertentu dengan pesan. Ini memungkinkan menggunakan placeholder dalam template pesan: {entitas} - target rekaman, {pengguna} - pengguna saat ini.

### Membuat Diikuti

Memaksa pengguna tertentu untuk mengikuti entitas target atau entitas terkait yang terkait.

### Trigger Another Workflow Memicu Alur Kerja Lainnya

Memungkinkan untuk membuat alur kerja berurutan. Ini memungkinkan dengan alur kerja cabang berdasarkan kondisi: Anda dapat mengatur alur kerja untuk memicu dua alur kerja dengan kondisi berbeda yang didefinisikan dalam alur kerja tersebut.

Ini memungkinkan menunda eksekusi alur kerja sekuensial. Dalam alur logika berurutan Anda dapat menentukan kondisi yang memeriksa apakah bidang spesifikasi berubah karena alur kerja induk dipicu dengan menggunakan tipe kondisi _Berubah_ dan _Sudah Sama_.

Catatan: Untuk alur kerja sekuensial, disarankan untuk menggunakan [alat BPM](bpm.md) daripada fitur Alur kerja.

### Menjalankan Tindakan Layanan

Mengizinkan untuk menjalankan skrip layanan tertentu. Secara default ada tindakan berikut yang tersedia:

* Kirim Undangan - untuk Rapat/Panggilan;
* Tambahkan Item Kutipan - untuk Penawaran.

Pengembang dapat menulis tindakan layanan mereka sendiri. Lihat [selengkapnya](../ development / workflow-service-actions.md).

## Menggunakan Rumus dalam Tindakan

Ini memungkinkan untuk mendefinisikan rumus untuk menghitung bidang untuk Membuat Catatan, Memperbarui Target Catatan, Membuat catatan Terkait, Memperbarui Catatan Terkait. Untuk dua yang terakhir, untuk mengakses atribut entitas target Anda harus menggunakan Fungsi `targetEntity\attribute`. Untuk mengakses atribut entitas target yang telah ditentukan sebelum alur kerja dipicu gunakan fungsi `targetEntity\attributesFetched`.

Contoh:
```
name = string\concatenate(targetEntity\attribute('name'), ' ', datetime\today());
```
