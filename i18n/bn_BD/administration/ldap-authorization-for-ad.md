# সক্রিয় ডিরেক্টরি জন্য LDAP অনুমোদন

সক্রিয় ডিরেক্টরি সার্ভারের কনফিগারেশন LDAP অনুমোদনের উদাহরণ। কনফিগারেশন LDAP অনুমোদনের সম্পূর্ণ গাইড বর্ণিত হল [এখানে](ldap-authorization.md).

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

![1](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/ldap-authorization/ldap-configuration-for-ad.png)
