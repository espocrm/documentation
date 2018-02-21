# Email în Masă

## Cum să trimiteți email-uri în masă

Trebuie să ai cel puțin o Listă Țintă cu înregistrări țintă și Sabloane pentru Email, în crm.

1. Crează o nouă campanie cu statusul `Email` sau `Newsletter`. În câmpul `Liste Țintă`, selectează una sau mai multe liste țintă.
2. După ce înregistrarea Campaniei este creată, creați Email-uri în Masă  pentru această campanie: apăsați plus pe panoul Email-urilor în Masă. Specificați _Data Începeri_ - când să fie trimise email-urile, și selectați  _Șablon Email_. Asigurați-vă că _Status_ este setat ca `În așteptare`.

If everything is setup right emails should go out. They should be sent each hour with portions (you can change portion size in Administration > Outbound Emails). Administrator can change it by updating `Scheduling` field of `Check Group Email Accounts` Scheduled Job.
Dacă totul este setat cum trebuie, email-urile ar trebui să se trimită. Acestea ar trebui timise, la fiecare oră, cu anumite poționări (puteți să schimbați mărimea în Administrare > Email-uri trimise. Administratorul poate schimba prin actualizarea câmpului `Planificare` din `Scheduling` field of `Verifică Conturi Group Email` Activități planificate.
Puteți verifica dacă email-urile sunt trimise în panoul jurnal.

## Test care va fi trimis la destinatari

Apăsați dreapta jos, pe rândul cu email-uri în masă din panoul _Email în Masă_ și apăsați _Trimite Test_.

## Jurnal

În jurnal puteți vedea:
* Email-urile trimise;
* Email-urile deschise de destinatar;
* Link-uril care au fost deshise de destinatar;
* Destinatarii care au renunțat;
* Bounced email (nu a ajuns la destinatar).

## Renunțare - link

În mod implicit, sistemul va adăuga opțiunea de renunțare la toate e-mailurile trimise. Dar puteți utiliza unul personalizat în șablonul de email.

Exemplu:
```html
<a href="{optOutUrl}">Unsubscribe from the mailing list.</a>
```

Administratorul poate dezactiva link-ul de renunțare, obligatoriu adăugat de sistem la Administrare > Email-uri Trimise.

## Urmărire URL

Dacă doriți să știți că destinatarul a deschis linkul din email, trebuie să creați Urmărire URL. Specificați orice _Nume_
 și _URL_  unde dorți să ducă link-ul dumneavoastră. Apoi va trebui să lipiți codul generat în Șablonul de Email-uri.

 Exemplu:
 ```html
<a href="{trackingUrl:55f2c87b09a220a78}">Try our demo</a>
 ```
 
## Liste Țintă

Listele țintă conțin listele de conturi, contacte, leads și înregistrările utilizatorilor.

Utilizatorii pot folosi manual liste de destinaatari cu ajutorul acțiunii _Selectare_ din panoul corespunzător din vizualizarea detaliată a Listei Țintă. Există posibilitatea de filtrare și apoi selectare a tuturor rezultatelor căutării.

## Popularea listelor țintă cu rapoarte

[Rapoarte](reports.md#syncing-with-target-lists) oferă o capacitate de a popula liste țintă cu înregistrări care corespund anumitor criterii.

## Excluderea listelor țintă

Specificați excluderea listelor țintă pentru a evita trimiterea de email în masă anumitor destinatari. Dacă există o înregistrare cu adresa de e-mail care se potrivește cu adresa de e-mail a oricărei înregistrări care este exclusă, va fi exclusă și prima înregistrare.

## Jurnalul campaniei

În jurnalul Campaniei, puteți vizualiza email-urile care au fost trimise, email-urile deschise, cele care nu au ajus la destinatar, cei care au renunțat, și cei care au deschis link-ul din email. Este posibil să utilizați acest jurnal prin crearea unei liste de destinatari (drop-down în colțul din dreapta-sus al panoului) pe baza înregistrărilor din jurnal. De exemplu, selectați numai persoanele de contact care au deschis link-ul (urmărire url).

## Troubleshooting

_Pentru Administratori_

#### Ce trebuie să faceți dacă email-urile nu sunt trimise.

1. Verificați dacă _Trimite Test_ dacă merge. Dacă nu funcționează, verificați dacă setările sistemului SMTP sunt corecte.
2. Verificați dacă aveți setat cron pentru sistemul dumneavoastră.
3. Verificați dacă aveți planificată activitatea `Trimite Email în Masă` și este `Activă` (Administrație > Activități Planificate > Trimite Email în Masă). Verificați dacă este ceva în Jurnal.


#### Dacă Urmărirea URL a fost greșită și nu ajunge la crm dumneavoastră.

Verificați parametrul 'siteUrl' din fișierul `data/config.php`. Trebuie să fie setat ca URL pentru accesibilitatea EspoCRM dintr-un mediu extern.

#### Email-urile care nu au fost trimise nu sunt trecute în jurnal

Mesajele eșuate pot fi gestionate numai prin contul de email al grupului. Asigurați-vă că aveți un cont de email de grup care monitorizează căsuțele poștale prin care s-au trimis email-urile.

De asemenea, unii furnizori de servere se pot abate de la standarde, astfel încât email-urile care nu au fost trimise, nu pot fi distinse.
