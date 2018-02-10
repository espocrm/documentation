# Hesaplanmış Alanlar (Formül)

Varlık yöneticisinde, belirli varlık türü için komut dosyasını (formül) tanımlamak mümkündür. Bu script, kayıt kaydedilmeden önce her defasında yürütülecektir.
 
Hesaplamadan türetilen değerler ile belirli alanların (niteliklerin) otomatik olarak ayarlaması olanağını sağlar.

Formülü düzenlemek için, Yönetim> Varlık Yöneticisi>Açılır menüsündeki gerekli satırın sağındaki Entity>Formül yolunu izleyin.

Hesaplanması beklenen alanları, Varlık Yöneticisi aracılığıyla sadece okunur olarak ayarlamanız gerekebilir.


## Söz Dizimi

EspoCRM formülü, bu özellik için özel olarak tasarlanmış olan basit dilde yazılmıştır.

Formülde kullanılabilen operatörlerin, işlevsel nitelikleri ve değerleri vardır. Ayrılmış ifadeler `;` karakteriyle sınırlandırılmalıdır.

### Operatörler

* `=` - atama.
* `||` - mantıksal VEYA,
* `&&` - mantıksal VE,
* `!` - mantıksal DEĞİL,
* `+`- sayısal toplama,
* `-` - sayısal çıkarma,
* `*` - sayısal çarpma,
* `/` - sayısal bölme,
* `%` - sayısal yüzde,
* `==` - eşittir karşılaştırması,
* `!=` - eşit değildir karşılaştırması,
* `>` - büyüktür karşılaştırması,
* `<` - küçüktür karşılaştırması,
* `>=` - büyük veya eşittir kaşılaştırması,
* `<=` - küçük veya eşittir karşılaştırması.

Operatörlerin öncelik sırası:
* `=`;
* `||`, `&&`;
* `==`, `!=`, `>`, `<`, `>=`, `<=`;
* `+`, `-`;
* `*`, `/`, `%`.

### Öznitelikler

Nitelikler, hedef varlığın alan değerlerini temsil eder. Artı düğmesine tıklayarak mevcut özelliklere ekleyebilirsiniz..

İlişkili varlığın niteliklerine aşağıdaki `linkName.attributeName` formatıyla erişmek mümkündür:


### Fonksiyonlar

Fonksiyon kullanım şekli: `groupName\functionName(argument1, argument2, ..., argumentN)`.

Kutudan çıkan işlevler aşağıda listelenmiştir.

#### ifThenElse
`ifThenElse(CONDITION, CONSEQUENT, ALTERNATIVE)` CONDITION sağlanırsa, CONSEQUENT'i yapın. Değilse - ALTERNATİF'i yapın.


#### ifThen
`ifThen(CONDITION, CONSEQUENT)` CONDITION karşılanırsa, CONSEQUENT'i yapın. Yoksa - başka hiçbir şey yapmayın.

#### string\concatenate(
`string\concatenate(STRING_1, STRING_2)` İki veya daha fazla stringleri birleştirir.

#### string\substring
`string\substring(STRING, START, LENGTH)`  Karakterleri STRING'in başlangıç konumuna ve uzunluğuna göre ayıklar. 

LENGTH atlanırsa, başlanğıçtan başlayıp STRING'in sonuna kadar olan alt dize döndürülür.

LENGTH negatifse, bu birçok karakter STRING'in sonuna çıkartılır.

#### string\\trim
`string\trim(STRING)` STRING'in başından ve sonundan itibaren boşlukları giderir.

#### string\\lowerCase
`string\lowerCase(STRING)` Harfleri küçük harfe dönüştürür. (5.0.0 sürümünden bu yana)

#### string\\upperCase
`string\upperCase(STRING)` Harfleri büyük harfe dönüştürür. (5.0.0 sürümünden bu yana)

#### datetime\\today
`datetime\today()` Bugünün tarihini döndürür.

#### datetime\now
`datetime\now()` Geçerli tarih saatini döndürür.

#### datetime\format
`datetime\format(VALUE, [TIMEZONE], [FORMAT])` Uygulama ayarlarına göre biçimlendirilmiş stringin biçimine tarih veya tarih saatinin DEĞER'ini dönüştürür. SAAT DİLİMİ ve FORMATI atlanabilir. SAAT DİLİMİ atlanırsa, varsayılan saat dilimi kullanılacaktır.Eğer FORMAT atlanırsa varsayılan format kullanılır.

