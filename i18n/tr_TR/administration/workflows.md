# İş Akışları

İş akışları özelliği, [Gelişmiş Paket]'de mevcuttur (https://www.espocrm.com/extensions/advanced-pack/).

İş akışları, işlemlerinizi kolay bir şekilde otomatikleştirir. Bunu Yönetim panelinde bulabilirsiniz. Bir iş akışı kuralı oluşturmak için şunları tanımlamanız gerekmektedir:

* Hedef Varlık - hangi varlık türü iş akışına uygulanır;
* Tetikleyici Türü - iş akışı tetiklendiğinde;
* Koşullar - iş akışını tetiklemek için gerekli koşulların yerine getirilmesi gerekir;
* Eylemler - iş akışı tetiklenirse ne yapılacak?


## Tetikleyici Tipleri

### Kayıt Oluşturulduktan sonra 

Yalnızca yeni bir kayıt oluşturulduğunda tetiklenmektedir. Belirtilen koşullar yerine getirilirse olaylar gerçekleştirilir.

### Kayıt kaydedildikten sonra

Yeni bir kayıt oluşturulduğunda veya mevcut bir kayıt güncellendiğinde başlatılır. Belirtilen koşullar yerine getirilirse olaylar gerçekleştirilir.

Bu tür tetiklemeye sahip iş akışı kuralları için, bazı alanların 'değiştirildi' olup olmadığını kontrol eden bir koşul olması yaygın bir uygulamadır. Örneğin, Olayların durumu değişirse, bazı işlemleri gerçekleştiriniz.

### Zamanlanmış

Tanımlanan zamanlamaya göre başlatıldı. Her gün, her hafta, vb. çalıştırmak için kurulum yapabilirsiniz. Belirli bir liste raporu tarafından geri gönderilen kayıtlar için eylemler uygulanacaktır.Dolayısıyla bir liste raporu oluşturmanız gerekmektedir.

Tarifeleme bir crontab notlarında belirtilmiştir.

```
* * * * * *
| | | | | | 
| | | | | +-- Year              (range: 1900-3000)
| | | | +---- Day of the Week   (range: 1-7, 1 standing for Monday)
| | | +------ Month of the Year (range: 1-12)
| | +-------- Day of the Month  (range: 1-31)
| +---------- Hour              (range: 0-23)
+------------ Minute            (range: 0-59)
```

### Ardışık

Nadiren kullanılırdı. Başka bir iş akışı tarafından çalıştırılması gerekiyordu.Bir karmaşık mantıksal yapma özelliğini sağlar.

Not: Sıralı iş akışları için bir İş Akışı özelliği yerine [BPM aracı] (bpm.md) kullanmanız önerilir.

## Koşullar

İş akışını başlatmak için yerine getirilmesi gereken koşulları belirtebilirsiniz. Koşulların nasıl belirtileceğini göstermenin iki yolu vardır: UI koşul oluşturucu ve formüldür.

### UI Koşul Oluşturucu

Bazı mevcut koşul türleri:

* _equals_ - alan belirli bir değere veya başka bir alanın değerine eşittir;
* _was equal_ - iş akışı tetiklenmeden önce alan belirli bir değere eşittir;
* _not equals_ - alan belirli bir değere veya başka bir alanın değerine eşit değildir;
* _was not equal_ - iş akışı tetiklenmeden önce alan belirli bir değere eşit değildir;
* _empty_ - alan değeri boştur;
* _not empty_ - alan değeri boş değildir;
* _changed_ - alan değiştirildi;
* _not changed_ - alan değiştirilmedi.

### Formül koşulları

Förmül herhangi bir karmaşıklığın koşullarını tanımlama olanağı sağlamaktadır.Formül sözdizimini okumak için [Bu yazı] (formula.md) bölümüne bakınız.

Not: Bir koşul belirlediğinde formül kodunda kullanılan `;` sınırlandırıcı olmamalıdır.

## Eylemler

### E-posta Göndermek

Sistem belirtişmiş e-posta şablonunu kullanarak bir e-posta gönderir. Bir alıcının e-posta adresi, hedef kaydı, ilişkili herhangi bir kaydı, geçerli kullanıcıyı, takipçileri, takım üyelerinden veya belirtilenlerden alınabilir. E-posta hemen gönderilebilir veya belirli bir süre için gecikir.

### Kayıt Oluşturma

