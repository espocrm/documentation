# Varlık Yöneticisi

Varlık Yöneticisi, Yönetici panelinde kullanılabilir. EspoCRM örneğini iyi derecede özelleştirmek için bir olanak sağlar. Aşağıdakileri yapabilirsiniz:

* Yeni varlık türlerini ekleyin.
* Varlık türlerini özelleştirin: etiketleri değiştirin, liste görünümünde varsayılan sıralama, akışı etkinleştirin veya devre dışı bırakın.
* Alanları yapılandırın: yeni alan ekleyin, mevcut alanları özelleştirin.
* İlişkileri yapılandırın: yeni ekleyin, mevcut olanların etiketlerini değiştirin.

## Yeni varlık oluşturmak

Varlık Yöneticisi sayfasındaki 'Varlık Yarat' düğmesini tıklayın. Adını, etiketlerini ve türünü belirtin. Eğer 'Kişi' türünü seçerseniz, varlığınız E-posta, Telefon, İsim, Soyisim ve Selamlaşma alanlarına sahip olacaktır. Varlığınızın akış paneli olmasını ve kullanıcıların bu tür varlıkları takip etmesini istiyorsanız "Akış"'ı kontrol edin.


Türler:

* Taban - Sadece isim, atanmış kullanıcı, takımlar, açıklamalar gibi temel alanlar içeren boş varlıklar.
* Taban Artı - Tabana benzer ancak Aktiviteler, Geçmiş ve Görevler panelleriyle birlikte. (4.3.0'dan itibaren kullanılabilir).
* Etkinlik - Başlangıç Tarihi, Bitiş Tarihi, Süre, Ebeveyn, Durum alanlarıdır.Takvim ve Etkinlikler panelinde mevcuttur (4.3.0'dan bu yana, Yönetim> Ayarlar'da etkinleştirilmelidir).
* Kişi - E-posta, Telefon, Adı, Soyadı, Selamlama, Adres alanlarını. Etkinlikler, Tarihçe, Görevler panellerini barındırır.
* Şirket - E-posta, Telefon, Fatura Adresi, Nakliye Adresi alanlarını. Etkinlikler, Tarihçe, Görevler panellerini barındırır.

## Mevcut varlığı güncelle

Belli bir varlık üzerinde `Düzenle` bağlantısını tıklarsanız, o varlığın bazı parametrelerini değiştirebileceksiniz.

* Etiketler - varlığın tekil ve çoğul adı..
* Varsayılan sipariş kayıtları liste görünümlerine göre sıralanır.
* Akış - Akış özelliğinin bu varlık için etkinleştirilip etkinleştirilmediği.
* Devre dışı - sisteminizde bu öğeye ihtiyacınız yok ise kontrol edin.
* Metin Filtresi Alanları - ana metin filtresi ve genel arama için hangi alanları arayacaklarını.


## Alanlar

'Alanlar' bağlantısını tıklayarak ayrı bir sayfaya geçeceksiniz. Orada yeni alanlar oluşturabilir veya mevcut alanları güncelleyebilirsiniz. Varlık Yöneticisinde şu alan türleri mevcuttur:

* Adres -  sokak, şehir, eyalet, posta kodu ve ülke iledir adres;
* Dizi - birden fazla değeri seçebilme olanağıyla değerlerin listesidir (bu alana arama yapmanız gerekiyorsa iyi bir seçenek değildir); seçenekler belirtilmemişse, kullanıcılar kendi değerlerini ekleyebilir.
* Çoklu Eklenti - çoklu dosya ekleri;
* Otomatik artış - yalnızca üretilen sayıları okumak;
* Boolean - onay kutusu, doğru veya yanlış;
* Para birimi - para birimlerine değer vermek için;
* Tarih;
* Tarih Saat;
* Enum - yalnızca bir değer seçme olanağı bulunan kutuyu seçin;
* Dosya - bir dosya yüklemek;
* Float - ondalık kısmı olan sayı;
* Yabancı - varlık ile lgili bir alan;
* Görüntü - önizleme ile görüntü dosyasını yükleme;
* Tamsayı - tamsayı;
* Sayı - mümkün ön ek ve belirli bir uzunluk ile otomatik artan sayıda dize türü;
* Çoklu-enum - değerlerin listesi, birden fazla değer seçme yeteneğine sahipken (Diziye benzer şekilde değilse iyi bir seçenek değil) Diziye benzerdir ancak daha güzeldir.
* Metin - metin alanı, uzun satırlı metinler için;
* Url - bağlantılar için;
* Varchar - kısa metin;
* Göründüğü gibi çıktı - Metin formatının becerisi ile text alanına benzer;

Parametreler:
* Gerekli - alanın doldurulması zorunludur.
* Varsayılan Değer - Yeni kayıt oluştururken alanın değeridir.
* Denetlendi - alandaki güncellemeler Akış'da günlüğe kaydedilecek.

**Not**: Yeni alanı ekledikten sonra [düzenlerini] (layout-manager.md) (Yönetim> Düzen Yöneticisi) üzerine bu alanı koymanız gerekir..

### Dinamik Mantık

Formları dinamik hale getirme olanağı sağlar. Bazı alanları görünür, gerekli veya sadece okunan hale getiren koşulları tanımlamak mümkündür. Formdaki veriler değiştirildiğinde koşullar otomatik olarak kontrol edilir.

Enum, Dizi ve Çoklu-Enum alanlarında, karşılaşılan koşullara bağlı olarak alan için kullanılabilecek farklı seçenek kümeleri tanımlamak mümkündür.

## İlişkiler

Hem başlangıçtaki hem de özel öğeler arasında yeni ilişkiler oluşturabilirsiniz. Kullanılabilir 3 ilişki türü vardır bunlar:

* Birden Çok'a: Bu ilişkiyi oluşturduktan sonra, doğru varlığın ayrıntılı düzenine bir bağlantı alanı yerleştirebilir ve solundaki varlık için ilişki paneli ekleyebilirsiniz;
* Çoktan Bir'e: Birden çoğa benzer ama tam terside olabilir.
* Çoktan çoğa: Her iki taraftaki ilişki panelleri.

'Birden Fazla Bağlantı' parametresi, 'çoklu bağlantı' alanının ilişkiyle birlikte oluşturulacağını belirtir. Düzene böyle bir alan koyabilirsiniz. İlgili kayıtların hızlıca toplanması için uygundur. İlişkileriniz, ayrıntılı görünüm ekranının yüklenmesini yavaşlatan çok sayıda bağlantılı kayıt içeriyorsa, bu iyi bir seçenek değildir.

Parametre 'Denetlendi' işaretlendiyse ilişkinin güncellemeleri Akış'daki günlüğe kaydedilir.
