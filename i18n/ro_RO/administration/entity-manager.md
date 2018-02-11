# Manger de Entități

Entity Manager este disponibil în panoul de Administrare. Oferă posibilitatea de a personaliza instanța ta de EspoCRM. Poți face asta în următoarele moduri:

* Adaugă noi tipuri de entități.
* Personalizează tipuri existente de enități: schimbă etichete, ordinea implicită în vizualizarea listei default, activează sau dezactivează stream.
* Personalizează câmpuri: adaugă, personalizează-le pe cele existente.
* Configurează relații: adaugă, schimbă etichetele la cele existente.

## Creearea unei noi entități

Apasă butonul `Creează Entitate` din pagina Managerului de Entități. Specifică numele, eticheta și tipul. Dacă ai select tipul `Persoană`, entitatea ta va avea Email, Telefon, Prenume, Nume și câmpuri de Salutare. Bifează `Stream` dacă vrei ca entitatea ta să aibe panou stream, iar utilizatorii să poată urmării asftel de entități.

Tipuri:

* Bază - entitate goală cu câmpuri de bază ca Nume, Utilizatori Atribuiți, Echipe, Descriere.
* Bază Plus - ca Bază dar cu Activități, Istoric, Panouri cu sarcini (disponibil începând cu 4.3.0).
* Eveniment - Câmpuri de Data începerii, Data sfârșirii, Durata, Părine, status. Disponibil în Calendar și panoul de Activități (începând cu 4.3.0, trebuie activată Administration > Settings).
* Persoană - Câmpuri de Email, Telefon, Prenume, Nume, Salutare, Adresă. Activități, Istoric, Panouri cu sarcini.
* Companie - Câmpuri de Email, Telefon, Adresa de facturare, Adresa de livrare. Activități, Istoric, Panouri cu sarcini.

## Actualizează o entitate existentă

Dacă apeși pe link-ul `Edit` de pe o anumită enitate, vei putea schimba o parte din parametrii acelei enități.

* Etichete - numele singular sau plural al enității.
* Ordinea implicită a înregistrărilor este sortată în afișazul listei.
* Stream - dacă caracteristica Stream este activată.
* Deazctivat - bifează dacă nu ai nevoie de această entitate în sistemul tău.
* Câmpuri de filtre text - în ce câmpuri să se facă căutarea pentru filterele text principale și căutările globale.


## Câmpuri

Prin apăsarea link-ului `Câmpuri` vei fi mutat în altă pagină. Acolo vei putea creea noi câmpuri sau să actualizezi unele deja exitente. Următoarele tipuri de câmpuri sunt disponibile în Mangerul de Entități:
 
* Adresă - adresa cu strada, oraș, stat, codul poștal și țara;
* Array - listă de valori, cu posibilitatea de a selecta valori multiple (nu este o opțiune bună dacă vrei să cauți după acest câmp); utilizatorii își pot adăuga propriile valori dacă nu sunt specificate alte opțiuni.
* Atașament Multiplu - fișiere multiple atașate;
* Auto-incrementare - se pot citi doar numere generate;
* Boolean - bifează, true sau false;
* Valută - pentru valorile valutei;
* Dată;
* Oră;
* Enum - căsuță de selectare, cu posibilitatea de a alege o singură opțiune;
* Fișier - încărcarea unui singur fișier;
* Float - număr cu o parte zecimală;
* Stăin - un câmp sau o entitate asemănătoare;
* Imagine - încărcarea unei imagini cu previzualizare;
* Integer - număr întreg;
* Număr - auto-incrementarea unui șir de număr cu un prefix posibil și o lungime specifică;
* Multi-enum - listă de valori, cu posibil de a selecta valori multiple(nu este o opțiune bună dacă vrei să cauți după acest câmp), similar cu Array dar mai drăguță.
* Text - text, pentru texte cu mai multe linii;
* Url - pentru link-uri;
* Varchar - text scurt;
* Wysiwyg - similar cu câmpul Text, cu posibilitatea de a formata caractere.

Parameteri:
* Necesar - completarea câmpului este necesară.
* Valoare implictă - Valoarea câmpului este stabilită la crearea unei noi înregistrări.
* Auditat - actualizările câmpului vor fi înregistrate în Stream.

**Rețineți**: După ce ai adăugat un nou câmp trebui să adaugi acest câmp [layouts](layout-manager.md) (Administration > Layout Manager).

### Logică Dinamică

Oferă posibilitatea de a face formularele dinamice. Este posibil să definiți condițiile care fac anumite câmpuri vizibile, necesare sau doar pentru citire. Condițiile vor fi verificate automat când datele din formular vor fi modificate.

Pentru câmpurile Enum, Array și Multi Enum este posibilă definirea unor seturi diferite de opțiuni, care vor fi disponibile în câmp, în funcție de ce condiții sunt îndeplinite.


## Relații

Puteți crea noi relații între entitățile out-of-box și cele personalizate. Există 3 tipuri de relații disponibile:

* Una-către-Multe: după ce ai creat această relație, poți adăuga un câmp de legătură la aspectul detaliat al entității potrivite și poți adăuga panoul de relații la entitatea din stânga;
* Multe-către-Una: la fel ca Una-către-Multe dar vice versa;
* Multe-către-Multe: panouri de relații pe ambele părți.

Parameterul 'Link Multiple Field' implică faptul că tipul câmpului `linkMultiple` o să fie creeat împreună. Poți adăuga acest câmp în aspect. Este convenabil pentru alegerea rapidă a înregistrărilor aferente. Nu este o opțiune bună dacă relația ta are intenția de a avea o mulțime de înregistrări legate care pot încetini încărcarea ecranului detaliat de vizualizare.

Dacă parametrul 'Audited' este bifat, actualizările relațiilor vor fi autentificate în Stream.

