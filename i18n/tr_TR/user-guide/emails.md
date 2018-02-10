# E-posta Kullanım Yönergeleri

EspoCRM, e-postaları IMAP kutusundan alabilme imkanı sağlar. Bu, EspoCRM'i, CRM'e özgü özelliklerle birlikte e-posta istemcisi olarak kullanmayı mümkün kılar.

## IMAP hesapları

*Not: Gelen iç e-postaların çalışabilmesi için sisteminizde [cron](https://github.com/espocrm/documentation/blob/master/administration/server-configuration.md#setup-a-crontab) doğru bir şekilde yapılandırılmış olmalıdır.*

Kullanıcı, Kişisel E-posta Hesapları sayfasında IMAP hesabı kulurumunu yapabilir (E-postalar sekmesi > sağ-üst menü > Kişisel E-posta Hesapları).

İzlenen Klasörler alanında hangi klasörlerin izleneceğini belirtin. Varsayılan olarak GELEN KUTUSU ayarlanmıştır. E-posta göndermek için harici e-posta istemcileri kullanırsanız, bu e-postaları arşivlemek için Gönderilmişler klasörü ekleyebilirsiniz.

*Fetch Since*, e-postaların arşivlenme tarihini seçmenizi sağlar. Eski e-postaları arşivlemeniz gerekiyorsa, bugünden önceki bir tarihe ayarlayın.

Kişisel E-Posta Hesabında  *Klasör* belirtebilme imkanı vardır. Gelen e-postalar bu klasöre konacaktır.

## SMTP hesapları

Kullanıcılar Tercihler'de ve de Kişisel E-Posta Hesapları'nda SMTP ayarlarını yapabilir. Ayrıca Yönetici, SMTP sisteminin kullanmasına izin verebilir (Paylaşımlı yapabilir).

Kullanıcılar birden fazla SMTP hesabına sahip olabilir (sürüm 4.2.0'dan bu yana). Ancak kullanıcıların e-posta göndermek için kullanabilecekleri e-posta adresleri *Kullanıcı* kaydı e-posta adresleri tarafından tanımlanır.

## E-postalarla Çalışma

E-postalar, (arka planda) cron tarafından birkaç dakikada bir çekilir (süre yönetici tarafından belirtilebilir).
Tüm e-postalarınızı E-postalar sekmesinde görebilirsiniz. Solda standart olan Gelen Kutusu, Gönderilmiş, Taslak e-postalar klasörler vardır.

*Durum* alanı. `Gönderildi`, CRM'den gönderildi anlamına gelir, `Arşivlendi` - IMAP hesabından çekilen veya el ile arşivlendiği, `Taslak` – e-postanın bir taslak olarak oluşturulduğu manasına gelir.

Yeni e-posta geldiğinde sistem, bu e-postanın hangi kayda ait olduğunu tanımaya çalışır. Hesap, Müşteri Adayı, Fırsat, Olay (ve B2C modunda İletişim) vb. ile bağlantı kurabilir. Bu tanınmadığı takdirde, kullanıcı, *Üst öğe* alanını doldurarak manuel olarak bağlayabilir.

E-posta yeni bir potansiyel müşteridense kullanıcı onu **Müşteri Adayı'na dönüştürebilir**. E-posta girişi'ni açın ve sağ üst menüdeki Müşteri Adayı Yarat'a tıklayın.

Bir e-posta kaydından **Görev veya Olay yaratmak** da mümkündür.

Bir e-posta kaydındaki e-posta adresleri (from, to, cc) sistem tarafından biliniyorsa ilgili olduğu kişiyi gösterecektir (Kişi, Olay, Kullanıcı vb.). Bazı e-posta adresi yeni ise **kişi eklenebilir**.

Belirli bir kayıtla ilgili tüm e-postalar o kaydın Geçmiş panelinde gösterilir. Bazı e-postalar, örneğin, fırsatla ilgiliyse, ancak fırsat da hesapla ilgiliyse, o e-posta hem fırsatta hem de hesapta gösterilir.

## E-posta Gönderimi

Birkaç yoldan yeni bir e-posta yazabilirsiniz:
* E-postalar listesi görünümünde *E-posta yaz* düğmesiyle;
* başka bir e-postayı yanıtlayarak;
* bazı kayıtların bir e-posta adresini tıklayarak;
* Etkinlikler panelinde *E-posta yaz* eylemiyle.

E-postanızın **şablon seçebilme** özelliği vardır.

Tercihler'de **e-posta imzanızı** ayarlayabilirsiniz.

## E-posta Klasörleri

Kullanıcılar, bazı e-postaları kolayca yerleştirmek için kendi e-posta klasörlerini oluşturabilir. Mevcut klasörlerin listesi, sol taraftaki E-postalar sayfasında mevcuttur. Klasör oluşturmak veya düzenlemek için E-postalar > sağ üst köşedeki açılır menü > Klasörler yolunu izleyin. `Bildirimi Atla`, belirli klasöre gelen e-postalar hakkında bildirim almayacağınız anlamına gelir. E-posta Filtreleri'ni kullanarak e-postaları belirli ölçütlere göre otomatik olarak klasörlere yerleştirmek mümkündür.

## E-posta Filtreleri

Yönetici istenmeyen e-postaları atlamak için genel e-posta filtreleri oluşturabilir. Bunlar Yönetim > E-posta Filtreleri'nde bulunur.

Normal kullanıcı, Kişisel E-Posta Hesapları veya tüm gelen kutuları için e-posta filtreleri oluşturabilir. E-postalar > sağ-üst köşedeki açılır menü > Filtreler altında bulunur.

İki tip filtre vardır:
* Atlama - e-posta, *Çöp Kutusu'na* konur yada filtre Kişisel E-Posta Hesabı ile ilişkiliyse içe aktarım yapılmaz;
* Klasöre Koy - içe aktarılmış e-postalar otomatik olarak kullanıcının belirtilmiş klasörüne konur.

## E-posta Şablonları

E-posta şablonları, E-postalar > sağ-üst köşedeki açılır menü > E-posta Şablonları altında bulunur. Hem toplu hem de normal e-postalar gönderimleri için kullanılabilir. `Bir kerelik` onay kutusu, e-posta pazarlamasında alışılageldiği gibi, e-posta şablonunun sadece bir kez kullanılacağı anlamına gelir.

E-posta şablonu gövdesinde ve başlığında yertutucu kullanmak mümkündür; örn.
 {Account.name}, {Person.emailAddress}. Bunlar, kayıtların ilgili değerleri ile değiştirilir.

Ayrıca şablon gövdesinde ayrılmış yertutucular kullanabilirsiniz: {optOutUrl} ve {optOutLink}.
```
<a href="{optOutUrl}">Abonelikten çık</a>
```
Bu toplu e-posta üyeliğinden çıkma bağlantısıdır.
