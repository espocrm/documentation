# Namestitev

### Zahteve
EspoCRM deluje na večini domen ponudnikov gostovanja. K zahtevam spada naslednje:

* PHP 5.6 ali najnovejša verzija PHP z omogočenimi pdo, json, GD library, mcrypt razširitvami (ponavadi so že privzeto omogočene);
* MySQL 5.5.3 ali novejši.

Glej članek [Konfiguracija strežnika](server-configuration.md) za več informacij.

### 1. Prenesite EspoCRM namestitveni paket
Za najnovejšo različico EspoCRM obiščite to [stran za prenos](http://www.espocrm.com/download/).

### 2. Naložite EspoCRM datoteke na svoj strežnik

Ko bo prenos paketa končan, ga naložite na svoj spletni strežnik.
V na namen lahko uporabite SSH, FTP ali gostujoči administratorski panel.
Arhiv ekstrahirajte na svoj javni direktorij spletnega strežnika (npr. `public_html`, `www` itd.).

_Opomba: Če uporabljate FTP, morate arhiv ekstrahirati prej, preden ga naložite na svoj spletni strežnik._

### 3. Ustvarite MySQL podatkovno bazo za EspoCRM

Pojdite v svoj gostujoči administratorski panel ali uporabite SSH ter ustvarite novo podatkovno bazo in uporabnika za EspoCRM (npr. `MySQL Databases` v cPanel-u).

### 4. Zaženite EspoCRM namestitveni postopek

Zdaj odprite svoj brskalnik in pojdite na URL z EspoCRM datotekami (npr. `http://yourdomain.com/espo`).

Če vidite ta zaslon, je prišlo do napake "Nimate pravic".
Torej morate zagnati prikazani ukaz v terminalu prek SSH oziroma nastaviti pravilne pravice (755 za direktorije, 644 za datoteke in 775 za direktorij `data`. Prav tako poskrbite, da bosta pravilno določena lastnik (_owner_) in skupina (_group_).

![1](../_static/images/administration/installation/1.png)

Če vidite naslednji zaslon, so pravice pravilne in lahko začnete z namestitvijo EspoCRM.

![2](../_static/images/administration/installation/2.png)

Na tej strani lahko preberete in sprejmete Licenčno pogodbo.

![3](../_static/images/administration/installation/3.png)

Vnesite podrobnosti za svojo novo ustvarjeno MySQL podatkovno bazo.

![4](../_static/images/administration/installation/4.png)

Vnesite uporabniško ime in geslo administratorja EspoCRM.

![5](../_static/images/administration/installation/5.png)

Na tej strani lahko določite privzete nastavitve za EspoCRM, kot so format datuma in časa, časovni pas, valuto in drugo.

![6](../_static/images/administration/installation/6.png)

Vnesite SMTP nastavitve za odhodno e-pošto, če želite imeti možnost pošiljanja e-pošte.
Ta korak lahko preskočite s klikom na gumb _Naprej_.
Vse te možnosti lahko dodate/uredite v EspoCRM po namestitvi.

![7](../_static/images/administration/installation/7.png)

Čestitamo! Namestitev je končana.
Kot zadnji korak je potrebno nastaviti funkcijo razporejanja opravil, da bo potekala na vašem sistemu. To lahko storite tako, da zaženete `crontab -e` v linux opravilni vrstici ter v _Windows Tasks Scheduler_ v operacijskem sistemu Windows.

![8](../_static/images/administration/installation/8.png)

Upamo, da boste z veseljem delali v EspoCRM.
