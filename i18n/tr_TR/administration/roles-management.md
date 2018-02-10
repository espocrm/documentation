# Rol Yönetimi

## Genel Bakış

Bazı kullanıcıların erişimini kısıtlamak için Rolleri kullanmanız gerekmektedir. Yönetici, Yönetim panelindeki rolleri yönetebilir. Her rol, bu rolü kullanan kullanıcılara uygulanan belirli alanlara (kapsamlar) erişimi tanımlamaktadır.

Bir kullanıcı birden çok role sahip olabilir. Bu roller, belirli bir kullanıcı için seçilebilir (Kullanıcı girdisinde 'Roller' alanı) ve/veya kullanıcının ait olduğu ekiplerden devralınabilir.

Bir kullanıcının birden fazla rolü varsa, izin verilen kuralın daha yüksek önceliğe sahip olması için birleştirileceklerdir.Bu, yöneticinin erişim seviyesi denetimini kolay ve esnek bir şekilde yönetmesini sağlamaktadır.

Kullanıcının ayrıntılı görünümünde 'Erişim' butonuna tıklayarak belirli bir kullanıcıya hangi izinlerin uygulandığını görmek mümkündür.

![1](../_static/images/administration/roles-management/scope-level.png)

## Örnek

Örneğin, kullanıcı 'Satış' ekibine aittir. Bu ekibin tek bir "Satış elemanı" rolü vardır. Böylece bu takımdaki tüm kullanıcılar 'Satışçı' rolünü alacaklardır.

'Satış elemanı' rolü şu şekilde tanımlanır:

Rehber:
```
create - yes
read – team
edit – own
delete – no
stream - team
```

İmkan: 
```
create - yes
read – team
edit – own
delete – no
stream - team
```

Kullanıcılar, yalnızca 'Satış Departmanı' ekibine ('Takımlar' alanı) ait olan potansiyel satışları ve fırsatları okuyabilmektedir.
Kullanıcı yalnızca atadığı fırsatları veya yarattığı fırsatları düzenleyebilir.Kullanıcılar potansiyel satışları veya fırsatları kaldıramaz.

Şirkette satış yöneticisi pozisyonuna sahip belirli bir kullanıcıya daha fazla hak vermek istiyoruz. Bu çalışanın 'Satış' takımındaki tüm kayıtları okuma / düzenleme / silme becerisine sahip olması gerekmektedir. Kullanıcı, 'Satış' takımımıza ait olmalıdır. Ancak yeni rolü 'Satış Yöneticisi' oluşturmalıdır ve bu rolü bu kullanıcı için 'Roller' alanından seçmeliyiz.

'Satış Müdürü' rolü şu şekilde tanımlanır:


Rehber:
```
create - yes
read – team
edit – team
delete – team
stream - team
```

İmkan:
```
create - yes
read – team
edit – team
delete – team
stream - team
```

Kullanıcılarımız 'Satış' ekibinden tüm olası pazarlama fırsatlarını  yönetebilir.

## Özel İzinler

### Atama İzni

Kayıtları başka bir kullanıcıya ve/veya takımlara yeniden atama yeteneğini sınırlandırmak için bu parametreyi ayarlayınız. Eğer 'Takım' belirtirseniz - yalnızca kendi takım(ları)ın  kullanıcılarına atamak mümkün olacaktır.Eğer `hayır` ise - kullanıcılar yeniden atayamazlar.

Ayrıca, kullanıcının başka kullanıcıların/takımların akışına yayın yapıp yapamayacağını tanımlar.

### Kullanıcı İzinleri

Kullanıcıların diğer kullanıcıların etkinliklerini, takvimlerini ve yayın akışlarını görüntüleme olanağını kısıtlamasına izin verir.

### Portal İzni

Portal bilgilerine erişim, portal kullanıcılarına mesaj gönderme becerisi tanımlamaktadır.

### E-posta Grup Hesabı İzinleri

Grup e-posta hesaplarına  erişimi, SMTP grubundan e-posta gönderme becerisini tanımlamaktadır.

### Dışarıya Aktarma İzinleri

Kullanıcıların kayıtları dışa aktarma yeteneği olup olmadığını değerlendirir. (sürüm 4.9.0'dan beri)

## Varsayılanlara Göre İzinler

Varsayılan olarak kullanıcılar (herhangi bir uygulama yoksa)  tüm kayıtları okuyabilirler ve düzenleyebilirler. Ancak, oluşturdukları ve bunlarla aynı anda atananların haricindeki herhangi bir şeyi silemezler.

Varsayılan olarak uygulanan erişim, Yönetim>Ayarlar kısmında 'ACL Strict Mode' özelliğini etkinleştirerek kısıtlama olanağı sağlar.

## Alan Seviyesinde Güvenlik

Belirli bir alana erişimi kontrol etmeyi sağlar.

Varsayılan kullanıcı olarak, kayıtları okuyabilirse tüm alanları okuyabilir. Alan Seviyesinde Güvenlik özelliğini kullanarak belirli alanlara erişimi kısıtlayabilirsiniz.

Alan Seviyesi bölümündeki bir rol kaydının düzenleme görünümündeki, belirli kapsamın yanındaki artı simgesine tıklayınız ve ardından gerekli alanı seçiniz. Ardından, `read` ve` edit` eylemleri için erişim seviyesini belirleyebileceksiniz. Var olan seçenekler: `evet` ve `hayır`.

![2](../_static/images/administration/roles-management/field-level-secutiry.png)
