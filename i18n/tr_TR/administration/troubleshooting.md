# Sorun giderme

## Günlükleri Kontrol et

Sorunu bulmak için hata günlüğü dosyalarını kontrol etmeniz gerekmektedir.

#### EspoCRM Hata Günlükleri

EspoCRM günlükleri `<ESPOCRM_DIRECTORY> / logs / *. Log` bölümünde bulunur ve bazı hata bilgilerini içermektedir.

#### Apache Hata Günlükleri

Ubuntu sunucusu için bir apache hata günlüğü `/var /log /apache2 /error.log` dosyasında bulunur ve tüm hata bilgilerini içermektedir.Günlük dosyalarının konumu diğer sistemlerde farklı olabilir.

## Hata ayıklama modunu etkinleştir

Hata ayıklama modunu etkinleştirmek için, kurulu EspoCRM dizinine gidiniz, `data/config.php` dosyasını açın ve değeri değiştiriniz:

```
'logger' => [
    ...
    'level' => 'WARNING',
    ...
]
```
to
```
'logger' => [
    ...
    'level' => 'DEBUG',
    ...
]
```

## Zamanlanmış Görevler çalışmıyor

#### #1. Sorun: Crontab'ınız yapılandırılmadı

1. SSH ile sunucunuza giriş yapın.

2. Aşağıdaki adımları uygulayarak crontab'ınızı yapılandırınız:  https://www.espocrm.com/documentation/administration/server-configuration/#user-content-setup-a-crontab.

Not: Crontab web sunucusu kullanıcısı altında yapılandırılmalıdır, Örneğin, `crontab -e -u www-data`.

3. Bir süre bekleyin ve herhangi bir iş yürütülüp gerçekleştirildiğini görmek için Zamanlanmış işleri'i kontrol ediniz (bkz. Bir Günlük paneli).

#### #2. Sorun: Crontab yapılandırıldı, ancak Zamanlanmış İşler çalışmıyor

Cron çalışırken hata olmadığından emin olmak için bir terminalde cron komutunu çalıştırmayı deneyiniz:

1. SSH ile sunucunuza giriş yapınız.

2. EspoCRM'nin kurulu olduğu dizine gidiniz. Örneğin,  `/var/www/html/espocrm` dizini için komut şu şekildedir:
```bash
cd /var/www/html/espocrm
```

3. Crontab komutunu çalıştırın:

```bash
php cron.php
```

Not: Bu web sunucusu kullanıcısı altında yürütülmelidir. root olarak oturum açtıysanız, komutun olması gerekir (ör. Ubuntu için):

```bash
sudo -u www-data php cron.php
```

Nerede `www-data` bir web-sunucusu kullanıcısıdır?

4. Herhangi bir hata yoksa, herhangi bir işin yürütülüp yürütülmediğini görmek için Zamanlanmış İşler'e bakınz (bkz. Bir Günlük paneli).

## EspoCRM, güncellemeden sonra yüklenmiyor

Bu, bazen paylaşılan bazı barındırmalardan meydana gelebilir.

Dosyaların izinlerini kontrol ediniz:
/index.php
/api/v1/index.php

Bunların 644 olması gerekir. Bu dosyalardan herhangi birinin 664 iznine sahip olması durumunda dosyayı 644 olarak değiştirmeniz gerekmektedir. Barındırma kontrol panelini veya chmod komutunu kullanınız.

```
chmod 644 /path/to/file
```
Dosya izinleri hakkındaki daha fazla bilgi: [burada](server-configuration.md#required-permissions-for-unix-based-systems).
