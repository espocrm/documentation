# Kurulum

### Gereksinimler
EspoCRM çoğu hosting sağlayıcıda çalışır. Gereksinimler aşağıdakileri içerir:

* PHP 5.6 veya PHP'nin pdo, json, GD library, mcrypt uzantıları (genellikle varsayılan olarak etkin) ile etkinleştirilmiş son sürümü;
* MySQL 5.5.3 veya daha yükseği.

Daha fazla bilgi için [Server Configuration](server-configuration.md) makalesine bakın.

### 1. EspoCRM kurulum paketini indir
EspoCRM'in son sürümünü edinmek için [download page](http://www.espocrm.com/download/) linkini takip edin.

### 2. EspoCRM Dosyalarını Sunucunuza Yükleyin

İndirme biter bitmez, paketi web sunucunuza yükleyin.
Yüklemek için SSH, FTP veya hosting yönetim panelini kullanabilirsiniz. 
Arşivi genel web sunucu dizininize çıkarın (Örn., `public_html`, `www`, vs.). 

_Not: FTP için, web sunucunuza yüklemeden önce arşivi çıkarmalısınız.._ 

### 3. EspoCRM için kullanılacak bir MySQL Veritabanı oluşturun 

Hosting yönetim panelinize veya SSH'e gidin ve EspoCRM için yeni bir veritabanı ve kullanıcı oluşturun (örn, cPanel'de `MySQL Databases`).

### 4. EspoCRM kurulum ilerlemesini çalıştırın 

Şimdi web tarayıcınızı açın ve EspoCRM dosyalarının olduğu URL'ye gidin (örn, `http://yourdomain.com/espo`).

Bu ekranı görüyotsanız, bir "Erişim reddedildi" hatanız var.
Yani, SSH aracılığıyla terminaldeki görüntülenen komutu uygulamalısınız veya doğru izin ayarlamalısınız.
Dizinler için 755, dosyalar için 644 ve `data` dizini için 775 olmalıdır.
Ayrıca doğru _owner_ ve _group_'unuz olduğuna emin olun.

![1](https://raw.githubusercontent.com/espocrm/documentation/master/_static/images/administration/installation/1.png)

Aşağıdaki ekranı görüyorsanız, izin doğrudur ve EspoCRM kurulumunu başlatabilirsiniz.

![2](https://raw.githubusercontent.com/espocrm/documentation/master/_static/images/administration/installation/2.png)

Bu sayfada, Lisans Anlaşması'nı okuyup kabul edebilirsiniz.

![3](https://raw.githubusercontent.com/espocrm/documentation/master/_static/images/administration/installation/3.png)

Yeni oluşturduğunuz MySQL veritabanı detaylarını girin. 

![4](https://raw.githubusercontent.com/espocrm/documentation/master/_static/images/administration/installation/4.png)

Yönetim EspoCRM'in kullanıcı adı ve şifresini girin.

![5](https://raw.githubusercontent.com/espocrm/documentation/master/_static/images/administration/installation/5.png)
 
Bu sayfada tarih ve zaman biçimi, zaman dilimi, para birimi ve diğerleri gibi EspoCRM'in varsayılan ayarlarını ayarlayabilirsiniz.

![6](https://raw.githubusercontent.com/espocrm/documentation/master/_static/images/administration/installation/6.png)

Emailler gönderebilmek istiyorsanız, giden emailler için SMTP ayarlarını girin.
_Next_ butonuna tıklayarak bu adım geçilebilir. 
Bu seçeneklerin tümü kurulumdan sonra EspoCRM'de eklenebilir/değiştirilebilir.

![7](https://raw.githubusercontent.com/espocrm/documentation/master/_static/images/administration/installation/7.png)

Tebrikler! Kurulum tamamlandı. 
Zamanlanmış Görevlerin sisteminiz tarafından çalışır olmasını kurmak için son şey. Linux cli'da ve Windows sistemlerde  _Windows Tasks Scheduler_'de `crontab -e` çalışarak yapılabilir.

![8](https://raw.githubusercontent.com/espocrm/documentation/master/_static/images/administration/installation/8.png)

EspoCRM'de çalışmaktan keyif alacağınızı umuyoruz.








