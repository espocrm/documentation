# Pag-install

### Mga Kinakailangan
Ang EspoCRM ay gagana sa karamihan ng mga hosting provider. Ang mga kakailanganin ay ang mga sumusunod: 

* PHP 5.6 o ang pinakabagong bersyon ng PHP na mayroong enabled pdo, json, GD library, mcrypt nga mga extension (kadalasan ay enabled batay sa default);
* MySQL 5.5.3 o mas mataas pa.

Tingnan ang [Server Configuration](server-configuration.md) na artikulo para sa karagdagang impormasyon.

### 1. I-download ang EspoCRM installation package
Upang makakuha ng pinakabagong bersyon ng EspoCRM, sundin ang [download page](http://www.espocrm.com/download/) na link.

### 2. I-upload ang mga EspoCRM File sa Iyong Server

Kapag nakumpleto na ang pag-download, i-upload ang package sa iyong web serber. 
Para i-upload ito, maaari mong gamitin ang SSH, FTP o ang hosting administration panel.
I-extract ang archive sa iyong publikong web serber direktoryo (e.g., `public_html`, `www`, etc.).

_Tandaan: Para sa FTP, kailangang mong i-extract ang archive bago mag-upload sa iyong web serber._

### 3. Gumawa ng isang MySQL Database para magamit ng EspoCRM

Pumunta sa iyong hosting administration panel, o sa SSH, at gumawa ng isang panibagong database at user para sa EspoCRM (e.g., `MySQL Databases` in cPanel).

### 4. Patakbuhin ang proseso ng pag-install ng EspoCRm

Ngayon, buksan ang iyong web browser, at pumunta sa URL na may mga EspoCRM na file (e.g., `http://yourdomain.com/espo`).

Kapag nakita mo ang screen na ito, mayroon kang "Permission denied" na error. 
Kaya kailangang mong i-execute ang nakadisplay na command sa terminal sa pamamagitan ng SSH, o i-set ang tamang permiso. 
Dapat 755 para sa mga direktoryo, 644 para sa mga file, at 775 para sa `data` na direktoryo. 
Tiyakin din na mayroon kang tamang _owner_ at _group_.

![1](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/installation/1.png)

Kapag nakita mo ang screen na ito, ang permiso ay tama at maaari mo ng simulan na i-install ang EspoCRM.

![2](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/installation/2.png)

Sa pahinang ito, pwede mong basahin at tanggapin ang License Agreement.

![3](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/installation/3.png)

Ilagay ang mga detalye ng iyong bagong nabuong MySQL database.

![4](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/installation/4.png)

Ilagay ang pangalan ng user at password ng Administrator EspoCRM.

![5](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/installation/5.png)

Sa page na ito ay maaari mong i-set ang mga default setting ng EspoCRM, tulad ng date at time format, timezone, currency at iba pa.

![6](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/installation/6.png)

I-enter ang mga SMTP setting para sa mga outgoing email, kung gusto mong makapagpadala ng mga email. 
Ang step na ito ay maaaring laktawan sa pamamagitan ng pag-click ng _Next_ pindutan. 
Ang lahat ng mga opsyon na ito ay maaaring idagdag/baguhin sa EspoCRM pagkatapos ng instalasyon.

![7](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/installation/7.png)

Congratulation! Ang installation ay kumpleto na. 
Ang huling bagay ay ang pag-setup ng mga Scheduled Task na patatakbuhin ng iyong sistema. Magagawa ito sa pamamagitan ng pagpapatakbo ng `crontab -e` sa linux cli at sa _Windows Tasks Scheduler_ sa mga Windows na sistema.

![8](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/installation/8.png)

Umaasa kami na masisiyahan kang magtrabaho sa EspoCRM.







