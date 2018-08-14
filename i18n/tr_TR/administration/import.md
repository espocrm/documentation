# İçeri Aktarmak

İçeri veri aktarma yalnızca yönetici kullanıcıları tarafından erişilebilir. Yönetim>İçe Aktar. Yalnızca CSV dosyalarından içe aktarabilirsiniz.

## 1. Adım

İhtiyacınız olan gereken kayıt türünü seçin (Varlık Türü alanı).
Bir CSV dosyası seçin. Bir dosya, `UTF-8` formatı ile biçimlendirilmelidir.
`Ne yapacaksınız?`ı seçin. Mevcut seçenekler: 'Yalnızca Oluştur', 'Oluştur ve Güncelle', 'Sadece Güncelle'.

* `Sadece Oluştur` - kaydı sadece yaratmak istiyorsanız seçiniz.
* `Oluştur & Güncelle`- kayıtlar oluşturulur, ancak eşleşen alan değerlerine sahip kayıtlar bulunursa değiştirilir._2. Adım_'da hangi alanların eşleşeceğini kontrol edebileceksiniz.
* `Sadece güncelle` - eşleşen alan değerlerine sahip kayıtlar güncellenecektir.

Bir CSV dosyasını seçtikten sonra Önizleme panelinde nasıl ayrıştırılacağını görebilirsiniz.Özelliklerini güncellediğinizde önizleme değişecektir.


* `Başlık Satırı`- CSV dosyasının alan adlarına sahip ilk satıra sahip olup olmadığını.
* `Boşta çalıştır`- içeri aktarılacak büyük bir kayıt grubunuz varsa önerilir. Aktarım, cron üzerinden işlenecektir. İçe aktarma işlemi tamamlandığında durum 'Tamamlandı' olarak ayarlanacaktır.
* `Kopyalama için aramayı geçmek` - içeri aktarım çalışma süresini azaltacaktır.


_ 2. Adım_ işlemine geçmek için _Next_ düğmesini tıklayın.

![1](https://raw.githubusercontent.com/espocrm/documentation/master/_static/images/administration/import/step-1.png)

## 2. Adım

Alan eşlemesini ayarlayın: alanların CSV dosyasının sütunlarına nasıl karşılık geldiğini belirleyin. Burada gerekli olmayan sütunları atlayabilirsiniz.'Oluştur & Güncelle' ve 'Sadece güncelle' durumlarında, güncellenecek kayıtların bulunup bulunmadığını kontrol etmeniz gerekmektedir.Yeni ve güncellenmiş kayıtlardan ayarlanmasını istediğiniz varsayılan değerleri ekleyiniz. Örneğin. Atanmış Kullanıcı veya Ekip alanları belirtebilirsiniz.

İçe aktarma işlemi tamamlandıktan sonra oluşturulan kayıtları geri alabilir, kopyalayabilir ve güncellenmiş kayıtları görebilirsiniz.Kopyalanan, sistemde benzer kayıt olduğu anlamına gelir.İçe aktarılan tüm kopyaları aynı anda kaldırabilirsiniz.Not: Geri çevirmek, güncellenmiş kayıtlarla çalışmaz.

Devam etmek için _Run Import_ düğmesine tıklayın. İçe aktarma işlemi bitmeden biraz zaman alabilir. Bir sürü kayıt ithal etmek istiyorsanız (sunucu yapılandırmasına bağlı, genellikle 200'den fazla kayıt varsa), php parametresinin `set_time_limit` yeterince büyük olduğundan emin olmanız gerekir.

![2](https://raw.githubusercontent.com/espocrm/documentation/master/_static/images/administration/import/step-2.png)

## Hedef Listeye nasıl aktarılır?

Kişileri, Rehberleri veya Hesapları içe aktardığınızda bunları bazı hedef listelerine ekleyebilirsiniz. 2. Adım'da 'Varsayılan Değerler' paneline Hedef Liste alanını eklemeniz ve gerekli bir hedef liste kaydını seçmeniz gerekmektedir. Var olan hedefleri bir hedef listesine eklemek için 'Sadece güncelle' veya 'Oluştur ve Güncelle' işlemini kullanabilirsiniz.
