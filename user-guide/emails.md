# Emaillerin Kullanım Kılavuzları

EspoCRM IMAP kutusundan emailleri getirme yeteneği sağlar. Bu, CRM-spesifik özellikleri ile birlikte EspoCRM'in bir email istemci olarak kullanılmasını mümkün kılar.

## IMAP hesapları

*Not: Gelen emaillerin çalışmasını sağlamak için sisteminizde düzgün şekilde yapılandırılmış [cron](https://github.com/espocrm/documentation/blob/master/administration/server-configuration.md#setup-a-crontab) olması gerekir.   

Kullanıcı Kişisel Email sayfasında IMAP hesabı ayarlayabilir. (Emailler sekmesi > sağ-üst menü > Kişisel Email Hesapları).

İzlenen Klasörler alanında hangi klasörlerin izleneceğini belirtin. Varsayılan olarak INBOX'a ayarlanır. Emailler göndermek için bazı harici email istemcileri kullanıyorsanız bu emailleri arşivlemek için Gönderilenler klasörü ekleyebilirsiniz.

*Fetch Since* emaillerin arşivlenmesi gereken tarihi seçmenize izin verir. Eski emailleri arşivlemeniz gerekiyorsa onu bugünden önceki bir tarihe ayarlayın. 

Kişisel Email Hesabı'nda *Klasör* belirtmek için bir özellik vardır. Gelen emailler bu klasöre koyulacak.

## SMTP hesapları

Kullanıcılar Kişisel Email Hesapları'nda olduğu gibi Tercihlerde de SMTP ayarları kurabilirler. Yönetici ayrıca sistem SMTP'nin kullanımına (paylaşılan yapma) izin verebilir. 

Kullanıcılar çoklu SMTP hesaplarına sahip olabilirler (4.2.0 sürümünden beri). Fakat email göndermek için kullanabildiği email adresleri *Kullanıcı* kaydının email adresleri tarafından belirtilir.

## Emailler ile Çalışmak
 
Emailler her birkaç dakikada (periyot Yönetici tarafından belirlenebilir) cron (arka planda) tarafından alınır. 
Emailler sekmesinde tüm emaillerinizi görebilirsiniz. Sol tarafta standart klasörler Gelen, Gönderilen, Taslak emailler vardır.

*Durum* alanı. `Sent` CRM'den gönderildiği anlamına gelir, `Archived` - IMAP hesabından alınır veya manuel olarak arşivlenir, `Draft` - emalilin bir taslak olarak oluşturulduğu anlamına gelir.

Yeni email geldiğinde sistem bu emailin hangi kayda ait olduğunu tanımaya çalışır. Hesap, Kılavuz, Fırsat, Durum (ve B2C modundaki İletişim) vs ile onu bağlayabilir. Eğer tanınmamışsa kullanıcı onu maunuel olarak *Temel* alanları doldurarak bağlayabilir. 
Bir email bir yeni potansiyel istemciden geldiyse kullanıcı onu **Öncü'ye çevirebilir**. Email girdisini açın ve sağ üst menüdeki Öncü oluştura tıklayın.
 
Bir email kaydından **Görev veya Durum** oluşturmak da mümkündür. 

Bir email kaydındaki email adresleri (gelen, giden, cc) sisteme göre biliniyorsa ilişkilendirilmiş olan kişileri gösterecek (İletişim, Öncü, Kullanıcı vs). Bir email adresi yeniyse oradan **iletişim oluşturabilirsiniz**.

Belirli kayıtla ilgili tüm emailler bu kaydın Geçmiş panelinde gösterilir. Bir email ilgiliyse, örneğin, olanak için fakat olacak hesapla ilişkiliyse, hem olanakta hem hesapta gösterilir.

## Emailler Göndermek

Birkaç yolla yen bir email oluşturabilirsiniz:
* Emailler liste görünümde *Email Oluştur* butonu; 
* başka bir emailde yanıtlayarak;
* bazı kayıtların bir email adresine tıklayarak; 
* Aktiviteler panelinin *Email Oluştur* eylemi.  

Emailinizin **şablon seçimi** için bir özellik vardır.

Tercihler'de **email imzasını** ayarlayabilirsiniz.

## Email Klasörleri

Kullanıcılar kolaylık için emaillerinin bazılarını koymak için kendi klasmrlerini oluşturabilirler. Mevcut klasörlerin listesi Emailler sayfasında sol tarafta mevcuttur. Klasörleri oluşturmak veya düzenlemek için şu yolu izleyin Emailler > sağ üst köşede açılır menü > Klasörler. `Skip Notification` belirli klasör içine düşecek gelen emailler hakkında bildirim almayacağınız anlamına gelir. Email Filtrelerinden yararlanarak emailleri belirli kriterlere göre otomatik olarak klasörlere koymak mümkündür.

## Email Filtreleri

Yönetici istenmeyen emailleri geçmek için global email filtreleri oluşturabilir. Yönetim > Email Filtreleri'nde mevcuttur.

Düzenli kullanıcı kendi Kişisel Email Hesapları veya gelen kutusunun tamamı için email filtreleri oluşturabilir. Emailler > sağ üst köşedeki açılır liste > Filtreler'de mevcuttur. 

İki tür filtre vardır:
* Geç - filtre Kişisel Email Hesabı'yla ilgiliyse email *Çöp* koyulacak veya içe aktarılmayacak;
* Klasöre Koy - içe aktarılan emailler belirlenen kullanıcının klasörüne otomatik olarak koyulacak. 

## Email Şablonları

Email şablonları Emailler > sağ üst köşedeki açılır liste > Email Şablonları'nda mevcuttur. Hem kitle emaili göderimi için hem de düzenli emailler için kullanılabilirler. `One-off` denetleme kutusu email şablonunun sadece bir kereye mahsus kullanılması gerektiği, email pazarlama için ne demek olduğu anlamına gelir.

Email şablonunun gövdesinde ve konusunda örn. {Account.name}, {Person.emailAddress} klasör tutucu kullanmak mümkündür. İlgili kayıtların değerleri ile değiştirileceklerdir.

Şablon gövdesinde ek rezerve edilmiş klasör tutucular kullanabilirsiniz:  {optOutUrl} ve {optOutLink}.

```
<a href="{optOutUrl}">Unsubscribe</a>
```
Bu kitle emaili için abonelikten çıkma linkidir.
