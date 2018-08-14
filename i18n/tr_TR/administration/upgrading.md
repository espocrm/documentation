# EspoCRM nasıl güncellenir?

EspoCRM, aşağıdaki adımlarla en yeni sürüme yükseltilebilir:

### 1. Adım Geçerli Sürümünüzü Kontrol Edin

Geçerli sürümünüzü kontrol etmek için Yönetim> Güncelleme sayfasına gidin.

### 2. Adım Gerekli Güncelleme Paketlerini indirin

Yükseltme sayfasına  https://www.espocrm.com/download/upgrades/ adresinden gidin ve doğru sürümünüze uygun olarak gereken paketleri indirin.

### 3. Adım Yedek oluştur (isteğe bağlı)

Yükseltmeden önce EspoCRM dosyalarınızın ve verilerinizin yedeğini oluşturun. İşlemi tamamlamak için [bu talimatları izleyin] (https://github.com/espocrm/documentation/blob/master/administration/backup-andrestrest.md).

### 4. Adım Yükseltme işlemi

Yönetim> Güncelle'ye gidin. Tek tek yükseltme paketleri yükleyin ve kurun.

Menü>Hakkında bölümünde en son sürüme sahip olup olmadığınızı kontrol edebilirsiniz.

## CLI üzerinden yükseltme

Ayrıca, komut satırı arayüzü üzerinden yükseltmeyi çalıştırabilirsiniz. Aşağıdaki komutu EspoCRM kök dizininden çalıştırmanız gerekmektedir:

```
php upgrade.php /path/to/upgrade/package.zip
```
