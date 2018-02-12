# Autorizație LDAP

În acest ghid, vei putea să  înveți cum se face Autorizațiea LDAP pentru EspoCRM.

Du-te în serverul tău LDAP și creează o bază DN pentru utilizatori EspoCRM
```
cn=espo-users,ou=users,dc=espo,dc=local
```

Trebuie să creăm un utilizator de sistem care să aibă acces la utilizatori DN (“cn=espo-users,ou=users,dc=espo,dc=local”). Astfel, DN complet pentru acest utilizator de sistem o să fie
```
cn=LDAP User,cn=espo-users,ou=users,dc=espo,dc=local
```
Acum, poți adăuga un utilizator LDAP pentru a accesa EspoCRM. Ex. Espo Tester cu același nume de utilizator “tester” în interiorul “cn=espo-users,ou=users,dc=espo,dc=local” DN. Vă rugăm, rețineți: pentru a putea folosi acest format de autentificare pentru EspoCRM, trebuie să specifici opțiunile “Atribut Nume Utilizator” și “Bază DN”.

Apoi, mergi la setările de Autentificare EspoCRM din panoul de administrare, selectează metoda `LDAP` și completează detaliile LDAP:

![1](../_static/images/administration/ldap-authorization/ldap-configuration.png)

* Gazdă – LDAP IP sau numele gazdei.
* Port – portul de conexiune.
* Auth – acreditările de acces pentru serverul LDAP:
 * Utilizator Complet DN – Utilizatorul complet de sistem DN care permite căutarea altor utilizatori.
 * Parolă – parola pentru accesarea serverului LDAP.
* Securitate – protocolul SSL sau TSL.
* Atribut Nume Utilizator – atributul pentru a identifica utilizatorul. Pentru Director activ poate fi “userPrincipalName” sau “sAMAccountName”.
* Forma Canonică a Contului – Tipul canonic a formei contului. Există 4 opțiuni:
 * Dn – forma în format `CN=tester,CN=Espocrm,DC=company,DC=com`.
 * Nume Utilizator – în forma `tester`.
 * Backslash – în forma `COMPANY\tester`.
 * Principal – îm forma `tester@company.com`.
* Legarea necesită Dn – dacă este necesar să se formateze numele utilizatorului în formularul DN.
* Bază Dn – baza DN implicită care este folosită pentru căutarea utilizatorilor.
* Filtru Autentificare Utilizator – filtru carepermite restricționarea utilizatorilor care au posibilitatea de a folosi EspoCRM. Ex. `memberOf=cn=espoGroup,cn=espo-users,ou=users,dc=espo,dc=local`.
* Numele Domeniului Contului – Domeniul care este folosit pentru a autoriza serverul LDAP.
* Numele Scurt al Domeniului Contului – Domeniul Scurt care este folosit pentru a autoriza serverul LDAP.
* Încercă Tăierea Numelui Utilizatorului – opțiunea de tăiere a numelui utilizatorului cu domeniul.
* Referali – dacă referali ar trebui să fie urmați către clientul LDAP.
* Creează Utilizator în EspoCRM – această opțiune permite EspoCRM să creeze un utilizator din LDAP.
 * Atributul Prenumelui Utilizatorului – atribut LDAP care este folosit pentru a determina prenumele utilizatorului.
 * Atributul Numelui Utilizatorului – atribut LDAP care este folosit pentru a determina numele utilizatorului.
 * Atributul Titlului Utilizatorului – atribut LDAP care este folosit pentru a determina titlul utilizatorului.
 * Atributul Adresei de Email al Utilizatorului – atribut LDAP care este folosit pentru a determina adresa de email utilizatorului.
 * Atributul Numelui de Telefon al Utilizator – atribut LDAP care este folosit pentru a determina numărul de telefon al utilizatorului.

Acum, mergi la pagina de autentificare și introdu acreditările.

![2](../_static/images/administration/ldap-authorization/ldap-login.png)

Utilizatorul a fost autentificat și creeat automat în EspoCRM.

##Instrucțiunile de configurare bazate pe serverul tău:
* [Active Directory server](ldap-authorization-for-ad.md)
* [OpenLDAP server](ldap-authorization-for-openldap.md)

Mai multe informații despre configurarea LDAP, găsești aici [Zend\Ldap library](https://zendframework.github.io/zend-ldap/intro/), deoarece EspoCRM folosește această librărie.




