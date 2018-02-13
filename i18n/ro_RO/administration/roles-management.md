# Roluri Management

## Prezentare generală

Pentru a restricționa accesul pentru anumiți utilizatori, trebuie să utilizați rolurile. Administratorul poate gestiona roluri în panoul de Administrare. Fiecare rol definește accesul la anumite zone (domenii) care se aplică utilizatorilor care dețin acest rol.

Un utilizator poate avea mai multe roluri. Acele roluri trebuie să fie selectate (câmpul ‘Roluri’ în intrarea Utilizator) și/sau să fie moștenit de la echipele care aparțin utilizatorului.

Dacă un utilizator are mai multe roluri, acestea vor fi îmbinate astfel încât regula permisivă să aibă o prioritate mai mare. Acest lucru îi permite administratorului să gestioneze ușor și flexibil, controlul accesului la nivel.

Este posibil să vezi ce permisiuni au fost aplicate pentru un anumit utilizator, prin apăsarea butonului 'Access', de pe vizualizarea detaliată a utilizatorului.

![1](../_static/images/administration/roles-management/scope-level.png)

## Example

De exemplu un utilizator aparține echipei ‘Vânzări’. Aceea echipă are un singur rol ‘Vânzător’. Astfel, toți membrii echipei o să obțină rolul de ‘Vânzător’.

Rolul ‘Vânzător’ este definit în modul următor:

Lead:
```
create - yes
read – team
edit – own
delete – no
stream - team
```

Opportunity:
```
create - yes
read – team
edit – own
delete – no
stream - team
```

Utilizatorii vor putea să citească doar acei potențiali clienți și acele oportunități care aparțin echipei ‘Departamentul vânzări’ (domeniul ‘Echipa’).
Utilizatorul va putea să editeze doar acei potențiali clienți și acele oportunități la care sunt alocați sau pe cei pe care i-au creat.
Utilizatorii nu vor putea elimina potențialii clienții sau oportunități.

Dorim să acordăm mai multe drepturi unui anumit utilizator care deține funcția de manager de vânzări în cadrul companiei. Acest angajat trebuie să poată citi/edita/șterge toate înregistrările echipei ‘Vânzări’. Acest utilizator ar trebui să aparțină echipei ‘Vânzări’. Dar va trebui să creăm un nou rol ‘Manager Vânzări’ și să selectăm acest rol din câmpul ‘Roluri’.

Rolul ‘Manager Vânzări’ este definit în modul următor:

Lead:
```
create - yes
read – team
edit – team
delete – team
stream - team
```

Opportunity:
```
create - yes
read – team
edit – team
delete – team
stream - team
```

Utilizatorul nostru va putea să gestioneze toate oportunitățile și potențialii clienți din echipa ‘Vânzări’.

## Permisiuni Speciale

### Permisiuni de Atribuire

Setați acest parametru pentru a restricționa capacitatea de a re-aloca înregistrări unui alt utilizator și/sau echipelor. Dacă setezi `echipa` - atunci va fi posibilă doar atribuirea către membrii echipei. Dacă `nu` - utilizatorii nu o să poată re-aloca.

De asemenea, definește dacă utilizatorul poate publica în fluxul altui utilizator/echipe.

### Permisiuni Utilizator

Permite posibilitatea de restricționare a utilizatorilor să vadă activitățiile, calendarul și fluxul altor utilizatori.

### Permisiuni Portal

Definește accesul la informațiile portalului, posibilitatea de a publica mesaje în utilizatorii portalului.

### Permisiuni Grup Conturi Email

Definește accesul la grupul conurilor email, abilitatea de a trimite email-uri din grupul SMTP.

### Permisiuni Export

Definește dacă utilizatorul are capacitatea de a exporta înregistrări. (începând cu versiunea 4.9.0)

## Permisiuni Implicite 

În mod implicit (dacă nu sunt aplicate) utilizatorii pot citi și edita înregistrări. Însă nu poate șterge, cu excepția celor care au fost creeate de ei și atribuite, în același timp.  except those they have created and they are assigned to at the same time.

Există posibilitatea de a restricționa accesul aplicat implicit prin activarea 'ACL Mod Strict ' de la Administrare > Setări.

## Securitate Nivel Câmp

Permite controlul accesului pentru un câmp specific.

Dacă se poate citi înregistrarea, în mod implicit, utilizatorul poate citi toate câmpurile. Dacă se poate citi înregistrarea, utilizatorul poate edita orice câmp. Poți restricționa accesul la câmpuri specifice folosind Securitatea Nivel Câmp.

În vizualizarea de editare a unei înregistrări de rol în secțiunea Nivel Câmp, apasă pe pictograma plus de lângă domeniul de aplicare specific, apoi selectează câmpul necesar. Acolo vei putea specifica accesul nivelui pentru acțiunile `citire` și `editare`. Există două opțiuni: `da` și `nu`.

![2](../_static/images/administration/roles-management/field-level-secutiry.png)
