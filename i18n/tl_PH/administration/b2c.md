#Ang pag-configure ng EspoCRM para sa B2C (Business-to-Client)

Batay sa default, ang EspoCRM ay naka-configure na gamitin para sa B2B na negosyo. Ngunit maaari mo itong ma set up nang madali para sa B2C.

* Baguhin ang `b2cMode` sa true sa iyong config file `data/config.php`. Dahil ang bersyon 4.3.0 ay maaaring ma-configure ito sa Administration > Settings.
* Alisin ang *Account* tab mula sa navigation menu (Administration > User Interface)
* Alisin ang mga *Account* field mula sa iyong mga layout (administration > Layout Manager).
* I-disable ang access sa *Account* scope para sa lahat ng iyong mga tungkulin (Administration > Roles.)
* Alisin ang Account mula sa mga picklist ng lahat ng parent fields (Administration > Entity Manager > {Meeting/Call/Task/Email} > Fields > Parent).
