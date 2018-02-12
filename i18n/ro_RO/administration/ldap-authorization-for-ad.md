# Autorizația LDAP authorization pentru Director Activ

Exemple de configurare a autorizației LDAP pentru serverul Director Activ. Ghidul complet al configurării autorizației LDAP este descris [aici](ldap-authorization.md).

```
Gazdă: espo.local
Port: 389
Utilizator complet DN: cn=LDAP User,cn=espo-users,ou=users,dc=espo,dc=local
Parolă: ******
Atribut Nume Utilizator: sAMAccountName
Utilizator ObiectectClasă: person
Formă Canonică Cont: Principal
Cerințe Legate DN: no
Bază DN: cn=espo-users,ou=users,dc=espo,dc=local
Nume Cont Domeniu: espo.local
Nume Cont Domeniu Scurt: ESPO
Creează Utilizator în EspoCRM: yes
Atribut Prenume Utilizator: givenName
Atribut Nume Utilizator: sn
Atribut Titlu Utilizator: title
Atribut Adresă de Email Utilizator: mail
Atribut Număr de Telefon Utilizator: telephoneNumber
```

![1](../_static/images/administration/ldap-authorization/ldap-configuration-for-ad.png)
