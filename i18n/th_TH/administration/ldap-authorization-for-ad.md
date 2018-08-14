# การขออนุมัติ LDAP สำหรับ Active Directory

ตัวอย่าง การกำหนดค่า LDAP สำหรับ เซิร์ฟเวอร์ Active Directory คู่มือคำอธิบายฉบับเต็มของการกำหนดค่า LDAP การอธิบายของการกำหนดค่า
[here](ldap-authorization.md).

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

![1](https://raw.githubusercontent.com/espocrm/documentation/master/_static/images/administration/ldap-authorization/ldap-configuration-for-ad.png)
