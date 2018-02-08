# Email massal

## Bagaimana mengirim email massal

You need to have at least one Target List with target records and Email Template in your crm.

Anda harus memiliki setidaknya satu Daftar Target dengan catatan target dan Template Email di crm Anda.

Jika semuanya benar setup email harus keluar. Mereka harus dikirim setiap jam dengan porsi (Anda dapat mengubah ukuran porsi di Administration> Outbound Emails). Administrator dapat mengubahnya dengan memperbarui bidang `Penjadwalan` dari` Periksa Akun Email' Pekerjaan Terjadwal. 

You can check if emails are sent in Log panel.

Anda dapat memeriksa apakah email dikirim ke panel Log.

## Test what will be sent to recipients

## Uji apa yang akan dikirim ke penerima

Click right dropdown on the mass email row in _Mass Email_ panel and then click _Send Test_.

Klik tarik-turun kanan pada baris email massal di _Mass Email_ panel dan kemudian klik _Send Test_.

## Log

In log you can see:
* Sent email;
* Emails opened by recipient;
* Links clicked by recipient;
* Recipients who opted out;
* Bounced emails (not delivered to recipient).

Dalam log Anda bisa melihat:
* Email terkirim;
* Email dibuka oleh penerima;
* Tautan diklik oleh penerima;
* Penerima yang memilih keluar;
* Email terpental (tidak terkirim ke penerima).

## Opt-out link

## Tautan penyisihan

By default the system will append opt-out to all sent emails. But you can use custom one in your Email Template.

Secara default sistem akan menambahkan opt-out ke semua email yang dikirim. Tapi Anda bisa menggunakan custom one di Template Email Anda.

Example:
```html
<a href="{optOutUrl}">Unsubscribe from the mailing list.</a>
```

Administrator can disable mandatory opt-out link being added by system at Administration > Outbound Emails.

Contoh:
`` `html
<a href="{optOutUrl}"> Berhenti berlangganan dari milis. </a>
`` `

Administrator dapat menonaktifkan link opt-out wajib yang ditambahkan oleh sistem di Administration> Email keluar.

## Tracking URL

## Melacak URL

If you want to know that your recipient opened the link from your email, you need to create Tracking URL. Specify any _Name_
 and _URL_ where your link should lead to. Then you will need to paste generated code into your Email Template.
 
 Jika Anda ingin tahu bahwa penerima Anda membuka tautan dari email Anda, Anda perlu membuat URL Pelacakan. Tentukan _Name_ apapun
  dan _URL_ di mana link Anda harus mengarah ke. Kemudian Anda perlu menempelkan kode yang dihasilkan ke Template Email Anda.

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

Daftar Target berisi daftar catatan Akun, Kontak, Pimpinan dan Pengguna.

Pengguna dapat mengisi daftar target secara manual dengan menggunakan _Select_ action pada panel yang sesuai pada tampilan detail Daftar Target. Ada kemampuan untuk melakukan penyaringan lalu pilih semua hasil pencarian.

## Populating target lists with Reports

[Reports](reports.md#syncing-with-target-lists) feature provides an ability to populate target lists with records matching specific criteria.

## Mengisi daftar target dengan Laporan

[Reports] (reports.md # syncing-dengan-daftar target) fitur menyediakan kemampuan untuk mengisi daftar target dengan catatan yang sesuai dengan kriteria spesifik.

## Excluding Target Lists

Specify Excluding Target Lists to avoid sending mass email to certain recipients. If there is a record with the email address that matches the email address of any excluding record, the first record will be excluded as well.

## Tidak termasuk Daftar Target

Tentukan Daftar Penawaran Tidak Termasuk untuk tidak mengirim email massal kepada penerima tertentu. Jika ada catatan dengan alamat email yang cocok dengan alamat email dari catatan yang tidak termasuk, rekaman pertama akan dikecualikan juga.

## Campaign Log

At Campaign Log you can see emails that have been sent, opened emails, bounced emails, who opted out, and who clicked the link in the email. It's possible to utilize this log by creating Target List (dropdown in the top-right corner on panel) based on records from log. For example, you pick only contacts that clicked on the link (tracking url).

## Log Kampanye

Di Campaign Log Anda dapat melihat email yang telah dikirim, email terbuka, email terpental, yang memilih ikut serta, dan siapa yang mengeklik tautan di email. Anda bisa memanfaatkan log ini dengan membuat Daftar Target (dropdown di pojok kanan atas pada panel) berdasarkan catatan dari log. Misalnya, Anda hanya memilih kontak yang diklik pada link (tracking url).

## Troubleshooting

_For Administrators_

## Penyelesaian masalah
_Untuk administrator_

#### What to do if emails are not sent out.

1. Check if _Send Test_ works. If does't work, then check if system SMTP settings are correct.
2. Check if you have setup cron for your system.
3. Check if you have `Send Mass Emails` Scheduled Job and it's `Active` (Administration > Scheduled Jobs > Send Mass Emails). Check if there is something in Log.

#### Apa yang harus dilakukan jika email tidak terkirim.

1. Periksa apakah _Send Tes_ bekerja. Jika tidak berhasil, maka periksa apakah setting sistem SMTP benar.
2. Periksa apakah Anda memiliki setup cron untuk sistem Anda.
3. Periksa apakah Anda memiliki 'Kirim Email Massal' Pekerjaan yang Dijadwalkan dan itu `Aktif` (Administrasi> Pekerjaan Terjadwal> Kirim Email Massal). Periksa apakah ada sesuatu di Log.

#### What if Tracking URLs has wrong url that does not lead to your crm.

Check 'siteUrl' parameter in `data/config.php` file. It must be set as URL of your EspoCRM accessible from the external world.

#### Bagaimana jika URL Pelacakan memiliki url salah yang tidak mengarah ke crm Anda.

Periksa parameter 'siteUrl' di file `data / config.php`. Ini harus ditetapkan sebagai URL EspoCRM Anda dapat diakses dari dunia luar.

#### Bounced emails are not being logged

Bounced emails can be handled by group email account only. Make sure that you have a group email account that monitores the mailbox bounced emails are sent to.

Also some mail server providers can deviate from standards, so bounced emails can be not distinguished.

#### email yang dipantulkan tidak masuk log

Email terpental hanya bisa ditangani oleh akun email grup. Pastikan bahwa Anda memiliki akun email grup yang memonitor kotak pesan yang memantul email dikirim.

Juga beberapa penyedia server email bisa menyimpang dari standar, sehingga email yang terpental tidak bisa dibedakan.
