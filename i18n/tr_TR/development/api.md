# REST Uygulaması(API)

EspoCRM bir tek sayfa uygulamasıdır, bu nedenle bir ön uç,  arka uçla bağlanmantılı olmak için REST API'yı kullanmaktadır.
Programlama dilinizi kullanarak API çağrılarıyla uygulayabileceğiniz UI'yı kullanarak gerçekleştirdiğiniz tüm işlemlerdir.
Tarayıcı konsolunuzdaki ağ sekmesinde neler olduğunu takip ederseniz API'nın nasıl çalıştığını öğrenebilirsiniz.

Çoğu API fonksiyonları JSON'u döndürür. POST, PATCH çağrıları genelde yük altında, bazı JSON verilerine ihtiyaç duyarlar.

EspoCRM API'sinin temel URL'si: `api/v1/`. Bu referans içindeki ifadelerle başa eklemeniz gerekmektedir. Örneğin:

`GET http://your_domain/api/v1/Contact/55643ca033f7ab4c5`.

## Yetkilendirme

EspoCRM API'sı [Temel Kimlik Doğrulaması]nı (http://en.wikipedia.org/wiki/Basic_access_authentication) kullanır. Kullanıcı adı ve şifre/simge, base64'de kodlanmıştır 'Yetkilendirme' başlığı sayesinde geçirilir.

`"Authorization: Basic " + base64Encode(username  + ':' + password)`


API ile çalışırken şifre yerine onay simgesi kullanmak daha iyidir. Bu durumda, `Espo-Yetkilendirme` başlığında kullanıcı adı ve şifre/simge girmeniz gerekecektir.
```
"Espo-Authorization: " + base64Encode(username  + ':' + passwordOrToken)
```

1. `Espo-Yetkilendirme` başlığında elde edilen kullanıcı adı ve şifreyle `GET App/user` isteği ile erişim simgesini edininiz.
2. Daha fazla istek için `Espo-Yetkilendirme` başlığındaki şifre yerine bu simgeyi kullanınız.
3. Eğer İstek, 403 hatası döndürürse, kullanıcı adı/şifre yanlış veya simge artık geçerli değil demektir.

#### Kimlik Doğrulama Simgesi/Kullanıcıya Özgü Veri

`GET App/user`

Sonuçlar:

* `token` - kullanmak için erişim izni;
* `acl` - kullanıcı erişimi hakkındaki bilgi;
* `preferences` - Kullanıcı tercihleri;
* `user` - kullanıcı kayıtlı özellikleri.


## CRUD İşlemleri

#### Listelenmiş Varlıklar

`GET {entityType}`

GET parametleri:

* `offset` - (int) ofset;
* `maxSize` - (int) maksimum boyut;
* `where` - (array) filtreler;
* `sortBy` - (string) sıralamak için alan;
* `asc` - (bool) sıralama yönü.

_Örnek_

`GET Account?offset=0&maxSize=20`

Sonuçlar:
```
{
  "list": [... array of records...],
  "total": {totalCountOfRecords}
}
```

#### Varlıkları Oku

`GET {entityType}/{id}`

JSON nesnesindeki öznitelikleri döndürür.

_Örnek_

`GET Account/5564764442a6d024c`

#### Varlık Yarat

`POST {entityType}`

Payload: Varlık özniteliklerinin nesnesidir.

JSON nesnesindeki öznitelikleri döndürür.

_Örnek_

`POST Account`

Payload:
```
{
  "name": "Test",
  "assignedUserId": "1"
}
```

#### Varlığı Güncelleme

`PATCH {entityType}/{id}`

veya

`PUT {entityType}/{id}`

Payload: Varlık özelliklerinin nesnesinin değiştirilmesi gereklidir.

JSON nesnesindeki öznitelikleri döndürür.

_Örnek_

`PATCH Account/5564764442a6d024c`

Payload:
```
{
  "assignedUserId": "1"
}
```

#### Varlığı Silmek

`DELETE {entityType}/{id}`

_Örnek_

`DELETE Account/5564764442a6d024c`


## İlgili Varlıklar

#### İlişkili Varlıkları Listele

`GET {entityType}/{id}/{link}`

* `offset` - (int) ofset;
* `maxSize` - (int) maksimum boyut;
* `where` - (array) filtreler;
* `sortBy` - (string) sıralamak için alan;
* `asc` - (bool) sıralama yönü.

_Örnek_

`GET Account/5564764442a6d024c/opportunities`

Sonuçlar:
```
{
  "list": [... array of records...],
  "total": {totalCountOfRecords}
}
```

#### Varlıkların Bağlantısı

`POST {entityType}/{id}/{link}`

Payload:

1. `id` nitelik.
2. `ids` dizi niteliği.
3. `"massRelate": true` ve `"where": {...}` arama kriterlerine göre birden fazla kaydı ilişkilendirmek içindir.

_Örnek_

`POST Account/5564764442a6d024c/opportunities`

Payload:
```
{
  "id": "55646fd85955c28c5"
}
```

#### Varlığın Bağlantısını Kopartmak

`DELETE {entityType}/{id}/{link}`

Payload:

1. JSON, `id` özniteliği ile birliktedir.
2. JSON `ids` dizi özniteliği iledir.

_Örnek_

`DELETE Account/5564764442a6d024c/opportunities`

Payload:
```
{
  "id": "55646fd85955c28c5"
}
```

## Akış

#### Varsayılan kullanıcı için akış girdilerini listelemek

`GET Stream`

Get parametleri:

* `offset` - (int) ofset;
* `maxSize` - (int) maksimum boyut;

#### Belirli bir kayda ilişkin akış girdilerini listelemek

`GET {entityType}/{id}/stream`

Get parametleri:

* `offset` - (int) ofset;
* `maxSize` - (int) maksimum boyut;

#### Kaydı takip et

`PUT {entityType}/{id}/subscription`

#### Kaydın takibini bırak

`DELETE {entityType}/{id}/subscription`



