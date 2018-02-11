# Importare

Importarea este disponibilă doar utiliaztorilor admin. Administration > Import. Ai posibilitatea de a importa doar fișiere CSV.

## Pasul 1

Selectează ce tipuri de înregistrări trebuie să imporți (Câmp Tip Entitate).
Selectează un fișier CSV. Un fișier ar trebui formatat cu `UTF-8`.
Selectează `What to do?`. Opțiuni disponibile: 'Create Only', 'Create & Update', 'Update Only'.

* `Create Only` - selectează dacă vrei ca înregistarea ta să fie doar creată.
* `Create & Update` - înregistrările o să fie creeate, iar dacă vor fi găsite înregistrări cu aceleași câmpuri, vor fi actualizate. Vei putea alege ce câmpuri să se potrivească la pasul _Step 2_.
* `Update only` - doar înregistrările cu aceleași valori ale câmpurior o să fie actualizate.
 
După ce ai selectat un fișier csv, vei putea să vezi cum ar trebuie să fie analizat în panoul de Previzualizare. Când schimbi propritățiile, previzualizarea va fi actualizată.

* `Header Row` - dacă fișierul CSV conține pe primul rând câmpul de nume.
* `Execute in idle` - este recomandat în cazul în care ai o cantitate mare de înregistrări care să fie importate. Importarea se va face prin cron. Statusul o să fie schimbat în 'Complet' când s-a terminat importarea.
* `Skip searching for duplicates` - o să scadă timpul de importare. 

Apasă _Next_ pentru a trece _Step 2_.

![1](../_static/images/administration/import/step-1.png)

## Pasul 2

Setează câmpul de mapare: corespunderea fișierelor la coloanele care conțin fișierul csv. Poți să sari peste coloanele care nu sunt necesare.
În caz de'Create & Update' și 'Update only' trebuie să bifezi câmpurile ale căror înregistrări să fie actualizate.
Adaugă valori implicite pentru noile înregistrări și cele actualizate să fie setate. Ex. Poți să specifici Utilizatorii Atribuiți sau câmpurior echipelor.
După ce importarea s-a terminat, vei putea inversa creearea înregistrărilor, să vezi înregistrările duplicate și actualizate. Duplicat înseamnă că a fost o înregistrare similară în sistem. Poți să elimini toate duplicatele în același timp. Rețineți: Inversarea nu funcționează cu înregistrările actualizate.
Apasă butonul _Run Import_ pentru a merge mai departe. Ar putea să dureze un timp până ce procesul de importare să se termine. Dacă vrei să imporți o cantitate mare de înregistrări(depinde de configurările serverului, de obicei mai mult de 200 înregistrări) trebuie să te asiguri că parametrul php `set_time_limit` este suficient de mare.

![2](../_static/images/administration/import/step-2.png)

## Cum să imporți în Liste Ținte

Când imporți Contacte, Oportunități sau Contrui poți să le adaugi într-o listă țintă. La pasul 2 trebuie să adaugi Lista Țintă în câmpul panoului `Default Values` și să selectezi înregistrarea listei țintă de care ai nevoie. Poți de asemenea să folosești `Update only` sau `Create & Update` pentru a importa sau adăuga ținte la o listă de ținte.