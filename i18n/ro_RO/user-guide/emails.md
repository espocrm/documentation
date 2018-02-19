# Instrucțiuni pentru Utilizarea Email-urilor

EspoCRM oferă posibiliteatea fetch email-uri din IMAP box. Acest lucru face posibilă folosirea EspoCRM ca și email client împreună cu caracteristicile CRM-specifice.

## Conturi IMAP

*Rețineți: Pentru ca email-urle de primite să funcționeze, trebuie să aveți [cron](https://github.com/espocrm/documentation/blob/master/administration/server-configuration.md#setup-a-crontab) configurat corespunzător în sistemul dumneavoastră.*

Utilizatorul poate seta contul IMAP pe pagina de Conturi Personale de Email (fila Email-uri > meniul de sus-dreapta > Conturi Personale de Email).

Specifică ce dosare să fie monitorizate în câmpul Dosarelor Monitorizate. În mod implicit nu este setat în INBOX. Dacă folosiți un client extern de email-uri pentru a trimite email-uri, poți adăuga Dosarul de Trimitere pentru a arhiva acele email-uri.

*Fetch începând de la* permite alegerea datei de când să înceapă arhivarea email-urilor. Dacă trebuie să arhivați email-uri vechi, setați-o la o dată anterioară datei de azi.

Există posibilitatea de a seta *Dosar* în Contul Personale de Email. Email-urile primite vor fi puse în acel dosar.

## Conturi SMTP

Utilizatorii pot seta setările SMTP în Preferințe, precum și în Conturile Personale de Email. Administratorul poate permite folosirea sistemului SMTP (să poate fi distribuit).

Utilizatorii pot avea conturi multiple SMTP (începând cu versiune 4.2.0). Însă, adresele de email pe care utilizatorul le pot folosi pentru a trimite email-uri sunt definite de către adresele de email ale înregistrării * Utilizator *

## Lucrul cu Email-uri

Email-urile sunt fetched de către cron (în background) la fiecare câteva minute (perioda poate fi specificată de către Administrator).
Poți vizualiza toate email-urile în fila de Email-uri. Există dosare standard Inbox, Sent, Draft în partea stângă.

Câmpul *Status*. `Sent` înseamnă că a fost trimis din CRM, `Archived` – fetched din contul de IMAP sau arhivat manual, `Draft` – înseamnă că email-ul a fost creat ca o ciornă.

Atunci când un email este primit, sistemul încearcă să recunoască cărui înregistrare corespunde email-ul respectiv. Îl poate lega cu Contul, Lead, Oportunitatea, Cazul (și contact în modul B2C) etc. Dacă nu a fost recunoscut, utilizatorul îl poate lega manul, completând câmpul *Parent* .

Dacă un email a venit de la un potențial nou client, utilizatorul poate să **convertește în Lead**. Deschideți intrarea Email și apasați Create Lead, în partea de sus a meniului.

Este posibilă crearea **creți Sarcină sau Caz** dintr-o înregistrare email.

Dacă adresele de email (from, to, cc) dintr-o înregistrare sunt cunoscute sistemului, o să afișeze persoanei respective că sunt legate de (Contact, Lead, User etc). Dacă vreo adresă de email este nouă, puteți **crați contact** din dreapta.

Toate email-urile legate de o anumită înregistrare sunt afișate în panoul Istoricului din acea înregistrare. Spre exemplu, dacă un email este leagat de o oportunitate, dar oportunitatea este legată de cont, o să fie afișat atât în oportunitate cât și în cont.

## Trimiterea Email-urilor

Puteți crea email-uri în mai multe moduri:
* Butonul *Compose Email* din vizualizare listei de Email-uri;
* răspunzând la un alt email;
* apăsând pe adresa de email a unei înregistrări;
* Acțiunea *Compose Email* din panoul de Activități.

Există posibilitatea de a **select template** pentru email-ul dumneavoastră.

Puteți seta **email signature** în Preferințe.

## Dosare Email

În funcție de nevoi, utilizatorii își pot creea propriile dosare de email-uri. Lista cu dosare disponibile este disponibilă pe pagina Email-urilor, în partea stângă. Pentru a creea sau edita dosare urmați Email-uril > dropdown în colțul din dreapta-sus > Dosare. `Skip Notification` înseamnă că nu veți fi notificat la primirea unui mesaj, care intră în anumite dosare. Prin folosirea Filtrelor de Email-uri, este posibil să puneți email-urile în dosare, după anumite criterii.

## Filtre Email

Administratorul poate crea filtre globale de email-uri pentru a sări peste anumite email-uri. Acestea sunt disponibile în Administrare > Filtre Email. 

Utilizatrul obișnuit poate crea filtre pentru email-uri pentru Conturile Personale de Email sau pentru întreaga căsuță poștală. Acestea sunt disponibile în Email-uri > dropdown în colțul din dreapta-sus > Filtere.

Există două tpuri de filtere:
* Skip - email-ul va fi pus în *Trash*, iar dacă filtrul este legat de Contul Personal de Email, nu o să fie importat;
* Pus în Folder - email-urile importate o să fie puse automant, în dosare specificate de către utilizator.

## Șabloane Email

Șabloanele Email sunt disponibile în Email-uri > dropdown în colțul din dreapta-sus > Șabloane Email. Acestea pot fi folosite atât pentru trimiterea email-urilor în masă, cât și pentru email-urile obișnuite. Căsuța `One-off` înseamnă că șablonul email-ului trebuie să fi folosit o singură dată, de obicei pentru email marketing.

Este posibilă utilizarea substituențiilor în conținutul șablonului email-ului și în subiectul email-ului ex {Account.name}, {Person.emailAddress}. Aceste o să fie înlocuite cu valori ale înregistrărilor legate.

Puteți alege substituenți adiționali în conținutul șablonului: {optOutUrl} și {optOutLink}.
```
<a href="{optOutUrl}">Unsubscribe</a>
```
Acesta este un link de dezabonare în masă de la email-uri.
