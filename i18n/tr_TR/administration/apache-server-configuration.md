# EspoCRM için Apache sunucu yapılandırması

Bu talimatlar [Sunucu Yapılandırması](server-configuration.md) klavuzuna tamamlayıcıdır. Burada listelenen tüm yapılandırma ayarlarının Ubuntu sunucusunda yapıldığını lütfen unutmayın.

## PHP gereksinimleri

Gerekli tüm kütüphaneleri yüklemek için bu komutları bir terminalde çalıştırın:

```
sudo apt-get update
sudo apt-get install php-mysql php-json php-gd php-mcrypt php-zip php-imap php-mbstring php-curl
sudo phpenmod mcrypt imap mbstring
sudo service apache2 restart
```

## API Hatası: EspoCRM API'sı kullanılamıyor sorunu giderildi:

Gerekli adımları yapın. Her adımda sorunun çözülüp çözülmediğini kontrol edin.

### 1. Apache'de "mod_rewrite" desteğini etkinleştirin 

"mod_rewrite" işlevini etkinleştirmek için bu komutları bir terminalde çalıştırın:

```
sudo a2enmod rewrite
sudo service apache2 restart
```

### 2. .htaccess desteğini etkinleştirin

.htaccess desteğini etkinleştirmek için, ekle/düzelt Sunucu Yapılandırma Ayarları /etc/apache2/sites-available/ESPO_VIRTUAL_HOST.conf ya da /etc/apache2/apache2.conf (/etc/httpd/conf/httpd.conf):

```
<Directory /PATH_TO_ESPO/>
AllowOverride All
</Directory>
```

Daha sonra, bu komutu bir terminalde çalıştırın:

```
sudo service apache2 restart
```

### 3. RewriteBase yolunu ekleyin

/ESPOCRM_DIRECTORY/api/v1/.htaccess dosyasını açın ve aşağıdaki satırı değiştirin:

```
# RewriteBase /
```

ile

```
RewriteBase /REQUEST_URI/api/v1/
```

REQUEST_URI, URL'nin bir parçasıdır; ör: "http://example.com/espocrm/" için REQUEST_URI "espocrm" dur.


## HTTP YETKİLENDİRME desteğini etkinleştir (sadece FastCGI için).

FastCGI varsayılan olarak HTTP YETKİLENDİRME'yi desteklemez. FastCGI kullanıyorsanız, aşağıdaki kodu ekleyerek VirtualHost veya /etc/apache2/apache2.conf dosyanızda (httpd.conf) etkinleştirmeniz gerekir:

Fcgid modülü için:

```
<IfModule mod_fcgid.c>
  FcgidPassHeader Authorization
  FcgidPassHeader Proxy-Authorization
  FcgidPassHeader HTTP_AUTHORIZATION  
</IfModule>
```

FastCgi modülü için:

```
<IfModule mod_fastcgi.c>
   FastCgiConfig -pass-header Authorization \
                        -pass-header Proxy-Authorization \
                        -pass-header HTTP_AUTHORIZATION  
</IfModule>
```

Hangi modülün şuanda kullanıldığını kontrol etmek için bu komutu çalıştırın ve modülü bulun:

```
apache2ctl -M
```
