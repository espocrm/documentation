# E-Postalar

> Önemli. E-posta alma işini yapmak için sisteminizde yapılandırılmalıdır [Cron] (https://github.com/espocrm/documentation/blob/master/administration/server-configuration.md#setup-a-crontab). Bilgileri, Yönetim> Zamanlanmış İşler bölümünde EspoCRM'yi bulabilirsiniz.

## Genel Bakış

EspoCRM, IMAP posta kutularını izleyebilme özelliğine sahiptir. E-posta iki şekilde arşivlenebilir bunlar: Grup E-posta Hesapları ve Kişisel E-posta Hesaplarıdır. Grup Gelen Hesaplar, grup posta kutuları için tasarlanmıştır: en yaygın olanı bir destek kutusudur.Kişisel E-posta Hesapları, kullanıcıların kişisel posta kutularına yönelik tasarlanmıştır.


Bir e-posta geldiğinde sistem uygun kaydı (Hesapları, Rehberi, Fırsatı, Durumu) bağlamaya çalışır. Bu kaydı takip eden kullanıcılar CC değillerse bile, sistemdeki yeni bir e-postayla ilgili bildirim alırlar.

## Grup E-posta Hesapları

Grup E-posta Hesaplarını yalnızca yöneticiler kurabilir. Grup E-posta Hesapları hem e-posta alma hem de gönderme için kullanılabilir.
Grup hesaplarından e-posta göndermek 4.9.0 sürümünden beri mevcuttur.

Takım alanları hangi ekiplerin gelen e-postalara atanacağını belirtirler.

Eğer grup e-posta hesabının SMTP'si varsa ve paylaşılan olarak işaretlenmişse erişim, Grup E-posta Hesabının izni aracılığıyla Roller tarafından kontrol edilecektir. İzin seviyesi 'takım' olarak ayarlanırsa, Takımlar alanı kullanılacaktır.

Sistemin, gelen e-postalar için otomatik cevap göndermesini sağlayan bir özelliği vardır.

## Kutuya E-postayla Gönder

Sistemin, gelen grup e-postalarından kutular oluşturmasını sağlamak için bir seçenek vardır. 
Bu özellik, destek ekipleri için tasarlanmıştır.
Durumlar, belirtilen takımdaki kullanıcılara şu şekillerde dağıtılabilir:
`direct assignment`, `round-robin` and `less-busy`. 
Sadece ilk e-posta tredin içerisinde yeni bir kutu oluşturur.
Ardından gelen her biri, mevcut kutu kaydına bağlanır ve akış panelinde görüntülenir.

Kullanıcılar müşteriye bir cevap göndermek istediğinde, gönderilen e-postanın ebeveyni kutunun seçili olduğundan emin olunmalıdır. Bu, kullanıcının kendine değil müşterinin grup e-posta adresine cevap vermesini sağlayacaktır.

## Kişisel E-posta Hesapları

Kullanıcılar, izlenmesi gereken kendi e-posta hesaplarını kurabilirler. E-postalar>En Sağdaki Açılır Menü>Kişisel E-posta Hesapları. Yönetici aynı zamanda kullanıcıların e-posta hesaplarını yönetebilir.

## E-posta Filtreleri

Bunlar, gelen e-postaların belirtilen kriterlere göre filtrelenmesine izin verir. Örneğin. Bazı uygulama tarafından gönderilen bildirim mesajlarının EspoCRM'ye aktarılmasını istemiyorsanız, EspoCRM'yi geçmek için filtre oluşturabilirsiniz.


Yönetici, tüm e-posta hesaplarına uygulanan genel filtreler oluşturabilir. Kullanıcılar kendi kişisel e-posta hesapları ve bütün gelen kutuları için filtreler oluşturabilirler.
