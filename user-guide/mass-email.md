# Toplu Eposta

## Nasıl toplu eposta gönderilir

crmnizde en az hedef kayıtların olduğu bir Hedef Listesi ve Eposta Şablonu olmalıdır.

1.`Eposta` or `Bülten` olarak yeni bir Kampanya yarat. `Hedef Listeleri` alanından bir veya daha fazla hedef listesi seç.
2. Kampanya kaydı yaratıldıktan sonra bu kampanya için Toplu Eposta yarat: Toplu Eposta panelindeki artıya tıkla. Epostaların gönderilmesi gereken _Başlama tarihi_ belirle ve _Eposta Şablonu_ seç. _Durum_u `Beklenen` olarak ayarladığınıza emin olun.

Her şey doğru ayarlandıysa epostalar gitmelidir. Epostalar her saat parçalar halinde gönderilmelidir (parça büyüklüğünü Yönetim > Giden Epostalar kısmından değiştirebilirsiniz). Yönetici `Programlama` alanından `Grup Eposta Hesaplarını Kontrol Et` Programlanmış İşi güncelleyerek değiştirebilir.

Log panelinden epostaların gönderilip gönderilmediğini kontrol edebilirsiniz.

## Alıcılara neyin gönderileceğini test et

_Toplu Eposta_ panelinde toplu eposta sırasının sağ açılır listesine tıkla ve sonra _Test Gönder_e tıkla.

## Log

Log'da şunları görebilirsiniz:
* Gönderilmiş eposta;
* Alıcı tarafından açılmış eposta;
* Alıcı tarafından tıklanmış linkler;
* Ayrılan alıcılar;
* Geri seken epostalar (alıcıya iletilmemiş).

## Ayrılma Linki

Sistem varsayılan olarak ayrılmayı tüm gönderilmiş epostalara ekleyecektir. Ama siz Eposta Şablonunuzda özel bir tane kullanabilirsiniz.

Örnek:
```html
<a href="{optOutUrl}">Mail listesinden çık.</a>
```

Yönetici sistem tarafından eklenmiş zorunlu ayrılma linkini Yönetim > Giden Epostalar kısmından devre dışı bırakabilir.

## URL İzleme

Eğer alıcınızın epostadaki linki açtığını bilmek istiyorsanız, bir URL İzleme yaratmalısınız. Linkinizin gitmesi gereken herhangi bir _İsim_ ve _URL_ belirleyin. Sonra, Eposta Şablonunuza yaratılan kodu yapıştırmalısınız.

 Örnek:
 ```html
<a href="{trackingUrl:55f2c87b09a220a78}">Demomuzu deneyin</a>
 ```
 
## Hedef Listeler

Hedef Listeler Hesap, Kişiler, Destekler ve Kullanıcıların kayıt listelerini içerir.

Kullanıcılar Hedef Listesinin detaylı görünümüne denk düşen panelde _Seç_ eylemini kullanarak hedef listesini elle doldurabilirler. Filtreleme ve sonra aramanın tüm sonuçlarını seçme yetisi vardır.

## Hedef listelerini raporlarla doldurmak

[Reports](reports.md#syncing-with-target-lists) özelliği hedef listelerinin spesifik kriterlerle eşleşen kayıtlarla doldurulmasını sağlar.

## Dışarda Tutulan Hedef Listeleri

Toplu epostaları belli alıcılara göndermekten kaçınmak için Dışarda Tutulan Hedef Listelerini belirleyin. Eğer dışarıda tutulmuş bir eposta adresinin kaydıyla eşleşen bir eposta adresi kaydı varsa, ilk kayıt da dışarıda tutulacaktır.

## Kampanya Logu

Kampanya Logunda gönderilmiş epostaları, açılmış epostaları, geri sekmiş epostaları, ayrılanları ve epostadaki linke tıklayanları görebilirsiniz. Bu logu, logdaki kayıtları baz alarak bir Hedef Listesi (panelde sağ-üst köşedeki açılır liste) yaratarak kullanmak mümkündür. Örneğin, sadece linke tıklamış kişileri seçersiniz (URL izleme).

## Sorun Giderme

_Yöneticiler için_

#### Epostalar gönderilmezse yapılacaklar

1. _Test Gönder_ çalışıyor mu diye kontrol edin. Eğer çalışmıyorsa, SMTP sistem ayarlarının doğruluğunu kontrol edin.
2. Sisteminiz için kurulum cronu olup olmadığını kontrol edin.
3. `Toplu Eposta Gönder`de Planlanmış İş var mı kontrol edin ve `Aktif` olup olmadığına bakın (Yönetim > Planlanmış İşler > Toplu Eposta Gönder). Log'da bir şey olup olmadığını kontrol edin.


#### What if Tracking URLs has wrong url that does not lead to your crm.

Check 'siteUrl' parameter in `data/config.php` file. It must be set as URL of your EspoCRM accessible from the external world.

#### Bounced emails are not being logged

Bounced emails can be handled by group email account only. Make sure that you have a group email account that monitores the mailbox bounced emails are sent to.

Also some mail server providers can deviate from standards, so bounced emails can be not distinguished.
