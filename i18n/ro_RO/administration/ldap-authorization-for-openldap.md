# Autorizația LDAP pentru OpenLDAP

Exemple de configurare a autorizației LDAP pentru severul  OpenLDAP. Ghidul complet al configurării autorizației LDAP este descris [aici](ldap-authorization.md).

```
Gazdă: espo.local
Port: 389
Utilizator complet DN: cn=LDAP User,cn=espo-users,ou=users,dc=espo,dc=local
Parolă: ******
Atribut Nume Utilizator: uid
Utilizator ObiectectClasă: inetOrgPerson
Formă Canonică Cont: Dn
Cerințe Legate DN: yes
Bază DN: cn=espo-users,ou=users,dc=espo,dc=local
Creează Utilizator în EspoCRM: yes
Atribut Prenume Utilizator: givenName
Atribut Nume Utilizator: sn
Atribut Titlu Utilizator: title
Atribut Adresă de Email Utilizator: mail
Atribut Număr de Telefon Utilizator: telephoneNumber
```

![1](../_static/images/administration/ldap-authorization/ldap-configuration-for-openldap.png)
