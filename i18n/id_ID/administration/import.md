# Impor

Impor hanya dapat diakses oleh admin. Administrasi> Impor. Anda dapat mengimpor hanya dari berkas CSV.

## Langkah 1

Pilih jenis catatan yang perlu Anda impor (jenis badan lapangan).
Pilih berkas CSV. berkas harus diformat dengan `UTF-8`.
Pilih `Apa yang Harus Dilakukan ?`. Pilihan yang tersedia: 'Hanya Buat', 'Buat & Perbarui', 'Hanya Perbarui'.

* `Hanya Buat` - pilih itu jika anda hanya ingin dibuat rekaman.
* `Buat & Perbarui` - catatan akan dibuat tapi jika catatan dengan nilai field yang cocok ditemukan maka akan diperbarui. Anda dapat memeriksa bidang apa yang cocok dengan di _Step 2_.
* `Hanya Perbarui` - hanya catatan dengan nilai field yang sesuai akan ditemukan maka akan diperbarui.

Setelah Anda memilih berkas csv Anda dapat melihat bagaimana hal itu harus diuraikan pada panel Pratinjau. Saat Anda mengubah properti, pratinjau akan diperbarui.

* `Baris Tajuk` - apakah berkas CSV memiliki baris pertama dengan nama field
* `Jalankan saat menganggur` - disarankan jika Anda memiliki banyak catatan untuk diimpor. Impor akan diproses melalui cron. Status akan diatur ke 'Lengkap' saat proses impor selesai.
* `Lewati mencari duplikat` - itu akan mengurangi jalan waktu impor  

Klik tombol _Lanjutkan_ untuk lanjut ke _Tahap 2_.

![1](../_static/images/administration/import/step-1.png)

## Tahap 2

Mempersiapkan pemetaan lapangan: bagaimana kolom sesuai dengan kolom dari file csv. Anda bisa melewatkan kolom yang tidak dibutuhkan disini.
Dalam kasus 'Buat & Perbarui' dan 'Perbarui saja', Anda perlu memeriksa bidang dimana catatan yang harus diperbarui akan ditemukan.
Tambahkan nilai default yang Anda inginkan untuk catatan baru dan yang diperbarui. Misalnya. Anda dapat menentukan bidang User atau Tim yang Ditugaskan.

Setelah impor selesai, Anda akan dapat mengembalikan catatan yang dibuat, melihat duplikat dan rekaman yang diperbarui. Duplikat berarti ada catatan serupa dalam sistem. Anda dapat menghapus semua duplikat yang diimpor sekaligus. Catatan: Kembalikan tidak bekerja dengan catatan yang diperbarui.

Klik tombol _Run Impor_ untuk melanjutkan. Mungkin diperlukan beberapa saat sebelum proses impor selesai. Jika Anda ingin mengimpor sejumlah besar catatan (tergantung pada konfigurasi server Anda, biasanya jika lebih dari 200 catatan), Anda harus memastikan bahwa parameter php `atur_batas_waktu` cukup besar.

![2](../_static/images/administration/import/step-2.png)

## Cara mengimpor ke Daftar Target

Saat Anda mengimpor Kontak, Memimpin atau Akun, Anda dapat menambahkannya ke beberapa daftar target. Pada Langkah 2 Anda perlu menambahkan kolom Daftar Target `Nilai Bawaan` panel dan pilih daftar target daftar yang dibutuhkan. Anda juga bisa menggunakan `Hanya Perbarui` atau `Buat & Perbarui` impor untuk menambahkan target yang ada ke daftar target.
