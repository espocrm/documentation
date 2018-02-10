# Kutipan

Fitur penawaran tersedia di [Paket Lanjutan](https://www.espocrm.com/extensions/advanced-pack/).

Kutipan adalah kelompok produk atau layanan tertentu dengan jumlah dan harga yang Anda kutip kepada pelanggan.

Kutipan memiliki hubungan dengan Opportuniti. Anda bisa menambahkan panel Kutipan ke detail Opportuniti lihat di Administrasi> Manajer Tata letak> Opportuniti> Hubungan. Saat membuat kutipan baru terkait dengan peluang, itu mengalihkan item peluang ke penawaran.

Anda dapat menambahkan panel Kutipan ke tampilan detail Akun untuk dapat melihat kutipan terkait. Anda dapat melakukannya di Administrasi> Manajer Tata letak> Akun> Hubungan.

## Item Kutipan

Kutipan memppunyai daftar item. Setiap item dapat mewakili produk atau layanan tertentu dengan deskripsi, jumlah, tarif pajak, daftar harga dan harga satuan. Ini memungkinkan untuk memilah item secara manual.

Anda dibolehkan untuk menambahkan bidang khusus untuk Item Kutipan yang menggunakan Manajer Entitas.

## Template

Secara default ada dua template yang tersedia: Kutipan and Faktur. Anda bisa membuat template baru (Tampilan daftar kutipan> menu dropdown kanan atas> Template) serta editan yang sudah ada.

Untuk pengeditan yang lebih tepat, sebaiknya menggunakan mode Tampilan Kode.

Anda dapat mencetak bidang catatan kutipan serta bidang catatan terkait dengan memanfaatkan placeholder di template Anda.

Contoh:
`{{accountName}}` – nama Akun

`{{{billingAddressStreet}}}` – jalan,

`{{account.type}}` – tipe Akun terkait,

`{{assignedUser.lastName}}` – nama belakang pengguna yang ditetapkan.

Jika item baris Anda adalah produk Anda dapat mencetak bidang produk. 

Contoh:
`{{product.length}}`, 

`{{product.color}}`.

Panjang dan warna adalah bidang kustom entitas Produk dalam contoh. 

Perulangan melalui item kutipan:

```
<!-- {{#each itemList}} -->
  <td>{{order}}</td>
  <td>{{name}}</td>
  <td>{{quantity}}</td>
  <td>{{product.weight}}</td>
  <td align="right">{{listPrice}}</td>
  <td align="right">{{unitPrice}}</td>
  <td align="right">{{amount}}</td>
<!-- {{/each}} -->
```

Memungkinan Anda untuk mencetak bidang gambar: 

```
<img src="{{file imageId}}">
```
dimana `imageId` – nama bidang gambar khusus pada entitas Kutipan yang digabungkan dengan akhiran `Id`.

Untuk item produk:
```
<img src="{{file product.photoId}}">
```

Untuk menampilkan nomor melayang (seperti quantity, harga unit dll) dengan bagian fraksional (sebagai integer) gunakan ungkapan berikut (sejak versi 4.8.3):
```
{{numberFormat quantity_RAW decimals=0}}
```

Format khusus untuk nilai mata uang (sejak versi 4.8.3):
```
{{numberFormat unitPrice_RAW decimals=2 decimalPoint=',' thousandsSeparator=' '}}
```
Nilai `10000.5` akan dicetak sebagai `10 000,50`. 

Untuk menampilkan teks fileds (multiline) gunakan tiga petik: `{{{description}}}`.

## Cetak ke PDF

Kutipan dapat dicetak ke PDF. Tindakan ini tersedia dalam menu tarik-turun di samping tombol Edit pada tampilan detail kutipan. Kemudian Anda akan diminta untuk memilih Template.

## Email Kutipan

Kutipan PDF bisa di kirim lewat email sebagai lampiran. Buka catatan quote, klik tarik-turun di samping tombol Edit dan klik Email PDF.

## Penomoran Otomatis

Anda dapat membuat bagian Nomor via Manajer Entiti untuk tipe entiti Kutipan. Administrasi> Manajer Entiti> Kutipan> Area> Tambah Area> Nomor. Maka Anda perlu menempatkannya pada tampilan detail menggunakan Manajer Tata letak.

Nilai akan bertambah dengan setiap kutipan baru. Ada kemampuan untuk menentukan nomor berikutnya sebagai awalan.

## Pajak Default

Tersedia sejak EspoCRM 4.8.0.

1. Tentukan catatan Pajak default pada Administrasi> Manajer Entiti> Kutipan> area> Pajak> Default.
2. Tentukan tingkat pajak default pada Administrasi> Manajer Entiti> Kutipan> area> tingkat pajak> Default.

## Tagihan

Kutipan bisa dianggap sebagai tagihan jika statusnya menjadi `Disetujui`. Kemudian area _Tanggal Tagihan_, _Nomor Tagihan_ muncul. Anda dapat menggunakan template yang berbeda untuk faktur untuk dicetak.
