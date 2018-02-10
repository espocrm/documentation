# Teklifler

Tekliflerin özelliği [Gelişmiş Paket]'de mevcuttur (https://www.espocrm.com/extensions/advanced-pack/).

Teklifler, müşterilere teklif ettiğiniz miktar ve fiyatlarla belirli ürün veya hizmet grubudur.

Tekliflerin fırsatlar ile bir ilişkisi vardır. Fırsat ayrıntısına, Yönetim> Düzen Yöneticisi> Fırsatlar> İlişkiler'de Teklifler panelini ekleyebilirsiniz. Bir fırsata bağlı yeni bir fiyat teklifi hazırlarken fırsat öğelerini fiyat teklifine geçirir.

İlgili teklifleri görebilmek için Accunt'in detaylı görünümüne Teklifler panelini ekleyebilirsiniz. Bunu, Yönetim> Düzen Yöneticisi> Hesaplar> İlişkiler'de yapabilirsiniz.

## Teklif Öğeleri

Alıntıların bir öğe listesi vardır. Her bir madde, açıklama, miktar, vergi oranı, liste fiyatı ve birim fiyatı alanlarıyla belli bir ürünü veya hizmeti temsil edebilir. Öğeleri elle sıralamak mümkündür.

Öğe Yöneticisi'ni kullanarak Alıntı Elemanı öğesi için özel alanlar ekleme özelliği mevcuttur.

## Şablonlar

Varsayılan olarak iki mevcut şablon vardır: Alıntı ve Fatura. Yeni şablonlar (Teklifler listesi görünümü> sağ üst açılır menü> Şablonlar) oluşturabilir ve var olanları düzenleyebilirsiniz.

Daha hassas düzenleme için Kod Görünümü modunu kullanmanız önerilir.

Şablonunuzdaki yer tutucuları kullanarak alıntı kayıt alanlarını ve ilgili kayıt alanlarını yazdırabilirsiniz.

Örnekler:
`{{accountName}}` â€“ Kullanıcı adı,

`{{{billingAddressStreet}}}` â€“ cadde,

`{{account.type}}` â€“ ilgili kullanıcı türü,

`{{assignedUser.lastName}}` â€“ giriş yapan kullanıcının soyadı.

Satır öğeniz bir ürünse, ürünlerin alanlarını yazdırabilirsiniz.

Örnekler:
`{{product.length}}`, 

`{{product.color}}`.

Uzunluk ve renk, örneklerde ürün ögesinin özel alanlarıdır.

Teklif Ögeleriyle Döngü:

```
<!-- {{#each itemList}} -->
  <td>{{order}}</td>
  <td>{{name}}</td>
  <td>{{quantity}}</td>
  <td>{{product.weight}}</td>
  <td align="right">{{listPrice}}</td>
  <td align="right">{{unitPrice}}</td>
  <td align="right">{{amount}}</td>
<!-- {{/each}} -->
```

Resim alanlarını baskılamak mümkündür:

```
<img src="{{file imageId}}">
```
Burada `imageId` â€“ alıntı ögelerdeki özel resim alanının adı` ID` sonekiyle birleştirilmiş haldedir.

Ürün satır öğesi için:
```
<img src="{{file product.photoId}}">
```

Şeffaf sayıları (örneğin miktar, birim fiyat vb.) görüntülemek için kesirli kısımda (tam sayı olarak) aşağıdaki ifadeleri kullanın (sürüm 4.8.3'ten beri):
```
{{numberFormat quantity_RAW decimals=0}}
```

Para birimi değerleri için özel biçimlendirme (sürüm 4.8.3'ten beri):
```
{{numberFormat unitPrice_RAW decimals=2 decimalPoint=',' thousandsSeparator=' '}}
```
'10000.5' değeri '10 000,50' olarak baskılancaktır.

Metin dosyalarını görüntülemek için (çok satırlı) üçlü parantez kullanın: `{{{description}}}`.

## PDF'ye Yazdır

Teklifler PDF'ye basılabilir. Bu işlem, teklif'in ayrıntı görünümündeki Düzenle butonunun yanında açılır menüde mevcuttur. Ardından Şablon'u seçmeniz istenir.

## E-Posta Teklifi

Alıntı PDF e-postayla ek olarak gönderilebilir. Teklif kaydını açın, Düzenle düğmesinin yanındaki açılır listeyi tıklayın ve E-posta PDF'yi tıklayın.

## Otomatik numaralama

Alıntı ögesi türü için Öğe Yöneticisi aracılığıyla Bir Sayı alanı oluşturabilirsiniz. Yönetim> Öğe Yöneticisi> Alıntıla> Alanlar> Alan Ekle> Numara. Ardından, Layout Manager'ı kullanarak ayrıntı görünümüne yerleştirmeniz gerekir.

Değer, her yeni teklif tarafından artırılacaktır. Önek yanı sıra, sonraki numarayı belirtme olanağı vardır.

## Varsayılan vergi

EspoCRM 4.8.0'den beri mevcut.

1. Yönetim> Kuruluş Yöneticisi> Teklifler> Alanlar> Vergi> Varsayılan'da varsayılan vergi kaydını belirtin.
2. Varsayılan vergi oranını Yönetim> Kuruluş Yöneticisi> Teklif> alanlar> Vergi Oranı> Varsayılan değerlerinden belirleyin.

## Faturalar

Onaylandığında bir fatura olarak ele alınabilir. Sonra _Fatura Tarihi_, _ Fatura Numarası_ alanları görünür. Faturaları baskılamak için farklı şablonlar kullanabilirsin.
