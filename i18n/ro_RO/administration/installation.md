# Instalare

### Cerințe
EspoCRM rulează pe cele mai mulți furnizori de găzduire. Cerințe:

* PHP 5.6 versiunea cea mai nouă PHP cu extensii activate pdo, json, GD library, mcrypt (de obicei este activată în  mod implicit);
* MySQL 5.5.3 sau mai nouă.

Pentru mai multe informații, vezi articole pe [Server Configuration](server-configuration.md).

### 1. Descarcă pachetul de instalare EspoCRM
Pentru a descărca ultima versiune, urmează următorul link [download page](http://www.espocrm.com/download/).

### 2. Încarcă fișierele EspoCRM în serverul tău

După ce descărcarea a fost terminată, încarcă pachetul în serverul tău. 
Pentru a îl încărca foloseșre SSH, FTP sau panoul de administare din găzduire.
Extrage arhiva în directorul public al serverului (ex., `public_html`, `www`, etc.).

_Note: Pentru FTP, trebuie să extragi arhiva înainte de încărcarea ei pe server._

### 3. Creează o bază de date MySQL pe care să o folosească EspoCRM 

Du-te la panoul de administare din găzduire, sau la SSH, și creează o nouă bază de date pentru utilizator, pentru EspoCRM (ex., `MySQL Databases` in cPanel).

### 4. Rulează procesul de instalare EspoCRM

Deschide browserul web, și mergi la URL-ul cu fișierele EspoCRM (ex., `http://yourdomain.com/espo`).

Dacă vezi acest ecran "Permission denied" a apărut o eroare. 
Va trebui să execuți comanda pe terminal prin via SSH, sau să setezi permisiune corectă. 
Ar trebui să fie 755 pentru directoare, 644 pentru fișiere, și 775 pentru directorul `data`. 
Asigură-te că ai _owner_ and _group_ corect.

![1](../_static/images/administration/installation/1.png)

Dacă vezi următorul ecran, permisiunea este corectă și poți să începi instalarea EspoCRM.

![2](../_static/images/administration/installation/2.png)

Pe această pagină, poți să citești și să accepși termeni si codițiile.

![3](../_static/images/administration/installation/3.png)

Introdu detaliile pentru noua bază de date MySQL creeată.

![4](../_static/images/administration/installation/4.png)

Introdu numele și parola pentru administor EspoCRM.

![5](../_static/images/administration/installation/5.png)

Pe această pagină poți să vezi setările implicite EspoCRM, cum ar fi formatul datei și al oeri, fusul orar, valuta și altele.

![6](../_static/images/administration/installation/6.png)

Introdu setările SMTP pentru email-urile de ieșire, dacă vrei să ai posibilitatea să trimiți email-uri.
Acest pas poate fi sărit prin apăsarea butonului _Next_. 
Toate aceste opțiuni pot fi adăugate/schimbate după instalarea EspoCRM.

![7](../_static/images/administration/installation/7.png)

Felicitări! Instalarea este completă!
Ultimul lucru pentru a seta Sarcini Programate care să fie rulate în sistem. Poate fi făcut prin rularea `crontab -e` în linux cli și în _Windows Tasks Scheduler_ în Windows.

![8](../_static/images/administration/installation/8.png)

Speră ca vă va face plăcere să lucrați cu EspoCRM.