#### datetime\date
`datetime\date(VALUE, [TIMEZONE])` Ayın tarihini döndürür (1-31).  Eğer SAAT DİLİMİ atlandıysa sistem saat dilimi kullanılır. (sürüm 4.7.0'dan beri)

#### datetime\month
`datetime\month(VALUE, [TIMEZONE])` Ayları döndürür(1-12). Eğer DEĞERİ `0` ise boştur. Eğer SAAT DİLİMİ atlandıysa sistem saat dilimi kullanılır. (sürüm 4.7.0'dan beri)

#### datetime\year
`datetime\year(VALUE, [TIMEZONE])` Yılı döndürür. Eğer DEĞERİ `0` ise boştur. Eğer SAAT DİLİMİ atlandıysa sistem saat dilimi kullanılır. (sürüm 4.7.0'dan beri)

#### datetime\hour
`datetime\hour(VALUE, [TIMEZONE])` Saati döndürür (0-23). Eğer DEĞERİ `-1` ise boştur. Eğer SAAT DİLİMİ atlandıysa sistem saat dilimi kullanılır. (sürüm 4.7.0'dan beri)

#### datetime\minute
`datetime\minute(VALUE, [TIMEZONE])` Dakikayı döndürür (0-59). Eğer DEĞERİ `-1` ise boştur. Eğer SAAT DİLİMİ atlandıysa sistem saat dilimi kullanılır. (sürüm 4.7.0'dan beri)

#### datetime\dayOfWeek
`datetime\dayOfWeek(VALUE, [TIMEZONE])` Haftanın günlerini döndürür (0-6). Eğer DEĞERİ `-1` ise boştur `0` ise Pazar günüdür. ğer SAAT DİLİMİ atlandıysa sistem saat dilimi kullanılır. (sürüm 4.7.3'dan beri)


#### datetime\diff
`datetime\diff(VALUE_1, VALUE_2, INTERVAL_TYPE)` İki tarih veya tarih arasındaki farkı döndürür. INTERVAL_TYPE, 'yıl', 'ay', 'gün', 'saat', 'dakika' olabilir. Eğer başarısız olursa `boşş` döndürür. VALUE_1<VALUE_2 olan sonuç negatiftir.

#### datetime\addMinutes
`datetime\addMinutes(VALUE, MINUTES)` Tarih DEĞERİ için DAKİKA eklendi. DAKİKALAR negatif olabilir.

#### datetime\addHours
`datetime\addHours(VALUE, HOURS)` Tarih DEĞERİ için SAAT eklendi. SAATLER negatif olabilir.

#### datetime\addDays
`datetime\addDays(VALUE, DAYS)` Tarih DEĞERİ için GÜNLER eklendi. GÜNLER negatif olabilir.

#### datetime\addWeeks
`datetime\addWeeks(VALUE, WEEKS)` Tarih DEĞERİ için HAFTALAR eklendi. HAFTALAR negatif olabilir.

#### datetime\addMonths
`datetime\addMonths(VALUE, MONTHS)` Tarih DEĞERİ için AYLAR eklendi. AYLAR negatif olabilir.

#### datetime\addYears
`datetime\addYears(VALUE, YEARS)` Tarih DEĞERİ için YILLAR eklendi. YILLAR negatif olabilir.

#### datetime\closest
`datetime\closest(VALUE, TYPE, TARGET, [IS_PAST], [TIMEZONE])` Geçilen bağımsız değişkenlere dayanarak en yakın tarihi veya zaman dilimi DEĞERİNİ döndürür. (

TİP şu değerlerden biri olabilir: 'zaman', 'dakika', 'saat', 'tarih', 'ay', 'HaftanınGünleri'. HEDEF bir tamsayı değer veya string değeridir. IS_PAST, geçmişe en yakın olanı bulmak anlamına gelir. ZAMAN DİLİMİ atlanırsa varsayılan saat dilimi kullanılır.

Örnekler:

`datetime\closest(datetime\now(), 'time', '20:00')` Gelecek olan 20:00'a en yakın saat dilimi değerini döndürür.

`datetime\closest('2017-11-20', 'date', 1, true)` Ayın ilk günü olan `2018-02-01`'i geri döndürür.

`datetime\closest(datetime\now(), 'dayOfWeek', 1)` Sonraki Pazartesi gününü (günün başında) döndürür.

#### number\format
`number\format(VALUE, [DECIMALS], [DECIMAL_MARK], [THOUSAND_SEPARATOR])` Sayısal DEĞERİNİ, belirli bir biçimde veya varsayılan uygulama ayarlarına göre biçimlendirilmiş string haline dönüştürür. Eğer ONDALIK,  DECIMAL_MARK veya THOUSAND_SEPARATOR ise, sistem varsayılanları kullanır.

Örnekler:

`number\format(2.666667, 2)` - sonuçlar 2.67;

`number\format(1000, 2)` - sonuçlar 1,000.00;

`number\format(10.1, 0)` - sonuçlar 10.


#### number\abs
`number\abs(VALUE)` Mutlak değer. DEĞERİ sayısal değilse boş döndürür.

#### number\round
`number\round(VALUE, PRECISION)` DEĞERİN yuvarlanması, belirtilen HASSASİYETİ (ondalık noktasından sonraki basamak sayısı) döndürür. HASSASİYET negatif veya sıfır olabilir (varsayılan).

#### number\floor
`number\floor(VALUE)` Gerektiğinde değeri yuvarlarken bir sonraki en düşük tamsayı değerini döndürür. (sürüm 4.9.0'dan beri)

#### number\ceil
`number\ceil(VALUE)` Gerektiğinde değeri yuvarlarken bir sonraki en yüksek tamsayı değerini döndürür. (sürüm 4.9.0'dan beri)

#### entity\isNew
`entity\isNew()` Varlık yeni(yaratılan) ise DOĞRU, değilse (güncellenirken) FALSE döndürür.

#### entity\\isAttributeChanged
`entity\isAttributeChanged(ATTRIBUTE)` Varlığın ÖZNİTELİK değeri değiştiyse, TRUE değerini döndürülür.

Örnek:

`entity\isAttributeChanged('status')`

#### entity\isAttributeNotChanged
`entity\isAttributeNotChanged(ATTRIBUTE)` Varlığın ÖZNİTELİK değeri değiştirilmediyse, TRUE değerini döndürülür.

#### entity\attributeFetched
`entity\attributeFetched(ATTRIBUTE)` Hedef varlık veritabanından alındığında belirlenen özelliktir. Değişiklik yapılmadan önceki.

Örnek:

`entity\isAttributeChanged('assignedUserId')`

#### entity\addLinkMultipleId
`entity\addLinkMultipleId(LINK, ID)` Birden Fazla Bağlantı Noktasına ID ekler. Örneğin, 'teams' alanına 'someTeamId' ekleyin.

`entity\addLinkMultipleId(LINK, ID_LIST)` Kimliklerin listesini ekler. (sürüm 4.8.3'ten beri)

#### entity\hasLinkMultipleId
`entity\hasLinkMultipleId(LINK, ID)` Çoklu bağlantı alanının belirli ID'ye sahip olup olmadığını kontrol eder.


#### entity\removeLinkMultipleId
`entity\removeLinkMultipleId(LINK, ID)` Birden Fazla Bağlantı alanındaki belirli bir kimliği kaldırır.

#### entity\isRelated
`entity\isRelated(LINK, ID)` Hedef varlığın LINK ve kimlik tarafından temsil edilen başka bir varlıkla ilişkisi olup olmadığını kontrol eder.

#### env\userAttribute
`env\userAttribute(ATTRIBUTE)` Geçerli kullanıcının ÖZNİTELİK değerini döndürür.

#### list
`list(VALUE-1, ... VALUE-N)` Diziyi döndürür. (sürüm 4.7.0'dan beri)

#### array\includes
`array\includes(LIST, VALUE)` LISTE, DEĞER içeriyorsa TRUE döndürür. Dizi ve Çoklu-Enum alanları için kullanılabilir.(sürüm 4.7.0'dan beri)

#### array\push
`array\push(LIST, VALUE1 [, VALUE2 ...])` Bir dizinin sonuna bir veya daha fazla öğe ekler, ve yeni diziyi döndürür. (5.0.0 sürümünden bu yana)

#### array\length
`array\length(LIST)` LISTE içindeki elemanların sayısını döndürür. (sürüm 4.8.1'den beri)

### Değerler

* Strings. Örneğin: 'some string';
* Tamsayılar. Örneğin: 1, 100, 40300.
* Virgüllü sayılar. Örneğin: 5.2.

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

## İş Akışlarında formül kullanma

Formülü iş akışı koşullarında ve işlemlerde kullanabilirsiniz. Daha fazla bilgi için [iş akış belgeleri] (workflows.md) konusuna bakın.
