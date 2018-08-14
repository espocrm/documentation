#Configurare EspoCRM pentru B2C (Business-to-Client)

În mod implicit EspoCRM este configurat pentru a folosi B2B. Însă îl poți seta cu ușurință pentru B2C.

* Schimbă `b2cMode` în true în fișierul tău de configurare `data/config.php`. Începând cu versiunea 4.3.0 poate fi configurat în Administration > Seetings.
* Înlătură fila *Account* din meniul de navigare (Administration > User Interface).
* Înlătură câmpurile *Account* din aspectul tău (Administation > Layout Manager).
* Dezactivează accesul la *Account* pentru toate rolurile (Administration > Roles).
* Înlătură Contul din listele de selectare cu toate câmpurile părinte (Administration > Entity Manager > {Meeting/Call/Task/Email} > Fields > Parent).