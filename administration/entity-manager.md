# Öğe Yöneticisi

Öğe Yöneticisi Yönetim panelinde kullanılabilir. EspoCRM durumunuzu çok iyi özelleştirmenize olanak sağlar. Aşağıdakileri yapabilirsiniz:

* Yeni durum türleri ekle.
* Varolan öğe türlerini özelleştirme: etiketleri değiştir, liste görünümünde varsayılan sıralama, akışı etkinletir veya devre dışı bırak.
* Alanları yapılandır: yeni ekle, varolanları özelleştir.
* İlişkileri yapılandır: yeni ekle, varolanların etiketlerini değiştir.

## Yeni öğe oluşturma

Öğe Yöneticisi sayfasındaki 'Öğe Oluştur' düğmesine tıklayın. Adı, etiketleri ve türü belirtin. Eğer 'Kişi' türünü seçerseniz, öğeniz Eposta, Telefon, Ad, Soyad ve selamlama alanlarına sahip olacaktır.

Türler:

* Temel - sadece Ad, Atanan Kullanıcı, Takımlar, Tanımlama gibi basit alanlar içeren boş öğe.
* Temel İlave - Temel gibi ancak Etkinlikler, Geçmiş ve Görevler panelleri (4.3.0'dan itibaren kullanılabilir).
* Etkinlik - Başlama Tarihi, Bitiş Tarihi, Süre, Ana Öğe, Durum alanları. Takvim ve Aktiviteler panelinde kullanılabilir(4.3.0'dan itibaren, Yönetim > Ayarlar etkinleştirilmelidir).
* Person - Eposta, Telefon, Ad, Soyad, Selamlama, Adres alanları. Aktiviteler, Geçmiş, Görevler panelleri.
* Şirket - Eposta, Telefon, Fatura Adresi, Teslimat Adresi alanları. Aktiviteler, Geçmiş, Görevler panelleri.

## Varolan öğeleri Güncelle

Eğer belirli bir öğede 'Düzenle' bağlantısını tıklarsanız o öğenin bazı parametrelerini değiştirebilirsiniz.

* Etiketler - öğenin tekil ve çoğul adı.
* Varsayılan sipariş kayıtları liste görünümlerine göre sıralanır.
* Akış - bu öğe için Akış özelliğinin etkin olup olmadığı.
* Devre dışı - sisteminizde bu öğeye ihtiyacınız yok mu kontrol edin.
* Metin Filtresi Alanları - ana metin filtresi ve genel arama için hangi alanlarda arayacakları.

## Alanlar

'Alanlar' bağlantısına tıkladığınızda ayrı bir sayfaya taşınacaksınız. Orada yeni alanlar oluşturabilir ya da varolanları güncelleyebilirsiniz. Öğe Yöneticisinde aşağıdaki alanlar kullanılabilir:

* Adres - sokak, şehir, eyalet, posta kodu ve ülke ile adres;
* Dizin - çoklu değer seçme yeteneği olan değerlerin listesi (bu alan ile arama yapmanız gerekirse iyi bir seçenek değil); seçenekler belirlenmezse kullanıcılar kendi değerlerini ekleyebilir.
* Çoklu Eklentiler - çoklu dosya eklentileri;
* Otomatik-artış - salt okunur üretilmiş sayı
* Boole - onay kutusu, doğru ya da yanlış;
* Para birimi - para birimleri için;
* Tarih;
* Tarihsaat;
* Sıralama - seçim kutusu, yalnızca bir değer seçme yeteneğiyle.
* Dosya - bir dosya yükleme;
* Ondalık - ondalıklı sayı;
* Harici - ilgili öğenin bir alanı;
* Görüntü - önizleme ile görüntü dostası yükleme;
* Tamsayı - tüm sayı;
* Sayı - olası bir ön ek ve belirli bir uzunluk ile dize türü otomatik artan sayı;
* Çoklu-sıralama - değerler listesi çoklu değerler seçme yeteneğine sahip (bu alanda arama yapmanız gerekirse iyi bir seçenek değil); Diziye benzer ancak daha iyi.
* Metin - metin alanı, uzun çok satırlı metinler için;
* Url - bağlantılar için;
* Varchar - kısa metin;
* Wysiwyg - metin alanına benzer şekilde, metin biçimlendirme yeteneği ile.

Parametreler:

* Gerekli - alanın doldurulmasının zorunlu olup olmadığı.
* Varsayılan Değer - yeni kayıt oluşturuken alanın Değeri.
* Denetlenmiş - alanın güncellemeleri Akış'da kaydedilecek.

**Not**: Yeni alan ekledikten sonra bu alanı [tasarımlar](layout-manager.md) (Administration > Layout Manager)'a koymanız gerekir.

### Dinamik Mantık

Formları dinamik yapma yeteneği sağlar. Bazı alanları görünür, gerekli ya da salt okunur yapma koşulları tanımlamak mümkündür.Formdaki veriler değiştiğinde koşullar otomatik olarak kontrol edilir.

  Sıralama, Dizin ve Çoklu Sıralama alanlarında karşılaşılan durumlara bağlı olarak farklı seçenek grupları tanımlamak mümkün olacaktır.

## İlişkiler

Hem ilk çalıştırmada hem de özel varlıklar arasında yeni ilişki türleri oluşturabilirsiniz. Kullanılabilen 3 ilişki türü vardır.

* Birden Çoğa: bu ilişkiyi oluşturduktan sonra sağ öğenin ayrıntı düzenine bir bağlantı alanı yerleştirebilir ve sol öğeye ilişki paneli ekleyebilirsiniz;
* Çoktan Bire: Birden Çoğa ile aynı ama tam tersi;
* Çoktan Çoğa: her iki taraftaki ilişki panelleri.

'Birçok Alan Bağlanma' parametresi `linkMultiple` alanının ilişkiyle birlikte oluşturulacağını belirtir.Düzene böyle bir alan koyabilirsiniz. İlgili kayıtların hızlı toplanması için uygundur. Eğer ilişkiniz ayrıntılı görünüm ekranını yavaşlatabilen birçok bağlantılı kayıt içeriyorsa bu iyi bir seçenek değildir.

Eğer 'Denetlendi' parametresi işaretlendiyse ilişki güncellemeleri Akışa kaydedilecektir.

