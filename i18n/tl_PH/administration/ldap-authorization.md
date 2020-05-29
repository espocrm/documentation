# Awtorisasyon ng Ldap

Sa guide na ito, ipapakita namin kung papaano i-configure ang awtorisasyon ng LDAP para EspoCRM. Tara na!

Pumunta sa iyong LDAP serber at gumawa ng isang base DN para sa mga EspoCRM user gaya ng
```
cn=espo-users,ou=users,dc=espo,dc=local
```

Kailangan nating lumikha ng isang system user na magkakaroon ng access sa users DN (“cn=espo-users,ou=users,dc=espo,dc=local”). Kaya ang buong DN para sa system user na ito ay magiging 
```
cn=LDAP User,cn=espo-users,ou=users,dc=espo,dc=local
```
Ngayon ay maaari na nating idagdag ang LDAP user para ma-acces ang EspoCRM. E.g. Espo Tester na may username “tester” sa loob ng “cn=espo-users,ou=users,dc=espo,dc=local” DN. Paalala: para magamit ang login format na ito para sa EspoCRM, kailangan mong tukuying ang “Username Attribute” at “Base DN” na mga opsyon.

Pagkatapos ay pumunta sa mga EspoCRM  Authentication setting sa Administrator panel, i-select ang `LDAP` method at punan ang mga LDAP na detalye:

![1](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/ldap-authorization/ldap-configuration.png)

* Host – LDAP IP o pangalan ng host.
* Port – port ng koneksyon.
* Auth – pag-access ng mga credential para LDAP serber:
 * Full User DN – ang buong system user DN na nagpapahintulot na i-search ang ibang mga user.
 * Password – ang password para ma-access ang LDAP serber.
* Security – protokol ng SSL o TSL.
* Username Attribute – ang katangian upang kilalanin ang user. Para sa Active Directory maaari itong maging “userPrincipalName” o “sAMAccountName”.
* Account Canonical Form – uri ng iyong account canonical form. Mayroong apat na opsyon:
 * Dn – ang form sa format `CN=tester,CN=Espocrm,DC=company,DC=com`.
 * Username – ang form na `tester`.
 * Backslash – ang form na `COMPANY\tester`.
 * Principal – ang form na `tester@company.com`.
* Bind Requires Dn – kung kinakailangang i-format ang username sa DN form.
* Base Dn – ang base DN batay sa default na ginagamit sa pag-search ng mga user.
* User Login Filter – ang filter na nagpapahintulot na i-restrict ang mga user na maaring gumamit ng EspoCRM. E.g. `memberOf=cn=espoGroup,cn=espo-users,ou=users,dc=espo,dc=local`.
* Account Domain Name – Ang domain na ginagamit para sa awtorisasyon ng LDAP serber.
* Account Domain Name Short – Ang short domain ginagamit para sa awtorisasyon ng LDAP serber.
* Try Username Split – ang opsyo na hahati sa username kasama ang domain.
* Opt Referrals – kung nag mga referral ay dapat sundin ng LDAP client.
* Create User in EspoCRM – ang opsyon na itoy ay nagpapahintulot sa EspoCRM na gumawa ng user mura sa LDAP.
 * User First Name Attribute – katangian ng LDAP na ginagamit upang matukoy ang unang pangalan ng user.
 * User Last Name Attribute – katangian ng LDAP na ginagamit upang matukoy ang apelyido ng user.
 * User Title Attribute – katangian ng LDAP na ginagamit upang matukoy ang user title.
 * User Email Address Attribute – katangian ng LDAP na ginagamit upang matukoy email address ng user.
 * User Phone Number Attribute – katangian ng LDAP na ginagamit upang matukoy ang numero ng telepono ng user.

Ngayon ay pumunta sa login page at i-enter ang mga user credential.

![2](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/ldap-authorization/ldap-login.png)

Ang user ay na-authenticate na at awtomatiko ng nalikha sa EspoCRM.

## Ang mga Instruksiyon ng Configuration base sa iyong serber:
* [Active Directory serber](ldap-authorization-for-ad.md)
* [OpenLDAP serber](ldap-authorization-for-openldap.md)

Para sa karagdagang impormasyon sa pag-configure ng LDAP, maaari mong basahin sa [Zend\Ldap library](https://zendframework.github.io/zend-ldap/intro/) page, sapagkat ang EspoCRM ay gumagamit ng library na ito.




