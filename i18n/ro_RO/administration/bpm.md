# Managementul Proceselor de Afaceri

Instrumentul Managementul Proceselor de Afaceri (BPM) oferă abilitatea de a modela și automatiza procesele de afaceri în EspoCRM. Este un motor care execută procesele de afaceri descrise în standardul BPMN 2.0. Instrumentul BPM este disponibil în extensia [Advanced Pack](https://www.espocrm.com/extensions/advanced-pack/).

![BPM example](../_static/images/administration/bpm/bpm-1.png)

### Diferență față de instrumentul fluxurilor de lucru

Instrumentul Fluxul de lucru este destinat automatizării regulilor de afaceri simple, fără elemente secvențiale de flux, atunci când nu este necesară afișarea grafică a fluxului.

Instrumentul BPM este pentru fluxuri de afaceri mai complexe, unde există fluxuri divergente și convergente, întârzieri de execuție, interacțiuni între utilizatori.  O vizualizare de tip diagramă face procesul de afaceri mai ușor de înțeles pentru un om, un jurnal ne permite să vedem cum a fost organizat procesul.

## Procesarea Diagramelor

Link-ul pentru procesarea diagramelor este disponibil în panoul de administrare. Poate fi adăugat ca și filă, din panoul de navigație. 

Diagramele sunt destinate procesului de modelare al afacerilor. Administratorul poate creea și edita diagrame. Utilizatorii obișnuiți au doar posibilitatea de vizualizare.

Fiecare diagramă are un anumit tip de entitate (Câmpul Tip Țintă). Diagrama determină execuția proceselor viitoare ale instanțelor. Conține elemente ale diagramei și conexiunile dintre elemente.

Dacă procesarea diagramei nu are bifat câmpul'Is Active' atunci nu va iniția procesarea instanțelor.

Pentru a afișa detaliile și parametrii unui anumit element de diagramă, trebuie să apeși pe el. În modul deeditare, vei putea edita parametrii.

## Procese

Procesele sunt disponiblie din panoul de administrare. Link-ul poate fi adăugat ca și filă, din panoul de navigație.

Procesul reprezintă instanța procesului de afaceri. Când este inițiată, are statutul "Started". Când procesul este terminat, are statusul de "Ended". De asemenea, procesul poate fi oprit manual de către un utilizator care are acces la editarea procesului. Dacă se oprește manual, are statusul "Stopped".

Procesul se execută urmând diagrama. Procesul diagramei nu poate fi schimbat după ce a început procesul.

Procesul este obligatoriu legat de înregistrarea țintă unică.

Processes can be started automatically (upon specific conditions or by scheduling) or manually (where there is at least one Start Event in the flowchart). To start process manually the user needs to click 'Start Process' button on the list view of processes.

## Flowchart Elements

### Evenimente

Evenimentele sunt afișate pe diagramă, sub formă de cercuri.

#### Evenimente de Început

Nu au parametrii. Este un punct de plecare al procesului. Evenimentele de Început pot fi inițiate manual de către un utilizator care are acces la creearea proceselor. Utilizatorul trebuie să apese butonul'Start Process' din lista de vizualizare a proceselor.

#### Evenimente Condiționale de Început

Este un punct de plecare al procesului. Este declanșat automant atunci când anumite criterii sunt îndeplinite. Există două tipuri de: 'După ce a fost creeată o înregistrare', 'După ce a fost salvată o înregistrare'.

#### Evenimente de Început Declanșate

Este un punct de plecare al procesului. Procesul este inițiat de după un anumit program. Trebuie să specifici raportul de listă care returnează înregistrările pentru inițierea proceselor și programarea timpului, în notația crontab.

#### Evenimente Condiționale Intermediare

Acest eveniment oprește fluxul până când sunt îndeplinite criteriile specificate.

#### Evenimente Intermediare Declanșate

Acest eveniment oprește fluxul și așteaptă atât timp cât este specificat de parametrii evenimentului.

Pentru setări mai complexe poți utiliza [formula](formula.md). Scripturile ar trebui să returneze valori de tip Dată-Timp (in UTC timezone). După trecerea timpului respectiv, fluxul va trece la următorul element.

Utilizând funcția dată/timp, este posibil să setați cronometrul la un moment dat în viitor, de ex. începutul următoarei zile lucrătoare.  

#### Terminare Eveniment

Termină fluxul actual. sfârșește fluxuri care rulează în paralel. Atunci când fluxul ajunge la capătul unui eveniment și nu mai sunt altele care rulează în paralel, procesul este terminat.

#### Închiderea Terminării Evenimentului 

Sfârșește toate fluxurile. Procesul este încheiat.

### Gateways

Gateways sunt afișate ca diamante.

#### Gateway Exclusive

Poate diverge sau converge fluxuri.

În cazul unei divergențe, acesta definește un singur flux (cale) care va fi ales în funcție de criteriile specificate. Prima condiție întâlnită determină fluxul, condițiile următoare sunt omise. Există posibilitatea de a specifica fluxul implicit. Fluxul implicit este ales dacă nu există condiții îndeplinite. Fluxul implicit este marcat cu un linie oblică.

În cazul convergenței, direcționează fluxul spre elementul de ieșire. Nu se blochează după ce fluxul a venit, iar fluxurile paralele nu vor fi unite în fluxul unic.

![exclusive gateway divergent](../_static/images/administration/bpm/gateway-exclusive-divergent.png)

![exclusive gateway convergent](../_static/images/administration/bpm/gateway-exclusive-convergent.png)

#### Gateway Inclusive

Poate diverge sau converge fluxurile.

În caz de divergență, poate direcționa către unul sau fluxuri multiple paralele (căi), în funcție de îndeplinirea fiecărui criteriu al fluxului. Fluxul implicit este ales dacă este îndeplinită vreo condiție. Fluxul implicit este marcat cu un linie oblică.

Dacă există o necesitate de îmbinare a fluxurilor paralele produse de un gateway divergent incluziv, trebuie să utilizați un gateway convergent incluziv. Aceasta va aștepta toate fluxurile de intrare și apoi va continua cu elementul de ieșire.

![inclusive gateway](../_static/images/administration/bpm/gateway-inclusive.png)

Rețineți: Gateway divergente sau convergente trebuie să fie balansate.

Rețineți: Dacă unul dintre fluxurile paralele a fost terminat, atunci gateway divergent nu va fi procesat. Acest proces va fi blocat. Evitați diagramele care pot provoca astfel de situații.

#### Gateway Paralel

Poate diverge sau converge fluxurile.

În caz de divergență, se împarte fluxul în mai multe fluxuri paralele. Nu există parametri pentru acest tip de gateway.

In case of converging it waits until all incoming flows come and then continues to the next outgoing element.

![parallel gateway](../_static/images/administration/bpm/gateway-parallel.png)

Note: Gateway divergente sau convergente trebuie să fie balansate.

Note: Dacă unul dintre fluxurile paralele a fost terminat, atunci gateway divergent nu va fi procesat. Acest proces va fi blocat. Evitați diagramele care pot provoca astfel de situații.

#### Gateway Bazate pe Evenimente

Poate doar diverge fluxuri.

Acesta oprește fluxul până la declanșarea oricărui eveniment de ieșire. Evenimentul declanșat determină fluxul unic. Alte evenimente de ieșire sunt respinse.

Doar evenimentele intermediare pot fi la finalul secvenței de ieșire al fluxului.

![event based gateway](../_static/images/administration/bpm/gateway-event-based.png)

### Activități

Activitățile sunt afișate ca și dreptunghiuri cu colțuri rotunjite.

#### Sarcină

Sarcinile pot executa următoarele acțiuni:

* Creeare Înregistrare - creează o nouă înregistrare pentru fiecare tip de entitate;
* Creeare Înregistrare Legată - creează o nouă înregistrare legată de înregistrarea țintă;
* Actualizare Înregistrarea Țintă;
* Actualizare Înregistrare Legată - acualizează înregistrările sau înregistrările legate de înregistrarea țintă;
* Actualizare Înregistrare Creeată - actualizează câmpul specific al oricărei înregistrări create în procesul actual;
* Actualizare Proces Înregistrare - pot fi utilizate pentru a atribui procesul unui anumit utilizator sau echipei;
* Legarea către o altă Înregistrare - leagă înregistrarea țintă de o înregistrare specifică;
* Anulează legarea de la o altă Înregistrare - anulează legarea înregistrării ținte de la o înregistrare specificată;
* Aplică Regula de atribuire - atribuie înregistrarea țintă, înregistrarea procesului sau orice înregistrare creată de proces conform cu regula specifică;
* Creeare Notificare - creează notificări în aplicație pentru utilizatori specifici;
* Urmărire - face utilizatori specifici să urmărească înregistrări specifice, înregistrarea procesului sau altă înregistrare creeată de un proces.
* Rulează Acțiunea de Serviciu - rulează acțiuni de serviciu personalizate implementate de programatori.

Acțiunile disponibile pentru sarcină sunt aproape la fel ca în funcția Fluxului de Lucru. Mai multe detalii găsiți aici [workflow's actions](workflows.md#actions).

#### Sarcina Trimite Mesaj

Trimite un mesaj către un destinatar specific.

#### Sarcina Utilizator

Oferă o capacitate flexibilă de interacțiune a utilizatorului. Oprește execuția până se (specificată explicit sau prin regula de atribuire) rezolvă sarcina. Înregistrările Sarcină Utilizator o să fie creeate în sistem. În mod implicit există trei tipuri de acțiuni: Aprobare, Revizuire, Îndeplinit.

* Tipul de aprobare necesită utilizatorul să aleagă între 'Aprobat' and 'Respins'.
* Tipul Revizuire îi oferă utilizatorului o opțiune: 'Revizuire'.
* Tipul Îndeplinit oferă două opțiuni: 'Terminat' and 'Nereușit'.


Utilizatorul atribuit înregistrării Sarcină Utilizator create va primi notificări în aplicație. De asemenea, administratorul poate activa notificările prin e-mail.

Utilizatorii pot adăuga Sarcini de Proces ale Utilizatorului pe panoul lor pentru a putea vedea sarcinile de proces ale utilizatorului.
 
Este posibilă citirea rezoluției unei sarcini trecute a unui utilizator în cadrul gateway divergente sau evenimentelor condiționale, făcând ramificația în fluxul procesului. 

#### Sarcină Script

Execută scriptul în limba [espo-formula](formula.md). Toate variabilele (`$variableName`) o să fie stocate și diponibile în cadrul procesului.

### Fluxuri

#### Secvență Flux

Reprezentată ca o săgeată solidă. Indică ordinea în care elementele procesului o să fie executate.

## Condiții

Evenimentele condiționate, gateway divergente exclusive și inclusive au condiții care determină fluxul procesului.

Prin intermediul UI există posibilitatea de verificare a condițiilor după următoarele înregistrări:

* Înregistrare Țintă;
* Înregistrări Legate de Țintă prin relații de tip multe-către-una și copil-către-părinte;
* Înregistrările creeate de procese prin sarcini;
* Înregistrări Sarcina Utilizator, permite verificarea rezoluției.

Este posibil să se definească în limba [Espo-formula](formula.md).

Condițiile în instrumentul BPM sunt aceleași ca în caracteristica Fluxului de Lucru. Mai multe detalii găsiți aici [workflow's conditions](workflows.md#conditions).

## Exemple

### Exemplul 1

![Example 1](../_static/images/administration/bpm/example-1.png)

### Exemplul 2

![Example 2](../_static/images/administration/bpm/example-2.png)

### Exemplul 3

![Example 3](../_static/images/administration/bpm/example-3.png)
