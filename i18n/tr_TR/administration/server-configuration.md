# EspoCRM için Sunucu Yapılandırması

EspoCRM Apache'de  ([talimatlar](apache-server-configuration.md)), Nginx'te ([talimatlar](nginx-server-configuration.md)), veya PHP sürüm 5.6 veya daha üstü ve MySQL sürüm 5.1 veya daha üstü desteklenen IIS sunucusu için kurulabilir.

## Önerilen Yapılandırmalar

### PHP Gereksinimleri

EspoCRM, aşağıdaki uzantıların etkinleştirilmiş hali ile PHP 5.6 veya üst sürümünü gerektirir:

* [PDO](http://php.net/manual/en/book.pdo.php) – PHP'de MySQL'e erişmek;
* [JSON](http://php.net/manual/en/book.json.php) – kaynaklar bu formatı kullanır (meta veriler, düzen, diller ve diğerleri);
* [GD](http://php.net/manual/en/book.image.php) – görüntüleri değiştirmek;
* [OpenSSL](http://php.net/manual/en/book.openssl.php) – en yüksek korumayı sağlamak için;
* [Zip](http://php.net/manual/en/book.zip.php) – EspoCRM sürümünü güncelleyip uzantıları yükleyebilmek;
* [IMAP](http://php.net/manual/en/book.imap.php) – EspoCRM'deki posta kutularını izlemek için;
* [mbstring](http://php.net/manual/en/book.mbstring.php);
* [cURL](http://php.net/manual/en/book.curl.php).

Ayrıca, [mailparse] (https://pecl.php.net/package/mailparse) pecl uzantısının kurulu olması önerilmektedir.E-postayı alma özelliğinin sorunsuz çalışması için gereklidir.


php.ini ayarları:

```
max_execution_time = 180
max_input_time = 180
memory_limit = 256M
post_max_size = 50M
upload_max_filesize = 50M
```


### MySQL Gereksinimleri

EspoCRM, MySQL sürüm 5.1 veya daha yeni sürümünü desteklemektedir.
Hiçbir özel özellik yoktur.Tüm varsayılan ayarlar EspoCRM için iyidir.

## Unix Tabanlı Sistemler için Gerekli İzinler

Dosyalar ve dizinler aşağıdaki izinlere sahip olmalıdır:

* `/data`, `/custom`, `/client/custom` – tüm dosyalar, dizinler ve alt dizinler (dosyalar için 664, dizinler için 775, tüm alt dizinler ve dosyalar da dahil olmak üzere) yazılabilir olmalıdır;
* `/application/Espo/Modules`, `/client/modules` – geçerli dizin de (mevcut dizin için 775, dosyalar için 644, dizinler ve alt dizinler için 755) yazılabilir olmalıdır;
* Diğer tüm dosyalar ve dizinler okunabilir olmalıdır (dosyalar için 644, dizinler için 755).

İzinleri ayarlamak için terminaldeki şu komutları çalıştırınız:

```
cd <PATH-TO-ESPOCRM-DIRECTORY>
find . -type d -exec chmod 755 {} + && find . -type f -exec chmod 644 {} +;
find data custom -type d -exec chmod 775 {} + && find data custom -type f -exec chmod 664 {} +;
```

Tüm dosyalar, web sunucusu işlemleri tarafından sahip olunmalı ve gruba ait olmalıdır."Www-data", "daemon", "apache", "www" vb. Olabilirler.
Not: Bitnami Yığınındaki, dosyaların "daemon" kullanıcısı tarafından sahibi olunduğu ve gruba ait olması gerekir.
Not: Paylaşılan ana makinelerdeki dosyalar kullanıcı hesabınıza ait ve gruba ait olmalıdır.

Sahibi ve grup sahibini ayarlamak için terminaldeki şu komutları çalıştırın:

```
cd <PATH-TO-ESPOCRM-DIRECTORY>
chown -R <OWNER>:<GROUP-OWNER> .;
```

## Bir crontab kurulumu

Bir UNIX sisteminde bir crontab kurmak için aşağıdaki adımları izleyiniz:

* 1. EspoCRM örneğinize yönetici olarak giriş yapınız.
* 2. Yönetici panelindeki Zamanlanmış İşler bölümüne gidiniz (Menü>Yönetim>Zamanlanmış İşler) ve crontab için dizeyi kopyalayınız. Bu şuna benzemektedir:
```
* * * * * /usr/bin/php -f /var/www/html/espocrm/cron.php > /dev/null 2>&1
```
* 3. Bir terminal açın ve şu komutu çalıştırınız:
```
crontab -e -u WEBSERVER_USER
```
WEBSERVER_USER  "www", "www-data", "apache" vb. Oolabilir(web sunucunuza bağlıdır).
* 4. Kopyaladığınız dizeyi (2. adımdan) yapıştırın ve crontab dosyasını (nano düzenleyici için Ctrl + O, ardından Ctrl + X) kaydediniz.

## Sunucunuza dayalı yapılandırma talimatları:

* [Apache sunucu yapılandırması](apache-server-configuration.md).
* [Nginx sunucu yapılandırması](nginx-server-configuration.md).
