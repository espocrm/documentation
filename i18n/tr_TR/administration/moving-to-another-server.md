# EspoCRM'yi başka bir sunucuya taşımak

EspoCRM'yi başka bir sunucuya taşımak için şu adımları izleyiniz:

### 1. Adım Dosyaları Yedekleyiniz

EspoCRM dizininden mevcut tüm dosyaları arşivlemek için dosya yöneticisini açın veya SSH ile giriş yapın. Daha fazla detay: https://github.com/espocrm/documentation/blob/master/administration/backup-and-restore.md#step-1-backup-files.

### 2. Adım Veritabanını Yedekleyiniz

Veritabanında saklanan veriler (MySQL, MariaDB) yedeklenmelidir. Lütfen bu öneriyi uygulayın: https://github.com/espocrm/documentation/blob/master/administration/backup-and-restore.md#step-2-backup-database.

### 3. Adım Dosyaların ve veritabanının yedeklerini başka bir sunucuya kopyalayınız

Dosyaların ve veritabanınızın yedeklerini yeni bir sunucuya kopyalayınız.

### 4. Adım Yedeklenmiş dosyala arşivden çıkartınız

Yedeklenmi dosyaların arşivden çıkartılması için Arşiv Yöneticisini veya şu talimatları kullanabilirsiniz: https://github.com/espocrm/documentation/blob/master/administration/backup-and-restore.md#step-1-unarchive-backup-files. 
Not: Dosyaların web sunucusu dizinine yerleştirilmesi gerekmektedir.

### 5. Adım Bir Sunucu yapılanrınız

Buradaki önerilere dayanan yeni bir sunucu yapılandırınız: https://www.espocrm.com/documentation/administration/server-configuration/.

### 6. Adım Uygun İzinler

Gerekli izinleri ve dosya sahiplerini ayarlayınız, https://www.espocrm.com/documentation/administration/server-configuration/#user-content-required-permissions-for-unix-based-systems.

### 7. Adım Veritabanı yedeklerinizi içe aktarınız


Öncelikle, MySQL'de bir kullanıcıyla yeni bir veritabanı oluşturmanız geremektedir. Veritabanınızı yedeklerini içeri aktarmak için aşağıdaki talimatları uygulayınız: https://github.com/espocrm/documentation/blob/master/administration/backup-and-restore.md#step-3-import-database-dump.

### 8. Adım Uygun EspoCRM yapılandırmaları

Sunucuyu başarılı bir şekilde içe aktardıktan ve yapılandırdıktan sonra, `ESPOCRM_DIRECTORY/data/config.php` dosyasındaki EspoCRM yapılandırmalarını düzeltiniz:

 * veritabanı bağlantı ayarları:
  
  ```php
  'database' => [
        'driver' => 'pdo_mysql',
        'dbname' => 'YOUR_DATABASE_NAME',
        'user' => 'YOUR_USER',
        'password' => 'YOUR_DATABASE_PASSWORD',
        'host' => 'localhost',
        'port' => ''
    ],
  ```
   
   * "siteUrl" - Eğer alan adınız (URL) değiştirilirse:


  ```php
  'siteUrl' => 'https://new-link.com',
  ```
  
  * varsayılan dosya sahipleri (sadece farklıysa):
  
  ```php
  'defaultPermissions' => [
        'user' => 'www-data',
        'group' => 'www-data'
    ]
  ```

  Neredeki 'www-data' web sunucusu kullanıcısıdır?


### 9. Adım bir crontab kurulumu

Bir crontab kurulumu için, https://www.espocrm.com/documentation/administration/server-configuration/#user-content-setup-a-crontab.
Not: web-sunucu kullanıcısı altında yapılandırılmalıdır.

Hepsi bu kadar. Şimdi, EspoCRM örneğiniz yeni bir sunucuda çalışıyor.
