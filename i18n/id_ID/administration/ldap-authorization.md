# Otorisasi Ldap

Dalam panduan ini, kami akan menunjukkan cara mengkonfigurasi otorisasi LDAP untuk EspoCRM. Ayo!

Buka server LDAP Anda dan buat _base_ DN untuk pengguna EspoCRM seperti
```
cn=espo-users,ou=users,dc=espo,dc=local
```

Kita harus membuat pengguna sistem yang memiliki akses ke pengguna DN (“cn=espo-users,ou=users,dc=espo,dc=local”). Jadi, DN yang lengkap untuk pengguna sistem ini akan menjadi
```
cn=LDAP User,cn=espo-users,ou=users,dc=espo,dc=local
```
Sekarang, kita dapat menambahkan pengguna LDAP untuk mengakses EspoCRM. Misalnya Espo Tester dengan nama pengguna “tester” di dalam DN “cn=espo-users,ou=users,dc=espo,dc=local”. Harap diperhatikan: Agar dapat menggunakan format login untuk EspoCRM ini, Anda harus menentukan opsi “Username Attribute” dan “Base DN”.

Kemudian, buka pengaturan Otentikasi EspoCRM di panel Administrator, pilih metode `LDAP` dan isi rincian LDAP dengan:

![1](../_static/images/administration/ldap-authorization/ldap-configuration.png)

* Host – IP LDAP atau nama host.
* Port – port koneksi.
* Auth – akses kredensial untuk server LDAP:
 * Full User DN – pengguna sistem penuh DN memungkinkan untuk mencari pengguna lain.
 * Password – kata sandi untuk mengakses server LDAP.
* Security – protokol TSL atau SSL.
* Username Attribute – atribut untuk mengidentifikasi pengguna. Untuk Direktori Aktif dapat berupa “userPrincipalName” atau “sAMAccountName”.
* Account Canonical Form – ketik formulir canonical akun Anda. Ada 4 opsi:
 * Dn – formulir dalam format `CN=tester,CN=Espocrm,DC=company,DC=com`.
 * Username – formulir `tester`.
 * Backslash – formulir `COMPANY\tester`.
 * Principal – formulir `tester@company.com`.
* Bind Requires Dn – diperlukan jika ingin memformat nama pengguna di formulir DN.
* Base Dn – base default DN yang digunakan untuk mencari pengguna
* User Login Filter – filter yang memungkinkan untuk membatasi pengguna yang mengakses EspoCRM. Misalnya `memberOf=cn=espoGroup,cn=espo-users,ou=users,dc=espo,dc=local`.
* Account Domain Name – Domain yang digunakan untuk otorisasi server LDAP.
* Account Domain Name Short – Domain pendek yang digunakan untuk otorisasi server LDAP.
* Try Username Split – opsi untuk membagi username dengan domain.
* Opt Referrals – jika rujukan harus diikuti ke klien LDAP.
* Create User in EspoCRM – opsi ini memungkinkan EspoCRM membuat pengguna dari LDAP.
 * User First Name Attribute – atribut LDAP yang digunakan untuk menentukan nama pertama pengguna.
 * User Last Name Attribute – atribut LDAP yang digunakan untuk menentukan nama terakhir pengguna.
 * User Title Attribute – atribut LDAP yang digunakan untuk menentukan gelar pengguna.
 * User Email Address Attribute – atribut LDAP yang digunakan untuk menentukan surel pengguna.
 * User Phone Number Attribute – atribut LDAP yang digunakan untuk menentukan nomor ponsel pengguna.

Sekarang, masuk ke halaman login dan masukkan kredensial pengguna.

![2](../_static/images/administration/ldap-authorization/ldap-login.png)

Pengguna telah dikonfirmasi dan dibuat secara otomatis di EspoCRM.

## Petunjuk konfigurasi berdasarkan server Anda:
* [server Direktori Aktif](ldap-authorization-for-ad.md)
* [server OpenLDAP](ldap-authorization-for-openldap.md)

Informasi lebih lanjut tentang mengonfigurasi LDAP dapat Anda baca di laman [Zend\Ldap library](https://zendframework.github.io/zend-ldap/intro/), karena EspoCRM menggunakan _library_ ini.




