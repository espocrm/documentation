# Otorisasi LDAP untuk Direktori Aktif

Contoh konfigurasi otorisasi LDAP untuk server Direktori Aktif. Panduan lengkap dari konfigurasi otorisasi LDAP dijelaskan [di sini](ldap-authorization.md).

```
Host: espo.local
Port: 389
Full User DN: cn=LDAP User,cn=espo-users,ou=users,dc=espo,dc=local
Password: ******
Username Attribute: sAMAccountName
User ObjectClass: person
Account Canonical Form: Principal
Bind Requires DN: no
Base DN: cn=espo-users,ou=users,dc=espo,dc=local
Account Domain Name: espo.local
Account Domain Name Short: ESPO
Create User in EspoCRM: yes
User First Name Attribute: givenName
User Last Name Attribute: sn
User Title Attribute: title
User Email Address Attribute: mail
User Phone Number Attribute: telephoneNumber
```

![1](../_static/images/administration/ldap-authorization/ldap-configuration-for-ad.png)
