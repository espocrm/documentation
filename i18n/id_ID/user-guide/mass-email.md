# Email massal

## Bagaimana mengirim email massal

You need to have at least one Target List with target records and Email Template in your crm.

Anda harus memiliki setidaknya satu Daftar Target dengan target catatan dan Email Template dalam crm anda.

Jika semuanya benar setup email harus keluar. Mereka harus dikirim setiap jam dengan porsi (Anda dapat mengubah ukuran porsi di Administration> Outbound Emails). Administrator dapat mengubahnya dengan memperbarui bidang `Penjadwalan` dari` Periksa Akun Email' Pekerjaan Terjadwal. 

You can check if emails are sent in Log panel.

Anda dapat memeriksa apakah email yang dikirim dalam Log panel.

## Test what will be sent to recipients

## Tes apa yang akan dikirim ke penerima

Click right dropdown on the mass email row in _Mass Email_ panel and then click _Send Test_.

Klik kanan dropdown pada email massal baris di _Mass Email_ panel, dan kemudian klik _kirim Test_.

## Log

In log you can see:
* Sent email;
* Emails opened by recipient;
* Links clicked by recipient;
* Recipients who opted out;
* Bounced emails (not delivered to recipient).

Dalam log, anda dapat melihat:
* Mengirim email;
* Email dibuka oleh penerima;
* Tautan diklik oleh penerima;
* Penerima yang memilih keluar;
* Membangun email (tidak dikirimkan kepada penerima).

## Opt-out link

## Tautan penyisihan

By default the system will append opt-out to all sent emails. But you can use custom one in your Email Template.

Secara default sistem akan menambahkan opt-out untuk semua email yang dikirim. Tapi anda dapat menggunakan satu kustom di Template Email anda.

Example:
```html
<a href="{optOutUrl}">Unsubscribe from the mailing list.</a>
```

Administrator can disable mandatory opt-out link being added by system at Administration > Outbound Emails.

Contoh:
``html
<a href="{optOutUrl}">berhenti Berlangganan dari mailing list.</a>
``

Administrator dapat menonaktifkan wajib opt-out link yang ditambahkan oleh sistem Administrasi > Email Keluar.

## Tracking URL

## Melacak URL

If you want to know that your recipient opened the link from your email, you need to create Tracking URL. Specify any _Name_
 and _URL_ where your link should lead to. Then you will need to paste generated code into your Email Template.
 
 Jika anda ingin tahu bahwa penerima anda membuka link dari email anda, yang anda butuhkan untuk membuat URL Pelacakan. Menentukan _Name_
dan _URL_ di mana link anda harus mengarah ke. Kemudian anda akan perlu untuk paste kode yang dihasilkan menjadi Template Email anda.

 Example:
 ```html
<a href="{trackingUrl:55f2c87b09a220a78}">Try our demo</a>
 ```
 
 Contoh:
  `` `html
<a href="{trackingUrl:55f2c87b09a220a78}"> Coba demo kami </a>
  `` `
  
## Target Lists

Target Lists contains the lists of Accounts, Contacts, Leads and Users records. 

Users can populate target lists manually using _Select_ tindakan pada panel yang sesuai pada tampilan detail Daftar Target. There is an ability to make filtering and then select all result of search.

## Daftar Target

Target berisi daftar Akun, Kontak, Memimpin dan Pengguna catatan.

Pengguna dapat mengisi target daftar secara manual menggunakan _Select_ tindakan pada panel yang sesuai pada tampilan detail Daftar Target. Ada kemampuan untuk membuat penyaringan dan kemudian pilih semua hasil pencarian.

## Populating target lists with Reports

[Reports](reports.md#syncing-with-target-lists) feature provides an ability to populate target lists with records matching specific criteria.

## Mengisi daftar sasaran dengan Laporan

[Laporan](laporan.md#sinkronisasi-dengan-target-list) fitur ini memberikan kemampuan untuk mengisi daftar sasaran dengan catatan yang sesuai dengan kriteria tertentu.

## Excluding Target Lists

Specify Excluding Target Lists to avoid sending mass email to certain recipients. If there is a record with the email address that matches the email address of any excluding record, the first record will be excluded as well.

## Tidak termasuk Target Daftar

Menentukan tidak Termasuk Target Daftar untuk menghindari mengirim email massal ke penerima tertentu. Jika ada record dengan alamat email yang sesuai dengan alamat email apapun termasuk catatan pertama akan dikeluarkan juga.

## Campaign Log

At Campaign Log you can see emails that have been sent, opened emails, bounced emails, who opted out, and who clicked the link in the email. It's possible to utilize this log by creating Target List (dropdown in the top-right corner on panel) based on records from log. For example, you pick only contacts that clicked on the link (tracking url).

## Log Kampanye

Pada Kampanye Log anda dapat melihat email yang telah dikirim, membuka email, memantul email, yang memilih keluar, dan yang mengklik link dalam email. Itu mungkin untuk menggunakan log ini dengan membuat Daftar Target (dropdown di pojok kanan atas pada panel) yang didasarkan pada catatan dari log. Misalnya, anda memilih hanya kontak yang diklik pada link (url pelacakan).

## Troubleshooting

_For Administrators_

## Penyelesaian masalah

_Untuk administrator_

#### What to do if emails are not sent out.

1. Check if _Send Test_ works. If does't work, then check if system SMTP settings are correct.
2. Check if you have setup cron for your system.
3. Check if you have `Send Mass Emails` Scheduled Job and it's `Active` (Administration > Scheduled Jobs > Send Mass Emails). Check if there is something in Log.

#### Apa yang harus dilakukan jika email tidak dikirim..

1. Periksa apakah _kirim Test_ bekerja. Jika tidak bekerja, kemudian memeriksa apakah sistem pengaturan SMTP adalah benar.
2. Periksa jika anda memiliki setup cron untuk sistem anda.
3. Periksa apakah anda memiliki `Kirim Email Massal` Dijadwalkan Pekerjaan dan itu `Aktif` (Administrasi > Dijadwalkan Pekerjaan > Kirim Email Massal). Periksa jika ada sesuatu dalam Log.

#### What if Tracking URLs has wrong url that does not lead to your crm.

Check 'siteUrl' parameter in `data/config.php` file. It must be set as URL of your EspoCRM accessible from the external world.

#### Bagaimana jika Url Pelacakan memiliki url yang salah yang tidak mengarah ke crm anda.

Periksa 'siteUrl' parameter `data/config.php` file. Itu harus ditetapkan sebagai URL anda EspoCRM dapat diakses dari dunia luar

#### Bounced emails are not being logged

Bounced emails can be handled by group email account only. Make sure that you have a group email account that monitores the mailbox bounced emails are sent to.

Also some mail server providers can deviate from standards, so bounced emails can be not distinguished.

#### email yang dipantulkan tidak masuk log

Bangkit email dapat ditangani oleh kelompok akun email saja. Pastikan bahwa anda memiliki sebuah kelompok akun email yang monitores kotak memantul email yang dikirim.

Juga beberapa mail server penyedia dapat menyimpang dari standar, sehingga terpental email tidak dapat dibedakan.
