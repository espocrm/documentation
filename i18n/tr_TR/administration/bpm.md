# İş Süreçleri Yönetimi

İş Süreçleri Yönetimi (BPM) aracı, EspoCRM'deki iş süreçlerini modelleme ve otomatikleştirme imkanı sağlar. BPMN 2.0 standardında açıklanan iş süreçlerini yürüten bir motordur. BPM aracı, [Advanced Pack](https://www.espocrm.com/extensions/advanced-pack/) uzantısında bulunur.

![BPM örneği](https://raw.githubusercontent.com/espocrm/documentation/master/_static/images/administration/bpm/bpm-1.png)

### İş Akışı araçlarının farkı

İş akışı aracı, akışın grafiksel olarak görüntülenmesine gerek olmadığı zaman, ardışık akış öğeleri olmaksızın basit işletme kurallarının otomasyonu için tasarlanmıştır.

BPM aracı, birbirinden uzaklaşan ve yaklaşan akışlar, uygulama gecikmeleri ve kullanıcı etkileşimleri gibi daha karmaşık iş akışları için tasarlanmıştır. Bir akış şeması görünümü, iş süreçlerini bir insan için daha anlaşılır kılmakta, bir günlük işlemin nasıl yapıldığının görülmesini sağlamaktadır.

## İşlem Akış Şemaları

İşlem akış çizelgelerine bağlantısı, yönetim panelinden edinilebilir.Gezinme panelinde bir sekme da olarak eklenebilir.

Akış çizelgeleri, iş süreçlerin modellemesi için tasarlanmıştır.Yönetici akış şemalarını oluşturabilir ve düzenleyebilir. Normal kullanıcılar yalnızca akış çizelgelerini görüntüleyebilirler.

Her akış şemasının sipesifik bir varlık türü (Hedef Türü alanı) vardır. Akış çizelgesi gelecek işlem örneklerinin yürütülmesini belirtir. Bu, akış elemanları ve elemanlar arasındaki bağlantıları içerir.

İşlem akış şeması denetlenmemiş 'Etkin mi?' Alana sahipse süreç örneklerini başlatmaz.

Belli bir akış şeması öğesinin ayrıntılarını ve parametrelerini görmek için üzerini tıklamanız gerekir.Düzenleme modunda parametreleri düzenleyebileceksiniz.

## İşlemler

İşlemler yönetim panelinde mevcuttr. Bağlantı, gezinme panelinde bir sekme olarak da eklenebilir.

İşlem, iş süreci örneğini temsil eder. Başlatıldığında 'Başlamış' durumuna gelir. İşlem tamamlandığında 'Sona Erdi' durumu alır. Süreç, işlemi düzenlemeye erişimi olan bir kullanıcı tarafından da manuel olarak durdurulabilir. El ile durdurulursa durum 'Durduruldu' durumuna gelir.

İşlem akış şemasına göre gerçekleştirilir. İşlem başladıktan sonra akış şeması değiştirilemez.

Süreç tek bir hedefe kayıt ile ilgilidir.

Süreçler otomatik olarak (belirli koşullar veya çizelgeleme ile) veya manuel olarak (akış şemasında en az bir Başlama Olayı olduğunda) başlatılabilir. İşlemin manuel olarak başlatılması için, kullanıcının süreçlerin listelenmiş görünümünde 'İşlemi Başlat' butonuna tıklaması gerekir.

## Akış Şeması Öğeleri

### Etkinlikler

Olaylar akış şemasında daireler şeklinde gösterilir.

#### Etkinliği Başlat

Parametre yok. Bu sürecin başlangıç noktasıdır. Etkinliğin başlatılması, süreç oluşturma erişimine sahip bir kullanıcı tarafından manuel olarak başlatılabilir. Kullanıcı, işlemlerin listelenmiş görünümünde 'İşlemi Başlat' butonuna tıklamalıdır.

#### Şartlı Başlama Olayı

Sürecin başlangıç noktası. Belirtilen koşullar sağlandığında otomatik olarak tetiklenmesi gerekiyor. İki tür tetikleyici vardır: 'Kayıt oluşturulduktan sonra' ve 'Kaydedildikten sonra'.

#### Zamanlayıcı Başlatma Olayı

İşlemin başlama noktası. Süreçleri zaman çizelgesi ile başlatır. İşlem başlatma ve crontab gösteriminde zamanlama için kayıtları döndüren listeleme raporunun belirtilmesi gerekir.

#### Koşullu Ara Durum

Bu olay, belirtilen ölçütler yerine getirilene kadar akışı durdurur.

#### Zamanlayıcı Ara Olayı

Bu olay akışını durdurur ve olayın parametreleri tarafından belirtildiği sürece bekler.

Daha karmaşık zamanlayıcı ayarları için [formula] (formula.md) kullanabilirsiniz. Formül komut dosyaları, Tarih-Saat değerlerini döndürmelidir(UTC saat dilimi içinde). Zamanı geldiğinde akış bir sonraki elemana ilerletilecektir.

Tarih-saate en yakın formül fonksiyonunu kullanarak, zamanlayıcıyı ilerideki belirli bir zamana ayarlamak mümkündür, örn. bir sonraki iş gününün başlangıcı şeklinde.  

#### Etkinlik Sonu

Akımı sonlandırır. Paralel olarak çalışan akışları sona erdirmez. Akış son olaya ulaştığında ve paralel çalışan hiçbir şey olmadığında işlem son bulur.

#### Olayı sona erdirmek

Tüm akışları bitirir. İşlem daha sonra bitirilir.

### Ağ geçitleri

Ağ geçitleri elmas olarak görüntülenir.

#### Özel Ağ Geçidi

Akışları ayırabilir veya bir araya getirebilir.

Sapma durumunda, belirtilen kriterlere göre seçilecek tek bir akış (yol) tanımlanır. İlk karşılaşılan koşul akışı belirler, sonraki koşullar atlanır. Akışı varsayılan olarak belirtme olanağı vardır. Varsayılan akış, herhangi bir karşılanmış koşulları yoksa seçilir.
Varsayılan akış, eğik çizgi işareti ile işaretlenmiştir.


Yakınsama durumunda, akış sadece giden elemana yönlendirilir. Akış geldiğinde bloke olmaz, paralel akışlar tek bir akışla birleştirilmez.


![özel farklı ağ geçidi](https://raw.githubusercontent.com/espocrm/documentation/master/_static/images/administration/bpm/gateway-exclusive-divergent.png)

![yakınsak ağ geçidi ](https://raw.githubusercontent.com/espocrm/documentation/master/_static/images/administration/bpm/gateway-exclusive-convergent.png)

#### Kapsamlı Ağ Geçidi

Akışı ayrıştırabilir veya bir araya getirebilir.

Ayrılması durumunda, her bir akışın ölçütlerinin başarısına bağlı olarak bir veya birden çok paralel akışa (yollar) yönlendirilebilir.
Varsayılan yol, herhangi bir karşılanma koşulları yoksa seçilir. Varsayılan akış, eğik çizgi işareti ile işaretlenmiştir.

Genişleyen bir kapsayıcı ağ geçidi tarafından üretilen paralel akışları birleştirmek gerekiyorsa, kapsayıcı bir ağ geçidi kullanmanız gerekir. Gelen akışların hepsini bekleyecek ve giden öğeye devam edecektir.

![kapsayıcı ağ geçidi](https://raw.githubusercontent.com/espocrm/documentation/master/_static/images/administration/bpm/gateway-inclusive.png)

Not: Ayrılan ve birbirine yaklaşan ağ geçitleri dengelenmelidir.

Not: Paralel akışlardan bir tanesi herhangi bir nedenden dolayı kesilirse, ayrılan ağ geçidi hiçbir zaman işlenmeyecektir. İşlem bloke edilecektir. Böyle bir durumu getirebilecek bir akış şeması tasarımından kaçınınız.

#### Paralel Ağ Geçidi

Akışı ayrıştırabilir veya bir araya getirebilir.

Ayrışması durumunda akış birden fazla paralel akışa bölünür. Bu ağ geçidi için hiçbir parametre mevcut değil.

Yakınsama durumunda tüm gelen akışlar gelene kadar beklenir ve bir sonraki giden elemana geçilir.

![paralel ağ geçidi](https://raw.githubusercontent.com/espocrm/documentation/master/_static/images/administration/bpm/gateway-parallel.png)

Not: Ayrışan ve birbirine yaklaşan ağ geçitleri dengelenmelidir.

Not: Paralel akışlardan bir tanesi herhangi bir nedenden dolayı kesilirse, farklı ağ geçidi hiçbir zaman işlenmeyecektir. Böyle bir durumu gerçekleştirebilecek bir akış şeması tasarımından kaçınınız.

#### Etkinlik Tabanlı Ağ geçidi

Akışı yalnızca birbirinden uzaklaştırabilir.

Giden olaylardan herhangi biri tetiklenene kadar akışı durdurur. Başlatılan olay tek akışı belirler.Diğer giden olaylar reddedilir.

Giden dizi akışlarının diğer ucunda sadece orta dereceli olaylar olabilir.


![etkinlik tabanlı ağ geçidi](https://raw.githubusercontent.com/espocrm/documentation/master/_static/images/administration/bpm/gateway-event-based.png)

### Aktiviteler

Olaylar dönen dikdörtgenler halinde gösterilir.

#### Görev

Görev, işlemlerin ardından gerçekleştirebilir:

* Kayıt Oluştur - Herhangi bir varlık türünün yeni kaydını oluşturur;
* İlişkili Kayıt Yarat - hedef kayıtla ilgili yeni kayıt oluşturur;
* Hedef Kaydı Güncelle;
* İligili Kaydı Güncelleme - kayıtları veya hedef kaydıyla ilgili kayıtları günceller;
* Oluşturulan Kaydı Güncelle - geçerli işlemlerle oluşturulan herhangi bir kaydın belirli alanını günceller;
* İşlem Kaydı Güncelleme - işlemi belirli bir kullanıcıya veya ekibe atamak için kullanılabilir;
* Diğer Kayıt Bağlantısı - hedef kaydı belirlenmiş bir kayıtla birleştirir;
* Diğer Kayıttan Bağlantısını Kaldırın - hedef kaydın belirtilen kayıttan kaldırılmasını sağlayın;
* Atama Kuralını Uygula - Hedef kaydı, süreç kaydını veya proses tarafından oluşturulan herhangi bir kaydı belirli kurallara göre atar;
* Bildirim Oluştur - belirli kullanıcılar için uygulama içi bildirim oluşturur;
* Takip Etmek - belirli kullanıcıların hedef kaydı, işlem kaydını veya süreç tarafından oluşturulan herhangi bir kaydı izlemesini sağlar;
* Hizmet Eylemini Çalıştır - geliştiriciler tarafından uygulanan özel hizmet eylemlerini çalıştırır.

Görev için uygulanabilir işlemler, iş Akışı özelliğinde olduğu gibi hemen hemen aynıdır. [Iş akışının eylemleri] hakkında daha fazla ayrıntıya bakmak için(workflows.md#actions).

#### Mesaj Gönderme Görevi

Belirli bir alıcıya e-posta mesajı gönderir.

#### Kullanıların Görevi

Kullanıcı etkileşimi için esnek bir yetenek sağlar. Kullanıcı (açıkça belirtilmiş veya atama kuralı tarafından) görevi tamamlayana kadar yürütmeyi durdurur. İşlem Kullanıcılı Görevi kaydı sistemde yaratılacaktır. Varsayılan olarak üç eylem türü vardır: Onayla, Gözden Geçir, Başar.

* Onay türü, kullanıcının "Onaylandı" ve "Reddedildi" seçeneklerinden birini seçmesini gerektirir.
* İnceleme türü yalnızca bir seçenek sunar: 'İncelendi'.
* Başarılı tipte iki seçenek vardır: 'Tamamlandı' ve 'Başarısız'.


Oluşturulan İşlem Kullanıcılı Görevi kaydına atanan kullanıcı, uygulama içi bildirim alacaktır. Yönetici ayrıca e-posta bildirimlerini de etkinleştirebilir.

Kullanıcılar gerçek işlem kullanıcılı görevlerini görmek için gösterge tablolarına İşlem Kullanıcılı görevlerin dashletini de ekleyebilirler.

Geçen ağ geçitlerinde veya koşullu olaylarda geçen kullanıcı görevinin çözünürlüğünü okumak mümkündür, böylece süreç akışında dallanma meydana gelir.

#### Komut Dosyası Görevi

Komut dosyasını [espo-formula] (formula.md) dili ile çalıştırır. Ayarlanan tüm değişkenler (`$ variableName`) süreç içinde saklanır ve kullanılabilirdir.

### Akımlar

#### Dizi Akışı

Katı bir ok şeklinde temsil edilir. İşlem öğelerinin yürütülme sırasını belirtir.

## Koşullar

Şartlı olaylar, özel ve kapsayıcı ayrılan ağ geçitleri, işlemin akışını belirleyen koşullara sahiptir.

UI aracılığıyla aşağıdaki kayıtların koşullarını kontrol etme olanağı vardır:

* Kayıtlı hedef;
* Bire bir ile çocuk-ebeveyn ilişkileri yoluyla hedefle ilgili kayıtlar;
* İşlem tarafından görevler vasıtasıyla yaratılan kayıtlar;
* Çözünürlüğün kontrol edilmesini sağlayan kullanıcı görev kayıtları.

[Espo-formula] (formula.md) dilinde koşulları tanımlamak da mümkündür.

BPM aracındaki koşullar İş Akışı özelliğindeki koşullarla aynıdır. [Iş akışı koşulları] hakkında daha fazla ayrıntıya buradan bakın(workflows.md#conditions).

## Örnekler

### Örnek 1

![Örnek 1](https://raw.githubusercontent.com/espocrm/documentation/master/_static/images/administration/bpm/example-1.png)

### Örnek 2

![Örnek 2](https://raw.githubusercontent.com/espocrm/documentation/master/_static/images/administration/bpm/example-2.png)

### Örnek 3

![Örnek 3](https://raw.githubusercontent.com/espocrm/documentation/master/_static/images/administration/bpm/example-3.png)
