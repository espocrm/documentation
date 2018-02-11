# LDAP Yetkilendirme

Bu kılavuzda, EspoCRM için LDAP yetkilendirmesinin nasıl yapılandırılacağını göstereceğiz. Hadi başlayalım.

LDAP sunucunuza gidiniz ve EspoCRM kullanıcıları için bir temel DN oluşturunuz.

```
cn=espo-users,ou=users,dc=espo,dc=local
```

Kullanıcıların DN'lerine ("c =espo-users, ou=users, dc=espo, dc=local") erişebilecek bir sistem kullanıcısı yaratmak zorundayız. SYani, bu sistem kullanıcısı için tam DN olacakır.
```
cn=LDAP User,cn=espo-users,ou=users,dc=espo,dc=local
```
Şimdi, EspoCRM'ye erişmek için LDAP kullanıcısı ekleyebiliriz. Örneğin. "Cn = espo-users, ou = users, dc = espo, dc = local" DN içinde "tester" kullanıcı adıyla Espo Tester'dir. Lütfen dikkat edin: Bu giriş biçimini EspoCRM için kullanabilmek için "Kullanıcı Adı Özelliği" ve "Temel DN" seçeneklerini belirtmeniz gerekmektedir.

Ardından, Yönetici panelinde EspoCRM Kimlik Doğrulaması ayarlarına gidini<, `LDAP` yöntemini seçin ve LDAP ayrıntılarını giriniz:

![1](../_static/images/administration/ldap-authorization/ldap-configuration.png)

* Host – LDAP IP veya ana makine adı.
* Port – bağlantı noktası.
* Auth – LDAP sunucusuna erişim için kimlik bilgileri:
 * Full User DN – diğer kullanıcıları aramaya izin veren tam sistem kullanıcı DN'sidir.
 * Password – LDAP sunucusuna erişmek için kullanılan paroladır.
* Security – SSL veya TLS protokolü.
* Username Attribute – kullanıcıyı belirten özellik. Aktif Dizin için "userPrincipalName" veya "sAMAccountName" olabilir.
* Account Canonical Form – hesap kanonik formunuzun türü. 4 seçenek vardır:
 * Dn – formattaki form `CN=tester,CN=Espocrm,DC=company,DC=com`.
 * Username – formu `tester`.
 * Backslash – formu `COMPANY\tester`.
 * Principal – formu `tester@company.com`.
* Bind Requires Dn – formatı istiyorsanız DN kullanıcı adını oluşturunuz.
* Base Dn – Kullanıcıları aramak için kullanılan varsayılan taban DN'si.
* User Login Filter – EspoCRM'yi kullanabilen kullanıcıları kısıtlamaya izin veren filtredir.Örneğin, `memberOf=cn=espoGroup,cn=espo-users,ou=users,dc=espo,dc=local`.
* Account Domain Name – LDAP sunucusunun yetkilendirilmesi için kullanılan etki alanıdır.
* Account Domain Name Short – LDAP sunucusunun yetkilendirilmesi için kullanılan kısa alandır.
* Try Username Split – bir kullanıcı adını, alan adıyla bölme seçeneğidir.
* Opt Referrals – Eğer yönlendirmelerde LDAP istemcisinin izlenmesi gerekiyorsa.
* Create User in EspoCRM – bu seçenek EspoCRM'nin LDAP'den bir kullanıcı oluşturmasına izin vermektedir.
 * User First Name Attribute – Kullanıcının ilk adını belirlemek için kullanılan LDAP özniteliğidir.
 * User Last Name Attribute – Kullanıcının soyadını belirlemek için kullanılan LDAP özniteliğidir.
 * User Title Attribute – Kullanıcının ünvanını belirlemek için kullanılan LDAP özniteliğidir.
 * User Email Address Attribute – Kullanıcının e-posta adresini belirlemek için kullanılan LDAP özniteliğidir.
 * User Phone Number Attribute – Kullanıcının telefon numarasını belirlemek için kullanılan LDAP özniteliğidir.

Şimdi, giriş sayfasına gidin ve kullanıcı kimlik bilgilerinizi giriniz.

![2](../_static/images/administration/ldap-authorization/ldap-login.png)

Kullanıcı kimliği doğrulanmış ve otomatik olarak EspoCRM'de oluşturulmuştur.

##Sunucunuza dayalı yapılandırma talimatları:
* [Aktif Server Dizini](ldap-authorization-for-ad.md)
* [OpenLDAP server](ldap-authorization-for-openldap.md)

EspoCRM'nin bu kütüphaneyi kullandığı için [Zend \ Ldap kütüphanesinde] (https://zendframework.github.io/zend-ldap/intro/) sayfasında okuyabileceğiniz LDAP yapılandırması hakkında daha fazla bilgi bulunur.



