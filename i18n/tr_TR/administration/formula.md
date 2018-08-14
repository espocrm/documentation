# Hesaplanan Alanlar (Formül)

Varlık modunda spesifik varlık türü için script (formül) tanımlamak mümkündür. Bu script kayıt kaydedilmesinden önce her zaman gerçekleştirilmiş olacaktır. 

Hesaplamadan elde edilmiş değerler ile otomatik olarak spsifik alanları (semboller) ayarlamak için bir yetenek sağlar.

Formülü düzenlemek için şunu izleyin, Yönetim > Varlık Yöneticisi > gerekli varlık sırasındaki sağdaki açılır menü > Formül.

Ayrıca hesaplanmış varsayılan, Varlık Yöneticisi aracılığıyla salt okunur alanları ayarlamanız gerekebilir. 

## Sözdizimi

EspoCRM formülü bu özellik için spesifik olarak tasarlanmış basit dilde yazılır.
 
Formülde kullanılan operatörler, fonksiyon simgeleri ve değerler vardır. Ayrılmış ifadeler `;` karakteri ile sınırlandırılmış olmalıdır.

### Operatörler

* `=` - atama.
* `||` - mantıksal OR,
* `&&` - mantıksal AND,
* `!` - mantıksal NOT,
* `+`- sayısal toplama,
* `-` - sayısal çıkarma,
* `*` - sayısal çarpma,
* `/` - sayısal bölme,
* `%` - sayısal modulo,
* `==` - karşılaştırma eşit,
* `!=` - karşılaştırma eşit değil,
* `>` - karşılaştırma daha büyük,
* `<` - karşılaştırma daha küçük,
* `>=` - karşılaştırma daha büyük veya eşit,
* `<=` - karşılaştırma daha küçük veya eşit.

Operatörlerin önceliği:
* `=`;
* `||`, `&&`;
* `==`, `!=`, `>`, `<`, `>=`, `<=`;
* `+`, `-`;
* `*`, `/`, `%`.

### Semboller

Semboller hedef varlığın alan değerlerini temsil eder. Artı butonuna tıklayarak geçerli simgeleri girebilirsiniz.

Takip eden `linkName.attributeName` format ile ilgili varlıkların sembollerine erişim mümkündür.

### Fonksiyonlar

Fonksiyon kullanım biçimi: `groupName\functionName(argument1, argument2, ..., argumentN)`.

Kutu dışındaki fonksiyonlar aşağıda listelenmiştir.

#### ifThenElse
`ifThenElse(CONDITION, CONSEQUENT, ALTERNATIVE)` CONDITION ile karşılaşılırsa CONSEQUENT yap. Değilse -- o zaman ALTERNATIVE yap.

#### ifThen
`ifThen(CONDITION, CONSEQUENT)` CONDITION ile karşılaşılırsa CONSEQUENT yap. Değilse -- hiçbir şey yapma. 

#### string\concatenate(
`string\concatenate(STRING_1, STRING_2)` İki veya daha fazla diziyi sıralar.

#### string\substring
`string\substring(STRING, START, LENGTH)`  START konumu ve LENGTH ile bir STRING'den karakterleri çıkarır.   

LENGTH çıkarılırsa, START'tan STRING'in sonuna kadar başlatılan alt dizi getirilmiş olacak.

LENGTH negatifse, o zaman bu birçok karakter STRING'in sonundan çıkarılmış olacak.

#### string\\trim
`string\trim(STRING)` Başlangıçtan ve STRING'in sonundan beyazalanı çıkarır.

