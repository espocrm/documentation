#Pagusab sa EspoCRM para sa B2C (Business-to-Client)

Ang EspoCRM kay naka-configure para gamiton alang sa B2B nga mga negosyo. Pero pwede usab kini e-setup para sa B2C.

* Usba ang `b2cMode` para mahimong true sa config nga file `data/config.php`. Gikan sa version 4.3.0, pwede nimo ning usbon sa Administration > Seetings.
* Tangtanga ang *Account* tab giakn sa navigation menu (Administration > User Interface).
* Tangtanga ang *Account* nga mga field gikan sa mga layout (Administation > Layout Manager).
* E-disable ang pa-agi sa pagsulod sa *Account* nga scope para sa tanang papel (Administration > Roles).
* Tangtanga ang Account gikan sa mga picklist sa tanang parent nga mga field (Administration > Entity Manager > {Meeting/Call/Task/Email} > Fields > Parent).
