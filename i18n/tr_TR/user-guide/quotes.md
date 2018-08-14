# Fiyatlandırma

Fiyatların özelliği [Gelişmiş Paket] içerisinde mevcuttur.(https://www.espocrm.com/extensions/advanced-pack/).

Fiyatlandırma, müşterilere teklif ettiğiniz miktar ve fiyatlarla belirli ürün veya hizmet grubudur.

Fiyatlandırma fırsat ile bir ilişkilidir. Fırsatlar ayrıntısını fiyatlandırma paneline  Yönetim> Düzen Yöneticisi> Fırsatlar> İlişkilere ekleyebilirsiniz.Bir fırsata bağlı yeni bir fiyat teklifi hazırlarken fırsat öğelerini fiyat teklifine aktarılır.

İlgili teklifleri görebilmek için Hesapın detaylı görünümüne Fiyat panelini ekleyebilirsiniz. Bunu, Yönetim>Düzen Yöneticisi> Hesaplar> İlişkilerde de yapabilirsiniz.

## Ürünlerin Fiyatandırması

Fiyatlandırmanın bir ürün listesi vardır. Her bir madde, açıklama, miktar, vergi oranı, liste fiyatı ve birim fiyat alanlarıyla belli bir ürünü veya hizmeti temsil edebilir. Öğeleri manuel olarak sıralamak mümkündür.

Varlık Yöneticisi'ni kullanarak Fiyat Elemanı varlığı için özel alanlar ekleme özelliği vardır.

## Şablonlar

Varsayılan olarak iki mevcut şablon vardır: Fiyat ve Fatura. Yeni şablonları (Quotes list view> top-right dropdown menu> Templates) oluşturabilir ve var olanları düzenleyebilirsiniz.

Daha hassas düzenleme için Kod Görünümü modunu kullanmanız önerilir.

Şablonunuzdaki yer tutucuları kullanarak Fiyatlandırma kayıt alanlarını ve ilgili kayıt alanlarını yazdırabilirsiniz.

Örnekler:
`{{accountName}}` – Hesap adı,

`{{{billingAddressStreet}}}` – Soka,

`{{account.type}}` – ilgili hesap türü,

`{{assignedUser.lastName}}` – atanmış kullanıcının soyadı.

Satır öğeniz bir ürünse, ürün alanlarını yazdırabilirsiniz.

Örnekler:
`{{product.length}}`, 

`{{product.color}}`.

Uzunluk ve renk, örneklerde Ürün varlığının özel alanlarıdır.

Teklif ürünleriyle döngü:

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

Resim alanlarını basmak mümkündür:

```
<img src="{{file imageId}}">
```
Nerede `imageId` – Fiyat nesnesinde özel imaj alanının adını `ID` sonekiyle bitiştirilir.

Ürün için üretim hattı:

```
<img src="{{file product.photoId}}">
```

Virgüllü sayıları (örneğin miktar, birim fiyat vb.) Görüntülemek için kesirli kısmı (tam sayı olarak) aşağıdaki ifadeleri kullanınız (sürüm 4.8.3'ten beri):

```
{{numberFormat quantity_RAW decimals=0}}
```

Para birimi değerleri için özel biçimlendirme (sürüm 4.8.3'ten beri):

```
{{numberFormat unitPrice_RAW decimals=2 decimalPoint=',' thousandsSeparator=' '}}
```
 `10000.5` değeri  `10 000,50` yazıcı olacaktır. 

Metin alanlarını görüntülemek için (çok satırlı) üçlü parantez kullanın: `{{{description}}}`.

## PDF'ye yazdır

Fiyatlandırmalar PDF'ye yazdırılabilir. Bu işlem teklifin ayrıntılı görünümü Düzenle düğmesinin yanında açılır menüde mevcuttur.Devamında Şablon'u seçmeniz istenecektir.


## E-Postaya gönderilen fiyatlar

Fiyatlandırmalar PDF e-postayla ek olarak gönderilebilir. Teklif kaydını açın, Düzenle butonunun yanındaki açılır listeye tıklayın ve E-posta PDF'e göndermeye tıklayın..

## Otomatik numaralandırma

Fiyatlandırmanın varlık türü için Varlık Yöneticisi aracılığıyla bir numara alanı oluşturabilirsiniz. Yönetim> Varlık Yönetimi> Fiyatlar> Alanlar> Alan Ekle> Numara. Ardından, Düzen Yöneticisi'ni kullanarak ayrıntılı görünümüne yerleştirmeniz gerekmektedir.

Değer, her yeni teklif tarafından artırılacaktır. Önekin yanı sıra sonraki numarayı belirtme olanağı da vardır.

## Varsayılan vergi

EspoCRM 4.8.0'dan beri mevcut.

1. Yönetim> Kuruluş Yöneticisi> Fiyatlar > Alanlar> Vergi> Varsayılan'da, varsayılan vergi kaydını belirtin.
2. Varsayılan vergi oranını Yönetim> Kuruluş Yöneticisi> Fiyatlar> Alanlar> Vergi Oranı> Varsayılan değerlerinden belirleyin.

## Faturalar

Fiyatlandırma durumu `Onaylandığında` bir fatura olarak ele alınabilir.Ardından Faturalandırılmış Tarih, Fatura Numarası alanları görülür. Faturaları yazdırmak için farklı şablon kullanabilirsiniz.

