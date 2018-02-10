# Raporlar

Raporlar özelliği [Gelişmiş Paket](https://www.espocrm.com/extensions/advanced-pack/) adresinde bulunur.

İki türlü rapor sistemi vardır: Liste ve Izgara Sistemi.  

## Liste Raporları

Belirtilen ölçütleri karşılayan kayıtların listelerini raporlayın.

Yeni liste raporu oluşturmak için Raporlar sekmesini ve ardından Rapor Oluştur butonuna tıklayın. Gereken Öğe Türü'nü seçin ve Liste Raporu bölümünde Oluştur butonuna tıklayın.

_Columns_ alanına, görüntülemek istediğiniz alanları seçin. Aşağıda her sütunun görüntü ölçütlerini belirtebilirsiniz; ör. genişlik ve hiza.

_List Order_ alanında gerekli sıralamayı yapın.

_Filters_ bölümünde, raporunuzda hangi kayıtların listeleneceğini belirleyen ölçütleri girebilirsiniz. Burada mantıksal operatörler olan 'OR' ve 'AND' değerlerini kullanabilirsiniz.

_Runtime Filters_, raporu başlatmadan önce farklı filtreler belirlemenize izin verir.

Excel sonuçlarını excel ve csv formatlarına __aktarabilirsiniz__

## Izgara Sistemi Raporları

Izgara Sistemi raporları, belirtilen alanları gruplandırarak özetlenmiş değerleri verir. Bu raporlar bir grafik olarak görüntülenebilir.

![Izgara Sistemi Raporları](../_static/images/user-guide/reports/grid.png)

Yeni kılavuz raporu oluşturmak için Raporlar sekmesini tıklayın ve daha sonra Rapor Oluştur butonuna tıklayın. Gereken Öğe Türü'nü seçin ve Izgara Sistemi Raporu bölümünde Oluştur butonuna tıklayın.

_Group By_ alanında, rapor verilerinizin gruplandırılmasını istediğiniz bir veya iki alanı seçin. Tarih alanlarına yıl, ay ve gün bazında gruplama yapmak mümkündür. İki alanla gruplandırma yaparsanız, raporunuz üç boyutlu olarak kabul edilir.

_Columns_ alanında, COUNT, SUM (toplam), MIN, MAX, AVG (ortalama) gibi bir veya daha fazla toplama işlevini seçin.

_Order by_ alanı rapor verisinin nasıl sıralanacağını belirtir.

_Filters_ bölümünde, raporunuzda hangi kayıtların kullanılacağını belirleyen ölçütleri girebilirsiniz. Buradaki mantıksal operatörlerin 'OR' ve 'AND' değerlerini kullanabilirsiniz.

_Runtime Filters_, raporu çalıştırmadan önce farklı filtreler girebilmenizi sağlar.

Izgara Raporu Sistemi, sonuçları bir grafik formunda görüntülemeye izin verir. Aşağıda bazı _chart türleri_ vardır: Bar (Yatay), Bar (Dikey), Pay, Çizgi.

Izgara Sistemi raporunun sonuçlarını excel ve csv formatlarına __aktarmak__ mümkündür.

## Filtreler

### Alan Filtresi

Ayrıca hedef varlığın alanlarını da ilgili varlıklar olarak seçebilirsiniz

![Alan Filtresi](../_static/images/user-guide/reports/filter-field.png)

### OR Grubu

OR, gruptaki en az bir koşulun yerine getirilmesi gerektiği anlamına gelir.

![OR Grubu](../_static/images/user-guide/reports/filter-or.png)

### AND Grubu

AND, gruptaki tüm koşulların yerine getirilmesi gerektiği anlamına gelir.

### NOT Grubu

Belirtilen kriterlere uymayan kayıtları filtreleme olanağı sağlar. Örneğin, Closed Won veya Closed Lost statüsü fırsatı olmayan hesapları listeler.

![NOT Grubu](../_static/images/user-guide/reports/filter-not.png)

### Karmaşık İfade

Bu daha gelişmiş kullanım içindir. Belli bir veritabanı sütunu için işlevi uygulayabilir ve [formül](../administration/formula.md) ifadesiyle birlikte karşılaştırabilirsiniz.

Not: Sadece basit bir dize değeri ile karşılaştırmanız gerekiyorsa, onu `'bazı dize'" şeklinde tek tırnak işaretlerinin arasına koymalısınız.

Not: Form kayıtları belirli kayıtlara uygulanmadığından varlık kaydı ile etkileşime girmeye yönelik işlevler burada geçerli olmayacaktır.

![Karmaşık İfade Filtresi](../_static/images/user-guide/reports/filter-complex.png)

## Gösterge Tablosunda Gösterim

Gösterge tablosundaki herhangi bir raporu görüntüleyebilirsiniz. Bunun için Report Dashlet'i eklemeniz ve ardından dashlet seçeneklerinde gerekli raporu seçmeniz gerekir.

## E-Posta Gönderimi

Belirli zamana göre belirli kullanıcılara düzenli olarak rapor sonuçları gönderecek sistemi oluşturmak mümkündür. Bu, belirli raporların her biri için ayrı ayrı yapılandırılmalıdır.

## Hedef Listelerle Senkronizasyon

Liste raporlarının sonuçlarıyla hedef listelerinin senkronize edilmesi mümkündür. Bu E-postaları yalnızca gönderim sırasındaki bazı ölçütleri karşılayan kişilere göndermek için uygundur. Bu özellik, 'Raporlarla Senkronize Etme' panelindeki herhangi bir hedef listesinin ayrıntılı görünümünde bulunur.
