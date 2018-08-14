# Fluxuri de lucru

Caracteristica Fluxuri de lucru este disponibilă în [Pachet Avansat](https://www.espocrm.com/extensions/advanced-pack/).

Fluxurile de lucru automatizează, într-un mod simplu, procesul de afaceri. Îl puteți găsi în panoul Administrare. Pentru a crea o regulă a fluxului de lucru, trebuie să definiți:

* Entitate Țintă - la ce tip de entitate este aplicat fluxul de lucru;
* Tip declanșator - când fluxul de lucru o să fie delanșat;
* Condiții- condițiile trebuie satisfăcute pentru a declanșa fluxul de lucru;
* Acțiuni - ce se întâmplă dacă fluxul de lucuru este delanșat.


## Tipuri declanșator

### După ce înregsitrarea a fost creată

Se declanșează numai atunci când se creează o nouă înregistrare. Dacă condițiile specificate sunt satisfăcute, atunci acțiunile vor fi executate.

### După ce înregsitrarea a fost salvată

Se declanșează când se creează o nouă înregistrare sau se actualizează o înregistrare existentă. Dacă condițiile specificate sunt satisfăcute, atunci acțiunile vor fi executate.

Pentru regulile fluxului de lucru cu acest tip de declanșator, este recomandat să aveți o condiție care verifică a fost 'modificat' un câmp. Ex. Dacă statusul cazului a fost schimbat atunci execută unele acțiuni.

### Planificat

Se declanșează în funcție de planificarea definită. Puteți să îl setați să ruleze în fiecare zi, în fiecare săptămână etc. Acțiunile vor fi aplicate pentru înregistrări. Deci, trebuie să creați o listă raport.

Planificarea este specificată într-o notație crontab.

```
* * * * * *
| | | | | | 
| | | | | +-- Year              (range: 1900-3000)
| | | | +---- Day of the Week   (range: 1-7, 1 standing for Monday)
| | | +------ Month of the Year (range: 1-12)
| | +-------- Day of the Month  (range: 1-31)
| +---------- Hour              (range: 0-23)
+------------ Minute            (range: 0-59)
```

### Secvențial

Folosit rar. Se presupune că este rulat de un alt flux de lucru. Oferă posibilitatea de a face o logică complexă.

Rețineți: Pentru fluxuri de lucur secvențiale, este recomandat să utilizeze [intrumentul BPM](bpm.md) în loc de o caracteristica fluxurilor de lucru.

## Condiții

Puteți specifica condițiile care trebuie setate pentru a declanșa fluxul de lucru. Există două moduri în care condițiile pot fi specificate: cu constructorul condiție UI și cu o formulă.

### Constructorul condiție UI

Unele tipuri de condiții disponibile:

* _egale_ - câmpul este egal cu o valoare specifică sau cu o valoare a altui câmp;
* _a fost egal_ - câmpul a fost egal cu o valoare specifică înainte de declanșarea fluxului de lucru;
* _nu sunt egale_ - câmpul nu este egal cu o valoare specifică sau cu o valoare a altui câmp;
* _nu a fost egal_ - câmpul nu a fost egal cu valoarea specifică înainte ca fluxul de lucru să fie declanșat;
* _egal_ - câmpul este gol;
* _nu este gol_ - câmpul nu este gol;
* _schimbat_ - câmpul a fost schimbat;
* _nu a fost schimbat_ - câmpul nu a fost schimbat.

### Condiții Formulă

Formula oferă o posibilitate de a defini condițiile de orice complexitate. Pentru a citi despre sintaxa formulei mergi la [acest articol](formula.md). 

Rețineți: Nu ar trebui să fie nici un delimitator `;` folosit în formulă când determină o condiție.

## Acțiuni

### Trimite Email

Sistemul o să trimită un email folosind un șablon de email specificat. Adresa de e-mail a destinatarului poate fi preluată din înregistrarea țintă, din orice înregistrare asemănătoare, utilizatorul actual, urmăritorii, utilizatorii echipei sau specificați. Emailul poate fi trimis imediat sau întârziat pentru un anumit interval.

### Creați Înregistrare

Sistemul o să creeze o nouă o nouă înregistrare cu o entitate de orice tip. Dacă există o relație între înregistrarea țintă și creearea înregistrării este posibil că înregistrările să se asemene. 

Există posibilitatea de a defini formula pentru a calcula câmpurile.

### Creați înregistrare asemănătoare

Sistemul o să creeze o înregistrare asemănătoare cu înregistrarea țintă. Există posibilitatea de a defini formula pentru a calcula câmpurile.

### Actualizare Înregistrarea Țintă

Permite schimbarea câmpurilor specifice sau a înregistrării țintă. Există posibilitatea de a defini formula pentru a calcula câmpurile.

Dacă ai nevoie de a adăuga noi elemente în câmpul Link-Multiple fără să pierdeși date existente (ex. Echipe) va trebui să utilizezi formula funcției entity\addLinkMultipleId. Exemplu: `entity\addLinkMultipleId('teams', 'teamId')`.

### Actualizare Înregistrări Asemănătoare

Permite schimbarea câmpurilor specifice a înregistrării asemănătoare sau a înregistrării țintă. Există posibilitatea de a defini formula pentru a calcula câmpurile.

### Leagă cu o altă Înregistrare

Relaționează entitatea țintă cu o altă entitate specifică. Ex. adaugă o echipă specifică la înregistrare.

### Dezleagă cu o altă înregistrare

Opește relaționare entității țintă cu o altă entitate specifică. Ex. elimină o echipă specifică la înregistrare.

### Aplicați regula de atribuire

Atribuiți înregistrarea țintă către un utilizator folosind regula distribuției. Există două regului disponibile: Round-Robin și Least-Busy.

* Round-Robin - utilizatorii sunt aleși de la începutul către sfârșitul listet (echipă) și apoi începând din nou.
* Least-Busy - utilizatorul care are mai puține înregistrări atribuite, ca fi ales pentru atribuire.

_Report Listă_ - Pentru distribuirea Least-Busy determină ce înregistrări o să fie luate în considerare pentru a calcula numărul de înregistrări atribuite. Ex. pentru cazurile va trebui să luam în considerare doar înregistrările utilizatorilor activi.

### Creați Notificare

Notifică utilizatori specifici cu mesaje. Este posibil să utilizați substituenți în șablonul mesajului: {entity} - înregistare țintă, {user} - utilizator actual.

### Faceți urmărirea

Forțează utilizatori specifici să urmărească enintatea țintă sau o entitate specifică asemănătoare.

### Declanșează un alt flux de lucru

Permite secvențarea fuxurilor de lucru. Este posibil ca fluxul de lucru să fie condiționat: puteți seta fluxul de lucru pentru a declanșa două fluxuri de lucru cu condiții diferite definite în acele fluxuri de lucru.

Este posibilă întârzierea executării a fluxului de lucru secvențial. În fluxul de lucru secvențial poți să definești condițiile care verifică dacă câmpurile specificate au fost chimbate de la fluxul de lucru părinte care au fost declanșate folosind tipul de condiție  _schimbat_ and _a fost egal_.

Rețineți: Pentru fluxurile de lucru secvențiale este recomandat să utilizați [instrumentul BPM](bpm.md) în loc de caracteristica Fluxurilor de lucru.

### Rulează Acțiune Serviciu

Permite rularea de scripturi de serviciu specifice. În mod implicit, sunt disponibile următoarele acțiuni:

* Trimite Invitații - pentru Întâlniri/Apeluri;
* Adaugă Elemente de Citat - pentru Citate.

Programatorii își pot scrie proprile acțiuni de serviciu. Vezi [mai multe detalii](../development/workflow-service-actions.md).

## Folosind Foormula în Acțiune

Este posibil să definiți o formulă pentru a calcula câmpurile pentru Creare Înregistrare, Actualizare Înregistrare Țintă, Creare Înregistrare Asemănătoare, Actualizare Înregistrări Asemănătoare. Pentru ultimele două, pentru a accesa atributele entității țintă, trebuie să utilizați funcția  `targetEntity\attribute`. Pentru a accesa atributele unui obiect țintă care a fost setat înainte ca fluxul de lucru să fie declanșat, utilizați funcția `targetEntity\attributeFetched`.

Exemplu:
```
name = string\concatenate(targetEntity\attribute('name'), ' ', datetime\today());
```
