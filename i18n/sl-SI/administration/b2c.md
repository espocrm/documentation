#Konfiguracija EspoCRM za B2C (Podjetje s stranko)

EspoCRM je privzeto konfiguriran za poslovanje B2B (podjetje s podjetjem). Vendar ga lahko preprosto nastavite za poslovanje B2C (podjetje s stranko).

* Spremenite `b2cMode` na "true" v svoji konfiguracijski datoteki `data/config.php`. Od verzije 4.3.0 lahko to skonfigurirate v Administracija > Nastavitve.
* Odstranite jeziček *Račun* iz navigacijskega menija (Administracija > Uporabniški vmesnik).
* Odstranite polja *Račun* iz svojih postavitev (Administracija > Upravljalnik postavitev).
* Onemogočite dostop do območja *Račun* za vse svoje vloge (Administracija > Vloge).
* Odstranite Račun iz padajočih seznamov vseh nadrejenih polj (Administracija > Upravljalnik entitet > {Sestanek/Klic/Naloga/E-pošta} > Polja > Starš).
