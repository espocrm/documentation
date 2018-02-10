# Toplu E-posta

## Nasıl toplu e-posta yollarsınız

Crm'inize Hedef kayıtlarınız ve E-posta Şablonunuzla birlikte en az bir Hedef Listenizi almalısınız. 

1. `E-posta` veya `Haber Bülteni` durumu ile yeni Kampanya oluşturun. `Hedef Listeleri`' alanında bir veya birkaç hedef listesi seçin.
2. Kampanya kaydı oluşturulduktan sonra bu kampanya için Toplu E-posta oluşturun: Toplu E-posta paneline çoklu tıklayın. E-postalar yollanacağı zaman _Başlangıç Tarihi_ - belirtin, ve _E-posta şablonu_ seçin. _Durum_'un `Beklemede` olduğundan emin olun.

Eğer herşey doğru kurulduysa e-postalar gidecektir. Her saat başı bölümler halinde gönderilmelidir (bölüm boyutunu Yönetim > Giden E-postalar'dan değiştirebilirsiniz). Yönetici, "Zamanlama" alanını güncelleyerek "Grup E-posta Hesaplarını Kontrol Et"'in Zamanlanmış İşini değiştirebilir.

Giriş panelinde e-postaların gönderilip gönderilmediğini kontrol edebilirsiniz.

## Alıcılara gönderilecekleri test edin

_Toplu E-posta_ panelindeki toplu e-posta satırında sağa açılan menüyü tıklayın ve ardından _Test'i Gönder_ seçeneğini tıklayın.

## Günlük Kayıtları

Kayıtlarda bunları görebilirsiniz:
* Gönderilen E-postalar;
* Alıcı tarafından açılmış gönderilmiş e-postalar;
* Alıcı tarafından tıklanmış linkler;
* Vazgeçen alıcılar;
* Geri gelen e-postalar (alıcıya ulaştırılmayan).

## Vazgeçilen link

Sistem varsayılan olarak kullanıldığında, gönderilen tüm e-postalara devre dışı bırakma ekleyecektir. Ancak E-posta Şablonunuz'da özel bir tane kullanabilirsiniz.

Örnek:
```html
<a href="{optOutUrl}">Posta listesi aboneliğinden çıkmak.</a>
```

Yönetici, Yönetim > Gönderilen E-postalar'da sistem tarafından eklenen zorunlu kaldırma bağlantısını devre dışı bırakabilir.

## İzlenen URL

Alıcınızın e-postanızdaki bağlantıyı açtığını bilmek istiyorsanız, İzleme URL'si oluşturmanız gerekir. Linkinizi yönlendirmek için herhangi bir _İsim_ ve _URL_ belirtin. Sonrasında oluşturulan kodu E-posta Şablonunuza yapıştırmanız gerekir.

 Örnek:
 ```html
<a href="{trackingUrl:55f2c87b09a220a78}">Demoyu deneyin</a>
 ```
 
## Hedef Listeleri

Hedef Listeler, Hesaplar, Kişiler, Talepler ve Kullanıcı kayıtlarının listelerini içerir. 

Kullanıcılar, Hedef Liste ayrıntısında ilgili paneldeki _Seç_ eylemini kullanarak hedef listelerini manuel olarak doldurabilir. Filtreleme yaparak arama sonuçlarını seçebilir.

## Hedef listeleri Raporlarla doldurma

[Raporlar](reports.md#syncing-with-target-lists) özelliği, hedef listeleri belirli ölçütlerle eşleşen kayıtlarla doldurma imkanı sağlar.

## Hedef Listeleri Hariç Tutma

Belirli alıcılara toplu e-posta göndermemek için Hedef Listeleri Hariç Tutun seçeneğini belirleyin. E-posta adresiyle, hariç tutulan tüm kayıtlar e-posta adresleriyle eşleşen bir kayıt varsa, ilk kayıt da hariç tutulur.

## Kampanya Günlüğü

Kampanya Günlüğünde, gönderilen e-postaları, açılmış e-postaları, geri dönen e-postaları, kimlerin hariç tutmayı ve e-postadaki bağlantıyı kimlerin tıkladığını görebilirsiniz. Günlüğün kayıtlarına dayalı olarak Hedef Listeyi (panelde sağ üst köşedeki açılır kutu) oluşturarak bu günlükten yararlanmak mümkündür. Örneğin, yalnızca bağlantıyı tıklayan kişileri seçersiniz (izleme url'si).

## Sorun Giderme

_Yöneticiler için_

#### E-postalar gönderilmezse yapılması gereken

1. Çalışıyorsa _Test Gönder_'i kontrol edin. Çalışmıyorsa, sistem SMTP ayarlarının doğru olup olmadığını kontrol edin.
2. Eğer sistem için daha sonra gönder kurduysanız kontrol edin.
3. `Toplu E-posta Gönder` için Zamanlanmış İş ve `Aktif` olup olmadığını kontrol edin ve (Yönetim > Zamanlanmış İşler > Toplu E-posta Gönder). Kayıtlarda birşeyler var mı kontrol edin.


#### Eğer crminizi yönlendirmeyen izleme URL'si yanış url ise.

`Data / config.php` dosyasındaki 'site Url' parametresini kontrol edin. Dış dünyadan erişebileceğiniz EspoCRM'nizin URL'si olarak ayarlanmalıdır.

#### Günlüğe kaydedilmeyen geri dönen e-postalar

Geri dönen e-postalar yalnızca grup e-posta hesabı tarafından işlenebilir. Geri dönen e-postaların gönderildiği posta kutusunu izleyen bir grup e-posta hesabınız olduğundan emin olun.

Ayrıca bazı posta sunucusu sağlayıcıları standartlardan sapabilir, bu nedenle geri dönen e-postalar ayırt edilemez.
