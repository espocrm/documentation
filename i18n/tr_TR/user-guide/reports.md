# Raporlar

Raporların özelliği [Gelişmiş Paket] (https://www.espocrm.com/extensions/advanced-pack/) adresinde mevcuttur.

İki tür rapor vardır: Listeli ve Izgaralı.  

## Liste Raporları

Rapor sonuçlarını, belirtilen kriterleri karşılayan kayıtların listesini yapınız.

Yeni liste raporu oluşturmak için Raporlar sekmesini ve ardından Rapor Oluştur düğmesini tıklayınız. İstenilen Öğe Türü'nü seçiniz ve Liste Raporu bölümünde Oluştur düğmesini tıklayınız.

_Sütunlar_ alanında görüntülemek istediğiniz alanları seçin. Aşağıda, her sütunun görüntü parametrelerini belirtebilirsiniz; örneğin: genişlik ve hizalamak.

_Liste komutu_ alanını sıralamak için gerekli olanını seçiniz. 

_Filtreler_ bölümünde, raporunuzda hangi kayıtların listeleneceğini belirleyen ölçütleri belirtebilirsiniz. Buradaki mantıksal operatörlerin 'VEYA' ve 'VE' değerlerini kullanabilirsiniz.

_Çalışma zamanlı filtreler_, raporu çalıştırmadan önce farklı filtreler belirlemenize izin verir.

Excel ve CSV formatlarının listelenmiş rapor sonuçlarını  __dışarıya aktarabilirsiniz__.

## Izgara Raporları

Izgara raporları, belirtilen alanlarla gruplandırılmış, özetlenmiş değerleri verir. Bu raporlar bir grafik olarak görüntülenebilirler.


![Grid reports](../_static/images/user-guide/reports/grid.png)

Yeni ızgara raporu oluşturmak için Raporlar sekmesine tıklayın ve ardından Rapor Oluştur butonuna tıklayınız. Gerekli Öğe Türü'nü seçin ve Izgara Raporu bölümünde Oluştur butonuna tıklayınız.

_Grupla_ alanında, rapor verilerinizin gruplandırılmasını istediğiniz bir veya iki alanı seçiniz. Tarih alanlarına yıl, ay ve gün bazında gruplama yapmak mümkündür.Eğer iki alana da gruplarsanız, raporunuz üç boyutlu olarak kabul edilir.

_Sütunlar_ kısmında, COUNT, SUM (toplam), MIN, MAX, AVG (ortalama) gibi bir veya daha fazla toplama işlevini seçiniz.

_Gruplama_ alanı rapor verilerinin nasıl sıralanacağını tanımlar.

_Filtreler_ bölümünde, raporunuzda hangi kayıtların kullanılacağını belirleyen ölçütleri belirtebilirsiniz. Buradaki mantıksal operatörlerin 'VEYA' ve 'VE' değerlerini kullanabilirsiniz.

_Çalışma zamanlı filtreler_, raporu çalıştırmadan önce farklı filtreler belirlemenize izin verir.

Izgara raporu, sonuçları grafik formunda görüntülemenize izin verir. Aşağıdaki  _grafik türleri_ ardından şunlardır:Bar (Yatay), Bar (Dikey), Pie, Çizgi.

Excel ve CSV formatlarının listelenmiş rapor sonuçlarını  __dışarıya aktarabilirsiniz__.

## Filtreler

### Alan Filtresi

Basit filtre türlerini kullanınız. Ayrıca, hedef varlığın alanlarını ve ilgili varlıkları da seçebilirsiniz.

![Alan filtresi](../_static/images/user-guide/reports/filter-field.png)

### VEYA grubu

VEYA, gruptaki en az bir koşulun yerine getirilmesi gerektiği anlamına gelir.

![VEYA grubu](../_static/images/user-guide/reports/filter-or.png)

### VE grubu

VE, gruptaki tüm koşulların yerine getirilmesi gerektiği anlamına gelir.

### DEĞİL grubu

Belirtilen kriterlere uymayan kayıtları filtreleme olanağı sağlar. Örneğin. Kapalı Kazanılan veya Kapatılı Kaybedilmiş Durumularıyla fırsat bulamayan hesapları listeleme.

![DEĞİL grubu](../_static/images/user-guide/reports/filter-not.png)

### Karmaşık İfade

Daha gelişmiş kullanım içindir. Belli bir veritabanı sütunu için işlevi uygulayabilir ve [formül] (../administration/formula.md) ifadesinin sonucuyla karşılaştırabilirsiniz.


Not: Sadece basit bir dize değeri ile karşılaştırmanız gerekiyorsa ona, `'bazı dize'` tek tırnak işaretlerini koymalısınız.

Not: Form kayıtları belirli kayıtlara uygulanmadığından varlık kaydı ile etkileşim kurmayı amaçlayan fonksiyonlar burada geçerli olmayacaktır.

![Karmaşık İfade filtresi](../_static/images/user-guide/reports/filter-complex.png)

## Gösterge tablosunda gösteriliyor

Gösterge tablosundaki herhangi bir raporu görüntüleyebilirsiniz. Bunun için Report dashlet'ni eklemeniz ve ardından dashlet seçeneklerinden gerekli raporu seçmeniz gerekmektedir.

## E-posta Gönderme

Belli zamana göre belirli kullanıcılara rapor sonuçlarını göndermek için sistemi düzenli olarak yapmak mümkündür. Bu, belirli raporlar için ayrı ayrı yapılandırılmalıdır.

## Hedef Listelerle Senkronizasyon

Liste raporlarının sonuçları ile senkronize edilmiş hedef listelerinin olması mümkündür. E-postalar yalnızca gönderim sırasındaki bazı ölçütleri karşılayan kişilere göndermek istediğinizde toplu e-posta için uygundur. Bu özellik, 'Raporlarla Senkronize Etme' panelindeki herhangi bir hedef listesinin ayrıntılı görünümünde bulunur.
