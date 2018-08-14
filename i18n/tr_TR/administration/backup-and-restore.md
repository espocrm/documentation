# Yedekleme ve Geri Yükleme

## Nasıl EspoCRM'yi manuel olarak yedeklemerim? 

EspoCRM, dosyalar ve veritabanı verilerini içerir.Tüm bu veriler, EspoCRM'nin tam bir yedek kopyasını oluşturmak için gereklidir. Burada Ubuntu sunucusunda MySQL ile nasıl yapılacağına dair talimatlar var.

### 1. Adım Dosyaları Yedekleme

Yüklü EspoCRM'nin dizin içeriğinin bir arşivini oluşturun. Ubuntu için varsayılan yol `/var/www/html`'dir. Bu komutu kullanabilirsiniz.

```bash
tar -czf "files.tar.gz" -C /var/www/html .
```

### 2. Adım Veritabanı Yedekleme

Tüm verilerinizi yedeklemek için, veritabanı adını ve erişim kimlik bilgilerini bilmeniz gerekmektedir. Veritabanı adını `database` bölümündeki  `/ESPOCRM_DIRECTORY/data/config.php` yapılandırma dosyasında bulabilirsiniz. Veritabanınızı yedeklemek için bu komutu kullanabilirsiniz:

```bash
mysqldump --user=YOUR_USER --password=YOUR_PASSWORD YOUR_DATABASE_NAME > "db.sql"
```

### 3. Adım Yedeklemeyi Kopyalamak 

Hepsi bu kadar. Şimdi oluşturulan yedeklemeyi güvenli bir yere kopyalamanız gerekiyor.

## EspoCRM bir script ile nasıl yedeklerim?

Gerekli tüm verileri yedeklemek için bir komut dizini kullanabilirsiniz. SSH ile giriş yapın ve komutları çalıştırın (Ubuntu sunucusunda test edilmiştir).

### Komut Dosyasını İndir

```bash
wget https://raw.githubusercontent.com/espocrm/documentation/master/_static/scripts/backup.sh
```

### Komut Dosyasını Çalıştır

```bash
bash ./backup.sh PATH_TO_ESPOCRM BACKUP_PATH
```
nerede:
 * `PATH_TO_ESPOCRM` kurulu EspoCRM dizininin bir yoludur.
 * `BACKUP_PATH` yedekleme dizininin bir yoludur.

Ubuntu sunucusu için:

```bash
bash ./backup.sh /var/www/html /opt/backups
```

Not: MySQL kullanıcınız veritabanınızı boşaltmak için gerekli haklara sahip değilse, başka bir MySQL kullanıcısının kimlik bilgilerini girmeniz istenecektir.

Başarılı oluşturmadan sonra, oluşturulan yedekleme yolunu edininiz.

## EspoCRM'yi yedekten geri yükleme

EspoCRM'yi, yukarıda açıklandığı gibi oluşturulan yedeklemeden geri yükleyebilirsiniz.

### 1. Adım Yedek Dosyalarını arşivden çıkartma

Dosyaları arşivden çıkartman için Arşiv Yöneticisi'ni kullanabilir veya aşağıdaki komutu çalıştırabilirsiniz. Dosyaların Web sunucusu dizinine yerleştirilmesi gerekir.

```bash
tar -xzf "files.tar.gz" -C /var/www/html
```
nerede:
 * `/var/www/html` bir web sunucusu yoludur.

### 2. Adım Gerekli İzinleri Ayarlamak

Dosyaların bir web sunucusu kullanıcısına ait olması ve doğru izinlere sahip olması gerekir. Lütfen şu talimatları izleyerek gerekli izinleri ayarlayın: [www.espocrm.com/documentation/administration/server-configuration/#user-content-required-permissions-for-unix-based-systems](https://www.espocrm.com/documentation/administration/server-configuration/#user-content-required-permissions-for-unix-based-systems).

### 3. Adım Veritabanı Dökümünü Almak

Veritabanı dökümü aynı kullanıcı kimlik bilgileriyle veritabanına alınmalıdır, aksi halde düzeltme yapılandırma `ESPOCRM_DIRECTORY/data/config.php` dosyasında yapılmalıdır. Veritabanınızın dökümlerini almak için, bir terminalde aşağıdaki komutu çalıştırın:

```bash
mysql --user=YOUR_DATABASE_USER --password=YOUR_DATABASE_PASSWORD YOUR_DATABASE_NAME < db.sql
```

### 4. Adım Crontabı kontrol etmek/yapılandırmak

Crontab'ınızın düzgün yapılandırıldığını kontrol ediniz. Aşağıdaki komutu çalıştırın ve EspoCRM'ye giden yolun doğru olup olmadığını kontrol edin:

```bash
sudo crontab -l -u www-data
```
nerede:
 * `www-data` is your web-server user.

Herhangi bir değişiklik yapmanız gerekiyorsa şu komutu kullanın:

```bash
sudo crontab -l -u www-data
```

Crontab'ı EspoCRM için yapılandırmayla ilgili daha fazla ayrıntı burada açıklanmaktadır[www.espocrm.com/documentation/administration/server-configuration/#user-content-setup-a-crontab](https://www.espocrm.com/documentation/administration/server-configuration/#user-content-setup-a-crontab).

