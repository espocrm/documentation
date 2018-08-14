#B2C için (İşyerinden Müşteriye) EspoCRM'yi yapılandırma

EspoCRM, B2B işletmesi için kullanılacak şekilde varsayılan olarak yapılandırılmıştır. Ancak B2C için kolayca kurabilirsiniz.

* `Data / config.php` yapılandırma dosyasında `b2cMode` parametresini değiştirin. Yönetim>Ayarlar bölümünden Sürüm 4.3.0'dan itibaren yapılandırılabilir.
* Navigasyon menüsünden *Hesap* sekmesini kaldırın (Yönetim>Kullanıcı Arayüzü).
* *Hesap* alanlarını Layout'larınızdan kaldırın (Yönetim>Layout Yöneticisi).
* *Hesap* kapsamına erişimi için tüm rollerinizi devre dışı bırakın (Yönetim> Roller).
* Tüm ana alanların seçim listelerinden Hesabı kaldırın (Yönetim> Kuruluş Yöneticisi> {Toplantı / Arama / Görev / E-posta}> Alanlar> Ebeveyn)
