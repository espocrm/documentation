# Uzantı Paketleri

Uzantılar, EspoCRM'ye fazladan işlevsellik eklemenizi sağlarlar. Yönetici paneli tarafından `Customization` bölümü altında kurulabilirler.

## Uzantı paketi nasıl oluşturulur?

Bir paketin dosya yapısı:

* `/manifest.json` – uzantı özellikleri içeren bir dosyadır;
* `/files` – uzantı dosyalarını içeren bir dizindir;
* `/scripts` – uzantı komut dosyalarını içerir.

### Manifest
```json
{
 "name": "Extension Name",
 "version": "1.0.0",
 "acceptableVersions": [
   ">=3.7.2"
 ],
 "releaseDate": "2015-10-15",
 "author": "Your Name",
 "description": "Description of your extension",
 "delete": []
}
```

* `version` ve `acceptableVersions` sözdizimi, http://semver.org'da bulunan v2.0.0 belirtilmesiyle tanımlanmıştır.
* `delete` - silinmesi gereken temel dosyaların listesidir.Bu parametrenin kullanılması tavsiye edilmez. Atlayabilirsiniz.

### Dosyalar

Tüm uzantı dosyaları `files` dizinine yerleştirilmelidir. EspoCRM çekirdek dizinine kopyalanırlar.

### Komut Dosyaları

Farklı amaçlar için, EspoCRM aşağıdaki komut türlerini desteklemektedir. Hepsi "scripts" dizini içerisine yerleştirilmelidir.

* `BeforeInstall.php` – bir yükleme işlemi öncesinde çalıştırılan bir komut dosyasıdır;
* `AfterInstall.php` – kurulum işlemi tamamlandıktan sonra sonlanır;
* `BeforeUninstall.php` – kaldırma işleminden önce yürütülendir;
* `AfterUninstall.php` – kaldırma işlemi tamamlandıktan sonra gerçekleştirilir.

Örnek:

```php
class AfterInstall
{
  public function run($conatiner)
  {
    $config = $conatiner->get('config');
 
    $tabList = $config->get('tabList');
    if (!in_array('My Custom Entity', $tabList)) {
      $tabList[] = 'My Custom Entity';
      $config->set('tabList', $tabList);
    }
 
    $config->save();
  }
}
```

### Paket

Sonuç olarak, tüm bu dosyaları bir .zip arşivine yerleştirmeliyiz.
