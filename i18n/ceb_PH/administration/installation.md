# Pag-install

### Mga Requirement
Ang EspoCRM mudagan ra sa kasagarang mga hosting provider. Ang mga requirement kay naglangkob sa mga musunod:

* PHP 5.6 o ang pinakabag-o nga version sa PHP nga gi-enable ang pdo, json, GD library, mga mcrypt extension (kasagaran kay gienable nani by default);
* MySQL 5.5.3 o mas taas pa.

Tanawa ang [Server Configuration](server-configuration.md) para sa dugang pa nga impormasyon.

### 1. I-download ang EspoCRM nga installation package
Para makuha ang pinakabag-o nga version sa EspoCRM, adto sa [download page](http://www.espocrm.com/download/) nga link.

### 2. I-upload ang mga EspoCRM File ngadto sa Imohang Server

Inig ka-kompleto sa download, i-upload ang package ngadto sa imohang web server.
Para ma-upload ni, pwede ka mugamit og SSH, FTP, o ang hosting administration panel.
I-extract ang archive ngadto padulong sa imohang publikong web server directory (e.g., `public_html`, `www`, etc.).

_Timan-e: Para sa FTP, gikinahanglan nimo i-extract ang archive una nimo i-upload ni sa imong web server._

### 3. Paghimo og MySQL Database para gamiton sa EspoCRM

Adto sa imohang hosting administration nga panel, o sa SSH, ug paghimo og bag-o nga database ug user para sa EspoCRM (e.g., `MySQL Databases` sa cPanel).

### 4. Ipadagan ang EspoCRM installation nga proseso

Karon, abilihi ang imohang web browser, ug adto sa URL nga naay mga EspoCRM file (e.g., `http://yourdomain.com/espo`).

Kung nakita ni nimo ni nga screen, naa kay "Permission denied" nga error.
Busa, gikinahanglan nimo i-execute ang nadisplay nga command sa terminal gamit ang SSH, o i-set ang sakto nga permission.
Gikinihanglan nga 755 para sa mga directory, 644 para sa mga file, ug 775 para sa `data` nga directory. 
Siguradoha usab nga sakto ang imohang _owner_ ug _group_.

![1](../_static/images/administration/installation/1.png)

Kung nakakita ka ani nga nga screen, ang permission kay sakto ug makasugod naka og install sa EspoCRM.

![2](../_static/images/administration/installation/2.png)

Sa kani nga page, pwede nimong basahon ug dawaton ang License Agreement.

![3](../_static/images/administration/installation/3.png)

Ibutang ang mga detalye para sa imohang bag-ong nahimo nga MySQL database.

![4](../_static/images/administration/installation/4.png)
.
Ibutang ang name sa user ug ang password sa Administrator EspoCRM.

![5](../_static/images/administration/installation/5.png)

Sa kani nga page, pwede nimong i-set ang default nga mga setting sa EspoCRM, parehas sa petsa, format sa time, timezone, currency, ug uban pa.

![6](../_static/images/administration/installation/6.png)

I-butang ang SMTP nga mga setting para sa mga gipadala na nga mga email, kung gusto ka mahatagan og abilidad nga mu send og mga email.
Ang kani nga step kay pwede ra laktaran. I-click ra ang _Next_ nga pindutanan.
Ang kaning tanang nga mga opsyon kay pwede idungag o iusab sa EspoCRM inig human og install.

![7](../_static/images/administration/installation/7.png)

Congratulations! Ang pag-install kay natapos na.
Ang pinaka-awahi nga butang nga imohang i-setup kay ang Scheduled Tasks nga ipadagan sa imohang sistema. Mahimo ni pinaagi sa pagpadagan sa `crontab -e` sa linux cli ug sa _Windows Tasks Scheduler_ sa Windows nga mga sistema.

![8](../_static/images/administration/installation/8.png)

Naglaum kami nga malingaw kamo og pagtrabaho sa EspoCRM.







