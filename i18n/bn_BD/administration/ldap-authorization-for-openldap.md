# OpenLDAP এর জন্য LDAP অনুমোদন

OpenLDAP সার্ভারের কনফিগারেশন LDAP অনুমোদনের উদাহরণস্বরূপ কনফিগারেশন LDAP অনুমোদনের সম্পূর্ণ গাইডে বর্ণিত হল [এখানে](ldap-authorization.md).

```
Host: espo.local
Port: 389
Full User DN: cn=LDAP User,cn=espo-users,ou=users,dc=espo,dc=local
Password: ******
Username Attribute: uid
User ObjectClass: inetOrgPerson
Account Canonical Form: Dn
Bind Requires DN: yes
Base DN: cn=espo-users,ou=users,dc=espo,dc=local
Create User in EspoCRM: yes
User First Name Attribute: givenName
User Last Name Attribute: sn
User Title Attribute: title
User Email Address Attribute: mail
User Phone Number Attribute: telephoneNumber
```

![1](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/ldap-authorization/ldap-configuration-for-openldap.png)
