# Ldap Authorization

Sa kani nga guide, ipakita namo kung unsaon pag-configure sa LDAP authorization para sa EspoCRM.
Tana.

Adto sa imohang LDAP server ug paghimo og usa ka base DN para sa EspoCRM nga mga user parehas sa
```
cn=espo-users,ou=users,dc=espo,dc=local
```

Nanginahanglan kita muhimo og system user kung asa naay access sa mga users DN (“cn=espo-users,ou=users,dc=espo,dc=local”). Busa, ang tibuok DN para sa kaning system user kay
```
cn=LDAP User,cn=espo-users,ou=users,dc=espo,dc=local
```
Karon, mupuno kita og LDAP user para mu-access sa EspoCRM. E.g. Espo Tester nga naay user name nga "tester" sa sulod sa “cn=espo-users,ou=users,dc=espo,dc=local” nga DN. Palihug timan-e: para makagamit sa kani nga login format para sa EspoCRM, gikinahanglan nimo nga i-specify ang “Username Attribute” ug “Base DN” nga mga opsyon.

Dayon, adto sa EspoCRM Authentication nga mga setting sa Administrator nga panel, pilia ang `LDAP` nga method ug ibutang ang mga LDAP nga mga detalye:

![1](../_static/images/administration/ldap-authorization/ldap-configuration.png)

* Host – ang LDAP IP o host name.
* Port – ang connection port.
* Auth – ang access credentials para sa LDAP server:
 * Full User DN – ang full system user DN nga nitugot sa pagpangita sa ubang mga user.
 * Password – ang password para ma-access ang LDAP nga server.
* Security – SSL o TSL nga protocol.
* Username Attribute – ang attribute nga mu-ila sa user. Para sa Active Directory, pwede ni “userPrincipalName” o “sAMAccountName”.
* Account Canonical Form – ang type sa imohang account canonical form. Naay 4 ka mga opsyon:
 * Dn – ang form nga naa sa format `CN=tester,CN=Espocrm,DC=company,DC=com`.
 * Username – ang form nga `tester`.
 * Backslash – ang form nga `COMPANY\tester`.
 * Principal – ang form nga `tester@company.com`.
* Bind Requires Dn – kung nanginahanglan muformat sa username didto sa DN form.
* Base Dn – ang default base DN nga gamiton para mangita og mga user.
* User Login Filter – ang filter nga mutugot sa pag restrict sa mga user nga naay abilidad nga mu gamit sa EspoCRM. E.g. `memberOf=cn=espoGroup,cn=espo-users,ou=users,dc=espo,dc=local`.
* Account Domain Name – Ang domain nga gamiton para sa authorization sa LDAP nga server.
* Account Domain Name Short – Ang mubo nga domain nga gamiton para sa authorization sa LDAP nga server.
* Try Username Split – ang opsyon nga mubuwag sa username ngadto sa domain.
* Opt Referrals – kung ang mga referral kay gikinahanglang i-follow ngadto padulong sa LDAP client.
* Create User in EspoCRM – ang kani nga opsyon kay mutugot sa EspoCRM nga muhimo og user gikan sa LDAP.
 * User First Name Attribute – LDAP attribute nga gamiton para mudetermina sa pangalan sa user.
 * User Last Name Attribute – LDAP attribute nga gamiton para mudetermina sa apelyedo sa user.
 * User Title Attribute – LDAP attribute nga gamiton para mudeterminal sa title sa user.
 * User Email Address Attribute – LDAP attribute nga gamiton para mudetermina sa email address sa user.
 * User Phone Number Attribute – LDAP attribute nga gamiton para mudetermina sa phone number sa user.

Karon, adto sa login nga page ug i-enter ang mga user credential.

![2](../_static/images/administration/ldap-authorization/ldap-login.png)

Ang user kay na-authenticate na ug nahimo automatically didto sa EspoCRM.

## Mga configuration instruction basi sa imohang server:
* [Active Directory server](ldap-authorization-for-ad.md)
* [OpenLDAP server](ldap-authorization-for-openldap.md)

Para dugang impormasyon bahin sa pag-configure sa LDAP, pwede nimong basahon ang [Zend\Ldap library](https://zendframework.github.io/zend-ldap/intro/) nga page, kay ang EspoCRM nigamit ani nga library.