Sistem herhangi bir öğe türünün yeni kaydını oluşturacaktır. Hedef kayıt ile kayıt oluşturma arasında bir ilişki varsa, kayıtları ilişkilendirmek mümkündür. 

Alanları hesaplamak için formül tanımlama özelliği vardır.

### İlgili Kayıt Oluşturma

Sistem hedef kayıtla ilgili kayıt oluşturacaktır. Alanları hesaplamak için formülü tanımlamak mümkündür.

### Hedef Kaydı Güncellemek

Hedef kaydın belirli alanlarını değiştirmeye izin verirlir. Alanları hesaplamak için formülü tanımlamak mümkündür.

Mevcut verileri kaybetmeden (örneğin, Takımlar) Çoklu-Bağlantı alanına yeni öğeler eklemeniz gerekiyorsa formül fonksiyonu entity\addLinkMultipleId kullanmanız gerekir. Örneğin: `entity\addLinkMultipleId('teams', 'teamId')`.

### İlgili Kaydı Güncellemek

İlgili kayıt veya kayıtların belirli alanlarının değiştirilmesine izin verirlir. Alanları hesaplamak için formülü tanımlamak mümkündür.

### Başka Bir Kayıtla Bağlantı Kurmak

Hedef varlığı başka bir belirli varlıkla ilişkilendirir. Örneğin, kayıta özel takım eklendi.

### Başka Bir Kayıtla Bağlantı Koparmak

Hedef birimi başka bir belirli varlıkla ilişkilendirmez. Örneğin, belli bir ekibi kayıtlardan kaldırır.

### Görev Kuralı Atamak

Hedef kaydı, dağılım kuralına göre kullanıcıya atayınız. İki geçerli kural vardır: Round-Robin ve Least-Busy.

* Round-Robin - kullanıcılar bir listenin en üstünden en altına (takım) seçilir ve tekrar başlarlar.
* Least-Busy - kayıtlı atama sayısı daha az olan kullanıcı görev için seçilecektir.

_List Report_ - Least-Busy dağıtımında, hesapların atanmış kayıtlarının sayısını hesaplamak için nelerin dikkkate alınacağını belirler. Örneğin. Olaylar için yalnızca aktif durumdaki kayıtları almamız gerekmektedir.

### Bildirim Oluşturmak

Belirli kullanıcıları mesajla bilgilendir. Mesaj şablonunda yer belirleyicilerin kullanılması mümkündür: {entity}-hedef kayıt, {user}-geçerli kullanıcı.

### Takip Et

Belirli kullanıcıları hedef varlığı veya belirtilen ilgili bir varlığı izlemek için zorlar.

### Başka Bir İş Akışını Tetiklemek

Ardışık iş akışlarını oluşturmaya izin verir. İş akışını duruma göre şubelendirmek mümkündür: iş akışını, iş akışlarında tanımlanan farklı koşullarla iki iş akışını başlatacak şekilde ayarlayabilirsiniz.

Sıralı iş akışının yürütülmesini geciktirmek mümkündür. Sıralı iş akışında, üst iş akışı _ Changed_ ve _Was Equal_ koşul türleri kullanılarak tetiklendiğinden dolayı, özel alanların değiştirilip değiştirilmediğini kontrol eden koşul tanımlayabilirsiniz.

NNot: Sıralı iş akışları için bir İş Akışı özelliği yerine [BPM aracı] (bpm.md) kullanmanız önerilir.

### Hizmet Eylemini Çalıştırmak

Belirli hizmet komut dosyalarını çalıştırmaya izin verir. Varsayılan olarak aşağıdaki eylemleri kullanabilirsiniz:

* Davetiyeleri Gönder - for Meetings/Calls;
* Alıntı Ekle - for Quotes.

Geliştiriciler kendi hizmet işlemlerini yazabilir. Bkz. [Ayrıntılı bilgi] (../ development / workflow-service-actions.md).

## İşlemlerde Formül Kullanımı

Kayıt Oluştur, Hedef Kaydı Güncelle, İlgili Kaydı Oluştur, İlgili Kayıtları Güncelle alanlarını hesaplamak için formül tanımlamak mümkündür. Son iki yılda, hedef varlığın özelliklerine erişmek için, `targetEntity \ attribute` işlevini kullanmalısınız. İş akışı tetiklenmeden önce belirlenen hedef öğenin özelliklerine erişmek için,  `targetEntity \ attributeFetched` işlemini kullanınız.

Örnek:
```
name = string\concatenate(targetEntity\attribute('name'), ' ', datetime\today());
```
