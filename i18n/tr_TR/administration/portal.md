# Portal

Portal, müşterileri ve ortakları için belirli CRM verisine ve işlevlerine erişme olanağı sağlar. Yönetici, birden fazla portal oluşturabilir. Her portal kendi ayarlarına, kumanda paneline, kullanıcı listesine, erişim kontrolü ayarlarına sahip olabilir.

Portal oluşturmak için, Yönetim> Portallar'ı takip edin, Portal Oluştur butonuna tıklayınız.

* `Is Active`. Değilse portal kimseye açık olmayacaktır.
* `Is Default`. Bu, portalın daha kısa bir URL ile kullanıma sunulacağı anlamına gelir: http (s): // YOUR_ESPO_URL/portal..
* `Roles`. Portala giriş yapan kullanıcılara uygulanacak bir veya birden fazla portal rolünü belirtiniz. Portal rolleri hakkında daha fazla bilgi aşağıda bulabilirsiniz.
* `Tab List`. Navigasyon çubuğunda gösterilecek sekmeler.
* `Dashboard Layout`. Portalın giriş sayfasında görüntülenen dashletleri belirtiniz. Portal kullanıcılarının gösterge tablosunu yapılandıramayacağını unutmayınız.
* `URL`. Portala erişebileceğiniz bağlantıyı gösteren sadece okunabilen alandır.


## Portal Kullanıcıları

Yöneticiler portal kullanıcıları oluşturabilir.

1. Yönetim>Kullanıcılar.
2. Kullanıcı Oluştur'un yanındaki sağ açılır menüye tıklayınız.
3. Portal Kullanıcısı Oluştur'a tıklayınız.
4. Portal kullanıcısı ile iletişim kuracak olan bağlantıyı seçiniz.
5. Formu doldurun ve Kaydet'e tıklayınız.

Portal kullanıcısı, o portala erişebilmek için Portal kaydına bağlanmalıdır.

## Portal Rolleri

Portal rolleri, EspoCRM'deki normal rollere benzer ancak birkaç farklılığa sahiptir.

* `not-set` seviyesinde bir erişimi reddeder.
* `own` seviyesi, kayıtların kullanıcı tarafından oluşturulduğu anlamına gelir. Örneğin. portal kullanıcısı bazı durumlara katlandı ve bu durum, bu kullanıcıya aittir.
* `account` düzeyinde kayıt, portal kullanıcısının ilişkili olduğu hesaba bağlı olduğu anlamına gelir.
* `contact` seviyesi, kayıtların portal kullanıcısının ilgili bulunduğu kişiyle ilişkili olduğu anlamına gelir.

Atanan Kullanıcının ve Takımların alanları, portal kullanıcıları için yalnızca okunurdur.

### Örnek

`Portal kullanıcıları, durumlar oluşturabilir, hesaplarıyla ilgili durumları görebilir; bilgi tabanını görebilmelidirler.`

1. Portal Rolü Oluşturma formunu açınız (Yönetim> Portal Rolleri> Rol Oluştur).
2. Durumlar'a erişimi etkinleştirin, ayarlayınız: `create - yes, read - account, edit - no, delete - no, stream - account`.
3. Bilgi Tabanına erişimi etkinleştirin, ayarlayınız: `create - no, read - account, edit - no, delete - no`.
4. Portal kaydınızı düzenleyiniz (Yönetim> Portallar). Roller alanında portal rolünü seçiniz ve sonra kaydediniz.


## Portal'a Erişim

Portal kayıtınızın 'URL' alanında portalınızdaki URL'yi bulabilirsiniz. Ayrıca farklı URL'ler ile erişebilmek için sunucu yapılandırma araçlarını da (mod_rewrite gibi) kullanmak mümkündür. Bu durumda, 'Özel URL' alanını doldurmanız gerekmektedir.

### Apache sunucusu için Özel URL ile portala erişim

Özel URL: my-portal-host-name.com.

#### crm.portal.conf
```
<VirtualHost *:80>
	DocumentRoot /path/to/espocrm/instance/
	ServerName my-portal-host-name.com

    <Directory /path/to/espocrm/instance/>
        Options Indexes FollowSymLinks
        AllowOverride All
        Order allow,deny
        allow from all
    </Directory>

	ErrorLog ${APACHE_LOG_DIR}/error.log
	CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>

ServerAlias my-portal-host-name.com

```

#### Mod yeniden yazma kuralları

`{PORTAL_ID}` yerinde portal kayıt kimliğini belirtiniz. Portal kaydı kimliğini, portal kaydının ayrıntılı görünümünü açtığınızda web tarayıcınızın adres çubuğunda kullanılabilirdir. Gibi: https://my-espocrm-url.com/#Portal/16b9hm41c069e6j24. 16b9hm41c069e6j24 bir portal kaydı kimliğidir.

```
  RewriteCond %{HTTP_HOST} ^portal-host-name.com$
  RewriteRule ^client - [L]

  RewriteCond %{HTTP_HOST} ^portal-host-name.com$
  RewriteCond %{REQUEST_URI} !^/portal/{PORTAL_ID}/.*$
  RewriteRule ^(.*)$ /portal/{PORTAL_ID}/$1 [L]
```
