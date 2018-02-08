# Laporan

Fitur laporan tersedia di [Paket Lanjutan](https://www.espocrm.com/extensions/advanced-pack/).

Ada dua jenis laporan: List dan Grid.

## Laporan List

Hasil laporan list adalah list dari catatan yang memenuhi kriteria tertentu.

Untuk membuat laporan list baru klik pada tab Report kemudian klik tolbol Buat Lapotan. Pilih Jenis Entitas yang dibutuhkan lalu klik tombol Buat di bagian Laporan List.

Pada bidang _Kolom_ pilih bidang yang ingin Anda tampilkan. Di bawah ini Anda dapat menentukan parameter tampilan untuk setiap kolom mis. lebar dan sejajar

Pilih sortir yang diinginkan pada bidang _Daftar Pesanan_. 

Pada bidang _Saring_ Anda dapat menentukan kriteria yang menentukan catatan apa yang akan tercantum dalam laporan Anda. Anda bisa menggunakan operator logika 'OR' dan 'AND' di sini.

Bidang _Penyaringan Waktu_ memungkinkan Anda menentukan filter yang berbeda sebelum menjalankan laporan.

Anda dapat __mengexport__ daftar hasil laporan ke format excel dan csv.

## Laporan Grid

Laporan Grid menghasilkan nilai ringkas yang dikelompokkan menurut bidang yang ditentukan. Laporan ini bisa ditampilkan sebagai bagan.

![Laporan Grid](../_static/images/user-guide/reports/grid.png)

Untuk membuat laporan grid baru klik pada tab Report kemudian klik tombol Buat Laporan. Pilih Tipe Entiti yang dibutuhkan lalu klik tombol Buat di bagian Laporan Grid.

Di bidang _Grup Menurut_ pilih satu atau dua bidang yang Anda inginkan agar data laporan Anda dikelompokkan. Anda dapat mengelompokkan menurut tahun, bulan, hari untuk bidang tanggal. Jika Anda mengelompokkan dua kolom, laporan Anda akan dianggap tiga dimensi.

Di bidang _Kolom_ pilih satu atau beberapa fungsi gabungan seperti COUNT, SUM (penjumlahan), MIN, MAX, AVG (rata-rata).

Bidang _Sortir berdasarkan_ mendefinisikan bagaimana data laporan akan diurutkan.

Pada bagian _Saring_ Anda dapat menentukan kriteria yang menentukan catatan apa yang akan digunakan dalam laporan Anda. Anda bisa menggunakan operator logika 'OR' dan 'AND' di sini.

_Penyaringan Waktu_ memungkinkan Anda menentukan filter yang berbeda sebelum menjalankan laporan.

Laporan grid memungkinkan menampilkan hasil dalam bentuk grafik. Ada jenis _tipe bagan_: Bar (Horizontal), Bar (Vertikal), Pie, Line.

Ini memungkinkan untuk __mengexport__ hasil laporan grid ke format excel dan csv.

## Penyaringan

### Bagian penyaringan

Sangat mudah untuk menggunakan jenis penyaringan. Anda juga dapat memilih bidang entitas target dan juga entitites terkait.

![Bagian penyaringan](../_static/images/user-guide/reports/filter-field.png)

### Grup OR

OR berarti setidaknya satu kondisi di bawah kelompok harus dipenuhi.

![Grup OR](../_static/images/user-guide/reports/filter-or.png)

### Grup AND

AND berarti bahwa semua kondisi di bawah kelompok harus dipenuhi.

### Grup NOT

Menyediakan kemampuan untuk menyaring catatan yang tidak memenuhi kriteria yang ditentukan. Misalnya daftar akun yang tidak memiliki peluang dengan status Closed Won atau Closed Lost.

![Grup NOT](../_static/images/user-guide/reports/filter-not.png)

### Pernyataan Kompleks

Untuk penggunaan lebih maju. Anda dapat menerapkan fungsi untuk kolom database tertentu dan membandingkannya dengan hasil ekspresi [formula](../administration/formula.md).

Catatan: Jika Anda perlu membandingkan hanya dengan nilai string sederhana, Anda harus memasukkannya ke dalam tanda kutip tunggal `'beberapa string'`.

Catatan: Fungsi yang dimaksudkan untuk berinteraksi dengan catatan entitas tidak akan bekerja disini karena formula tidak diterapkan pada record tertentu.

![Penyaringan Pernyataan Kompleks](../_static/images/user-guide/reports/filter-complex.png)

## Menampilkan di Dasbor

Anda dapat menampilkan laporan di dasbor. Untuk ini Anda perlu menambahkan Laporan dashlet dan kemudian memilih laporan yang diperlukan di opsi dashlet.

## Pengiriman Email

Ini memungkinkan sistem untuk mengirimkan hasil laporan kepada pengguna tertentu secara reguler sesuai waktu yang ditentukan. Ini harus dikonfigurasi untuk laporan tertentu secara terpisah.

## Menyingkronkan dengan Daftar Target

Ini memungkinkan daftar target disinkronkan dengan daftar hasil laporan. Ini lebih mudah untuk email massal jika Anda ingin mengirim email hanya ke kontak yang memenuhi beberapa kriteria pada saat pengiriman. Fitur ini tersedia pada tampilan detail daftar target di panel 'Singkron dengan Laporan'.