#### string\\lowerCase
`string\lowerCase(STRING)` Harfleri küçük harfe dönüştürür. (Sürüm 5.0.0'den beri)

#### string\\upperCase
`string\upperCase(STRING)` Harfleri büyük harfe dönüştürür. (Sürüm 5.0.0'den beri)

#### datetime\\today
`datetime\today()` Bugünün tarhini getirir.

#### datetime\now
`datetime\now()` Geçerli tarih saati getirir.

#### datetime\format
`datetime\format(VALUE, [TIMEZONE], [FORMAT])` Tarih veya tarih saat VALUE'yu uygulama ayarlarına göre biçimlendirilmiş diziye dönüştürür. TIMEZONE ve FORMAT çıkarılablir. TIMEZONE çıkarılırsa o zaman varsayılan zaman dilimi kullanılır. FORMAT çıkarılırsa o zaman varsayılan format kullanılır. 

#### datetime\date
`datetime\date(VALUE, [TIMEZONE])` Ayın gününü getirir (1-31). `0` VALUE boşsa. TIMEZONE çıkarılırsa o zaman sistem zaman dilimi kullanılır. (4.7.0 sürümünden beri)

#### datetime\month
`datetime\month(VALUE, [TIMEZONE])` Ayı getirir (1-12). `0` VALUE boşsa. TIMEZONE çıkarılırsa o zaman sistem zaman dilimi kullanılır. (4.7.0 sürümünden beri)

#### datetime\year
`datetime\year(VALUE, [TIMEZONE])` Yılı getirir. `0` VALUE boşsa. TIMEZONE çıkarılırsa o zaman sistem zaman dilimi kullanılır. (4.7.0 sürümünden beri)

#### datetime\hour
`datetime\hour(VALUE, [TIMEZONE])` Saati getirir (0-23). `-1` VALUE boşsa. TIMEZONE çıkarılırsa o zaman sistem zaman dilimi kullanılır. (4.7.0 sürümünden beri)

#### datetime\minute
`datetime\minute(VALUE, [TIMEZONE])` Dakikayı getirir (0-59). `-1` VALUE boşsa. TIMEZONE çıkarılırsa o zaman sistem zaman dilimi kullanılır. (4.7.0 sürümünden beri)

#### datetime\dayOfWeek
`datetime\dayOfWeek(VALUE, [TIMEZONE])` Haftanın günlerini getirir (0-6). `-1` VALUE boşsa. `0` Pazar için. TIMEZONE çıkarılırsa o zaman sistem zaman dilimi kullanılır. (4.7.0 sürümünden beri)

#### datetime\diff
`datetime\diff(VALUE_1, VALUE_2, INTERVAL_TYPE)` İki tarih veya zaman dilimi arasındaki farkı getirir. INTERVAL_TYPE 'yıllar', 'aylar', 'günler', 'saatler', 'dakikalar' olabilir. Başarısız olursa `null` getirir. VALUE_1 < VALUE_2 sağlanırsa sonuç negatif olacaktır. 

#### datetime\addMinutes
`datetime\addMinutes(VALUE, MINUTES)` Zaman dilimi VALUE'ya MINUTES ekler. MINUTES negatif olabilir.

#### datetime\addHours
`datetime\addHours(VALUE, HOURS)` Zaman dilimi VALUE'ya HOURS ekler. HOURS negatif olabilir.

#### datetime\addDays
`datetime\addDays(VALUE, DAYS)` Zaman veya zaman dilimi VALUE'ya DAYS ekler. DAYS negatif olabilir.

#### datetime\addWeeks
`datetime\addWeeks(VALUE, WEEKS)` Zaman veya zaman dilimi VALUE'ya WEEKS ekler. WEEKS negatif olabilir.

#### datetime\addMonths
`datetime\addMonths(VALUE, MONTHS)` Zaman veya zaman dilimi VALUE'ya MONTHS ekler. MONTHS negatif olabilir.

#### datetime\addYears
`datetime\addYears(VALUE, YEARS)` Zaman veya zaman dilimi VALUE'ya YEARS ekler. YEARS negatif olabilir.

#### datetime\closest
`datetime\closest(VALUE, TYPE, TARGET, [IS_PAST], [TIMEZONE])` En yakın zaman veya zaman dilimini geçmiş argümana bağlı VALUE'ye getirir. (Sürüm 5.0.0'dan beri) 

TYPE sıralanan şu değerlerden biri olabilir: 'time', 'minute', 'hour', 'date', 'month', 'dayOfWeek'. TARGET bir tamsayı değeri veya bir dizi değeridir. IS_PAST geçmişteki en yakını bulmak anlamına gelir. TIMEZONE çıkarılırsa o zaman varsayılan zaman dilimi kullanılır. 

Örnekler:

`datetime\closest(datetime\now(), 'time', '20:00')` Gelecekteki en yakın zaman dilimini 20:00 zamanı getirecek.

`datetime\closest('2017-11-20', 'date', 1, true)` `2017-11-01`, ayın ilk gününü getirecek. 

`datetime\closest(datetime\now(), 'dayOfWeek', 1)` Gelecek Pazartesi'yi (günün başlangıcı) getirecek. 

#### number\format
`number\format(VALUE, [DECIMALS], [DECIMAL_MARK], [THOUSAND_SEPARATOR])` Sayısal VALUE'yu bir spesifik biçime veya varsayılan uygulama ayarlarına göre biçimlendirilmiş diziye dönüştürür. DECIMALS, DECIMAL_MARK OR THOUSAND_SEPARATOR ise, o zaman sistem varsayılanları kullanılır. 

Örnekler:

`number\format(2.666667, 2)` - 2.67 sonuçlar;

`number\format(1000, 2)` - 1,000.00 sonuçlar; 

`number\format(10.1, 0)` - 10 sonuçlar.


#### number\abs
`number\abs(VALUE)` Kesin değer. VALUE sayısal değilse geçersiz olarak getirir. .

#### number\round
`number\round(VALUE, PRECISION)` VALUE'nun yuvarlanmış değerini belirli PREECISION'a getirir (ondalık noktadan sonraki basamak sayısı). PRECISION negatif veya sıfır (varsayılan) olabilir. 

#### number\floor
`number\floor(VALUE)` Gerekliyse aşağı yuvarlayarak sonraki en küçük tam sayı değeerini getirir. (4.9.0 sürümünden beri)

#### number\ceil
`number\ceil(VALUE)` Gerekliyse yukarı yuvarlayarak sonraki en büyük tam sayı değeerini getirir. (4.9.0 sürümünden beri)

#### entity\isNew
`entity\isNew()` Varlık yeniyse (oluşturuluyorsa) TRUE ve değilse (güncelleniyorsa) FALSE getirir.

#### entity\\isAttributeChanged
`entity\isAttributeChanged(ATTRIBUTE)` Varlığın ATTRIBUTE'u değiştirilmişse TRUE getirir.

Örnek:

`entity\isAttributeChanged('status')`

#### entity\isAttributeNotChanged
`entity\isAttributeNotChanged(ATTRIBUTE)` Varlığın ATTRIBUTE'u değiştirilmemişse TRUE getirir.

#### entity\attributeFetched
`entity\attributeFetched(ATTRIBUTE)` Hedef varlık veritabanından çekildiğinde ayarlanmış simge. Değiştirilmeden önce.

Örnek:

`entity\isAttributeChanged('assignedUserId')`

#### entity\addLinkMultipleId
`entity\addLinkMultipleId(LINK, ID)` Link Çoklu alana kimlik ekler. Örneğin, 'teams' alanına 'someTeamId' ekle.

`entity\addLinkMultipleId(LINK, ID_LIST)` Kimliklerin listesini ekler. (4.8.3 sürümünden beri)

#### entity\hasLinkMultipleId
`entity\hasLinkMultipleId(LINK, ID)` Link Çoklu alanın belirli kimliğinin olup olmadığını denetler.

#### entity\removeLinkMultipleId
`entity\removeLinkMultipleId(LINK, ID)` Link Çoklu alandan belirli bir kimlik kaldırır.

#### entity\isRelated
`entity\isRelated(LINK, ID)` Hedef varlığın LINK ve ID ile temsil edilen başka bir varlık ile ilgili olup olmalığını denetler. 

#### env\userAttribute
`env\userAttribute(ATTRIBUTE)` Geçerli kullanıcının ATTRIBUTE'unu getirir.

#### list
`list(VALUE-1, ... VALUE-N)` Sıralama getirir. (4.7.0 sürümünden beri)

#### array\includes
`array\includes(LIST, VALUE)` LIST, VALUE içeriyorsa true getirir. Sıralama ve ÇokluSıra alanlarında kullanılabilir. (4.7.0 sürümünden beri)

#### array\push
`array\push(LIST, VALUE1 [, VALUE2 ...])` Bir sıralamanın sonuna bir veya daha fazla eleman ekler ve yeni sıralama getirir. (5.0.0 sürümünden beri)

#### array\length
`array\length(LIST)` LIST içindeki eleman sayısını getirir. (4.8.1 sürümünden beri) 


### Değerler

* Diziler. Örn. 'bazı diziler';
* Tam sayılar. Örn. 1, 100, 40300.
* Kesirli sayılar. Örn. 5.2.

### Değişkenler

Formülde özel değişkenler tanımlamak mümkündür.
```
$someVariableName = 'Test';
description = $test;
```


## Örnekler

```
ifThen(
  entity\isNew() && assignedUserId == null,
  assignedUserId = 'managerId'
);

ifThen(
  entity\isNew() && closeDate == null && stage == 'Closed Won',
  datetime\today()
);
```

```
amount = product.listPrice - (product.listPriceConverted * discount / 100.0);
amountCurrency = 'USD';
```

```
someField = string\concatenate(firstName, " '", middleName, "' ", lastName);
```

```
ifThenElse(
  entity\isNew() && status == 'Planned' && dateStart == null,
  dateStart = datetime\addDays(datetime\now(), 10),
  ifThen(
    status == 'Held' && dateStart == null,
    dateStart = datetime\now()
  )
);

```

## İş akışında formül kullanımı

İş akışı durumlarında ve çalışmalarında formülden yararlanabilirsiniz. Daha fazla bilgi için [workflows documentation](workflows.md)'ye bakın.

