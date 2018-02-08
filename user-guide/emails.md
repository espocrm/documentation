# Guidelines on Using Emails

# Pedoman Menggunakan Email

EspoCRM provides the ability to fetch emails from IMAP box. This makes possible to use EspoCRM as an email client along with CRM-specific features.

EspoCRM menyediakan kemampuan untuk mengambil email dari kotak IMAP. Hal ini memungkinkan untuk menggunakan EspoCRM sebagai klien email beserta fitur khusus CRM.

## IMAP accounts

*Note: You need to have [cron](https://github.com/espocrm/documentation/blob/master/administration/server-configuration.md#setup-a-crontab) properly configured in your system to have inbound emails working.*

User can setup IMAP account on Personal Email Accounts page (Emails tab > top-right menu > Personal Email Accounts).

Specify what folders to monitor in Monitored Folders field. By default it's set to INBOX. If you use some external email client to send emails you can add Sent folder to archive those emails.

*Fetch Since* allows you to choose the date emails should be archived from. Set it to some date prior today if you need to archive old emails.

There is an ability to specify *Folder* in Persnoal Email Account. Incoming emails will be put in that folder.

## akun IMAP

* Catatan: Anda harus memiliki [cron] (https://github.com/espocrm/documentation/blob/master/administration/server-configuration.md#setup-a-crontab) yang dikonfigurasikan dengan benar di sistem Anda agar memiliki email masuk kerja.*

Pengguna dapat mensetup akun IMAP di halaman Akun Email Pribadi (tab Email> menu kanan atas> Akun Email Pribadi).

Tentukan folder apa yang akan dipantau di kolom Monitored Folders. Secara default itu diatur ke INBOX. Jika Anda menggunakan beberapa klien email eksternal untuk mengirim email, Anda dapat menambahkan folder Terkirim untuk mengarsipkan email tersebut.

* Fetch Since * memungkinkan Anda memilih tanggal email yang harus diarsipkan dari. Tetapkan ke beberapa tanggal sebelum hari ini jika Anda perlu mengarsipkan email lama.

Ada kemampuan untuk menentukan * Folder * di Akun Email Persnoal. Email masuk akan dimasukkan ke dalam folder itu.

## SMTP accounts

Users can setup SMTP settings in Preferences as well as in thier Personal Email Accounts. Administrator also can allow to use system SMTP (make it Shared).

Users can have multiple SMTP accounts (since version 4.2.0). But email addresses user can use to send emails from are defined by email addresses of *User* record.

## akun SMTP

Pengguna dapat mengatur pengaturan SMTP di Preferensi dan juga di Akun Email Pribadi mereka. Administrator juga dapat mengizinkan untuk menggunakan sistem SMTP (membuatnya Shared).

Pengguna dapat memiliki beberapa akun SMTP (sejak versi 4.2.0). Tapi alamat email yang bisa digunakan pengguna untuk mengirim email dari yang ditentukan oleh alamat email * User * record.

## Working with Emails

Emails are fetched by cron (in background) every few minutes (period can specified by Administrator).
You can see all your emails at Emails tab. There are standard folders Inbox, Sent, Draft emails at the left side.

*Status* field. `Sent` means it was sent from CRM, `Archived` – fetched from IMAP account or archived manually, `Draft` – means that email was created as a draft.

When the new email comes the system tries to recognize which record this email belongs to. It can link it with Account, Lead, Opportunity, Case (and Contact in B2C mode) etc. If it wasn't recognized then user can link it manually by filling in *Parent* field.

If an email came from a new potential client user can **convert it to Lead**. Open Email entry and click Create Lead in top-right menu.

It's also possible to **create Task or Case** from an email record.

If email addresses (from, to, cc) in an email record are known to the system it will show the person they are related to (Contact, Lead, User etc). If some email address is new you can **create contact** right from there.

All emails related to specific record are shown in History panel of that record. If some email is related, for example, to opportunity but opportunity is related to the account, it will be shown both in opportunity and account.

## Bekerja dengan Email

Email diambil oleh cron (di latar belakang) setiap beberapa menit (periode dapat ditentukan oleh Administrator).
Anda dapat melihat semua email Anda di tab Emails. Ada folder standar Inbox, Sent, Draft email di sebelah kiri.

* Bidang Status *. `Terkirim` berarti dikirim dari CRM,` Archived` - diambil dari akun IMAP atau diarsipkan secara manual, `Draft` - berarti email dibuat sebagai draf.

Saat email baru tersebut masuk, sistem mencoba mengenali catatan email mana yang menjadi miliknya. Ini bisa menautkannya dengan Account, Lead, Opportunity, Case (dan Kontak dalam mode B2C) dll. Jika tidak dikenali maka pengguna bisa menautkannya secara manual dengan mengisi kolom * Parent *.

Jika email berasal dari pengguna klien potensial baru, bisa mengonversinya menjadi Lead **. Buka entri Email dan klik Create Lead di menu kanan atas.

**Mungkin juga untuk membuat Task atau Case** dari sebuah email record.

Jika alamat email (dari, ke, cc) dalam catatan email diketahui bahwa sistem akan menunjukkan orang yang mereka kenal (Kontak, Pimpin, Pengguna dll). Jika beberapa alamat email Anda baru saja Anda dapat membuat kontak ** langsung dari sana.

Semua email yang terkait dengan catatan tertentu ditampilkan di panel Sejarah rekaman itu. Jika beberapa email terkait, misalnya dengan peluang tapi peluang terkait dengan akun, maka akan ditunjukkan peluang dan akun.

## Sending Emails

You can compose new email by a few ways:
* *Compose Email* button on Emails list view;
* replying on another email;
* clicking on an email address of some record;
* *Compose Email* action of Activities panel.

There is an ability to **select template** of your email.

You can setup **email signature** in Preferences.

## Mengirim Email

Anda bisa menulis email baru dengan beberapa cara:
* * Tulis Email * pada tampilan daftar Email;
* membalas email lain;
* mengklik alamat email dari beberapa catatan;
* * Tulis Email * action of Activities panel.

Ada kemampuan untuk ** memilih template ** dari email anda.

Anda bisa mengatur ** email signature ** in Preferences.

## Email Folders

Users can create their own email folders to put some of emails in for convenience. List of available folders is available at Emails page at the left side. To create or edit folders follow Emails > dropdown in top-right corner > Folders. `Skip Notification` means that you wan't be notified about incoming emails that fall into the certain folder. By utilizing Email Filters it's possible to put emails in folders automatically by specific criteria.

## Email Folders

Pengguna dapat membuat folder email mereka sendiri untuk memasukkan beberapa email untuk kenyamanan. Daftar folder yang tersedia tersedia di halaman Email di sisi kiri. Untuk membuat atau mengedit folder ikuti Email> dropdown di pojok kanan atas> Folder. `Lewati Notifikasi` berarti Anda tidak diberi tahu tentang email masuk yang masuk ke folder tertentu. Dengan memanfaatkan Email Filters, mungkin saja memasukkan email ke folder secara otomatis menurut kriteria tertentu.

## Email Filters

Administrator can create global email filters to skip not desirable emails. They are available at Administration > Email Filters.

Regular user can create email filters for their Personal Email Accounts or for their entire inbox. They are available at Emails > dropdown in top-right corner > Filters.

There are two types of filters:
* Skip - email will be put in *Trash* or not imported if filter is related to Personal Email Account;
* Put in Folder - imported emails will be put into specified user's folder automatically.

## Filter Email

Administrator dapat membuat filter email global untuk tidak melewatkan email yang diinginkan. Mereka tersedia di Administration> Email Filters.

Pengguna biasa dapat membuat filter email untuk Akun Email Pribadi mereka atau untuk keseluruhan kotak masuk mereka. Mereka tersedia di Email> dropdown di pojok kanan atas> Filter.

Ada dua jenis filter:
* Lewati - email akan dimasukkan ke dalam * Sampah * atau tidak diimpor jika filter terkait dengan Personal Email Account;
* Masukan Email yang diimpor Folder akan dimasukkan ke dalam folder pengguna tertentu secara otomatis.

## Email Templates

Email templates are available at Emails > dropdown in top-right corner > Email Templates. They can be used both for mass email sendings and for regular emails. `One-off` checkbox means that email template supposed to be used only once, what is usual for email marketing.

It's possible to use placefolders in email template's body and subject e.g. {Account.name}, {Person.emailAddress}. They will be replaced with values of related records.

You can use additional reserved placefolders in template body: {optOutUrl} and {optOutLink}.
```
<a href="{optOutUrl}">Unsubscribe</a>
```
This is unsubscribe link for mass email.

## Email Template

Template email tersedia di Email> dropdown di pojok kanan atas> Template Email. Mereka dapat digunakan baik untuk pengiriman email massal dan untuk email biasa. Kotak centang `One-off` berarti template email seharusnya hanya digunakan sekali saja, apa yang biasa untuk pemasaran email.

Anda mungkin menggunakan placefolders di kerangka email dan subjek, mis. {Account.name}, {Person.emailAddress}. Mereka akan diganti dengan nilai-nilai catatan terkait.

Anda dapat menggunakan placeholder tambahan yang disediakan di badan template: {optOutUrl} dan {optOutLink}.
`` `
<a href="{optOutUrl}">Unsubscribe</a>
`` `
Ini adalah tautan berhenti berlangganan email massal.
