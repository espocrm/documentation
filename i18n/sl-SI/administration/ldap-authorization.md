# LDAP avtorizacija

V tem razdelku bomo pokazali, kako skonfigurirati LDAP avtorizacijo za EspoCRM. Pa pričnimo!

Pojdite na vaš LDAP strežnik in ustvarite osnovni DN za uporabnike EspoCRM, na primer
```
cn=espo-users,ou=users,dc=espo,dc=local
```

Ustvariti moramo sistemskega uporabnika, ki bo imel dostop do DN uporabnikov (“cn=espo-users,ou=users,dc=espo,dc=local”). Potemtakem bo polni DN za tega sistemskega uporabnika
```
cn=LDAP User,cn=espo-users,ou=users,dc=espo,dc=local
```
Zdaj lahko dodamo LDAP uporabnika, da bo dostopal do EspoCRM. Na primer, Espo Tester z uporabniškim imenom “tester” znotraj “cn=espo-users,ou=users,dc=espo,dc=local” DN. Prosimo, upoštevajte: da boste lahko uporabljali to obliko prijave za EspoCRM, morate izbrati možnosti “Atribut uporabniško ime“ in “Osnovni DN“.

Nato pojdite na nastavitve avtentikacije (overitve) EspoCRM v administracijskem panelu, izberite način `LDAP` in izpolnite podrobnosti glede LDAP:

![1](../_static/images/administration/ldap-authorization/ldap-configuration.png)

* Gostitelj – LDAP IP ali ime gostitelja.
* Vrata – vrata povezave.
* Auth – dostopne pravice za LDAP strežnik:
 * Polni DN uporabnika – polni sistemski DN uporabnika, ki omogoča iskanje drugih uporabnikov.
 * Geslo – geslo za dostop do LDAP strežnika.
* Varnost – SSL ali TSL protokol.
* Atribut uporabniško ime – atribut, ki določa uporabnika. Za Active Directory je lahko “userPrincipalName” ali “sAMAccountName”.
* Pristna oblika računa – tip vaše pristne oblike računa. Obstajajo 4 možnosti:
 * Dn – oblika `CN=tester,CN=Espocrm,DC=company,DC=com`.
 * Uporabniško ime – oblika `tester`.
 * Leva poševnica – oblika `COMPANY\tester`.
 * Glavno ime – oblika `tester@company.com`.
* Povezovanje zahteva DN – če je potrebno uporabniško ime predstaviti v DN obliki.
* Osnovni DN – privzeti osnovni DN, ki se uporablja za iskanje uporabnikov.
* Filter prijave uporabnikov – filter, s katerim se lahko omeji uporabnike, ki lahko uporabljajo EspoCRM. Na primer, `memberOf=cn=espoGroup,cn=espo-users,ou=users,dc=espo,dc=local`.
* Domensko ime računa – Domena, ki se uporablja za avtorizacijo LDAP strežnika.
* Kratko domensko ime računa – Kratko ime domene, ki se uporablja za avtorizacijo LDAP strežnika.
* Poskusi razdeliti uporabniško ime – možnost razdelitve uporabniškega imena z domeno.
* Možnost napotitve – ali so možne napotitve do LDAP odjemalca.
* Ustvari uporabnika v EspoCRM – ta možnost omogoča ustvaritev EspoCRM uporabnika iz LDAP.
 * Atribut ime uporabnika – LDAP atribut, ki se uporablja za določitev imena uporabnika.
 * Atribut priimek uporabnika – LDAP atribut, ki se uporablja za določitev priimka uporabnika.
 * Atribute naziv uporabnika – LDAP atribut, ki se uporablja za določitev naziva uporabnika.
 * Atribut e-poštni naslov uporabnika – LDAP atribut, ki se uporablja za določitev e-poštnega naslova uporabnika.
 * Atribut telefonska številka uporabnika – LDAP atribut, ki se uporablja za določitev telefonskega številke uporabnika.

Zdaj pa pojdite na prijavno stran ter vpišite uporabniško ime in geslo.

![2](../_static/images/administration/ldap-authorization/ldap-login.png)

Uporabnik je bil avtenticiran (overjen) in samodejno ustvarjen v EspoCRM.

##Navodila za konfiguracijo glede na vaš strežnik:
* [Active Directory strežnik](ldap-authorization-for-ad.md)
* [OpenLDAP strežnik](ldap-authorization-for-openldap.md)

Več informacij glede konfiguriranja LDAP lahko najdete na strani [Zend\Ldap library](https://zendframework.github.io/zend-ldap/intro/), saj EspoCRM uporablja to knjižnico.
