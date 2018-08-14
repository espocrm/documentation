# Eposta Kullanım Önerileri

EspoCRM epostaları IMAP kutusundan getirme yetisi sağlar ve bu EspoCRM'yi eposta işlemcisi olarak CRM'ye özel özelliklerle birlikte kullanmayı mümkün kılar.
EspoCRM provides the ability to fetch emails from IMAP box. This makes possible to use EspoCRM as an email client along with CRM-specific features.

## IMAP hesapları

*Not: Almalısınız [cron](https://github.com/espocrm/documentation/blob/master/administration/server-configuration.md#setup-a-crontab) sisteminizde gelen mailleri çalışır durumda tutmak için düzgünce yapılandırılmıştır.*

Kullanıcı IMAP hesabını Kişisel Eposta Hesapları sayfasından ayarlayabilir (Epostalar sekmesi > sağ-üst menü > Kişisel Eposta Hesapları).

Gözlenen Dosyalar alanında yönetilecek dosyaların hangileri olduğunu belirtiniz. Varsayılan ayarlarda GELEN KUTUSU olarak ayarlanmıştır. Eğer epostalarınızı göndermek için dış eposta istemcileri kullanıyorsanız bu epostaları arşivleyerek Gönderilmişler dosyasına ekleyebilirsiniz.


*Getirme Tarihi* epostaların hangi tarihten itibaren arşivlenmiş olacağını seçmenize izin verir. Eski epostaları arşivlemeye ihtiyacınız varsa tarihi bugünden önce herhangi bir zamana ayarlayın.

Kişisel Eposta Hesabında *Dosta* belirleme yetisi vardır. Gelen epostalar bu dosyaya koyulacaktır.

## SMTP Hesapları

Kullanıcılar SMTP ayarlarını Kişisel Eposta Hesaplarında olduğu gibi Tercihler kısmından yapabilirler. Yönetici de SMTP sistemini kullanmaya izin verebilir (Paylaşımlı yapın). 

Kullanıcılar birden fazla SMTP hesabına sahip olabilirler (4.2.0 versiyonundan beri). Ama, burayı epostalarını göndermek için kullanan eposta adreslerinin kullanıcısı *Kullanıcı* kaydının eposta adreslerinden belirlenir.

## Epostalarla Çalışmak

Epostalar her birkaç dakikada bir(zaman aralığı Yönetici tarafından belirlenebilir) cron ile getirilir(arkaplanda). Epostalar sekmesinde bütün epostalarınızı görebilirsiniz. Sol tarafta Gelen Kutusu, Gönderilen, Taslak epostalar olarak standart dosyalar bulunmaktadır.


*Durum* alanı. `Gönderildi` CRM'den gönderildiği anlamına gelir, `Arşivlendi` – IMAP hesabından getirilmiş veya elle arşivlenmiş, `Taslak` – epostanın taslak olarak yaratılmış olduğu anlamına gelir.

Yeni bir eposta geldiği zaman sistem bu epostanın hangi kayda ait olduğunu tanımaya çalışır. Bu mail Hesap, Kılavuz, Fırsat, Durum(B2C moduyla etkileşim halindedir) vb. ile bağlantılı olabilir. Eğer mail tanınmazsa kullanıcı elle *Üst öğe* alanını doldurarak bağlantı kurabilir.

Eğer eposta potansiyel yeni bir istemciden geliyorsa kullanıcı **Kılavuze çevirebilir** . Eposta öğesini açın ve sağ-üst menüden Kılavuz Yarat sekmesine tıklayın.

Eposta kaydından **Durum veya Görev yaratmak** da mümkündür.

Eğer bir email kaydındaki email adresleri (-dan, -a, cc) sistemce biliniyorsa, sistem ilgili olduğu kişiyi gösterecektir (Kişi, Kılavuz, Kullanıcı vb). Eğer bazı eposta adresleri yeniyse hemen oradan **kişi yaratabilirsiniz**.

Bütün epostalar o kaydın Geçmiş panelinde gösterilen spesifik bir kayıtla ilgilidir. Örneğin, eğer bazı epostalar fırsatla ilgiliyse ama fırsatlar hesapla ilgiliyse, bu epostalar hem fırsatlarda hem de hesapta gösterilecektir.

## Eposta Yollama

Birkaç yolla yeni eposta oluşturabilirsiniz:
* Eposta listesi görünümündeki *Eposta Oluştur* butonu ile;
* bir başka maile cevap vererek;
* bir kaydın bir eposta adresine tıklayarak;
* Aktiviteler panelinden *Eposta Oluştur* işlemiyle.

Epostanız için **şablon seçme** yetisi vardır.

Tercihlerden **eposta imzanızı** ayarlayabilirsiniz.

## Email Dosyaları

Kullanıcılar kolaylık olsun diye bazı epostaları koymak için kendi eposta dosyalarını yaratabilirler. Uygun dosyaların listesi Epostalar sayfasının sol tarafında mevcuttur. Dosyaları yaratmak veya düzenlemek için Epostalar > sağ-üst köşedeki açılır liste > Dosyalar takip edilir. 'Bildirimleri Atla' belirli bir dosyaya düşen epostalar hakkında bildirim almayacağınız anlamına gelir. Eposta Filtrelerini kullanarak epostaları otomatik olarak spesifik bir kritere dayanarak dosyalara koymanız mümkündür.

## Eposta Filtreleri

Yönetici istenmeyen epostaları atlamak için global eposta filtreleri yaratabilir. Bu filtreler Yönetim > Eposta Filtreleri sekmesinde mevcuttur.

Düzenli kullanıcılar kendi Kişisel Eposta Hesapları veya kendi gelen kutuları için eposta filtreleri yaratabilirler. Bu filtreler Epostalar > sağ-üst köşedeki açılır kapanır liste > Filtreler takip edilir.

İki tip filtre mevcuttur:
* Geç - email *Çöp*e koyulur veya filtre Kişisel Eposta Hesabıyla alakalıysa aktarılmayacaktır;
* Dosyaya koy - aktarılmış epostalar otomatik olarak özelleştirilmiş kullanıcı dosyasına koyulacaktır.

## Eposta Şablonları

Epostalar > sağ-üst köşedeki açılır kapanır liste > Eposta Şablonları kısmında eposta şablonları mevcuttur. Hem toplu eposta gönderimlerinde, hem de normal epostalar için kullanılabilir. 'Tek seferlik' onay kutusu eposta şablonunun sadece tek bir sefer kullanılması gerektiği anlamına gelir ki bu eposta marketing için alışılmış bir durumdur.

Eposta şablonunun gövde ve konusunda dosyaları kullanmak mümkündür örneğin {Hesap.adı}, {Kişi.epostaAdresi}. İlgili kayıtların değerleri onların yerine gelecektir.

Ek mahfuz dosyaları şablon gövdesinde kullanabilirsiniz: {optOutUrl} ve {optOutLink}.
```
<a href="{optOutUrl}">Unsubscribe</a>
```
Bu toplu eposta için aboneliği kaldırma linkidir.
