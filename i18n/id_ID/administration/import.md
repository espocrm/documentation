# Impor

Impor hanya dapat diakses pleh pengguna admin. Administrasi > Impor. Anda hanya dapat mengimpor dari file CSV.

## Langkah 1

Pilih jenis catatan apa yang perlu Anda impor (bidang Tipe Entity).
Pilih file CSV. File harus berformat `UTF-8`.
Pilih `What to do?`. Pilihan yang tersedia: 'Buat Saja', 'Buat & Perbarui', 'Perbarui Saja'.

* `Buat Saja` - pilih ini jika Anda hanya ingin rekaman dibuat saja.
* `Buat & Perbarui` - rekaman akan dibuat tetapi jika rekaman sesuai dengan nilai bidang maka akan diperbarui. Anda dapat memeriksa bidang-bidang apa saja yang cocok dengan _Langkah 2_.
* `Perbarui Saja` - only records with matching field values will be found it will be updated.
hanya rekaman yang cocok dengan nilai bidang yang akan ditemukan yang akan diperbarui.

Setelah Anda memilih file csv Anda dapat melihat bagaimana file tersebut harus diuraikan dalam panel Pratinjau. Jika Anda mengubah properties tinjauan akan diperbarui.

* `Header Row` - Apakah CSV file berada pada baris pertama dalam nama bidang.
* `Execute in idle` - disararankan jika Anda memiliki sekelompok besar rekaman yang akan diimpor. Impor akan diproses melalui cron. Status akan diatur ke 'Selesai' setelah proses impor selesai.
* `Skip searching for duplicates` - hal ini dapat mengurangi jangka waktu impor. 

Klik tombol _Berikutnya_ untuk memproses ke _Langkah 2_.

![1](../_static/images/administration/import/step-1.png)

## Langkah 2

Add default values you want new and updated records to set with. E.g. you can specify Assigned User or Teams fields.

Tambahkan nilai-nilai default baru yang Anda inginkan dan catatan Anda akan diperbarui dengan Misalnya Anda dapat menentukan yang spesifik seperti bidang Ketetapan Pengguna atau Tim.

Setelah impor dilakukan, Anda akan dapat kembali menciptakan rekaman, lihat duplikat dan catatan yang diperbarui. Duplikat berarti ada rekaman yang serupa dalam sistem. Anda dapat menghapus semua file impor duplikat sekaligus. Catatan: pemulihan tidak bekerja pada  rekaman yang diperbarui.

Click _Run Import_ button to proceed. It may take some time before an import process gets finished. If you want to import a large bunch of records (depends on you server configuration, usually if more than 200 records) you need to make sure that php parameter `set_time_limit` is large enough.
Klik tombol _Jalankan Impor_ untuk melanjutkan. Mungkin diperlukan beberapa waktu sebelum proses impor selesai. Jika Anda ingin mengimpor sebagian besar rekaman (tergantung pada konfigurasi server Anda, biasanya jika lebih dari 200 catatan) Anda perlu memastikan bahwa php parameter 'set_time_limit' cukup besar.

![2](../_static/images/administration/import/step-2.png)

## Bagaimana mengimpor ke Daftar Target

Bila Anda mengimpor kontak, Judul atau akun  Anda dapat menambahkannya ke beberapa sasaran daftar. Pada langkah 2, Anda perlu menambahkan bidang daftar Target  pada panel 'Nilai Default' dan pilih sebuah rekaman dari daftar target yang diperlukan. Anda juga dapat menggunakan impor 'hanya perbarui' atau 'Buat & Perbarui' untuk menambahkan target yang ada untuk daftar target.
